Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE0CAF6E6F
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 11:20:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98093C3F943;
	Thu,  3 Jul 2025 09:20:37 +0000 (UTC)
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net
 (zg8tmty1ljiyny4xntuumtyw.icoremail.net [165.227.155.160])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37115C3F93E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 09:20:36 +0000 (UTC)
Received: from E0005182LT.eswin.cn (unknown [10.12.96.155])
 by app2 (Coremail) with SMTP id TQJkCgDXaJJQS2Zocl+oAA--.41647S2;
 Thu, 03 Jul 2025 17:20:19 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
 jszhang@kernel.org, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
 boon.khai.ng@altera.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu,  3 Jul 2025 17:20:15 +0800
Message-Id: <20250703092015.1200-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgDXaJJQS2Zocl+oAA--.41647S2
X-Coremail-Antispam: 1UD129KBjvJXoW3tF45CrWxKr1rZr1fGrWfXwb_yoWkWr4rpa
 y8Aa45trnrAr1xG3ykJF48Ga4F9w12ga1fuF93tFn3ZFWayrZ8W3s5tFyakFyDKr9xZr13
 Gw4UAFyfuF1q9rDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7sRiWrW5UUUUU==
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
Cc: ningyu@eswincomputing.com, lizhi2@eswincomputing.com,
 Shangjuan Wei <weishangjuan@eswincomputing.com>, linmin@eswincomputing.com
Subject: [Linux-stm32] [PATCH v3 2/2] ethernet: eswin: Add eic7700 ethernet
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

From: Shangjuan Wei <weishangjuan@eswincomputing.com>

Add Ethernet controller support for Eswin's eic7700 SoC. The driver
provides management and control of Ethernet signals for the eiC7700
series chips.

Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 257 ++++++++++++++++++
 3 files changed, 269 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e52..a13b15ce1abd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -67,6 +67,17 @@ config DWMAC_ANARION

 	  This selects the Anarion SoC glue layer support for the stmmac driver.

+config DWMAC_EIC7700
+	tristate "Support for Eswin eic7700 ethernet driver"
+	select CRC32
+	select MII
+	depends on OF && HAS_DMA && ARCH_ESWIN || COMPILE_TEST
+	help
+	  This driver supports the Eswin EIC7700 Ethernet controller,
+	  which integrates Synopsys DesignWare QoS features. It enables
+	  high-speed networking with DMA acceleration and is optimized
+	  for embedded systems.
+
 config DWMAC_INGENIC
 	tristate "Ingenic MAC support"
 	default MACH_INGENIC
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index b591d93f8503..f4ec5fc16571 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -14,6 +14,7 @@ stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
 # Ordering matters. Generic driver must be last.
 obj-$(CONFIG_STMMAC_PLATFORM)	+= stmmac-platform.o
 obj-$(CONFIG_DWMAC_ANARION)	+= dwmac-anarion.o
+obj-$(CONFIG_DWMAC_EIC7700)	+= dwmac-eic7700.o
 obj-$(CONFIG_DWMAC_INGENIC)	+= dwmac-ingenic.o
 obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
