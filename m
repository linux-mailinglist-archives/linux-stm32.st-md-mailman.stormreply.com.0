Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7986B908C45
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 15:10:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 260EDC6B460;
	Fri, 14 Jun 2024 13:10:30 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 782C6C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 13:10:22 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E8kead019656;
 Fri, 14 Jun 2024 15:09:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 wxtvJM/S8LG5cPErR7HthqNE9krEBOGgu5Sip7uN34o=; b=P6EpU0QIwUVS06SA
 7FdNG+PgNaanMcpLqF6lrWueyoVrsrwj4Ukh5oxh4wQIt1xlerQzvgiwHqOHrptO
 cptuUYsGCY6DhzQdvateVbKL72jKvZopEUdF46J7boEAg2U7EPGvRc8jktjbtx7+
 235WNQwJZtEsz6WRwokbs4KbyymN0QYXTgmuIHrgiwRii/6MtNPIq0atIfjMEnkq
 K9/jOOVKs75EPFghGZJcSnzOKvRltPzHpZr7IP1XRS6BxyUNif6vICmVT5AgSWSL
 LchSh8WOBzCFQ8gnJI4mXLgzxRQ46m5xcKedt73hB9glIIwZZx4NcJo3x1FVTcl+
 0c+pgw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp2rr88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 15:09:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 11C4540047;
 Fri, 14 Jun 2024 15:09:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB225214D2C;
 Fri, 14 Jun 2024 15:08:24 +0200 (CEST)
Received: from localhost (10.252.5.68) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 15:08:23 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Marek Vasut <marex@denx.de>
Date: Fri, 14 Jun 2024 15:08:12 +0200
Message-ID: <20240614130812.72425-3-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240614130812.72425-1-christophe.roullier@foss.st.com>
References: <20240614130812.72425-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.5.68]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_10,2024-06-14_03,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [net-next,
	PATCH 2/2] net: stmmac: dwmac-stm32: stm32: add management of
	stm32mp25 for stm32
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

Add Ethernet support for STM32MP25.
STM32MP25 is STM32 SOC with 2 GMACs instances.
GMAC IP version is SNPS 5.3x.
GMAC IP configure with 2 RX and 4 TX queue.
DMA HW capability register supported
RX Checksum Offload Engine supported
TX Checksum insertion supported
Wake-Up On Lan supported
TSO supported

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 121 +++++++++++++++---
 1 file changed, 104 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index b2db0e26c4e4..49685fc9c7ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -53,7 +53,18 @@
 #define SYSCFG_MCU_ETH_SEL_MII		0
 #define SYSCFG_MCU_ETH_SEL_RMII		1
 
-/* STM32MP1 register definitions
+/* STM32MP2 register definitions */
+#define SYSCFG_MP2_ETH_MASK		GENMASK(31, 0)
+
+#define SYSCFG_ETHCR_ETH_PTP_CLK_SEL	BIT(2)
+#define SYSCFG_ETHCR_ETH_CLK_SEL	BIT(1)
+#define SYSCFG_ETHCR_ETH_REF_CLK_SEL	BIT(0)
+
+#define SYSCFG_ETHCR_ETH_SEL_MII	0
+#define SYSCFG_ETHCR_ETH_SEL_RGMII	BIT(4)
+#define SYSCFG_ETHCR_ETH_SEL_RMII	BIT(6)
+
+/* STM32MPx register definitions
  *
  * Below table summarizes the clock requirement and clock sources for
  * supported phy interface modes.
@@ -277,6 +288,49 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 				 dwmac->mode_mask, val);
 }
 
+static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
+{
+	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
+	u32 reg = dwmac->mode_reg;
+	int val = 0;
+
+	switch (plat_dat->mac_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		break;
+	case PHY_INTERFACE_MODE_GMII:
+		if (dwmac->enable_eth_ck)
+			val |= SYSCFG_ETHCR_ETH_CLK_SEL;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		val = SYSCFG_ETHCR_ETH_SEL_RMII;
+		if (dwmac->enable_eth_ck)
+			val |= SYSCFG_ETHCR_ETH_REF_CLK_SEL;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		val = SYSCFG_ETHCR_ETH_SEL_RGMII;
+		if (dwmac->enable_eth_ck)
+			val |= SYSCFG_ETHCR_ETH_CLK_SEL;
+		break;
+	default:
+		dev_err(dwmac->dev, "Mode %s not supported",
+			phy_modes(plat_dat->mac_interface));
+		/* Do not manage others interfaces */
+		return -EINVAL;
+	}
+
+	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
+
+	/*  select PTP (IEEE1588) clock selection from RCC (ck_ker_ethxptp) */
+	val |= SYSCFG_ETHCR_ETH_PTP_CLK_SEL;
+
+	/* Update ETHCR (set register) */
+	return regmap_update_bits(dwmac->regmap, reg,
+				 SYSCFG_MP2_ETH_MASK, val);
+}
+
 static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	int ret;
