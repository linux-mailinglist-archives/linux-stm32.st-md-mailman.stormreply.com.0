Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E17B20CA
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 17:16:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE0CC6B473;
	Thu, 28 Sep 2023 15:16:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 867B1C6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 15:16:56 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38SE1jJs007793; Thu, 28 Sep 2023 17:16:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=RBXVmwb6jNT2iUShZk/ZgEGot9S1AER/3jhHyMGTE+c=; b=uD
 LE/blludOOkCNvI579XO1bQevlIlwvuzI5xsJadyo4wm6LOU/89Q3h32iLjDpfZ8
 EzAnEVXPb1mWQf57PFVhH5Pgt0LeGNBzTar0X4rloPAX3BKmlTCOqtQhUH39VG34
 y9jlCvzL5Ab/K3ljqpnL4TqZp7hvSa9JaOAytw+A87wXo69ZChEehgsznEpme6tu
 Qz4Wj3Aal8TXlrGTtAVaBBE7rT+yeSoOf7Hk1XyTjc5Jx/CVx3aFctA4yrPX6tm8
 gFsRA6cG9ycyWkbWKKODnZVp2v5cHsTWxTTlNJe9q/uh3P85H6CWcxIMurdED2cG
 IVuLf18GYyQC/y3sVq7A==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ta9k0my07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Sep 2023 17:16:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5277100058;
 Thu, 28 Sep 2023 17:16:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B714324553E;
 Thu, 28 Sep 2023 17:16:30 +0200 (CEST)
Received: from localhost (10.201.21.249) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 17:16:30 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
Date: Thu, 28 Sep 2023 17:15:06 +0200
Message-ID: <20230928151512.322016-7-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928151512.322016-1-christophe.roullier@foss.st.com>
References: <20230928151512.322016-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.249]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_14,2023-09-28_02,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 06/12] net: ethernet: stmmac: stm32: update
	config management for phy wo cristal
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

From: Christophe Roullier <christophe.roullier@st.com>

Some cleaning because some Ethernet PHY configs do not need to add st,ext-phyclk property
Change print info message "No phy clock provided" only when debug

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index a071dc6ffc95b..1210062f0832a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -55,17 +55,17 @@
  *|         |        |      25MHz    |        50MHz       |                  |
  * ---------------------------------------------------------------------------
  *|  MII    |	 -   |     eth-ck    |	      n/a	  |	  n/a        |
- *|         |        | st,ext-phyclk |                    |		     |
+ *|         |        |	             |                    |		     |
  * ---------------------------------------------------------------------------
  *|  GMII   |	 -   |     eth-ck    |	      n/a	  |	  n/a        |
- *|         |        | st,ext-phyclk |                    |		     |
+ *|         |        |               |                    |		     |
  * ---------------------------------------------------------------------------
  *| RGMII   |	 -   |     eth-ck    |	      n/a	  |      eth-ck      |
- *|         |        | st,ext-phyclk |                    | st,eth-clk-sel or|
+ *|         |        |               |                    | st,eth-clk-sel or|
  *|         |        |               |                    | st,ext-phyclk    |
  * ---------------------------------------------------------------------------
  *| RMII    |	 -   |     eth-ck    |	    eth-ck        |	  n/a        |
- *|         |        | st,ext-phyclk | st,eth-ref-clk-sel |		     |
+ *|         |        |               | st,eth-ref-clk-sel |		     |
  *|         |        |               | or st,ext-phyclk   |		     |
  * ---------------------------------------------------------------------------
  *
@@ -180,23 +180,22 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 	dwmac->enable_eth_ck = false;
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		if (clk_rate == ETH_CK_F_25M && dwmac->ext_phyclk)
+		if (clk_rate == ETH_CK_F_25M)
 			dwmac->enable_eth_ck = true;
 		val = dwmac->ops->pmcsetr.eth1_selmii;
 		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_MII\n");
 		break;
 	case PHY_INTERFACE_MODE_GMII:
 		val = SYSCFG_PMCR_ETH_SEL_GMII;
-		if (clk_rate == ETH_CK_F_25M &&
-		    (dwmac->eth_clk_sel_reg || dwmac->ext_phyclk)) {
+		if (clk_rate == ETH_CK_F_25M)
 			dwmac->enable_eth_ck = true;
-			val |= dwmac->ops->pmcsetr.eth1_clk_sel;
-		}
 		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_GMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		val = dwmac->ops->pmcsetr.eth1_sel_rmii | dwmac->ops->pmcsetr.eth2_sel_rmii;
-		if ((clk_rate == ETH_CK_F_25M || clk_rate == ETH_CK_F_50M) &&
+		if (clk_rate == ETH_CK_F_25M)
+			dwmac->enable_eth_ck = true;
+		if ((clk_rate == ETH_CK_F_50M) &&
 		    (dwmac->eth_ref_clk_sel_reg || dwmac->ext_phyclk)) {
 			dwmac->enable_eth_ck = true;
 			val |= dwmac->ops->pmcsetr.eth1_ref_clk_sel;
@@ -209,7 +208,9 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		val = dwmac->ops->pmcsetr.eth1_sel_rgmii | dwmac->ops->pmcsetr.eth2_sel_rgmii;
-		if ((clk_rate == ETH_CK_F_25M || clk_rate == ETH_CK_F_125M) &&
+		if (clk_rate == ETH_CK_F_25M)
+			dwmac->enable_eth_ck = true;
+		if ((clk_rate == ETH_CK_F_125M) &&
 		    (dwmac->eth_clk_sel_reg || dwmac->ext_phyclk)) {
 			dwmac->enable_eth_ck = true;
 			val |= dwmac->ops->pmcsetr.eth1_clk_sel;
@@ -225,7 +226,7 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 	}
 
 	/* Need to update PMCCLRR (clear register) */
-	regmap_write(dwmac->regmap, reg + dwmac->ops->syscfg_clr_off,
+	regmap_write(dwmac->regmap, dwmac->ops->syscfg_clr_off,
 		     dwmac->mode_mask);
 
 	/* Update PMCSETR (set register) */
@@ -332,7 +333,7 @@ static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
 	/*  Get ETH_CLK clocks */
 	dwmac->clk_eth_ck = devm_clk_get(dev, "eth-ck");
 	if (IS_ERR(dwmac->clk_eth_ck)) {
-		dev_info(dev, "No phy clock provided...\n");
+		dev_dbg(dev, "No phy clock provided...\n");
 		dwmac->clk_eth_ck = NULL;
 	}
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