new file mode 100644
index 000000000000..000362e9987d
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Eswin DWC Ethernet linux driver
+ *
+ * Copyright 2025, Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ * Authors:
+ *   Shuang Liang <liangshuang@eswincomputing.com>
+ *   Shangjuan Wei <weishangjuan@eswincomputing.com>
+ */
+
+#include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/stmmac.h>
+#include <linux/regmap.h>
+#include <linux/of.h>
+
+#include "stmmac_platform.h"
+
+/* eth_phy_ctrl_offset eth0:0x100; eth1:0x200 */
+#define EIC7700_ETH_TX_CLK_SEL		BIT(16)
+#define EIC7700_ETH_PHY_INTF_SELI	BIT(0)
+
+/* eth_axi_lp_ctrl_offset eth0:0x108; eth1:0x208 */
+#define EIC7700_ETH_CSYSREQ_VAL		BIT(0)
+
+/* hsp_aclk_ctrl_offset (0x148) */
+#define EIC7700_HSP_ACLK_CLKEN		BIT(31)
+#define EIC7700_HSP_ACLK_DIVSOR		(0x2 << 4)
+
+/* hsp_cfg_ctrl_offset (0x14c) */
+#define EIC7700_HSP_CFG_CLKEN		BIT(31)
+#define EIC7700_SCU_HSP_PCLK_EN		BIT(30)
+#define EIC7700_HSP_CFG_CTRL_REGSET	(EIC7700_HSP_CFG_CLKEN | EIC7700_SCU_HSP_PCLK_EN)
+
+/* TX/RX clock delay (unit: 0.1ns per bit) */
+#define EIC7700_ETH_TX_ADJ_DELAY	GENMASK(14, 8)
+#define EIC7700_ETH_RX_ADJ_DELAY	GENMASK(30, 24)
+
+/* Default delay value*/
+#define EIC7700_DELAY_VALUE0 0x20202020
+#define EIC7700_DELAY_VALUE1 0x96205A20
+
+struct eic7700_qos_priv {
+	struct device *dev;
+	struct regmap *crg_regmap;
+	struct regmap *hsp_regmap;
+	u32 tx_delay_ps;
+	u32 rx_delay_ps;
+	u32 dly_hsp_reg[3];
+	u32 dly_param_1000m[3];
+	u32 dly_param_100m[3];
+	u32 dly_param_10m[3];
+};
+
+static inline void eic7700_set_delay(u32 rx_ps, u32 tx_ps, u32 *reg)
+{
+	u32 rx_val = rx_ps / 100;
+
+	if (rx_val > 0x7F)
+		rx_val = 0x7F;
+
+	*reg &= ~EIC7700_ETH_RX_ADJ_DELAY;
+	*reg |= (rx_val << 24) & EIC7700_ETH_RX_ADJ_DELAY;
+
+	u32 tx_val = tx_ps / 100;
+
+	if (tx_val > 0x7F)
+		tx_val = 0x7F;
+
+	*reg &= ~EIC7700_ETH_TX_ADJ_DELAY;
+	*reg |= (tx_val << 8) & EIC7700_ETH_TX_ADJ_DELAY;
+}
+
+static void eic7700_qos_fix_speed(void *priv, int speed, u32 mode)
+{
+	struct eic7700_qos_priv *dwc_priv = priv;
+	int i;
+
+	switch (speed) {
+	case SPEED_1000:
+		for (i = 0; i < 3; i++)
+			regmap_write(dwc_priv->hsp_regmap,
+				     dwc_priv->dly_hsp_reg[i],
+				     dwc_priv->dly_param_1000m[i]);
+		break;
+	case SPEED_100:
+		for (i = 0; i < 3; i++) {
+			regmap_write(dwc_priv->hsp_regmap,
+				     dwc_priv->dly_hsp_reg[i],
+				     dwc_priv->dly_param_100m[i]);
+		}
+		break;
+	case SPEED_10:
+		for (i = 0; i < 3; i++) {
+			regmap_write(dwc_priv->hsp_regmap,
+				     dwc_priv->dly_hsp_reg[i],
+				     dwc_priv->dly_param_10m[i]);
+		}
+		break;
+	default:
+		dev_err(dwc_priv->dev, "invalid speed %u\n", speed);
+		break;
+	}
+}
+
+static int eic7700_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct eic7700_qos_priv *dwc_priv;
+	u32 hsp_aclk_ctrl_offset;
+	u32 hsp_aclk_ctrl_regset;
+	u32 hsp_cfg_ctrl_offset;
+	u32 eth_axi_lp_ctrl_offset;
+	u32 eth_phy_ctrl_offset;
+	u32 eth_phy_ctrl_regset;
+	bool has_rx_dly = false;
+	bool has_tx_dly = false;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				"failed to get resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
+				"dt configuration failed\n");
+
+	dwc_priv = devm_kzalloc(&pdev->dev, sizeof(*dwc_priv), GFP_KERNEL);
+	if (!dwc_priv)
+		return -ENOMEM;
+
+	dwc_priv->dev = &pdev->dev;
+	dwc_priv->dly_param_1000m[0] = EIC7700_DELAY_VALUE0;
+	dwc_priv->dly_param_1000m[1] = EIC7700_DELAY_VALUE1;
+	dwc_priv->dly_param_1000m[2] = EIC7700_DELAY_VALUE0;
+	dwc_priv->dly_param_100m[0] = EIC7700_DELAY_VALUE0;
+	dwc_priv->dly_param_100m[1] = EIC7700_DELAY_VALUE1;
+	dwc_priv->dly_param_100m[2] = EIC7700_DELAY_VALUE0;
+	dwc_priv->dly_param_10m[0] = 0x0;
+	dwc_priv->dly_param_10m[1] = 0x0;
+	dwc_priv->dly_param_10m[2] = 0x0;
+
+	ret = of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
+				   &dwc_priv->rx_delay_ps);
+	if (ret)
+		dev_dbg(&pdev->dev, "can't get rx-internal-delay-ps, ret(%d).", ret);
+	else
+		has_rx_dly = true;
+
+	ret = of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
+				   &dwc_priv->tx_delay_ps);
+	if (ret)
+		dev_dbg(&pdev->dev, "can't get tx-internal-delay-ps, ret(%d).", ret);
+	else
+		has_tx_dly = true;
+	if (has_rx_dly && has_tx_dly) {
+		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
+				  &dwc_priv->dly_param_1000m[1]);
+		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
+				  &dwc_priv->dly_param_100m[1]);
+		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
+				  &dwc_priv->dly_param_10m[1]);
+	} else {
+		dev_dbg(&pdev->dev, " use default dly\n");
+	}
+
+	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "eswin,dly_hsp_reg",
+						  &dwc_priv->dly_hsp_reg[0], 3, 0);
+	if (ret != 3) {
+		dev_err(&pdev->dev, "can't get delay hsp reg.ret(%d)\n", ret);
+		return ret;
+	}
+
+	dwc_priv->crg_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+							       "eswin,syscrg_csr");
+	if (IS_ERR(dwc_priv->crg_regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwc_priv->crg_regmap),
+				"Failed to get syscrg_csr regmap\n");
+
+	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,syscrg_csr", 1,
+					 &hsp_aclk_ctrl_offset);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "can't get hsp_aclk_ctrl_offset\n");
+
+	regmap_read(dwc_priv->crg_regmap, hsp_aclk_ctrl_offset, &hsp_aclk_ctrl_regset);
+	hsp_aclk_ctrl_regset |= (EIC7700_HSP_ACLK_CLKEN | EIC7700_HSP_ACLK_DIVSOR);
+	regmap_write(dwc_priv->crg_regmap, hsp_aclk_ctrl_offset, hsp_aclk_ctrl_regset);
+
+	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,syscrg_csr", 2,
+					 &hsp_cfg_ctrl_offset);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "can't get hsp_cfg_ctrl_offset\n");
+
+	regmap_write(dwc_priv->crg_regmap, hsp_cfg_ctrl_offset, EIC7700_HSP_CFG_CTRL_REGSET);
+
+	dwc_priv->hsp_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+							       "eswin,hsp_sp_csr");
+	if (IS_ERR(dwc_priv->hsp_regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwc_priv->hsp_regmap),
+				"Failed to get hsp_sp_csr regmap\n");
+
+	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,hsp_sp_csr", 2,
+					 &eth_phy_ctrl_offset);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "can't get eth_phy_ctrl_offset\n");
+
+	regmap_read(dwc_priv->hsp_regmap, eth_phy_ctrl_offset, &eth_phy_ctrl_regset);
+	eth_phy_ctrl_regset |= (EIC7700_ETH_TX_CLK_SEL | EIC7700_ETH_PHY_INTF_SELI);
+	regmap_write(dwc_priv->hsp_regmap, eth_phy_ctrl_offset, eth_phy_ctrl_regset);
+
+	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,hsp_sp_csr", 3,
+					 &eth_axi_lp_ctrl_offset);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "can't get eth_axi_lp_ctrl_offset\n");
+
+	regmap_write(dwc_priv->hsp_regmap, eth_axi_lp_ctrl_offset, EIC7700_ETH_CSYSREQ_VAL);
+
+	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(plat_dat->clk_tx_i))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
+				"error getting tx clock\n");
+
+	plat_dat->fix_mac_speed = eic7700_qos_fix_speed;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	plat_dat->bsp_priv = dwc_priv;
+
+	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to driver probe\n");
+
+	return ret;
+}
+
+static const struct of_device_id eic7700_dwmac_match[] = {
+	{ .compatible = "eswin,eic7700-qos-eth" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, eic7700_dwmac_match);
+
+static struct platform_driver eic7700_dwmac_driver = {
+	.probe  = eic7700_dwmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name           = "eic7700-eth-dwmac",
+		.pm             = &stmmac_pltfr_pm_ops,
+		.of_match_table = eic7700_dwmac_match,
+	},
+};
+module_platform_driver(eic7700_dwmac_driver);
+
+MODULE_AUTHOR("Eswin");
+MODULE_AUTHOR("Shuang Liang <liangshuang@eswincomputing.com>");
+MODULE_AUTHOR("Shangjuan Wei <weishangjuan@eswincomputing.com>");
+MODULE_DESCRIPTION("Eswin eic7700 qos ethernet driver");
+MODULE_LICENSE("GPL");
--
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
