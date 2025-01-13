Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F8AA0B29B
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 10:22:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A60FEC78018;
	Mon, 13 Jan 2025 09:22:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1091AC030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 09:22:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5nK3n026544;
 Mon, 13 Jan 2025 10:22:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=m0FPfJ7gKA+absR2EDaCck
 e919XXBg34hJsIHU+bQhA=; b=7XW3MQD+1MlnteAcvHTQpn3daRxAHyY2ULDOlK
 eNl6AHFLTbfgk4dLMpAdMD3wB4lvYeNWMuScV0oUfZBtrO+z04t9JKaTCv3KrrX/
 jr0XpFWp+o4ox5GZXSYHPeTcN6Eedwa3U81svnQYd9KYihAMafgQ1dVSHDrwv8Tp
 80KNueNxafWvA1S7fhoRDOn2NzASeIEHx5FaZT1LD0K+0//CY/GmSMfSAVokJWfh
 C/QgOrCizX1ldVx/IVY83m+UsVimFILTdXQl/inodsEXIvzLMCoPdNva8EsWydKq
 rmaMKh6XYG4f0qz/vnFdmqtrCiKSoEwbQxqNgSRrwuzT/p2g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444w17gt9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 10:22:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EEA0D40048;
 Mon, 13 Jan 2025 10:21:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B58C236E67;
 Mon, 13 Jan 2025 10:20:31 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 10:20:31 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <p.zabel@pengutronix.de>,
 <linux-phy@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <fabrice.gasnier@foss.st.com>
Date: Mon, 13 Jan 2025 10:20:01 +0100
Message-ID: <20250113092001.1344151-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Christian Bruel <christian.bruel@foss.st.com>
Subject: [Linux-stm32] [PATCH v2] phy: stm32: Optimize tuning values from DT.
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

phy_init can be recalled during PM resume. Thus cache the tuning values
read from the device tree.
Don't read the known default ohm value from regmap.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
v2: Fix 'val' uninitialized variable from clang build bot

 drivers/phy/st/phy-stm32-combophy.c | 84 ++++++++++++++---------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/phy/st/phy-stm32-combophy.c b/drivers/phy/st/phy-stm32-combophy.c
