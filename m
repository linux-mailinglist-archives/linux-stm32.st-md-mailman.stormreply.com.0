Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB490000A
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 12:00:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8856CC71290;
	Fri,  7 Jun 2024 10:00:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73BA1C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 10:00:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45791lAA009506;
 Fri, 7 Jun 2024 12:00:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 hBO/8sFCkcPpRtbOEbZweOTDMZQkjBRnKwGu29CWvBY=; b=WjlAm8ICSHmsk/8u
 M229+clIT1cv26522ElaPt82nbcIybYt1YXZHroCZN3Y1bYqo6IkK5HAj+1UlhdL
 CQb95kIKGf0yBRZR4SfM9+ZAe+d2iWlVrfnRZ6kdjkCwC4mPmSAkZ7eeXn4Mspmf
 pVor7pCSss+IrdHGdTWhM9rqTNmEC5JxZhbX3T70T+ZAeD4hYMR2Z36+7mA/I0UZ
 Ydh9I+vc8SV0zU9mVTamN2lzKHXJkXvqJco0HrVkzyV+bW6AwdLAanXLs44NbEN1
 OZJaUhDrLBakN011RacvV2E8E8KAVwJV4QzhAceRbAs0x/GVfzOaezYC6+s/ijIx
 bWdIiw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw91swjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jun 2024 12:00:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EDA7540049;
 Fri,  7 Jun 2024 12:00:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 267D8214D11;
 Fri,  7 Jun 2024 11:59:16 +0200 (CEST)
Received: from localhost (10.252.19.205) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 11:59:15 +0200
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
Date: Fri, 7 Jun 2024 11:57:49 +0200
Message-ID: <20240607095754.265105-8-christophe.roullier@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v5 07/12] net: stmmac: dwmac-stm32: Mask
	support for PMCR configuration
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

Add possibility to have second argument in syscon property to manage
mask. This mask will be used to address right BITFIELDS of PMCR register.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index bed2be129b2d2..96ba7bc73e823 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -90,6 +90,7 @@ struct stm32_dwmac {
 	int eth_ref_clk_sel_reg;
 	int irq_pwr_wakeup;
 	u32 mode_reg;		 /* MAC glue-logic mode register */
+	u32 mode_mask;
 	struct regmap *regmap;
 	u32 speed;
 	const struct stm32_ops *ops;
@@ -102,8 +103,8 @@ struct stm32_ops {
 	void (*resume)(struct stm32_dwmac *dwmac);
 	int (*parse_data)(struct stm32_dwmac *dwmac,
 			  struct device *dev);
-	u32 syscfg_eth_mask;
 	bool clk_rx_enable_in_suspend;
+	u32 syscfg_clr_off;
 };
 
 static int stm32_dwmac_clk_enable(struct stm32_dwmac *dwmac, bool resume)
@@ -256,13 +257,16 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 
 	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
 
+	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
+	val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
+
 	/* Need to update PMCCLRR (clear register) */
-	regmap_write(dwmac->regmap, reg + SYSCFG_PMCCLRR_OFFSET,
-		     dwmac->ops->syscfg_eth_mask);
+	regmap_write(dwmac->regmap, dwmac->ops->syscfg_clr_off,
+		     dwmac->mode_mask);
 
 	/* Update PMCSETR (set register) */
 	return regmap_update_bits(dwmac->regmap, reg,
-				 dwmac->ops->syscfg_eth_mask, val);
+				 dwmac->mode_mask, val);
 }
 
 static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
@@ -303,7 +307,7 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
 	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
 
 	return regmap_update_bits(dwmac->regmap, reg,
-				 dwmac->ops->syscfg_eth_mask, val << 23);
+				 SYSCFG_MCU_ETH_MASK, val << 23);
 }
 
 static void stm32_dwmac_clk_disable(struct stm32_dwmac *dwmac, bool suspend)
@@ -348,8 +352,15 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 		return PTR_ERR(dwmac->regmap);
 
 	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->mode_reg);
-	if (err)
+	if (err) {
 		dev_err(dev, "Can't get sysconfig mode offset (%d)\n", err);
+		return err;
+	}
+
+	dwmac->mode_mask = SYSCFG_MP1_ETH_MASK;
+	err = of_property_read_u32_index(np, "st,syscon", 2, &dwmac->mode_mask);
+	if (err)
+		pr_debug("Warning sysconfig register mask not set\n");
 
 	return err;
 }
@@ -540,8 +551,7 @@ static SIMPLE_DEV_PM_OPS(stm32_dwmac_pm_ops,
 	stm32_dwmac_suspend, stm32_dwmac_resume);
 
 static struct stm32_ops stm32mcu_dwmac_data = {
-	.set_mode = stm32mcu_set_mode,
-	.syscfg_eth_mask = SYSCFG_MCU_ETH_MASK
+	.set_mode = stm32mcu_set_mode
 };
 
 static struct stm32_ops stm32mp1_dwmac_data = {
@@ -549,7 +559,7 @@ static struct stm32_ops stm32mp1_dwmac_data = {
 	.suspend = stm32mp1_suspend,
 	.resume = stm32mp1_resume,
 	.parse_data = stm32mp1_parse_data,
-	.syscfg_eth_mask = SYSCFG_MP1_ETH_MASK,
+	.syscfg_clr_off = 0x44,
 	.clk_rx_enable_in_suspend = true
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
