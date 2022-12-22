Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB4653E00
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 11:08:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85598C6904D;
	Thu, 22 Dec 2022 10:08:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49DCEC6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 10:08:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BM7iASD001801; Thu, 22 Dec 2022 11:07:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=tzeNCEGgeWwB6hmTiwRszChcIsxaZzEkO100I3xFQ8A=;
 b=4KwF5+becYHE4M6emXCG1428SuI13COpDTIYJWL70bhDe6Fwi8oRNFsU6v2XJc+rEKIq
 1GL0vbzHGGszAHX2YHQTMPqlAaqLR+XjWKJ05AKs9AdnsG3x6cMMducgbcqjDT3MAeAI
 gy5drRwkHzuqlO01wCuU1OWrl5lM4gF7YS5rVdlfMhbJEzpz2R/dE8axUTjuS+hT4OV2
 HaE2KmJBmpN0bvFAdgAu2HuCJlcEpYqKh5KKsaqur1IyoaSWR5bWvCieHUtSW4QTiP/G
 s/AqxU6oYx7ouOFATIu5Najn0kxl6ZCFLX8r6K79V1ZFk/gLG7E2MSh93hgKqPsjmrEw Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mka9xfdnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 11:07:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0819F10002A;
 Thu, 22 Dec 2022 11:07:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0036F2122E6;
 Thu, 22 Dec 2022 11:07:45 +0100 (CET)
Received: from localhost (10.201.21.217) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 22 Dec
 2022 11:07:44 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>,
 <Oleksii_Moisieiev@epam.com>, <linus.walleij@linaro.org>,
 <gregkh@linuxfoundation.org>
Date: Thu, 22 Dec 2022 11:07:13 +0100
Message-ID: <20221222100715.69233-6-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.217]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_05,2022-12-21_01,2022-06-22_01
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, gatien.chevallier@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH v2 5/7] bus: stm32_sys_bus: add support
	for STM32MP15 and STM32MP13 system bus
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

This driver is checking the access rights of the different
peripherals connected to the system bus. If access is denied,
the associated device tree node is skipped so the platform bus
does not probe it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>
---

Changes in V2:
	- Re-ordered Signed-off-by tags

 MAINTAINERS                 |   6 ++
 drivers/bus/Kconfig         |   9 ++
 drivers/bus/Makefile        |   1 +
 drivers/bus/stm32_sys_bus.c | 180 ++++++++++++++++++++++++++++++++++++
 4 files changed, 196 insertions(+)
 create mode 100644 drivers/bus/stm32_sys_bus.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 886d3f69ee64..768a8272233e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19522,6 +19522,12 @@ L:	linux-spi@vger.kernel.org
 S:	Maintained
 F:	drivers/spi/spi-stm32.c
 
+ST STM32 SYS BUS DRIVER
+M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/bus/st,sys-bus.yaml
+F:	drivers/bus/stm32_sys_bus.c
+
 ST STPDDC60 DRIVER
 M:	Daniel Nilsson <daniel.nilsson@flex.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 7bfe998f3514..638bf5839cb0 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -163,6 +163,15 @@ config QCOM_SSC_BLOCK_BUS
 	  i2c/spi/uart controllers, a hexagon core, and a clock controller
 	  which provides clocks for the above.
 
+config STM32_SYS_BUS
+	bool "STM32 System bus controller"
+	depends on ARCH_STM32
+	default MACH_STM32MP157 || MACH_STM32MP13
+	help
+	  Say y to enable device access right verification before device probing.
+	  If access not granted, device won't be probed and an error message will
+	  provide the reason.
+
 config SUN50I_DE2_BUS
 	bool "Allwinner A64 DE2 Bus Driver"
 	  default ARM64
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index d90eed189a65..b15fdc42d0be 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
+obj-$(CONFIG_STM32_SYS_BUS)	+= stm32_sys_bus.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
 obj-$(CONFIG_OF)		+= simple-pm-bus.o
