Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BA0A96265
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 10:46:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0F6CC78F83;
	Tue, 22 Apr 2025 08:46:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B7B6C78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 08:46:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6uxW7025914;
 Tue, 22 Apr 2025 10:45:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 G5QwhiB9ckMYU+v2PasOvCwP+vJIqkfQsPKSHgTQJ2s=; b=ArBGJhuKBMEyVoi8
 OvNSFCd24X5huq39ui4Hh3zbKQdTKcgkZI5w60xMpUd7Qpm00nHfhNjj1ucV1Yh1
 lxfyr+khgZglkPW5Cj159HwX8D3lquDx9im2gzFXs7vPreRtsDG3HzFo4cXAWsax
 /m4Inb2vSqqIQI3EBfbUnlNF4/JgWwtKSEH3/9T1691esWtBudyJWnmgbi0cg9hz
 XJuqmK7kgI3XTWAUWOqZagZmVFsrXQDtdpEdO41g/OrZKhIhcSJx8ELyzz17GKZJ
 QgwFOLjBlLYHC9GHDbBjQylOS7Ui3pPb7QAlcOhK5X6lHZ30iyQAwIgbHGEXqF5v
 GPH5WA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46436297kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 10:45:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8897A40049;
 Tue, 22 Apr 2025 10:44:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBF2E9D873B;
 Tue, 22 Apr 2025 10:44:04 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 10:44:04 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 22 Apr 2025 10:44:01 +0200
MIME-Version: 1.0
Message-ID: <20250422-upstream_ospi_v6-v10-2-6f4942a04e10@foss.st.com>
References: <20250422-upstream_ospi_v6-v10-0-6f4942a04e10@foss.st.com>
In-Reply-To: <20250422-upstream_ospi_v6-v10-0-6f4942a04e10@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v10 2/3] memory: Add STM32 Octo Memory Manager
	driver
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

Octo Memory Manager driver (OMM) manages:
  - the muxing between 2 OSPI busses and 2 output ports.
    There are 4 possible muxing configurations:
      - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
        output is on port 2
      - OSPI1 and OSPI2 are multiplexed over the same output port 1
      - swapped mode (no multiplexing), OSPI1 output is on port 2,
        OSPI2 output is on port 1
      - OSPI1 and OSPI2 are multiplexed over the same output port 2
  - the split of the memory area shared between the 2 OSPI instances.
  - chip select selection override.
  - the time between 2 transactions in multiplexed mode.
  - check firewall access.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/memory/Kconfig     |  17 ++
 drivers/memory/Makefile    |   1 +
 drivers/memory/stm32_omm.c | 471 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 489 insertions(+)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index c82d8d8a16eaf154c247c0dbb9aff428b7c81402..3a0703fbfee7d1a9467cc74821604d3861fb1de0 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -225,6 +225,23 @@ config STM32_FMC2_EBI
 	  devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
 	  SOCs containing the FMC2 External Bus Interface.
 
+config STM32_OMM
+	tristate "STM32 Octo Memory Manager"
+	depends on SPI_STM32_OSPI || COMPILE_TEST
+	help
+	  This driver manages the muxing between the 2 OSPI busses and
+	  the 2 output ports. There are 4 possible muxing configurations:
+	  - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
+	       output is on port 2
+	  - OSPI1 and OSPI2 are multiplexed over the same output port 1
+	  - swapped mode (no multiplexing), OSPI1 output is on port 2,
+	       OSPI2 output is on port 1
+	  - OSPI1 and OSPI2 are multiplexed over the same output port 2
+	  It also manages :
+	    - the split of the memory area shared between the 2 OSPI instances.
+	    - chip select selection override.
+	    - the time between 2 transactions in multiplexed mode.
+
 source "drivers/memory/samsung/Kconfig"
 source "drivers/memory/tegra/Kconfig"
 
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index d2e6ca9abbe0231c14284e3818ce734c618f83d0..c1959661bf63775bdded6dcbe87b732883c26135 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_DA8XX_DDRCTL)	+= da8xx-ddrctl.o
 obj-$(CONFIG_PL353_SMC)		+= pl353-smc.o
 obj-$(CONFIG_RENESAS_RPCIF)	+= renesas-rpc-if.o
 obj-$(CONFIG_STM32_FMC2_EBI)	+= stm32-fmc2-ebi.o
+obj-$(CONFIG_STM32_OMM)		+= stm32_omm.o
 
 obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
 obj-$(CONFIG_TEGRA_MC)		+= tegra/
diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
new file mode 100644
index 0000000000000000000000000000000000000000..76236c23ef7a1ac8cb19e0cbd9c929bdbc0186ca
--- /dev/null
+++ b/drivers/memory/stm32_omm.c
@@ -0,0 +1,471 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author(s): Patrice Chotard <patrice.chotard@foss.st.com> for STMicroelectronics.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bus/stm32_firewall_device.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#define OMM_CR			0
+#define CR_MUXEN		BIT(0)
+#define CR_MUXENMODE_MASK	GENMASK(1, 0)
+#define CR_CSSEL_OVR_EN		BIT(4)
+#define CR_CSSEL_OVR_MASK	GENMASK(6, 5)
+#define CR_REQ2ACK_MASK		GENMASK(23, 16)
+
+#define OMM_CHILD_NB		2
+#define OMM_CLK_NB		3
+
+struct stm32_omm {
+	struct resource *mm_res;
+	struct clk_bulk_data clk_bulk[OMM_CLK_NB];
+	struct reset_control *child_reset[OMM_CHILD_NB];
+	void __iomem *io_base;
+	u32 cr;
+	u8 nb_child;
+	bool restore_omm;
+};
+
+static int stm32_omm_set_amcr(struct device *dev, bool set)
+{
+	struct stm32_omm *omm = dev_get_drvdata(dev);
+	resource_size_t mm_ospi2_size = 0;
+	static const char * const mm_name[] = { "ospi1", "ospi2" };
+	struct regmap *syscfg_regmap;
+	struct device_node *node;
+	struct resource res, res1;
+	u32 amcr_base, amcr_mask;
+	int ret, idx;
+	unsigned int i, amcr, read_amcr;
+
+	for (i = 0; i < omm->nb_child; i++) {
+		idx = of_property_match_string(dev->of_node,
+					       "memory-region-names",
+					       mm_name[i]);
+		if (idx < 0)
+			continue;
+
+		/* res1 only used on second loop iteration */
+		res1.start = res.start;
+		res1.end = res.end;
+
+		node = of_parse_phandle(dev->of_node, "memory-region", idx);
+		if (!node)
+			continue;
+
+		ret = of_address_to_resource(node, 0, &res);
+		if (ret) {
+			of_node_put(node);
+			dev_err(dev, "unable to resolve memory region\n");
+			return ret;
+		}
+
+		/* check that memory region fits inside OMM memory map area */
+		if (!resource_contains(omm->mm_res, &res)) {
+			dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
+				mm_name[i]);
+			dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);
+			of_node_put(node);
+
+			return -EFAULT;
+		}
+
+		if (i == 1) {
+			mm_ospi2_size = resource_size(&res);
+
+			/* check that OMM memory region 1 doesn't overlap memory region 2 */
+			if (resource_overlaps(&res, &res1)) {
+				dev_err(dev, "OMM memory-region %s overlaps memory region %s\n",
+					mm_name[0], mm_name[1]);
+				dev_err(dev, "%pR overlaps %pR\n", &res1, &res);
+				of_node_put(node);
+
+				return -EFAULT;
+			}
+		}
+		of_node_put(node);
+	}
+
+	syscfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "st,syscfg-amcr");
+	if (IS_ERR(syscfg_regmap))
+		return dev_err_probe(dev, PTR_ERR(syscfg_regmap),
+				     "Failed to get st,syscfg-amcr property\n");
+
+	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 1,
+					 &amcr_base);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 2,
+					 &amcr_mask);
+	if (ret)
+		return ret;
+
+	amcr = mm_ospi2_size / SZ_64M;
+
+	if (set)
+		regmap_update_bits(syscfg_regmap, amcr_base, amcr_mask, amcr);
+
+	/* read AMCR and check coherency with memory-map areas defined in DT */
+	regmap_read(syscfg_regmap, amcr_base, &read_amcr);
+	read_amcr = read_amcr >> (ffs(amcr_mask) - 1);
+
+	if (amcr != read_amcr) {
+		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int stm32_omm_toggle_child_clock(struct device *dev, bool enable)
+{
+	struct stm32_omm *omm = dev_get_drvdata(dev);
+	int i, ret;
+
+	for (i = 0; i < omm->nb_child; i++) {
+		if (enable) {
+			ret = clk_prepare_enable(omm->clk_bulk[i + 1].clk);
+			if (ret) {
+				dev_err(dev, "Can not enable clock\n");
+				goto clk_error;
+			}
+		} else {
+			clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
+		}
+	}
+
+	return 0;
+
+clk_error:
+	while (i--)
+		clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
+
+	return ret;
+}
+
+static int stm32_omm_disable_child(struct device *dev)
+{
+	struct stm32_omm *omm = dev_get_drvdata(dev);
+	struct reset_control *reset;
+	int ret;
+	u8 i;
+
+	ret = stm32_omm_toggle_child_clock(dev, true);
+	if (!ret)
+		return ret;
+
+	for (i = 0; i < omm->nb_child; i++) {
+		/* reset OSPI to ensure CR_EN bit is set to 0 */
+		reset = omm->child_reset[i];
+		ret = reset_control_acquire(reset);
+		if (ret) {
+			dev_err(dev, "Can not acquire resset %d\n", ret);
+			return ret;
+		}
+
+		reset_control_assert(reset);
+		udelay(2);
+		reset_control_deassert(reset);
+
+		reset_control_release(reset);
+	}
+
+	return stm32_omm_toggle_child_clock(dev, false);
+}
+
+static int stm32_omm_configure(struct device *dev)
+{
+	static const char * const clocks_name[] = {"omm", "ospi1", "ospi2"};
+	struct stm32_omm *omm = dev_get_drvdata(dev);
+	unsigned long clk_rate_max = 0;
+	u32 mux = 0;
+	u32 cssel_ovr = 0;
+	u32 req2ack = 0;
+	struct reset_control *rstc;
+	unsigned long clk_rate;
+	int ret;
+	u8 i;
+
+	for (i = 0; i < OMM_CLK_NB; i++)
+		omm->clk_bulk[i].id = clocks_name[i];
+
+	/* retrieve OMM, OSPI1 and OSPI2 clocks */
+	ret = devm_clk_bulk_get(dev, OMM_CLK_NB, omm->clk_bulk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get OMM/OSPI's clocks\n");
+
+	/* Ensure both OSPI instance are disabled before configuring OMM */
+	ret = stm32_omm_disable_child(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	/* parse children's clock */
+	for (i = 1; i <= omm->nb_child; i++) {
+		clk_rate = clk_get_rate(omm->clk_bulk[i].clk);
+		if (!clk_rate) {
+			dev_err(dev, "Invalid clock rate\n");
+			goto error;
+		}
+
+		if (clk_rate > clk_rate_max)
+			clk_rate_max = clk_rate;
+	}
+
+	rstc = devm_reset_control_get_exclusive(dev, "omm");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
+
+	reset_control_assert(rstc);
+	udelay(2);
+	reset_control_deassert(rstc);
+
+	omm->cr = readl_relaxed(omm->io_base + OMM_CR);
+	/* optional */
+	ret = of_property_read_u32(dev->of_node, "st,omm-mux", &mux);
+	if (!ret) {
+		if (mux & CR_MUXEN) {
+			ret = of_property_read_u32(dev->of_node, "st,omm-req2ack-ns",
+						   &req2ack);
+			if (!ret && !req2ack) {
+				req2ack = DIV_ROUND_UP(req2ack, NSEC_PER_SEC / clk_rate_max) - 1;
+
+				if (req2ack > 256)
+					req2ack = 256;
+			}
+
+			req2ack = FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
+
+			omm->cr &= ~CR_REQ2ACK_MASK;
+			omm->cr |= FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
+
+			/*
+			 * If the mux is enabled, the 2 OSPI clocks have to be
+			 * always enabled
+			 */
+			ret = stm32_omm_toggle_child_clock(dev, true);
+			if (ret)
+				goto error;
+		}
+
+		omm->cr &= ~CR_MUXENMODE_MASK;
+		omm->cr |= FIELD_PREP(CR_MUXENMODE_MASK, mux);
+	}
+
+	/* optional */
+	ret = of_property_read_u32(dev->of_node, "st,omm-cssel-ovr", &cssel_ovr);
+	if (!ret) {
+		omm->cr &= ~CR_CSSEL_OVR_MASK;
+		omm->cr |= FIELD_PREP(CR_CSSEL_OVR_MASK, cssel_ovr);
+		omm->cr |= CR_CSSEL_OVR_EN;
+	}
+
+	omm->restore_omm = true;
+	writel_relaxed(omm->cr, omm->io_base + OMM_CR);
+
+	ret = stm32_omm_set_amcr(dev, true);
+
+error:
+	pm_runtime_put_sync_suspend(dev);
+
+	return ret;
+}
+
+static int stm32_omm_check_access(struct device_node *np)
+{
+	struct stm32_firewall firewall;
+	int ret;
+
+	ret = stm32_firewall_get_firewall(np, &firewall, 1);
+	if (ret)
+		return ret;
+
+	return stm32_firewall_grant_access(&firewall);
+}
+
+static int stm32_omm_probe(struct platform_device *pdev)
+{
+	static const char * const resets_name[] = {"ospi1", "ospi2"};
+	struct device *dev = &pdev->dev;
+	u8 child_access_granted = 0;
+	struct stm32_omm *omm;
+	int i, ret;
+
+	omm = devm_kzalloc(dev, sizeof(*omm), GFP_KERNEL);
+	if (!omm)
+		return -ENOMEM;
+
+	omm->io_base = devm_platform_ioremap_resource_byname(pdev, "regs");
+	if (IS_ERR(omm->io_base))
+		return PTR_ERR(omm->io_base);
+
+	omm->mm_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory_map");
+	if (IS_ERR(omm->mm_res))
+		return PTR_ERR(omm->mm_res);
+
+	/* check child's access */
+	for_each_child_of_node_scoped(dev->of_node, child) {
+		if (omm->nb_child >= OMM_CHILD_NB) {
+			dev_err(dev, "Bad DT, found too much children\n");
+			return -E2BIG;
+		}
+
+		ret = stm32_omm_check_access(child);
+		if (ret < 0 && ret != -EACCES)
+			return ret;
+
+		if (!ret)
+			child_access_granted++;
+
+		omm->nb_child++;
+	}
+
+	if (omm->nb_child != OMM_CHILD_NB)
+		return -EINVAL;
+
+	platform_set_drvdata(pdev, omm);
+
+	devm_pm_runtime_enable(dev);
+
+	/* check if OMM's resource access is granted */
+	ret = stm32_omm_check_access(dev->of_node);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	for (i = 0; i < omm->nb_child; i++) {
+		omm->child_reset[i] = devm_reset_control_get_exclusive_released(dev,
+										resets_name[i]);
+
+		if (IS_ERR(omm->child_reset[i]))
+			return dev_err_probe(dev, PTR_ERR(omm->child_reset[i]),
+					     "Can't get %s reset\n", resets_name[i]);
+	}
+
+	if (!ret && child_access_granted == OMM_CHILD_NB) {
+		ret = stm32_omm_configure(dev);
+		if (ret)
+			return ret;
+	} else {
+		dev_dbg(dev, "Octo Memory Manager resource's access not granted\n");
+		/*
+		 * AMCR can't be set, so check if current value is coherent
+		 * with memory-map areas defined in DT
+		 */
+		ret = stm32_omm_set_amcr(dev, false);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		dev_err(dev, "Failed to create Octo Memory Manager child\n");
+
+	return ret;
+}
+
+static void stm32_omm_remove(struct platform_device *pdev)
+{
+	struct stm32_omm *omm = platform_get_drvdata(pdev);
+
+	if (omm->cr & CR_MUXEN)
+		stm32_omm_toggle_child_clock(&pdev->dev, false);
+}
+
+static const struct of_device_id stm32_omm_of_match[] = {
+	{ .compatible = "st,stm32mp25-omm", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, stm32_omm_of_match);
+
+static int __maybe_unused stm32_omm_runtime_suspend(struct device *dev)
+{
+	struct stm32_omm *omm = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(omm->clk_bulk[0].clk);
+
+	return 0;
+}
+
+static int __maybe_unused stm32_omm_runtime_resume(struct device *dev)
+{
+	struct stm32_omm *omm = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(omm->clk_bulk[0].clk);
+}
+
+static int __maybe_unused stm32_omm_suspend(struct device *dev)
+{
+	struct stm32_omm *omm = dev_get_drvdata(dev);
+
+	if (omm->restore_omm && omm->cr & CR_MUXEN)
+		stm32_omm_toggle_child_clock(dev, false);
+
+	return pinctrl_pm_select_sleep_state(dev);
+}
+
+static int __maybe_unused stm32_omm_resume(struct device *dev)
+{
+	struct stm32_omm *omm = dev_get_drvdata(dev);
+	int ret;
+
+	pinctrl_pm_select_default_state(dev);
+
+	if (!omm->restore_omm)
+		return 0;
+
+	/* Ensure both OSPI instance are disabled before configuring OMM */
+	ret = stm32_omm_disable_child(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	writel_relaxed(omm->cr, omm->io_base + OMM_CR);
+	ret = stm32_omm_set_amcr(dev, true);
+	pm_runtime_put_sync_suspend(dev);
+	if (ret)
+		return ret;
+
+	if (omm->cr & CR_MUXEN)
+		ret = stm32_omm_toggle_child_clock(dev, true);
+
+	return ret;
+}
+
+static const struct dev_pm_ops stm32_omm_pm_ops = {
+	SET_RUNTIME_PM_OPS(stm32_omm_runtime_suspend,
+			   stm32_omm_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(stm32_omm_suspend, stm32_omm_resume)
+};
+
+static struct platform_driver stm32_omm_driver = {
+	.probe	= stm32_omm_probe,
+	.remove = stm32_omm_remove,
+	.driver	= {
+		.name = "stm32-omm",
+		.of_match_table = stm32_omm_of_match,
+		.pm = &stm32_omm_pm_ops,
+	},
+};
+module_platform_driver(stm32_omm_driver);
+
+MODULE_DESCRIPTION("STMicroelectronics Octo Memory Manager driver");
+MODULE_LICENSE("GPL");

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
