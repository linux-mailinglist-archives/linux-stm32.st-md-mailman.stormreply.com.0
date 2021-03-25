Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD53348BCC
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 09:46:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40A66C57B78;
	Thu, 25 Mar 2021 08:46:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A34DC57B5E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 08:43:31 +0000 (UTC)
IronPort-SDR: DMN0NZhvu+XXsX4KeiPJ92j1zEsmK/6V/gdiOVZZ487LqywFEsqruEP5cDYhq+NHcsYOSkAKXj
 h4wVFdN2zUMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="276008712"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="276008712"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 01:43:29 -0700
IronPort-SDR: tWueMzg3hqLScUXwbEniJ64NgVorsjT5hfpIjRpOnwwfG9P1PTLb09AhIgjmaBX74JbwCyZCof
 s9r5WO+5EYFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="452976328"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga001.jf.intel.com with ESMTP; 25 Mar 2021 01:43:24 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com,
 linux@armlinux.org.uk, weifeng.voon@intel.com, boon.leong.ong@intel.com,
 qiangqing.zhang@nxp.com, vee.khee.wong@intel.com, fugang.duan@nxp.com,
 kim.tatt.chuah@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew@lunn.ch, hkallweit1@gmail.com
Date: Thu, 25 Mar 2021 16:38:05 +0800
Message-Id: <20210325083806.19382-2-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325083806.19382-1-michael.wei.hong.sit@intel.com>
References: <20210325083806.19382-1-michael.wei.hong.sit@intel.com>
X-Mailman-Approved-At: Thu, 25 Mar 2021 08:46:05 +0000
Subject: [Linux-stm32] [PATCH net-next v3 1/2] net: stmmac: enable 2.5Gbps
	link speed
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Voon Weifeng <weifeng.voon@intel.com>

The MAC support 2.5G mode when the PCS is in 1000BASE-T mode. The
2.5G mode of operation is functionally same as 1000BASE-T mode,
except that the clock rate is 2.5 times the original rate.
In this mode, the serdes/PHY operates at a serial baud rate of
3.125 Gbps and the PCS data path and GMII interface of the MAC
operate at 312.5 MHz instead of 125 MHz.

The MAC running in 10M/100M/1G mode or 2.5G mode depends on
the link speed mode in the serdes.

Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 44 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.h | 13 ++++++
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 35 ++++++++++++++-
 include/linux/stmmac.h                        |  2 +
 5 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 8e4dbfdca237..750e7b7c554e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -96,6 +96,22 @@ static int intel_serdes_powerup(struct net_device *ndev, void *priv_data)
 
 	serdes_phy_addr = intel_priv->mdio_adhoc_addr;
 
+	/* Set the serdes rate and the PCLK rate */
+	data = mdiobus_read(priv->mii, serdes_phy_addr,
+			    SERDES_GCR0);
+
+	data &= ~SERDES_RATE_MASK;
+	data &= ~SERDES_PCLK_MASK;
+
+	if (priv->plat->speed_2500_en)
+		data |= SERDES_RATE_PCIE_GEN2 << SERDES_RATE_PCIE_SHIFT |
+			SERDES_PCLK_37p5MHZ << SERDES_PCLK_SHIFT;
+	else
+		data |= SERDES_RATE_PCIE_GEN1 << SERDES_RATE_PCIE_SHIFT |
+			SERDES_PCLK_70MHZ << SERDES_PCLK_SHIFT;
+
+	mdiobus_write(priv->mii, serdes_phy_addr, SERDES_GCR0, data);
+
 	/* assert clk_req */
 	data = mdiobus_read(priv->mii, serdes_phy_addr, SERDES_GCR0);
 	data |= SERDES_PLL_CLK;
@@ -214,6 +230,28 @@ static void intel_serdes_powerdown(struct net_device *ndev, void *intel_data)
 	}
 }
 
+static bool intel_speed_mode_2500(struct net_device *ndev, void *intel_data)
+{
+	struct intel_priv_data *intel_priv = intel_data;
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	int serdes_phy_addr = 0;
+	u32 data = 0;
+
+	serdes_phy_addr = intel_priv->mdio_adhoc_addr;
+
+	/* Determine the link speed mode: 2.5Gbps/1Gbps */
+	data = mdiobus_read(priv->mii, serdes_phy_addr,
+			    SERDES_GCR);
+
+	if (((data & SERDES_LINK_MODE_MASK) >> SERDES_LINK_MODE_SHIFT) ==
+	    SERDES_LINK_MODE_2G5) {
+		dev_info(priv->device, "Link Speed Mode: 2.5Gbps\n");
+		return true;
+	} else {
+		return false;
+	}
+}
+
 /* Program PTP Clock Frequency for different variant of
  * Intel mGBE that has slightly different GPO mapping
  */