diff --git a/drivers/bus/stm32_sys_bus.c b/drivers/bus/stm32_sys_bus.c
new file mode 100644
index 000000000000..e4c21e24b65e
--- /dev/null
+++ b/drivers/bus/stm32_sys_bus.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+/* ETZPC peripheral as firewall bus */
+/* ETZPC registers */
+#define ETZPC_DECPROT			0x10
+
+/* ETZPC miscellaneous */
+#define ETZPC_PROT_MASK			GENMASK(1, 0)
+#define ETZPC_PROT_A7NS			0x3
+#define ETZPC_DECPROT_SHIFT		1
+
+#define IDS_PER_DECPROT_REGS		16
+#define STM32MP15_ETZPC_ENTRIES		96
+#define STM32MP13_ETZPC_ENTRIES		64
+
+struct sys_bus_data;
+
+struct stm32_sys_bus_match_data {
+	const u32 *map_table;
+	unsigned int max_entries;
+	int (*sys_bus_get_access)(struct sys_bus_data *pdata, struct device_node *np);
+};
+
+struct sys_bus_data {
+	struct stm32_sys_bus_match_data *pconf;
+	void __iomem *sys_bus_base;
+	struct device *dev;
+};
+
+static int stm32_sys_bus_get_periph_id(struct sys_bus_data *pdata, struct device_node *np, u32 *id)
+{
+	int err;
+	u32 feature_domain_cell[2];
+	u32 id_bus;
+
+	/* Get reg from device node */
+	err = of_property_read_u32_array(np, "feature-domains", feature_domain_cell, 2);
+	if (err) {
+		dev_err(pdata->dev, "Unable to find feature-domains property\n");
+		return -ENODEV;
+	}
+
+	id_bus = feature_domain_cell[1];
+
+	if (id_bus >= pdata->pconf->max_entries) {
+		dev_err(pdata->dev, "Invalid sys bus ID for %s\n", np->full_name);
+		return -EINVAL;
+	}
+
+	*id = id_bus;
+
+	return 0;
+}
+
+static int stm32_etzpc_get_access(struct sys_bus_data *pdata, struct device_node *np)
+{
+	int err;
+	u32 offset, reg_offset, sec_val, id;
+
+	err = stm32_sys_bus_get_periph_id(pdata, np, &id);
+	if (err)
+		return err;
+
+	/* Check access configuration, 16 peripherals per register */
+	reg_offset = ETZPC_DECPROT + 0x4 * (id / IDS_PER_DECPROT_REGS);
+	offset = (id % IDS_PER_DECPROT_REGS) << ETZPC_DECPROT_SHIFT;
+
+	/* Verify peripheral is non-secure and attributed to cortex A7 */
+	sec_val = (readl(pdata->sys_bus_base + reg_offset) >> offset) & ETZPC_PROT_MASK;
+	if (sec_val != ETZPC_PROT_A7NS) {
+		dev_dbg(pdata->dev, "Invalid bus configuration: reg_offset %#x, value %d\n",
+			reg_offset, sec_val);
+		return -EACCES;
+	}
+
+	return 0;
+}
+
+static void stm32_sys_bus_populate(struct sys_bus_data *pdata)
+{
+	struct device *parent;
+	struct device_node *child;
+
+	parent = pdata->dev;
+
+	dev_dbg(parent, "Populating %s system bus\n", pdata->dev->driver->name);
+
+	for_each_available_child_of_node(dev_of_node(parent), child) {
+		if (pdata->pconf->sys_bus_get_access(pdata, child)) {
+			/*
+			 * Peripheral access not allowed.
+			 * Mark the node as populated so platform bus won't probe it
+			 */
+			of_node_set_flag(child, OF_POPULATED);
+			dev_dbg(parent, "%s: Peripheral will not be probed\n",
+				child->full_name);
+		}
+	}
+}
+
+static int stm32_sys_bus_probe(struct platform_device *pdev)
+{
+	struct sys_bus_data *pdata;
+	struct resource *res;
+	void __iomem *mmio;
+	struct stm32_sys_bus_match_data *mdata;
+	struct device_node *np = pdev->dev.of_node;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	mmio = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
+
+	pdata->sys_bus_base = mmio;
+
+	mdata = (struct stm32_sys_bus_match_data *)of_device_get_match_data(&pdev->dev);
+	if (!mdata)
+		return -EINVAL;
+
+	pdata->pconf = mdata;
+	pdata->dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, pdata);
+
+	stm32_sys_bus_populate(pdata);
+
+	/* Populate all available nodes */
+	return of_platform_populate(np, NULL, NULL, &pdev->dev);
+}
+
+static const struct stm32_sys_bus_match_data stm32mp15_sys_bus_data = {
+	.max_entries = STM32MP15_ETZPC_ENTRIES,
+	.sys_bus_get_access = stm32_etzpc_get_access,
+};
+
+static const struct stm32_sys_bus_match_data stm32mp13_sys_bus_data = {
+	.max_entries = STM32MP13_ETZPC_ENTRIES,
+	.sys_bus_get_access = stm32_etzpc_get_access,
+};
+
+static const struct of_device_id stm32_sys_bus_of_match[] = {
+	{ .compatible = "st,stm32mp15-sys-bus", .data = &stm32mp15_sys_bus_data },
+	{ .compatible = "st,stm32mp13-sys-bus", .data = &stm32mp13_sys_bus_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, stm32_sys_bus_of_match);
+
+static struct platform_driver stm32_sys_bus_driver = {
+	.probe  = stm32_sys_bus_probe,
+	.driver = {
+		.name = "stm32-sys-bus",
+		.of_match_table = stm32_sys_bus_of_match,
+	},
+};
+
+static int __init stm32_sys_bus_init(void)
+{
+	return platform_driver_register(&stm32_sys_bus_driver);
+}
+arch_initcall(stm32_sys_bus_init);
+
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
