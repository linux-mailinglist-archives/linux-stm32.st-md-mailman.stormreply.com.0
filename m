Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2A52C112C
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 18:01:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FD8DC56634;
	Mon, 23 Nov 2020 17:01:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B742CC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 17:01:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ANGwQCB011899; Mon, 23 Nov 2020 18:01:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4WIPBWYgKD1BCSicaiG2Sl6ayQrJIpDvtAZmjrD4cVo=;
 b=Dzza8YOzxVfGxTyMcy/rznORnueVgIMIC8ltx1zinVaLj8BrZQ9FMMaPKfReGK7kHcsI
 nwgFxty4q1XxfNqHWr/0eZPNIoB7hUcWg6ASBJ6VAFkpKVl2kLCnT3TmqCCamzmBOOJm
 0ZYvEPJZdZ8YJkKsmWPt+XBRXYbvxSrGS1zciQza2pq1b3XE7z190mHjyDBlc7uWsDMV
 hihs/l7tHuzubcTbxnXNga7H0eHwq3p/BON4oMxvE5f/kh5YrpGDmBg6rrkhjtfUMlPh
 uR1l/C6ij6oaAetHjjtpzgVWuzLEa62m8C9pbN4NxtKeei9l6tJf9UdpsRO4Im1O4X8j 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fgkmky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 18:01:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63C5910002A;
 Mon, 23 Nov 2020 18:01:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 558292BA2D0;
 Mon, 23 Nov 2020 18:01:38 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov 2020 18:01:37
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 23 Nov 2020 18:01:28 +0100
Message-ID: <20201123170132.17859-3-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201123170132.17859-1-amelie.delaunay@st.com>
References: <20201123170132.17859-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_14:2020-11-23,
 2020-11-23 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/6] phy: stm32: manage 1v1 and 1v8 supplies
	at pll activation/deactivation
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

PLL block requires to be powered with 1v1 and 1v8 supplies to catch
ENABLE signal.
Currently, supplies are managed through phy_ops .power_on/off, and PLL
activation/deactivation is managed through phy_ops .init/exit.
The sequence of phy_ops .power_on/.phy_init, .power_off/.exit is USB
drivers dependent.
To ensure a good behavior of the PLL, supplies have to be managed at PLL
activation/deactivation. That means the supplies need to be put in usbphyc
node and not in phy children nodes.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 102 +++++++++++++----------------
 1 file changed, 46 insertions(+), 56 deletions(-)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index a54317e96c41..c78a2c7947ce 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -58,7 +58,6 @@ struct pll_params {
 struct stm32_usbphyc_phy {
 	struct phy *phy;
 	struct stm32_usbphyc *usbphyc;
-	struct regulator_bulk_data supplies[NUM_SUPPLIES];
 	u32 index;
 	bool active;
 };
@@ -70,6 +69,7 @@ struct stm32_usbphyc {
 	struct reset_control *rst;
 	struct stm32_usbphyc_phy **phys;
 	int nphys;
+	struct regulator_bulk_data supplies[NUM_SUPPLIES];
 	int switch_setup;
 };
 
@@ -153,10 +153,30 @@ static bool stm32_usbphyc_has_one_phy_active(struct stm32_usbphyc *usbphyc)
 	return false;
 }
 
