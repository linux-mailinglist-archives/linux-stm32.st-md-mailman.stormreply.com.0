Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED0AA86D7E
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 16:10:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44E8DC78F77;
	Sat, 12 Apr 2025 14:10:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D208C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 14:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TzZSekNjF10GEoJOoBkiDNi20o8XQUc9JGN7JTqcMVQ=; b=mQAsr3Hk3WRBChwUcoFcE2fHio
 khJvcwBu0XeBZtwcMTAtIAgAGL23iAUfBybYrMJhY8ZpKXiOGbBUb+Ys7/aAanRM3XldXJDr6mR6F
 7JGETeHGhGbM/VtQuuT8Il2IMOleaIeQBdkJ9ynGWO3hTkjl29i8FFpq7a30PPFMrzruYm04uvpec
 hJxTQ4vJvjx3FA00iV1niJqpVsppsDzY3Cac0kN3DS3WBUdnatR4i7JKp5HYijltBd5ddI037nUUI
 NQMYMHx5XW5N9hZJt/+t+TLP7H2G0Jv6cgGlWjkcGcBH6f6FbqVRQtGD20ZMdNMT1UeTHPV6FvwLE
 t38iIHxg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51240 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u3bZ1-0004aR-1n;
 Sat, 12 Apr 2025 15:10:31 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u3bYQ-000EcK-9K; Sat, 12 Apr 2025 15:09:54 +0100
In-Reply-To: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u3bYQ-000EcK-9K@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:09:54 +0100
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/4] net: stmmac: qcom-ethqos: remove
	ethqos->speed
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

Rather than ethqos_fix_mac_speed() storing the speed in struct
qcom_ethqos and then functions that are only called from here reading
that speed, pass the speed to the called functions instead.

This removes all readers of this struct member, which then allows the
removal of the two places that set its value and the struct member.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 31 +++++++++----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 5d8cd4336a8c..cd25aea3e48f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -106,12 +106,11 @@ struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
-	int (*configure_func)(struct qcom_ethqos *ethqos);
+	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
 	unsigned int link_clk_rate;
 	struct clk *link_clk;
 	struct phy *serdes_phy;
-	int speed;
 	int serdes_speed;
 	phy_interface_t phy_mode;
 
@@ -385,7 +384,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
+static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
 	int phase_shift;
@@ -412,7 +411,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
 		      0, RGMII_IO_MACRO_CONFIG);
 
-	switch (ethqos->speed) {
+	switch (speed) {
 	case SPEED_1000:
 		rgmii_updatel(ethqos, RGMII_CONFIG_DDR_MODE,
 			      RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
@@ -532,14 +531,14 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
 			      loopback, RGMII_IO_MACRO_CONFIG);
 		break;
 	default:
-		dev_err(dev, "Invalid speed %d\n", ethqos->speed);
+		dev_err(dev, "Invalid speed %d\n", speed);
 		return -EINVAL;
 	}
 
 	return 0;
 }
 
-static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
+static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
 	volatile unsigned int dll_lock;
@@ -562,7 +561,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 		      SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
 
 	if (ethqos->has_emac_ge_3) {
-		if (ethqos->speed == SPEED_1000) {
+		if (speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
 			rgmii_writel(ethqos, 0xA001, SDCC_HC_REG_DLL_CONFIG2);
@@ -580,7 +579,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_PDN, 0,
 		      SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->speed != SPEED_100 && ethqos->speed != SPEED_10) {
+	if (speed != SPEED_100 && speed != SPEED_10) {
 		/* Set DLL_EN */
 		rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
 			      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
@@ -607,10 +606,10 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 			dev_err(dev, "Timeout while waiting for DLL lock\n");
 	}
 
-	if (ethqos->speed == SPEED_1000)
+	if (speed == SPEED_1000)
 		ethqos_dll_configure(ethqos);
 
-	ethqos_rgmii_macro_init(ethqos);
+	ethqos_rgmii_macro_init(ethqos, speed);
 
 	return 0;
 }
@@ -626,7 +625,7 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
-static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
+static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -634,7 +633,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 
 	val = readl(ethqos->mac_base + MAC_CTRL_REG);
 
-	switch (ethqos->speed) {
+	switch (speed) {
 	case SPEED_2500:
 		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
@@ -681,9 +680,9 @@ static void qcom_ethqos_speed_mode_2500(struct net_device *ndev, void *data)
 	priv->plat->phy_interface = PHY_INTERFACE_MODE_2500BASEX;
 }
 
-static int ethqos_configure(struct qcom_ethqos *ethqos)
+static int ethqos_configure(struct qcom_ethqos *ethqos, int speed)
 {
-	return ethqos->configure_func(ethqos);
+	return ethqos->configure_func(ethqos, speed);
 }
 
 static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
@@ -691,9 +690,8 @@ static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
 	struct qcom_ethqos *ethqos = priv;
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
-	ethqos->speed = speed;
 	ethqos_update_link_clk(ethqos, speed);
-	ethqos_configure(ethqos);
+	ethqos_configure(ethqos, speed);
 }
 
 static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
@@ -847,7 +845,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
 				     "Failed to get serdes phy\n");
 
-	ethqos->speed = SPEED_1000;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
