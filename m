Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C33901B9B
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 09:17:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AD00C6C83C;
	Mon, 10 Jun 2024 07:17:20 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD6AAC6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 07:17:13 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459KgMS7011982;
 Mon, 10 Jun 2024 09:16:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 AmLKDPb0oT6lLe6SQe3GR2w8UgmNAhsCLM0PNSYGh9g=; b=jyMwZWVgTvjFr1S5
 fenjIIdAabwSgaGxAoFXr4n6CEYi8zKFZ6tBJdzCljfsz+S7D3cJO7tZnJBjWq/R
 Wvvbdy8YE08Tk2AdwIFFqRHbYtwzVylhWgo2knDrrqQ6W3bwvNz1CoB8/DE6W/zV
 BcvxJv6UotCb+RREVrSMcXMO2tSQ5R4wJtG+xWAjKQ/71UhEl3U11LDoxRxmzbeT
 HzPSStA2MuT0O6tdNQtNsIMVUD6dwa4JcUXdtu7O6ctghFv/JavvL7pAQKe7yGKP
 y0PuaX5TI3BfLdiANXEIPp+5lARidsP0EFlkuNXnfr1rcbmbTavs0jdIHJohMrUe
 OdWMvA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yn28hu5w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 09:16:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C349840046;
 Mon, 10 Jun 2024 09:16:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F19121072E;
 Mon, 10 Jun 2024 09:15:10 +0200 (CEST)
Received: from localhost (10.48.86.164) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 09:15:09 +0200
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
Date: Mon, 10 Jun 2024 09:14:54 +0200
Message-ID: <20240610071459.287500-4-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240610071459.287500-1-christophe.roullier@foss.st.com>
References: <20240610071459.287500-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [net-next,
	PATCH v6 3/8] net: stmmac: dwmac-stm32: Separate out external clock
	selector
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

From: Marek Vasut <marex@denx.de>

Pull the external clock selector into a separate function, to avoid
conflating it with external clock rate validation and clock mux
register configuration. This should make the code easier to read and
understand.

The dwmac->enable_eth_ck variable in the end indicates whether the MAC
clock are supplied by external oscillator (true) or internal RCC clock
IP (false). The dwmac->enable_eth_ck value is set based on multiple DT
properties, some of them deprecated, some of them specific to bus mode.

The following DT properties and variables are taken into account. In
each case, if the property is present or true, MAC clock is supplied
by external oscillator.
- "st,ext-phyclk", assigned to variable dwmac->ext_phyclk
  - Used in any mode (MII/RMII/GMII/RGMII)
  - The only non-deprecated DT property of the three
- "st,eth-clk-sel", assigned to variable dwmac->eth_clk_sel_reg
  - Valid only in GMII/RGMII mode
  - Deprecated property, backward compatibility only
- "st,eth-ref-clk-sel", assigned to variable dwmac->eth_ref_clk_sel_reg
  - Valid only in RMII mode
  - Deprecated property, backward compatibility only

The stm32mp1_select_ethck_external() function handles the aforementioned
DT properties and sets dwmac->enable_eth_ck accordingly.

The stm32mp1_set_mode() is adjusted to call stm32mp1_select_ethck_external()
first and then only use dwmac->enable_eth_ck to determine hardware clock mux
settings.

No functional change intended.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 50 ++++++++++++++-----
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 2fd2620ebed69..767994061ea82 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -157,6 +157,37 @@ static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat, bool resume)
 	return stm32_dwmac_clk_enable(dwmac, resume);
 }
 
+static int stm32mp1_select_ethck_external(struct plat_stmmacenet_data *plat_dat)
+{
+	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
+
+	switch (plat_dat->mac_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		dwmac->enable_eth_ck = dwmac->ext_phyclk;
+		return 0;
+	case PHY_INTERFACE_MODE_GMII:
+		dwmac->enable_eth_ck = dwmac->eth_clk_sel_reg ||
+				       dwmac->ext_phyclk;
+		return 0;
+	case PHY_INTERFACE_MODE_RMII:
+		dwmac->enable_eth_ck = dwmac->eth_ref_clk_sel_reg ||
+				       dwmac->ext_phyclk;
+		return 0;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		dwmac->enable_eth_ck = dwmac->eth_clk_sel_reg ||
+				       dwmac->ext_phyclk;
+		return 0;
+	default:
+		dwmac->enable_eth_ck = false;
+		dev_err(dwmac->dev, "Mode %s not supported",
+			phy_modes(plat_dat->mac_interface));
+		return -EINVAL;
+	}
+}
+
 static int stm32mp1_validate_ethck_rate(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
@@ -194,28 +225,25 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 	u32 reg = dwmac->mode_reg;
 	int val, ret;
 
-	dwmac->enable_eth_ck = false;
+	ret = stm32mp1_select_ethck_external(plat_dat);
+	if (ret)
+		return ret;
+
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		if (dwmac->ext_phyclk)
-			dwmac->enable_eth_ck = true;
 		val = SYSCFG_PMCR_ETH_SEL_MII;
 		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_MII\n");
 		break;
 	case PHY_INTERFACE_MODE_GMII:
 		val = SYSCFG_PMCR_ETH_SEL_GMII;
-		if (dwmac->eth_clk_sel_reg || dwmac->ext_phyclk) {
-			dwmac->enable_eth_ck = true;
+		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
-		}
 		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_GMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		val = SYSCFG_PMCR_ETH_SEL_RMII;
-		if (dwmac->eth_ref_clk_sel_reg || dwmac->ext_phyclk) {
-			dwmac->enable_eth_ck = true;
+		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_REF_CLK_SEL;
-		}
 		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
@@ -223,10 +251,8 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		val = SYSCFG_PMCR_ETH_SEL_RGMII;
-		if (dwmac->eth_clk_sel_reg || dwmac->ext_phyclk) {
-			dwmac->enable_eth_ck = true;
+		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
-		}
 		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RGMII\n");
 		break;
 	default:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
