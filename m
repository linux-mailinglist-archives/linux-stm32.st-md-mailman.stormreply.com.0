Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B67D96AB
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Oct 2023 13:31:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 286B3C6DD66;
	Fri, 27 Oct 2023 11:31:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45CA1C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 07:30:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50472143D;
 Fri, 27 Oct 2023 00:31:12 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.32.209])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 79FC03F762;
 Fri, 27 Oct 2023 00:30:26 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	suzuki.poulose@arm.com
Date: Fri, 27 Oct 2023 12:59:43 +0530
Message-Id: <20231027072943.3418997-8-anshuman.khandual@arm.com>
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
Subject: [Linux-stm32] [PATCH 7/7] coresight: debug: Move ACPI support from
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

Add support for the cpu debug devices in a new platform driver, which can
then be used on ACPI based platforms. This change would now allow runtime
power management for ACPI based systems. The driver would try to enable
the APB clock if available.

Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@arm.com>
Cc: linux-acpi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: coresight@lists.linaro.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/acpi/arm64/amba.c                     |   1 -
 .../hwtracing/coresight/coresight-cpu-debug.c | 130 ++++++++++++++++--
 2 files changed, 117 insertions(+), 14 deletions(-)

diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
index ebc866518057..b591c7a650aa 100644
--- a/drivers/acpi/arm64/amba.c
+++ b/drivers/acpi/arm64/amba.c
@@ -22,7 +22,6 @@
 static const struct acpi_device_id amba_id_list[] = {
 	{"ARMH0061", 0}, /* PL061 GPIO Device */
 	{"ARMH0330", 0}, /* ARM DMA Controller DMA-330 */
-	{"ARMHC503", 0}, /* ARM CoreSight Debug */
 	{"", 0},
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 1874df7c6a73..cb4e0150feff 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -23,6 +23,8 @@
 #include <linux/smp.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
 
 #include "coresight-priv.h"
 
@@ -84,6 +86,7 @@
 #define DEBUG_WAIT_TIMEOUT		32000
 
 struct debug_drvdata {
+	struct clk	*pclk;
 	void __iomem	*base;
 	struct device	*dev;
 	int		cpu;
@@ -557,18 +560,12 @@ static void debug_func_exit(void)
 	debugfs_remove_recursive(debug_debugfs_dir);
 }
 
-static int debug_probe(struct amba_device *adev, const struct amba_id *id)
+static int __debug_probe(struct device *dev, struct resource *res)
 {
+	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
 	void __iomem *base;
-	struct device *dev = &adev->dev;
-	struct debug_drvdata *drvdata;
-	struct resource *res = &adev->res;
 	int ret;
 
-	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
 	drvdata->cpu = coresight_get_cpu(dev);
 	if (drvdata->cpu < 0)
 		return drvdata->cpu;
@@ -579,8 +576,7 @@ static int debug_probe(struct amba_device *adev, const struct amba_id *id)
 		return -EBUSY;
 	}
 
-	drvdata->dev = &adev->dev;
-	amba_set_drvdata(adev, drvdata);
+	drvdata->dev = dev;
 
 	/* Validity for the resource is already checked by the AMBA core */
 	base = devm_ioremap_resource(dev, res);
@@ -629,10 +625,21 @@ static int debug_probe(struct amba_device *adev, const struct amba_id *id)
 	return ret;
 }
 
-static void debug_remove(struct amba_device *adev)
+static int debug_probe(struct amba_device *adev, const struct amba_id *id)
 {
-	struct device *dev = &adev->dev;
-	struct debug_drvdata *drvdata = amba_get_drvdata(adev);
+	struct debug_drvdata *drvdata;
+
+	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	amba_set_drvdata(adev, drvdata);
+	return __debug_probe(&adev->dev, &adev->res);
+}
+
+static void __debug_remove(struct device *dev)
+{
+	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
 
 	per_cpu(debug_drvdata, drvdata->cpu) = NULL;
 
@@ -646,6 +653,11 @@ static void debug_remove(struct amba_device *adev)
 		debug_func_exit();
 }
 
+static void debug_remove(struct amba_device *adev)
+{
+	__debug_remove(&adev->dev);
+}
+
 static const struct amba_cs_uci_id uci_id_debug[] = {
 	{
 		/*  CPU Debug UCI data */
@@ -679,6 +691,98 @@ static struct amba_driver debug_driver = {
 
 module_amba_driver(debug_driver);
 
+static int debug_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	struct debug_drvdata *drvdata;
+	int ret = 0;
+
+	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
+	if (IS_ERR(drvdata->pclk))
+		return -ENODEV;
+
+	if (res) {
+		drvdata->base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(drvdata->base)) {
+			clk_put(drvdata->pclk);
+			return PTR_ERR(drvdata->base);
+		}
+	}
+
+	dev_set_drvdata(&pdev->dev, drvdata);
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = __debug_probe(&pdev->dev, res);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		pm_runtime_disable(&pdev->dev);
+	}
+	return ret;
+}
+
+static int debug_platform_remove(struct platform_device *pdev)
+{
+	struct debug_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
+
+	if (drvdata)
+		__debug_remove(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_put(drvdata->pclk);
+	return 0;
+}
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id debug_platform_ids[] = {
+	{"ARMHC503", 0}, /* ARM CoreSight Debug */
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, debug_platform_ids);
+#endif
+
+#ifdef CONFIG_PM
+static int debug_runtime_suspend(struct device *dev)
+{
+	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (drvdata->pclk && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_disable_unprepare(drvdata->pclk);
+	return 0;
+}
+
+static int debug_runtime_resume(struct device *dev)
+{
+	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (drvdata->pclk && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_prepare_enable(drvdata->pclk);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops debug_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(debug_runtime_suspend, debug_runtime_resume, NULL)
+};
+
+static struct platform_driver debug_platform_driver = {
+	.probe	= debug_platform_probe,
+	.remove	= debug_platform_remove,
+	.driver	= {
+		.name			= "coresight-debug-platform",
+		.acpi_match_table	= ACPI_PTR(debug_platform_ids),
+		.suppress_bind_attrs	= true,
+		.pm			= &debug_dev_pm_ops,
+	},
+};
+module_platform_driver(debug_platform_driver);
+
 MODULE_AUTHOR("Leo Yan <leo.yan@linaro.org>");
 MODULE_DESCRIPTION("ARM Coresight CPU Debug Driver");
 MODULE_LICENSE("GPL");
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
