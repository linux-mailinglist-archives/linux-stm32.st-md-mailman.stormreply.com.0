Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF190000D
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 12:00:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9F3DC78004;
	Fri,  7 Jun 2024 10:00:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75DFBC712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 10:00:48 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45791LUr011040;
 Fri, 7 Jun 2024 12:00:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 oZt3ANozAyCi4RMnooDgV1ukrsEF0MYMZVmMcPQZSJw=; b=5vAc/TsrFtf96Bjw
 vF2qhf7Gwbx3kmjEm2g+Ud3NQILxtSFsn9cYEj/XAdVN7Bhx6Intxqn1ZgB7rGmJ
 htBas0jC1pRSnOog2K3YTEjLtLAu6wMEDAnxUIltp7pIPx0MFUo/UAdqUVQk+bqi
 QASjix4mRpAm3509bo4JMpU7exKca57zE9CtmYfH/LWmEVXhg23He7USNVOhy4y4
 1XnWhgFfxMh1o/PVvBY3rqxeTqmzTuVkYQ29tWWGoOxn9/yNAv5t34XFsFhgx693
 38jj2R7cNgz65DCdI2aqMbU/UoQNXAeIgeU+qd4Jy+8QK1x6O3OxLqDPA2bY84Xh
 m5fvBg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yg7r0gx9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jun 2024 12:00:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4C75840044;
 Fri,  7 Jun 2024 12:00:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64F63214D12;
 Fri,  7 Jun 2024 11:59:16 +0200 (CEST)
Received: from localhost (10.252.19.205) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 11:59:14 +0200
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
Date: Fri, 7 Jun 2024 11:57:47 +0200
Message-ID: <20240607095754.265105-6-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607095754.265105-1-christophe.roullier@foss.st.com>
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.19.205]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_04,2024-06-06_02,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 05/12] net: stmmac: dwmac-stm32: Clean up
	the debug prints
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

Use dev_err()/dev_dbg() and phy_modes() to print PHY mode instead of
pr_debug() and hand-written PHY mode decoding. This way, each debug
print has associated device with it and duplicated mode decoding is
removed.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index aa413edd1ef71..75981ac2cbb56 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -228,19 +228,16 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = SYSCFG_PMCR_ETH_SEL_MII;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_MII\n");
 		break;
 	case PHY_INTERFACE_MODE_GMII:
 		val = SYSCFG_PMCR_ETH_SEL_GMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_GMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		val = SYSCFG_PMCR_ETH_SEL_RMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_REF_CLK_SEL;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -249,15 +246,16 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 		val = SYSCFG_PMCR_ETH_SEL_RGMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RGMII\n");
 		break;
 	default:
-		pr_debug("SYSCFG init :  Do not manage %d interface\n",
-			 plat_dat->mac_interface);
+		dev_err(dwmac->dev, "Mode %s not supported",
+			phy_modes(plat_dat->mac_interface));
 		/* Do not manage others interfaces */
 		return -EINVAL;
 	}
 
+	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
+
 	/* Need to update PMCCLRR (clear register) */
 	regmap_write(dwmac->regmap, reg + SYSCFG_PMCCLRR_OFFSET,
 		     dwmac->ops->syscfg_eth_mask);
@@ -291,19 +289,19 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = SYSCFG_MCU_ETH_SEL_MII;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_MII\n");
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		val = SYSCFG_MCU_ETH_SEL_RMII;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RMII\n");
 		break;
 	default:
-		pr_debug("SYSCFG init :  Do not manage %d interface\n",
-			 plat_dat->mac_interface);
+		dev_err(dwmac->dev, "Mode %s not supported",
+			phy_modes(plat_dat->mac_interface));
 		/* Do not manage others interfaces */
 		return -EINVAL;
 	}
 
+	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
+
 	return regmap_update_bits(dwmac->regmap, reg,
 				 dwmac->ops->syscfg_eth_mask, val << 23);
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
