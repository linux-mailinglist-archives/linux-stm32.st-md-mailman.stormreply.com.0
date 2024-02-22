Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F785F2C3
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 09:22:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F7D6C6C83C;
	Thu, 22 Feb 2024 08:22:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DFC1C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 08:22:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BED914BF;
 Thu, 22 Feb 2024 00:23:29 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.42.8])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DDEDD3F762;
 Thu, 22 Feb 2024 00:22:46 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	suzuki.poulose@arm.com
Date: Thu, 22 Feb 2024 13:51:41 +0530
Message-Id: <20240222082142.3663983-11-anshuman.khandual@arm.com>
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
Subject: [Linux-stm32] [PATCH V5 10/11] coresight: stm: Move ACPI support
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

Add support for the stm devices in the platform driver, which can then be
used on ACPI based platforms. This change would now allow runtime power
management for ACPI based systems. The driver would try to enable the APB
clock if available. But first this renames and then refactors stm_probe()
and stm_remove(), making sure it can be used both for platform and AMBA
drivers. Also this moves pm_runtime_put() from stm_probe() to the callers.

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
Tested-by: Sudeep Holla <sudeep.holla@arm.com> # Boot and driver probe only
Acked-by: Sudeep Holla <sudeep.holla@arm.com> # For ACPI related changes
Reviewed-by: James Clark <james.clark@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V5:

- Updated commit message regarding stm_probe/remove() refactoring and renaming

 drivers/acpi/arm64/amba.c                   |   1 -
 drivers/hwtracing/coresight/coresight-stm.c | 103 ++++++++++++++++++--
 2 files changed, 93 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
index d3c1defa7bc8..bec0976541da 100644
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
index 6737e7b5bfca..13f9c7d10270 100644
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
@@ -115,6 +117,7 @@ DEFINE_CORESIGHT_DEVLIST(stm_devs, "stm");
  * struct stm_drvdata - specifics associated to an STM component
  * @base:		memory mapped base address for this component.
  * @atclk:		optional clock for the core parts of the STM.
+ * @pclk:		APB clock if present, otherwise NULL
  * @csdev:		component vitals needed by the framework.
  * @spinlock:		only one at a time pls.
  * @chs:		the channels accociated to this STM.
@@ -132,6 +135,7 @@ DEFINE_CORESIGHT_DEVLIST(stm_devs, "stm");
 struct stm_drvdata {
 	void __iomem		*base;
 	struct clk		*atclk;
+	struct clk		*pclk;
 	struct coresight_device	*csdev;
 	spinlock_t		spinlock;
 	struct channel_space	chs;
@@ -814,14 +818,12 @@ static char *stm_csdev_name(struct coresight_device *csdev)
 	return uci_data ? (char *)uci_data : "STM";
 }
 
-static int stm_probe(struct amba_device *adev, const struct amba_id *id)
+static int __stm_probe(struct device *dev, struct resource *res)
 {
 	int ret, trace_id;
 	void __iomem *base;
-	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata = NULL;
 	struct stm_drvdata *drvdata;
-	struct resource *res = &adev->res;
 	struct resource ch_res;
 	struct coresight_desc desc = { 0 };
 
@@ -833,12 +835,16 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
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
@@ -886,7 +892,7 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 		ret = PTR_ERR(pdata);
 		goto stm_unregister;
 	}
-	adev->dev.platform_data = pdata;
+	dev->platform_data = pdata;
 
 	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
 	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE;
@@ -907,8 +913,6 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 	drvdata->traceid = (u8)trace_id;
 
-	pm_runtime_put(&adev->dev);
-
 	dev_info(&drvdata->csdev->dev, "%s initialized\n",
 		 stm_csdev_name(drvdata->csdev));
 	return 0;
@@ -921,9 +925,20 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	return ret;
 }
 
-static void stm_remove(struct amba_device *adev)
+static int stm_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	int ret;
+
+	ret = __stm_probe(&adev->dev, &adev->res);
+	if (!ret)
+		pm_runtime_put(&adev->dev);
+
+	return ret;
+}
+
+static void __stm_remove(struct device *dev)
 {
-	struct stm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
 
 	coresight_trace_id_put_system_id(drvdata->traceid);
 	coresight_unregister(drvdata->csdev);
@@ -931,6 +946,11 @@ static void stm_remove(struct amba_device *adev)
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
@@ -939,6 +959,8 @@ static int stm_runtime_suspend(struct device *dev)
 	if (drvdata && !IS_ERR(drvdata->atclk))
 		clk_disable_unprepare(drvdata->atclk);
 
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_disable_unprepare(drvdata->pclk);
 	return 0;
 }
 
@@ -949,6 +971,8 @@ static int stm_runtime_resume(struct device *dev)
 	if (drvdata && !IS_ERR(drvdata->atclk))
 		clk_prepare_enable(drvdata->atclk);
 
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_prepare_enable(drvdata->pclk);
 	return 0;
 }
 #endif
@@ -977,7 +1001,66 @@ static struct amba_driver stm_driver = {
 	.id_table	= stm_ids,
 };
 
-module_amba_driver(stm_driver);
+static int stm_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	int ret = 0;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = __stm_probe(&pdev->dev, res);
+	pm_runtime_put(&pdev->dev);
+	if (ret)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static int stm_platform_remove(struct platform_device *pdev)
+{
+	struct stm_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
+
+	if (drvdata)
+		__stm_remove(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
+		clk_put(drvdata->pclk);
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
+
+static int __init stm_init(void)
+{
+	return coresight_init_driver("stm", &stm_driver, &stm_platform_driver);
+}
+
+static void __exit stm_exit(void)
+{
+	coresight_remove_driver(&stm_driver, &stm_platform_driver);
+}
+module_init(stm_init);
+module_exit(stm_exit);
 
 MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
 MODULE_DESCRIPTION("Arm CoreSight System Trace Macrocell driver");
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
