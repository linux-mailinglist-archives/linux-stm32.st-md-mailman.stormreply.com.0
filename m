Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8E7D96AA
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Oct 2023 13:31:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14F3AC6DD64;
	Fri, 27 Oct 2023 11:31:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D5BBC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 07:30:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80D62143D;
 Fri, 27 Oct 2023 00:31:07 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.32.209])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ACAA53F762;
 Fri, 27 Oct 2023 00:30:21 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	suzuki.poulose@arm.com
Date: Fri, 27 Oct 2023 12:59:42 +0530
Message-Id: <20231027072943.3418997-7-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027072943.3418997-1-anshuman.khandual@arm.com>
References: <20231027072943.3418997-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Oct 2023 11:31:33 +0000
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH 6/7] coresight: stm: Move ACPI support from
	AMBA driver to platform driver
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

Add support for the stm devices in the platform driver, which can then be
used on ACPI based platforms. This change would now allow runtime power
management for ACPI based systems. The driver would try to enable the APB
clock if available.

Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-acpi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: coresight@lists.linaro.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/acpi/arm64/amba.c                   |  1 -
 drivers/hwtracing/coresight/coresight-stm.c | 80 ++++++++++++++++++---
 2 files changed, 71 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
index 6980502b7868..ebc866518057 100644
--- a/drivers/acpi/arm64/amba.c
+++ b/drivers/acpi/arm64/amba.c
@@ -22,7 +22,6 @@
 static const struct acpi_device_id amba_id_list[] = {
 	{"ARMH0061", 0}, /* PL061 GPIO Device */
 	{"ARMH0330", 0}, /* ARM DMA Controller DMA-330 */
-	{"ARMHC502", 0}, /* ARM CoreSight STM */
 	{"ARMHC503", 0}, /* ARM CoreSight Debug */
 	{"", 0},
 };
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index a1c27c901ad1..14b2d79e935f 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -29,6 +29,8 @@
 #include <linux/perf_event.h>
 #include <linux/pm_runtime.h>
 #include <linux/stm.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
 
 #include "coresight-priv.h"
 #include "coresight-trace-id.h"
@@ -132,6 +134,7 @@ DEFINE_CORESIGHT_DEVLIST(stm_devs, "stm");
 struct stm_drvdata {
 	void __iomem		*base;
 	struct clk		*atclk;
+	struct clk		*pclk;
 	struct coresight_device	*csdev;
 	spinlock_t		spinlock;
 	struct channel_space	chs;
@@ -804,14 +807,12 @@ static void stm_init_generic_data(struct stm_drvdata *drvdata,
 	drvdata->stm.set_options = stm_generic_set_options;
 }
 
-static int stm_probe(struct amba_device *adev, const struct amba_id *id)
+static int __stm_probe(struct device *dev, struct resource *res, void *dev_caps)
 {
 	int ret, trace_id;
 	void __iomem *base;
-	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata = NULL;
 	struct stm_drvdata *drvdata;
-	struct resource *res = &adev->res;
 	struct resource ch_res;
 	struct coresight_desc desc = { 0 };
 
@@ -823,12 +824,16 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get(&adev->dev, "atclk"); /* optional */
+	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
 	if (!IS_ERR(drvdata->atclk)) {
 		ret = clk_prepare_enable(drvdata->atclk);
 		if (ret)
 			return ret;
 	}
+
+	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
+	if (IS_ERR(drvdata->pclk))
+		return -ENODEV;
 	dev_set_drvdata(dev, drvdata);
 
 	base = devm_ioremap_resource(dev, res);
@@ -876,7 +881,7 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 		ret = PTR_ERR(pdata);
 		goto stm_unregister;
 	}
-	adev->dev.platform_data = pdata;
+	dev->platform_data = pdata;
 
 	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
 	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE;
@@ -897,10 +902,10 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 	drvdata->traceid = (u8)trace_id;
 
-	pm_runtime_put(&adev->dev);
+	pm_runtime_put(dev);
 
 	dev_info(&drvdata->csdev->dev, "%s initialized\n",
-		 (char *)coresight_get_uci_data(id));
+		 (char *)dev_caps);
 	return 0;
 
 cs_unregister:
@@ -911,9 +916,14 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	return ret;
 }
 
-static void stm_remove(struct amba_device *adev)
+static int stm_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	return __stm_probe(&adev->dev, &adev->res, coresight_get_uci_data(id));
+}
+
+static void __stm_remove(struct device *dev)
 {
-	struct stm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
 
 	coresight_trace_id_put_system_id(drvdata->traceid);
 	coresight_unregister(drvdata->csdev);
@@ -921,6 +931,11 @@ static void stm_remove(struct amba_device *adev)
 	stm_unregister_device(&drvdata->stm);
 }
 
+static void stm_remove(struct amba_device *adev)
+{
+	__stm_remove(&adev->dev);
+}
+
 #ifdef CONFIG_PM
 static int stm_runtime_suspend(struct device *dev)
 {
@@ -929,6 +944,8 @@ static int stm_runtime_suspend(struct device *dev)
 	if (drvdata && !IS_ERR(drvdata->atclk))
 		clk_disable_unprepare(drvdata->atclk);
 
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_disable_unprepare(drvdata->pclk);
 	return 0;
 }
 
@@ -939,6 +956,8 @@ static int stm_runtime_resume(struct device *dev)
 	if (drvdata && !IS_ERR(drvdata->atclk))
 		clk_prepare_enable(drvdata->atclk);
 
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_prepare_enable(drvdata->pclk);
 	return 0;
 }
 #endif
@@ -969,6 +988,49 @@ static struct amba_driver stm_driver = {
 
 module_amba_driver(stm_driver);
 
+static int stm_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	int ret = 0;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = __stm_probe(&pdev->dev, res, NULL);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		pm_runtime_disable(&pdev->dev);
+	}
+	return ret;
+}
+
+static int stm_platform_remove(struct platform_device *pdev)
+{
+	__stm_remove(&pdev->dev);
+	return 0;
+}
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id stm_acpi_ids[] = {
+	{"ARMHC502", 0}, /* ARM CoreSight STM */
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, stm_acpi_ids);
+#endif
+
+static struct platform_driver stm_platform_driver = {
+	.probe	= stm_platform_probe,
+	.remove	= stm_platform_remove,
+	.driver	= {
+		.name			= "coresight-stm-platform",
+		.acpi_match_table	= ACPI_PTR(stm_acpi_ids),
+		.suppress_bind_attrs	= true,
+		.pm			= &stm_dev_pm_ops,
+	},
+};
+module_platform_driver(stm_platform_driver);
+
 MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
 MODULE_DESCRIPTION("Arm CoreSight System Trace Macrocell driver");
 MODULE_LICENSE("GPL v2");
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