index 49e9fa90a681..5c09c4e48bd0 100644
--- a/drivers/phy/st/phy-stm32-combophy.c
+++ b/drivers/phy/st/phy-stm32-combophy.c
@@ -86,6 +86,10 @@ struct stm32_combophy {
 	struct clk_bulk_data clks[ARRAY_SIZE(combophy_clks)];
 	int num_clks;
 	bool have_pad_clk;
+	bool have_ssc;
+	int rx_eq;
+	u32 microohm;
+	u32 microvolt;
 	unsigned int type;
 	bool is_init;
 	int irq_wakeup;
@@ -112,27 +116,15 @@ static const struct clk_impedance imp_lookup[] = {
 	{ 3999000, { 571000, 648000, 726000, 803000 } }
 };
 
-static int stm32_impedance_tune(struct stm32_combophy *combophy)
+static void stm32_impedance_tune(struct stm32_combophy *combophy)
 {
-	u8 imp_size = ARRAY_SIZE(imp_lookup);
-	u8 vswing_size = ARRAY_SIZE(imp_lookup[0].vswing);
 	u8 imp_of, vswing_of;
-	u32 max_imp = imp_lookup[0].microohm;
-	u32 min_imp = imp_lookup[imp_size - 1].microohm;
-	u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
-	u32 min_vswing = imp_lookup[0].vswing[0];
-	u32 val;
 	u32 regval;
 
-	if (!of_property_read_u32(combophy->dev->of_node, "st,output-micro-ohms", &val)) {
-		if (val < min_imp || val > max_imp) {
-			dev_err(combophy->dev, "Invalid value %u for output ohm\n", val);
-			return -EINVAL;
-		}
-
+	if (combophy->microohm) {
 		regval = 0;
 		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
-			if (imp_lookup[imp_of].microohm <= val) {
+			if (imp_lookup[imp_of].microohm <= combophy->microohm) {
 				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
 				break;
 			}
@@ -145,19 +137,14 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
 				   regval);
 	} else {
-		regmap_read(combophy->regmap, SYSCFG_PCIEPRGCR, &val);
-		imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
+		/* default is 50 ohm */
+		imp_of = 3;
 	}
 
-	if (!of_property_read_u32(combophy->dev->of_node, "st,output-vswing-microvolt", &val)) {
-		if (val < min_vswing || val > max_vswing) {
-			dev_err(combophy->dev, "Invalid value %u for output vswing\n", val);
-			return -EINVAL;
-		}
-
+	if (combophy->microvolt) {
 		regval = 0;
 		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
-			if (imp_lookup[imp_of].vswing[vswing_of] >= val) {
+			if (imp_lookup[imp_of].vswing[vswing_of] >= combophy->microvolt) {
 				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
 				break;
 			}
@@ -170,8 +157,6 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
 				   regval);
 	}
-
-	return 0;
 }
 
 static int stm32_combophy_pll_init(struct stm32_combophy *combophy)
@@ -197,7 +182,7 @@ static int stm32_combophy_pll_init(struct stm32_combophy *combophy)
 		cr1_val |= SYSCFG_COMBOPHY_CR1_REFSSPEN;
 	}
 
-	if (of_property_present(combophy->dev->of_node, "st,ssc-on")) {
+	if (combophy->have_ssc) {
 		dev_dbg(combophy->dev, "Enabling clock with SSC\n");
 		cr1_mask |= SYSCFG_COMBOPHY_CR1_SSCEN;
 		cr1_val |= SYSCFG_COMBOPHY_CR1_SSCEN;
@@ -253,24 +238,16 @@ static int stm32_combophy_pll_init(struct stm32_combophy *combophy)
 	reset_control_assert(combophy->phy_reset);
 
 	if (combophy->type == PHY_TYPE_PCIE) {
-		ret = stm32_impedance_tune(combophy);
-		if (ret)
-			goto out_iso;
+		stm32_impedance_tune(combophy);
 
 		cr1_mask |= SYSCFG_COMBOPHY_CR1_REFUSEPAD;
 		cr1_val |= combophy->have_pad_clk ? SYSCFG_COMBOPHY_CR1_REFUSEPAD : 0;
 	}
 
-	if (!of_property_read_u32(combophy->dev->of_node, "st,rx-equalizer", &val)) {
-		dev_dbg(combophy->dev, "Set RX equalizer %u\n", val);
-		if (val > SYSCFG_COMBOPHY_CR4_RX0_EQ) {
-			dev_err(combophy->dev, "Invalid value %u for rx0 equalizer\n", val);
-			ret = -EINVAL;
-			goto out_iso;
-		}
-
+	if (combophy->rx_eq != -1) {
+		dev_dbg(combophy->dev, "Set RX equalizer %u\n", combophy->rx_eq);
 		regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR4,
-			   SYSCFG_COMBOPHY_CR4_RX0_EQ, val);
+			   SYSCFG_COMBOPHY_CR4_RX0_EQ, combophy->rx_eq);
 	}
 
 	regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR1, cr1_mask, cr1_val);
@@ -314,9 +291,6 @@ static int stm32_combophy_pll_init(struct stm32_combophy *combophy)
 
 	return 0;
 
-out_iso:
-	reset_control_deassert(combophy->phy_reset);
-
 out:
 	regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR2,
 			   SYSCFG_COMBOPHY_CR2_ISO_DIS, 0);
@@ -522,6 +496,12 @@ static int stm32_combophy_probe(struct platform_device *pdev)
 	struct stm32_combophy *combophy;
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	u8 imp_size = ARRAY_SIZE(imp_lookup);
+	u8 vswing_size = ARRAY_SIZE(imp_lookup[0].vswing);
+	u32 max_imp = imp_lookup[0].microohm;
+	u32 min_imp = imp_lookup[imp_size - 1].microohm;
+	u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
+	u32 min_vswing = imp_lookup[0].vswing[0];
 	int ret, irq;
 
 	combophy = devm_kzalloc(dev, sizeof(*combophy), GFP_KERNEL);
@@ -569,6 +549,26 @@ static int stm32_combophy_probe(struct platform_device *pdev)
 						 combophy->irq_wakeup);
 	}
 
+	if (of_property_present(dev->of_node, "st,ssc-on"))
+		combophy->have_ssc = true;
+
+	if (!of_property_read_u32(dev->of_node, "st,rx-equalizer", &combophy->rx_eq)) {
+		if (combophy->rx_eq > SYSCFG_COMBOPHY_CR4_RX0_EQ)
+			return dev_err_probe(dev, combophy->rx_eq,
+					     "Invalid value for rx0 equalizer\n");
+	} else
+		combophy->rx_eq = -1;
+
+	if (!of_property_read_u32(dev->of_node, "st,output-micro-ohms", &combophy->microohm))
+		if (combophy->microohm < min_imp || combophy->microohm > max_imp)
+			return dev_err_probe(dev, combophy->microohm,
+					     "Invalid value for output ohm\n");
+
+	if (!of_property_read_u32(dev->of_node, "st,output-vswing-microvolt", &combophy->microvolt))
+		if (combophy->microvolt < min_vswing || combophy->microvolt > max_vswing)
+			return dev_err_probe(dev, combophy->microvolt,
+					     "Invalid value for output vswing\n");
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable pm runtime\n");
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
