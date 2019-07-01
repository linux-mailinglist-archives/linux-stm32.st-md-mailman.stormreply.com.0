Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8CF5B68A
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 10:14:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 468BBD2686C
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 08:14:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32A1FD2686A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2019 08:14:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x618CeOs016170; Mon, 1 Jul 2019 10:14:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SA12HvxMBgmLlaje8uVlkPT05/Yq7cp0AhDC6a3uSfo=;
 b=e7y5o2QbMaYgEzp/6H3nVYqjHUoNaSuOr8vA9wJnJJGKlPjcyL7p3ya312pr030F4c0c
 WywiHhJlMvXuPmi5++pNF+USqFjiCP2lJx7tkJXrx3KpMn1l9lZh8q2Z3NzS+us9Vooq
 3AzAR4yZCdwI+TFQ/1p02CkvDNGUB5mlmNZ+QXt9OHHa6OjAm7bI1+51BBYyHiZ0ygRZ
 4zhx6HmdL2h+QZTsWjV12RjIu3w0wcBNJO/FlJnkaV5CsjAIx/0/98Hc7+YpX+ah9iz+
 W1aAhGTkE86m21tu0TX1z1fZEhPyknlF/QZEVSAPmkE1Z0oOTd9B/wsbO/vFDjeOoKjt 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwf0kn6j-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 01 Jul 2019 10:14:35 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31C6B3D;
 Mon,  1 Jul 2019 08:14:35 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D728191D;
 Mon,  1 Jul 2019 08:14:35 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 1 Jul 2019 10:14:34 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <alexandre.torgue@st.com>
Date: Mon, 1 Jul 2019 10:14:23 +0200
Message-ID: <1561968865-22037-3-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
References: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_06:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/4] regulator: add support for the
	stm32-booster
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

Add support for the 3.3V booster regulator embedded in stm32h7 and stm32mp1
devices, that can be used to supply ADC analog input switches.

This regulator is supplied by vdda. It's controlled by using SYSCFG:
- STM32H7 has a unique register to set/clear the booster enable bit
- STM32MP1 has separate set and clear registers to configure it.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
Changes in v2:
- rebase on top of for-next branch
---
 drivers/regulator/Kconfig         |  11 ++++
 drivers/regulator/Makefile        |   1 +
 drivers/regulator/stm32-booster.c | 132 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 drivers/regulator/stm32-booster.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 0e7d425..1e590ec 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -839,6 +839,17 @@ config REGULATOR_SLG51000
 	  The SLG51000 is seven compact and customizable low dropout
 	  regulators.
 
+config REGULATOR_STM32_BOOSTER
+	tristate "STMicroelectronics STM32 BOOSTER"
+	depends on ARCH_STM32 || COMPILE_TEST
+	help
+	  This driver supports internal booster (3V3) embedded in some
+	  STMicroelectronics STM32 chips. It can be used to supply ADC analog
+	  input switches when vdda supply is below 2.7V.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called stm32-booster.
+
 config REGULATOR_STM32_VREFBUF
 	tristate "STMicroelectronics STM32 VREFBUF"
 	depends on ARCH_STM32 || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index c15b0b6..eef73b5 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -105,6 +105,7 @@ obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
 obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_SLG51000) += slg51000-regulator.o
+obj-$(CONFIG_REGULATOR_STM32_BOOSTER) += stm32-booster.o
 obj-$(CONFIG_REGULATOR_STM32_VREFBUF) += stm32-vrefbuf.o
 obj-$(CONFIG_REGULATOR_STM32_PWR) += stm32-pwr.o
 obj-$(CONFIG_REGULATOR_STPMIC1) += stpmic1_regulator.o