@@ -405,7 +443,7 @@ static int ehl_sgmii_data(struct pci_dev *pdev,
 {
 	plat->bus_id = 1;
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
-
+	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
 
@@ -456,6 +494,7 @@ static int ehl_pse0_sgmii1g_data(struct pci_dev *pdev,
 				 struct plat_stmmacenet_data *plat)
 {
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
 	return ehl_pse0_common_data(pdev, plat);
@@ -492,6 +531,7 @@ static int ehl_pse1_sgmii1g_data(struct pci_dev *pdev,
 				 struct plat_stmmacenet_data *plat)
 {
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
 	return ehl_pse1_common_data(pdev, plat);
@@ -516,6 +556,7 @@ static int tgl_sgmii_phy0_data(struct pci_dev *pdev,
 {
 	plat->bus_id = 1;
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
 	return tgl_common_data(pdev, plat);
@@ -530,6 +571,7 @@ static int tgl_sgmii_phy1_data(struct pci_dev *pdev,
 {
 	plat->bus_id = 2;
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
 	return tgl_common_data(pdev, plat);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
index e723096c0b15..021a5c178d97 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
@@ -9,6 +9,7 @@
 #define POLL_DELAY_US 8
 
 /* SERDES Register */
+#define SERDES_GCR	0x0	/* Global Conguration */
 #define SERDES_GSR0	0x5	/* Global Status Reg0 */
 #define SERDES_GCR0	0xb	/* Global Configuration Reg0 */
 
@@ -16,8 +17,20 @@
 #define SERDES_PLL_CLK		BIT(0)		/* PLL clk valid signal */
 #define SERDES_RST		BIT(2)		/* Serdes Reset */
 #define SERDES_PWR_ST_MASK	GENMASK(6, 4)	/* Serdes Power state*/
+#define SERDES_RATE_MASK	GENMASK(9, 8)
+#define SERDES_PCLK_MASK	GENMASK(14, 12)	/* PCLK rate to PHY */
+#define SERDES_LINK_MODE_MASK	GENMASK(2, 1)
+#define SERDES_LINK_MODE_SHIFT	1
 #define SERDES_PWR_ST_SHIFT	4
 #define SERDES_PWR_ST_P0	0x0
 #define SERDES_PWR_ST_P3	0x3
+#define SERDES_LINK_MODE_2G5	0x3
+#define SERSED_LINK_MODE_1G	0x2
+#define SERDES_PCLK_37p5MHZ	0x0
+#define SERDES_PCLK_70MHZ	0x1
+#define SERDES_RATE_PCIE_GEN1	0x0
+#define SERDES_RATE_PCIE_GEN2	0x1
+#define SERDES_RATE_PCIE_SHIFT	8
+#define SERDES_PCLK_SHIFT	12
 
 #endif /* __DWMAC_INTEL_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 29f765a246a0..cbfc4de7e9a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -1349,6 +1349,7 @@ int dwmac4_setup(struct stmmac_priv *priv)
 	mac->link.speed10 = GMAC_CONFIG_PS;
 	mac->link.speed100 = GMAC_CONFIG_FES | GMAC_CONFIG_PS;
 	mac->link.speed1000 = 0;
+	mac->link.speed2500 = GMAC_CONFIG_FES;
 	mac->link.speed_mask = GMAC_CONFIG_FES | GMAC_CONFIG_PS;
 	mac->mii.addr = GMAC_MDIO_ADDR;
 	mac->mii.data = GMAC_MDIO_DATA;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c89f0421bfdb..df582ad7892a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -877,6 +877,25 @@ static void stmmac_validate(struct phylink_config *config,
 	phylink_set(mac_supported, Asym_Pause);
 	phylink_set_port_modes(mac_supported);
 
+	if (priv->plat->has_gmac ||
+	    priv->plat->has_gmac4 ||
+	    priv->plat->has_xgmac) {
+		phylink_set(mac_supported, 1000baseT_Half);
+		phylink_set(mac_supported, 1000baseT_Full);
+		phylink_set(mac_supported, 1000baseKX_Full);
+	}
+
+	/* 2.5G mode only support 2500baseT full duplex only */
+	if (priv->plat->has_gmac4 && priv->plat->speed_2500_en) {
+		phylink_set(mac_supported, 2500baseT_Full);
+		phylink_set(mask, 10baseT_Half);
+		phylink_set(mask, 10baseT_Full);
+		phylink_set(mask, 100baseT_Half);
+		phylink_set(mask, 100baseT_Full);
+		phylink_set(mask, 1000baseT_Half);
+		phylink_set(mask, 1000baseT_Full);
+	}
+
 	/* Cut down 1G if asked to */
 	if ((max_speed > 0) && (max_speed < 1000)) {
 		phylink_set(mask, 1000baseT_Full);
@@ -1166,8 +1185,14 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	priv->phylink_config.dev = &priv->dev->dev;
 	priv->phylink_config.type = PHYLINK_NETDEV;
 	priv->phylink_config.pcs_poll = true;
-	priv->phylink_config.ovr_an_inband =
-		priv->plat->mdio_bus_data->xpcs_an_inband;
+	/* For 2.5G, we do not use SGMII in-band AN */
+	if (priv->plat->speed_2500_en) {
+		priv->phylink_config.ovr_an_inband = false;
+	} else {
+		priv->phylink_config.ovr_an_inband =
+			priv->plat->mdio_bus_data->xpcs_an_inband;
+	}
+
 
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
@@ -5284,6 +5309,12 @@ int stmmac_dvr_probe(struct device *device,
 		}
 	}
 
+	if (priv->plat->speed_mode_2500) {
+		priv->plat->speed_2500_en = priv->plat->speed_mode_2500(ndev,
+									priv->plat->bsp_priv);
+		priv->hw->xpcs_args.speed_2500_en = priv->plat->speed_2500_en;
+	}
+
 	ret = stmmac_phy_setup(priv);
 	if (ret) {
 		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index bf73982f92b3..d68805a57eb4 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -182,6 +182,7 @@ struct plat_stmmacenet_data {
 	void (*fix_mac_speed)(void *priv, unsigned int speed);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
+	bool (*speed_mode_2500)(struct net_device *ndev, void *priv);
 	void (*ptp_clk_freq_config)(void *priv);
 	int (*init)(struct platform_device *pdev, void *priv);
 	void (*exit)(struct platform_device *pdev, void *priv);
@@ -205,6 +206,7 @@ struct plat_stmmacenet_data {
 	int has_xgmac;
 	bool vlan_fail_q_en;
 	u8 vlan_fail_q;
+	bool speed_2500_en;
 	unsigned int eee_usecs_rate;
 	struct pci_dev *pdev;
 	bool has_safety_feat;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
