Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2D887B785
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Mar 2024 06:59:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53232C6A613;
	Thu, 14 Mar 2024 05:59:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BA72C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Mar 2024 05:59:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D03A11FB;
 Wed, 13 Mar 2024 23:00:02 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.53.138])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 010483F73F;
 Wed, 13 Mar 2024 22:59:21 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	suzuki.poulose@arm.com
Date: Thu, 14 Mar 2024 11:28:34 +0530
Message-Id: <20240314055843.2625883-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314055843.2625883-1-anshuman.khandual@arm.com>
References: <20240314055843.2625883-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH V7 02/11] coresight: stm: Extract device name
	from AMBA pid based table lookup
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

Instead of using AMBA private data field, extract the device name from AMBA
pid based table lookup using new coresight_get_uci_data_from_amba() helper.

Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@arm.com>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Reviewed-by: James Clark <james.clark@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 10 ++++++++++
 drivers/hwtracing/coresight/coresight-stm.c  | 12 +++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index eb365236f9a9..fc3617642b01 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -222,6 +222,16 @@ static inline void *coresight_get_uci_data(const struct amba_id *id)
 	return uci_id->data;
 }
 
+static inline void *coresight_get_uci_data_from_amba(const struct amba_id *table, u32 pid)
+{
+	while (table->mask) {
+		if ((pid & table->mask) == table->id)
+			return coresight_get_uci_data(table);
+		table++;
+	};
+	return NULL;
+}
+
 void coresight_release_platform_data(struct coresight_device *csdev,
 				     struct device *dev,
 				     struct coresight_platform_data *pdata);
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 974d37e5f94c..5ae24c33c846 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -800,6 +800,16 @@ static void stm_init_generic_data(struct stm_drvdata *drvdata,
 	drvdata->stm.set_options = stm_generic_set_options;
 }
 
+static const struct amba_id stm_ids[];
+
+static char *stm_csdev_name(struct coresight_device *csdev)
+{
+	u32 stm_pid = coresight_get_pid(&csdev->access);
+	void *uci_data = coresight_get_uci_data_from_amba(stm_ids, stm_pid);
+
+	return uci_data ? (char *)uci_data : "STM";
+}
+
 static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	int ret, trace_id;
@@ -896,7 +906,7 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	pm_runtime_put(&adev->dev);
 
 	dev_info(&drvdata->csdev->dev, "%s initialized\n",
-		 (char *)coresight_get_uci_data(id));
+		 stm_csdev_name(drvdata->csdev));
 	return 0;
 
 cs_unregister:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
