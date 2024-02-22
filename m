Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4500585F2C0
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 09:22:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C0EFC6C83C;
	Thu, 22 Feb 2024 08:22:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C0CAC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 08:22:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A3E91007;
 Thu, 22 Feb 2024 00:23:19 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.42.8])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0460C3F762;
 Thu, 22 Feb 2024 00:22:36 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	suzuki.poulose@arm.com
Date: Thu, 22 Feb 2024 13:51:39 +0530
Message-Id: <20240222082142.3663983-9-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222082142.3663983-1-anshuman.khandual@arm.com>
References: <20240222082142.3663983-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: [Linux-stm32] [PATCH V5 08/11] coresight: tpiu: Move ACPI support
	from AMBA driver to platform driver
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

Add support for the tpiu device in the platform driver, which can then be
used on ACPI based platforms. This change would now allow runtime power
management for ACPI based systems. The driver would try to enable the APB
clock if available. But first this renames and then refactors tpiu_probe()
and tpiu_remove(), making sure it can be used both for platform and AMBA
drivers. This also moves pm_runtime_put() from tpiu_probe() to the callers.

Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@arm.com>
Cc: linux-acpi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: coresight@lists.linaro.org
Tested-by: Sudeep Holla <sudeep.holla@arm.com> # Boot and driver probe only
Acked-by: Sudeep Holla <sudeep.holla@arm.com> # For ACPI related changes
Reviewed-by: James Clark <james.clark@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V5:

- Updated commit message regarding tpiu_probe/remove() refactoring and renaming

 drivers/acpi/arm64/amba.c                    |   1 -
 drivers/hwtracing/coresight/coresight-tpiu.c | 102 +++++++++++++++++--
 2 files changed, 92 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
index 587061b0fd2f..6d24a8f7914b 100644
--- a/drivers/acpi/arm64/amba.c
+++ b/drivers/acpi/arm64/amba.c
@@ -25,7 +25,6 @@ static const struct acpi_device_id amba_id_list[] = {
 	{"ARMHC501", 0}, /* ARM CoreSight ETR */
 	{"ARMHC502", 0}, /* ARM CoreSight STM */
 	{"ARMHC503", 0}, /* ARM CoreSight Debug */
-	{"ARMHC979", 0}, /* ARM CoreSight TPIU */
 	{"ARMHC97C", 0}, /* ARM CoreSight SoC-400 TMC, SoC-600 ETF/ETB */
 	{"", 0},
 };
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 59eac93fd6bb..7a76bbd610bf 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -5,6 +5,8 @@
  * Description: CoreSight Trace Port Interface Unit driver
  */
 
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -52,11 +54,13 @@ DEFINE_CORESIGHT_DEVLIST(tpiu_devs, "tpiu");
 /*
  * @base:	memory mapped base address for this component.
  * @atclk:	optional clock for the core parts of the TPIU.
+ * @pclk:	APB clock if present, otherwise NULL
  * @csdev:	component vitals needed by the framework.
  */
 struct tpiu_drvdata {
 	void __iomem		*base;
 	struct clk		*atclk;
+	struct clk		*pclk;
 	struct coresight_device	*csdev;
 };
 
@@ -114,14 +118,12 @@ static const struct coresight_ops tpiu_cs_ops = {
 	.sink_ops	= &tpiu_sink_ops,
 };
 
-static int tpiu_probe(struct amba_device *adev, const struct amba_id *id)
+static int __tpiu_probe(struct device *dev, struct resource *res)
 {
 	int ret;
 	void __iomem *base;
-	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata = NULL;
 	struct tpiu_drvdata *drvdata;
-	struct resource *res = &adev->res;
 	struct coresight_desc desc = { 0 };
 
 	desc.name = coresight_alloc_device_name(&tpiu_devs, dev);
@@ -132,12 +134,16 @@ static int tpiu_probe(struct amba_device *adev, const struct amba_id *id)
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
 
 	/* Validity for the resource is already checked by the AMBA core */
@@ -163,21 +169,34 @@ static int tpiu_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.dev = dev;
 	drvdata->csdev = coresight_register(&desc);
 
-	if (!IS_ERR(drvdata->csdev)) {
-		pm_runtime_put(&adev->dev);
+	if (!IS_ERR(drvdata->csdev))
 		return 0;
-	}
 
 	return PTR_ERR(drvdata->csdev);
 }
 
-static void tpiu_remove(struct amba_device *adev)
+static int tpiu_probe(struct amba_device *adev, const struct amba_id *id)
 {
-	struct tpiu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+	int ret;
+
+	ret = __tpiu_probe(&adev->dev, &adev->res);
+	if (!ret)
+		pm_runtime_put(&adev->dev);
+	return ret;
+}
+
+static void __tpiu_remove(struct device *dev)
+{
+	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
 
 	coresight_unregister(drvdata->csdev);
 }
 
+static void tpiu_remove(struct amba_device *adev)
+{
+	__tpiu_remove(&adev->dev);
+}
+
 #ifdef CONFIG_PM
 static int tpiu_runtime_suspend(struct device *dev)
 {
@@ -186,6 +205,8 @@ static int tpiu_runtime_suspend(struct device *dev)
 	if (drvdata && !IS_ERR(drvdata->atclk))
 		clk_disable_unprepare(drvdata->atclk);
 
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_disable_unprepare(drvdata->pclk);
 	return 0;
 }
 
@@ -196,6 +217,8 @@ static int tpiu_runtime_resume(struct device *dev)
 	if (drvdata && !IS_ERR(drvdata->atclk))
 		clk_prepare_enable(drvdata->atclk);
 
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_prepare_enable(drvdata->pclk);
 	return 0;
 }
 #endif
@@ -235,7 +258,66 @@ static struct amba_driver tpiu_driver = {
 	.id_table	= tpiu_ids,
 };
 
-module_amba_driver(tpiu_driver);
+static int tpiu_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	int ret;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = __tpiu_probe(&pdev->dev, res);
+	pm_runtime_put(&pdev->dev);
+	if (ret)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static int tpiu_platform_remove(struct platform_device *pdev)
+{
+	struct tpiu_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
+
+	if (drvdata)
+		__tpiu_remove(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_put(drvdata->pclk);
+	return 0;
+}
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id tpiu_acpi_ids[] = {
+	{"ARMHC979", 0}, /* ARM CoreSight TPIU */
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, tpiu_acpi_ids);
+#endif
+
+static struct platform_driver tpiu_platform_driver = {
+	.probe	= tpiu_platform_probe,
+	.remove	= tpiu_platform_remove,
+	.driver = {
+		.name			= "coresight-tpiu-platform",
+		.acpi_match_table	= ACPI_PTR(tpiu_acpi_ids),
+		.suppress_bind_attrs	= true,
+		.pm			= &tpiu_dev_pm_ops,
+	},
+};
+
+static int __init tpiu_init(void)
+{
+	return coresight_init_driver("tpiu", &tpiu_driver, &tpiu_platform_driver);
+}
+
+static void __exit tpiu_exit(void)
+{
+	coresight_remove_driver(&tpiu_driver, &tpiu_platform_driver);
+}
+module_init(tpiu_init);
+module_exit(tpiu_exit);
 
 MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
 MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