diff --git a/drivers/regulator/stm32-booster.c b/drivers/regulator/stm32-booster.c
new file mode 100644
index 0000000..2a89766
--- /dev/null
+++ b/drivers/regulator/stm32-booster.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) STMicroelectronics 2019
+// Author(s): Fabrice Gasnier <fabrice.gasnier@st.com>.
+
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+/* STM32H7 SYSCFG register */
+#define STM32H7_SYSCFG_PMCR		0x04
+#define STM32H7_SYSCFG_BOOSTE_MASK	BIT(8)
+
+/* STM32MP1 SYSCFG has set and clear registers */
+#define STM32MP1_SYSCFG_PMCSETR		0x04
+#define STM32MP1_SYSCFG_PMCCLRR		0x44
+#define STM32MP1_SYSCFG_EN_BOOSTER_MASK	BIT(8)
+
+static const struct regulator_ops stm32h7_booster_ops = {
+	.list_voltage	= regulator_list_voltage_linear,
+	.enable		= regulator_enable_regmap,
+	.disable	= regulator_disable_regmap,
+	.is_enabled	= regulator_is_enabled_regmap,
+};
+
+static const struct regulator_desc stm32h7_booster_desc = {
+	.name = "booster",
+	.supply_name = "vdda",
+	.n_voltages = 1,
+	.type = REGULATOR_VOLTAGE,
+	.min_uV = 3300000,
+	.fixed_uV = 3300000,
+	.ramp_delay = 66000, /* up to 50us to stabilize */
+	.ops = &stm32h7_booster_ops,
+	.enable_reg = STM32H7_SYSCFG_PMCR,
+	.enable_mask = STM32H7_SYSCFG_BOOSTE_MASK,
+	.owner = THIS_MODULE,
+};
+
+static int stm32mp1_booster_enable(struct regulator_dev *rdev)
+{
+	return regmap_write(rdev->regmap, STM32MP1_SYSCFG_PMCSETR,
+			    STM32MP1_SYSCFG_EN_BOOSTER_MASK);
+}
+
+static int stm32mp1_booster_disable(struct regulator_dev *rdev)
+{
+	return regmap_write(rdev->regmap, STM32MP1_SYSCFG_PMCCLRR,
+			    STM32MP1_SYSCFG_EN_BOOSTER_MASK);
+}
+
+static const struct regulator_ops stm32mp1_booster_ops = {
+	.list_voltage	= regulator_list_voltage_linear,
+	.enable		= stm32mp1_booster_enable,
+	.disable	= stm32mp1_booster_disable,
+	.is_enabled	= regulator_is_enabled_regmap,
+};
+
+static const struct regulator_desc stm32mp1_booster_desc = {
+	.name = "booster",
+	.supply_name = "vdda",
+	.n_voltages = 1,
+	.type = REGULATOR_VOLTAGE,
+	.min_uV = 3300000,
+	.fixed_uV = 3300000,
+	.ramp_delay = 66000,
+	.ops = &stm32mp1_booster_ops,
+	.enable_reg = STM32MP1_SYSCFG_PMCSETR,
+	.enable_mask = STM32MP1_SYSCFG_EN_BOOSTER_MASK,
+	.owner = THIS_MODULE,
+};
+
+static int stm32_booster_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = pdev->dev.of_node;
+	struct regulator_config config = { };
+	const struct regulator_desc *desc;
+	struct regulator_dev *rdev;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	desc = (const struct regulator_desc *)
+		of_match_device(dev->driver->of_match_table, dev)->data;
+
+	config.regmap = regmap;
+	config.dev = dev;
+	config.of_node = np;
+	config.init_data = of_get_regulator_init_data(dev, np, desc);
+
+	rdev = devm_regulator_register(dev, desc, &config);
+	if (IS_ERR(rdev)) {
+		ret = PTR_ERR(rdev);
+		dev_err(dev, "register failed with error %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id stm32_booster_of_match[] = {
+	{
+		.compatible = "st,stm32h7-booster",
+		.data = (void *)&stm32h7_booster_desc
+	}, {
+		.compatible = "st,stm32mp1-booster",
+		.data = (void *)&stm32mp1_booster_desc
+	}, {
+	},
+};
+MODULE_DEVICE_TABLE(of, stm32_booster_of_match);
+
+static struct platform_driver stm32_booster_driver = {
+	.probe = stm32_booster_probe,
+	.driver = {
+		.name  = "stm32-booster",
+		.of_match_table = of_match_ptr(stm32_booster_of_match),
+	},
+};
+module_platform_driver(stm32_booster_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier@st.com>");
+MODULE_DESCRIPTION("STMicroelectronics STM32 booster regulator driver");
+MODULE_ALIAS("platform:stm32-booster");
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
