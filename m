Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4862B879227
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 11:35:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAB7BC6DD73;
	Tue, 12 Mar 2024 10:35:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56ECEC6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 10:23:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F29921007;
 Tue, 12 Mar 2024 03:24:32 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.52.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 32A743F73F;
 Tue, 12 Mar 2024 03:23:49 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	suzuki.poulose@arm.com
Date: Tue, 12 Mar 2024 15:53:11 +0530
Message-Id: <20240312102318.2285165-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240312102318.2285165-1-anshuman.khandual@arm.com>
References: <20240312102318.2285165-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Mar 2024 10:35:14 +0000
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Leo Yan <leo.yan@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH V6 04/11] coresight: Add helpers
	registering/removing both AMBA and platform drivers
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This adds two different helpers i.e coresight_init_driver()/remove_driver()
enabling coresight devices to register or remove AMBA and platform drivers.
This changes replicator and funnel devices to use above new helpers.

Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@arm.com>
Cc: Leo Yan <leo.yan@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: coresight@lists.linaro.org
Reviewed-by: James Clark <james.clark@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 29 +++++++++++++++++++
 .../hwtracing/coresight/coresight-funnel.c    | 19 ++----------
 .../coresight/coresight-replicator.c          | 20 ++-----------
 include/linux/coresight.h                     |  7 +++++
 4 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index b83613e34289..9fc6f6b863e0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1398,6 +1398,35 @@ static void __exit coresight_exit(void)
 module_init(coresight_init);
 module_exit(coresight_exit);
 
+int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
+			  struct platform_driver *pdev_drv)
+{
+	int ret;
+
+	ret = amba_driver_register(amba_drv);
+	if (ret) {
+		pr_err("%s: error registering AMBA driver\n", drv);
+		return ret;
+	}
+
+	ret = platform_driver_register(pdev_drv);
+	if (!ret)
+		return 0;
+
+	pr_err("%s: error registering platform driver\n", drv);
+	amba_driver_unregister(amba_drv);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(coresight_init_driver);
+
+void coresight_remove_driver(struct amba_driver *amba_drv,
+			     struct platform_driver *pdev_drv)
+{
+	amba_driver_unregister(amba_drv);
+	platform_driver_unregister(pdev_drv);
+}
+EXPORT_SYMBOL_GPL(coresight_remove_driver);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
 MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index ef1a0abfee4e..ff3ea0670a5b 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -410,27 +410,12 @@ static struct amba_driver dynamic_funnel_driver = {
 
 static int __init funnel_init(void)
 {
-	int ret;
-
-	ret = platform_driver_register(&static_funnel_driver);
-	if (ret) {
-		pr_info("Error registering platform driver\n");
-		return ret;
-	}
-
-	ret = amba_driver_register(&dynamic_funnel_driver);
-	if (ret) {
-		pr_info("Error registering amba driver\n");
-		platform_driver_unregister(&static_funnel_driver);
-	}
-
-	return ret;
+	return coresight_init_driver("funnel", &dynamic_funnel_driver, &static_funnel_driver);
 }
 
 static void __exit funnel_exit(void)
 {
-	platform_driver_unregister(&static_funnel_driver);
-	amba_driver_unregister(&dynamic_funnel_driver);
+	coresight_remove_driver(&dynamic_funnel_driver, &static_funnel_driver);
 }
 
 module_init(funnel_init);
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 73452d9dc13b..ddb530a8436f 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -416,27 +416,13 @@ static struct amba_driver dynamic_replicator_driver = {
 
 static int __init replicator_init(void)
 {
-	int ret;
-
-	ret = platform_driver_register(&static_replicator_driver);
-	if (ret) {
-		pr_info("Error registering platform driver\n");
-		return ret;
-	}
-
-	ret = amba_driver_register(&dynamic_replicator_driver);
-	if (ret) {
-		pr_info("Error registering amba driver\n");
-		platform_driver_unregister(&static_replicator_driver);
-	}
-
-	return ret;
+	return coresight_init_driver("replicator", &dynamic_replicator_driver,
+				     &static_replicator_driver);
 }
 
 static void __exit replicator_exit(void)
 {
-	platform_driver_unregister(&static_replicator_driver);
-	amba_driver_unregister(&dynamic_replicator_driver);
+	coresight_remove_driver(&dynamic_replicator_driver, &static_replicator_driver);
 }
 
 module_init(replicator_init);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 5f288d475490..653f1712eb77 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -12,6 +12,8 @@
 #include <linux/io.h>
 #include <linux/perf_event.h>
 #include <linux/sched.h>
+#include <linux/amba/bus.h>
+#include <linux/platform_device.h>
 
 /* Peripheral id registers (0xFD0-0xFEC) */
 #define CORESIGHT_PERIPHIDR4	0xfd0
@@ -658,4 +660,9 @@ coresight_find_output_type(struct coresight_platform_data *pdata,
 			   enum coresight_dev_type type,
 			   union coresight_dev_subtype subtype);
 
+int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
+			  struct platform_driver *pdev_drv);
+
+void coresight_remove_driver(struct amba_driver *amba_drv,
+			     struct platform_driver *pdev_drv);
 #endif		/* _LINUX_COREISGHT_H */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