@@ -292,6 +346,21 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return stm32mp1_configure_pmcr(plat_dat);
 }
 
+static int stm32mp2_set_mode(struct plat_stmmacenet_data *plat_dat)
+{
+	int ret;
+
+	ret = stm32mp1_select_ethck_external(plat_dat);
+	if (ret)
+		return ret;
+
+	ret = stm32mp1_validate_ethck_rate(plat_dat);
+	if (ret)
+		return ret;
+
+	return stm32mp2_configure_syscfg(plat_dat);
+}
+
 static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
@@ -348,12 +417,6 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 		return PTR_ERR(dwmac->clk_rx);
 	}
 
-	if (dwmac->ops->parse_data) {
-		err = dwmac->ops->parse_data(dwmac, dev);
-		if (err)
-			return err;
-	}
-
 	/* Get mode register */
 	dwmac->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
 	if (IS_ERR(dwmac->regmap))
@@ -365,20 +428,14 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 		return err;
 	}
 
-	dwmac->mode_mask = SYSCFG_MP1_ETH_MASK;
-	err = of_property_read_u32_index(np, "st,syscon", 2, &dwmac->mode_mask);
-	if (err) {
-		if (dwmac->ops->is_mp13)
-			dev_err(dev, "Sysconfig register mask must be set (%d)\n", err);
-		else
-			dev_dbg(dev, "Warning sysconfig register mask not set\n");
-	}
+	if (dwmac->ops->parse_data)
+		err = dwmac->ops->parse_data(dwmac, dev);
 
 	return err;
 }
 
-static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
-			       struct device *dev)
+static int stm32mpx_common_parse_data(struct stm32_dwmac *dwmac,
+				      struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
@@ -439,6 +496,27 @@ static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
 	return err;
 }
 
+static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
+			       struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	int err = 0;
+
+	if (stm32mpx_common_parse_data(dwmac, dev))
+		return err;
+
+	dwmac->mode_mask = SYSCFG_MP1_ETH_MASK;
+	err = of_property_read_u32_index(np, "st,syscon", 2, &dwmac->mode_mask);
+	if (err) {
+		if (dwmac->ops->is_mp13)
+			dev_err(dev, "Sysconfig register mask must be set (%d)\n", err);
+		else
+			dev_dbg(dev, "Warning sysconfig register mask not set\n");
+	}
+
+	return err;
+}
+
 static int stm32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -586,10 +664,19 @@ static struct stm32_ops stm32mp13_dwmac_data = {
 	.clk_rx_enable_in_suspend = true
 };
 
+static struct stm32_ops stm32mp25_dwmac_data = {
+	.set_mode = stm32mp2_set_mode,
+	.suspend = stm32mp1_suspend,
+	.resume = stm32mp1_resume,
+	.parse_data = stm32mpx_common_parse_data,
+	.clk_rx_enable_in_suspend = true
+};
+
 static const struct of_device_id stm32_dwmac_match[] = {
 	{ .compatible = "st,stm32-dwmac", .data = &stm32mcu_dwmac_data},
 	{ .compatible = "st,stm32mp1-dwmac", .data = &stm32mp1_dwmac_data},
 	{ .compatible = "st,stm32mp13-dwmac", .data = &stm32mp13_dwmac_data},
+	{ .compatible = "st,stm32mp25-dwmac", .data = &stm32mp25_dwmac_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, stm32_dwmac_match);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