+static int stm32_usbphyc_pll_disable(struct stm32_usbphyc *usbphyc)
+{
+	void __iomem *pll_reg = usbphyc->base + STM32_USBPHYC_PLL;
+
+	/* Check if other phy port active */
+	if (stm32_usbphyc_has_one_phy_active(usbphyc))
+		return 0;
+
+	stm32_usbphyc_clr_bits(pll_reg, PLLEN);
+	/* Wait for minimum width of powerdown pulse (ENABLE = Low) */
+	udelay(PLL_PWR_DOWN_TIME_US);
+
+	if (readl_relaxed(pll_reg) & PLLEN) {
+		dev_err(usbphyc->dev, "PLL not reset\n");
+		return -EIO;
+	}
+
+	return regulator_bulk_disable(NUM_SUPPLIES, usbphyc->supplies);
+}
+
 static int stm32_usbphyc_pll_enable(struct stm32_usbphyc *usbphyc)
 {
 	void __iomem *pll_reg = usbphyc->base + STM32_USBPHYC_PLL;
-	bool pllen = (readl_relaxed(pll_reg) & PLLEN);
+	bool pllen = readl_relaxed(pll_reg) & PLLEN;
 	int ret;
 
 	/* Check if one phy port has already configured the pll */
@@ -164,46 +184,35 @@ static int stm32_usbphyc_pll_enable(struct stm32_usbphyc *usbphyc)
 		return 0;
 
 	if (pllen) {
-		stm32_usbphyc_clr_bits(pll_reg, PLLEN);
-		/* Wait for minimum width of powerdown pulse (ENABLE = Low) */
-		udelay(PLL_PWR_DOWN_TIME_US);
+		ret = stm32_usbphyc_pll_disable(usbphyc);
+		if (ret)
+			return ret;
 	}
 
-	ret = stm32_usbphyc_pll_init(usbphyc);
+	ret = regulator_bulk_enable(NUM_SUPPLIES, usbphyc->supplies);
 	if (ret)
 		return ret;
 
-	stm32_usbphyc_set_bits(pll_reg, PLLEN);
+	ret = stm32_usbphyc_pll_init(usbphyc);
+	if (ret)
+		goto reg_disable;
 
+	stm32_usbphyc_set_bits(pll_reg, PLLEN);
 	/* Wait for maximum lock time */
 	udelay(PLL_LOCK_TIME_US);
 
 	if (!(readl_relaxed(pll_reg) & PLLEN)) {
 		dev_err(usbphyc->dev, "PLLEN not set\n");
-		return -EIO;
+		ret = -EIO;
+		goto reg_disable;
 	}
 
 	return 0;
-}
-
-static int stm32_usbphyc_pll_disable(struct stm32_usbphyc *usbphyc)
-{
-	void __iomem *pll_reg = usbphyc->base + STM32_USBPHYC_PLL;
-
-	/* Check if other phy port active */
-	if (stm32_usbphyc_has_one_phy_active(usbphyc))
-		return 0;
 
-	stm32_usbphyc_clr_bits(pll_reg, PLLEN);
-	/* Wait for minimum width of powerdown pulse (ENABLE = Low) */
-	udelay(PLL_PWR_DOWN_TIME_US);
+reg_disable:
+	regulator_bulk_disable(NUM_SUPPLIES, usbphyc->supplies);
 
-	if (readl_relaxed(pll_reg) & PLLEN) {
-		dev_err(usbphyc->dev, "PLL not reset\n");
-		return -EIO;
-	}
-
-	return 0;
+	return ret;
 }
 
 static int stm32_usbphyc_phy_init(struct phy *phy)
@@ -231,25 +240,9 @@ static int stm32_usbphyc_phy_exit(struct phy *phy)
 	return stm32_usbphyc_pll_disable(usbphyc);
 }
 
-static int stm32_usbphyc_phy_power_on(struct phy *phy)
-{
-	struct stm32_usbphyc_phy *usbphyc_phy = phy_get_drvdata(phy);
-
-	return regulator_bulk_enable(NUM_SUPPLIES, usbphyc_phy->supplies);
-}
-
-static int stm32_usbphyc_phy_power_off(struct phy *phy)
-{
-	struct stm32_usbphyc_phy *usbphyc_phy = phy_get_drvdata(phy);
-
-	return regulator_bulk_disable(NUM_SUPPLIES, usbphyc_phy->supplies);
-}
-
 static const struct phy_ops stm32_usbphyc_phy_ops = {
 	.init = stm32_usbphyc_phy_init,
 	.exit = stm32_usbphyc_phy_exit,
-	.power_on = stm32_usbphyc_phy_power_on,
-	.power_off = stm32_usbphyc_phy_power_off,
 	.owner = THIS_MODULE,
 };
 
@@ -313,7 +306,7 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 	struct device_node *child, *np = dev->of_node;
 	struct phy_provider *phy_provider;
 	u32 version;
-	int ret, port = 0;
+	int ret, i, port = 0;
 
 	usbphyc = devm_kzalloc(dev, sizeof(*usbphyc), GFP_KERNEL);
 	if (!usbphyc)
@@ -355,11 +348,20 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
+	for (i = 0; i < NUM_SUPPLIES; i++)
+		usbphyc->supplies[i].supply = supplies_names[i];
+
+	ret = devm_regulator_bulk_get(dev, NUM_SUPPLIES, usbphyc->supplies);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to get regulators: %d\n", ret);
+		goto clk_disable;
+	}
+
 	for_each_child_of_node(np, child) {
 		struct stm32_usbphyc_phy *usbphyc_phy;
 		struct phy *phy;
 		u32 index;
-		int i;
 
 		phy = devm_phy_create(dev, child, &stm32_usbphyc_phy_ops);
 		if (IS_ERR(phy)) {
@@ -377,18 +379,6 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 			goto put_child;
 		}
 
-		for (i = 0; i < NUM_SUPPLIES; i++)
-			usbphyc_phy->supplies[i].supply = supplies_names[i];
-
-		ret = devm_regulator_bulk_get(&phy->dev, NUM_SUPPLIES,
-					      usbphyc_phy->supplies);
-		if (ret) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(&phy->dev,
-					"failed to get regulators: %d\n", ret);
-			goto put_child;
-		}
-
 		ret = of_property_read_u32(child, "reg", &index);
 		if (ret || index > usbphyc->nphys) {
 			dev_err(&phy->dev, "invalid reg property: %d\n", ret);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
