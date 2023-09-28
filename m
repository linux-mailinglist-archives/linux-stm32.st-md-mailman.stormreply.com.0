Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C53CC7B1C44
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 14:26:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BBB2C6B47B;
	Thu, 28 Sep 2023 12:26:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C5DCC6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 12:26:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38S8VIaf001998; Thu, 28 Sep 2023 14:25:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=qxcsFIRjXFLHKGA5nZCs9qGhJHkQP52WVsL1NenTq+Y=; b=y5
 J0Qg2pa6afxG03gQN/EMfDY/vxkRD7xbaHTP4NJxVWa3GvNkqKNqhoYNZALjZSiS
 iFCCMLAfW14Kah47XXqltrnQlmPsBCnJQ08Wn6YK1xa6fgoFRtpxoDHM2vM/v0tY
 s02pAI5ISoxLaCXHyQ5ALUg2vj547e4Sh2ZXlMgNskgq2I1vbtms6W8qasQb6DN7
 HmvcRjBqAOU1yESpdvhEiDDP74/T8+KCuG3CoKLnBz9xTsIYCifvlofsn8NJI8SV
 O7WrtUd9gQIO8aBRA2efwew4Mfc1OHnsBdmt6NIOM1PnmoowAPs8LjWAwjn6qiH0
 tqOuLpOcMRlxTLmN2fyg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9pwdf4a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Sep 2023 14:25:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7EB7C100058;
 Thu, 28 Sep 2023 14:25:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7395D22F7B0;
 Thu, 28 Sep 2023 14:25:49 +0200 (CEST)
Received: from localhost (10.201.21.249) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 14:25:48 +0200
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
Date: Thu, 28 Sep 2023 14:24:23 +0200
Message-ID: <20230928122427.313271-9-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928122427.313271-1-christophe.roullier@foss.st.com>
References: <20230928122427.313271-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.249]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_11,2023-09-28_01,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 08/12] net: ethernet: stmmac: stm32:
	support the phy-supply regulator binding
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

Configure the phy regulator if defined by the "phy-supply" DT phandle.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 51 ++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 72dda71850d75..31e3abd2caeaa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -14,6 +14,7 @@
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -84,6 +85,7 @@ struct stm32_dwmac {
 	u32 mode_reg;		 /* MAC glue-logic mode register */
 	u32 mode_mask;
 	struct regmap *regmap;
+	struct regulator *regulator;
 	u32 speed;
 	const struct stm32_ops *ops;
 	struct device *dev;
@@ -309,6 +311,16 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 	if (err)
 		pr_debug("Warning sysconfig register mask not set\n");
 
+	dwmac->regulator = devm_regulator_get_optional(dev, "phy");
+	if (IS_ERR(dwmac->regulator)) {
+		if (PTR_ERR(dwmac->regulator) == -EPROBE_DEFER) {
+			dev_dbg(dev, "phy regulator is not available yet, deferred probing\n");
+			return -EPROBE_DEFER;
+		}
+		dev_dbg(dev, "no regulator found\n");
+		dwmac->regulator = NULL;
+	}
+
 	return 0;
 }
 
@@ -367,6 +379,27 @@ static int stm32_dwmac_wake_init(struct device *dev,
 	return 0;
 }
 
+static int phy_power_on(struct stm32_dwmac *bsp_priv, bool enable)
+{
+	int ret;
+	struct device *dev = bsp_priv->dev;
+
+	if (!bsp_priv->regulator)
+		return 0;
+
+	if (enable) {
+		ret = regulator_enable(bsp_priv->regulator);
+		if (ret)
+			dev_err(dev, "fail to enable phy-supply\n");
+	} else {
+		ret = regulator_disable(bsp_priv->regulator);
+		if (ret)
+			dev_err(dev, "fail to disable phy-supply\n");
+	}
+
+	return 0;
+}
+
 static int stm32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -414,12 +447,18 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wake_init_disable;
 
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	ret = phy_power_on(plat_dat->bsp_priv, true);
 	if (ret)
 		goto err_clk_disable;
 
+	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	if (ret)
+		goto err_gmac_powerdown;
+
 	return 0;
 
+err_gmac_powerdown:
+	phy_power_on(plat_dat->bsp_priv, false);
 err_clk_disable:
 	stm32_dwmac_clk_disable(dwmac);
 err_wake_init_disable:
@@ -440,6 +479,8 @@ static void stm32_dwmac_remove(struct platform_device *pdev)
 
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
+
+	phy_power_on(priv->plat->bsp_priv, false);
 }
 
 static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
@@ -455,12 +496,20 @@ static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
 	if (dwmac->enable_eth_ck)
 		clk_disable_unprepare(dwmac->clk_eth_ck);
 
+	/* Keep the PHY up if we use Wake-on-Lan. */
+	if (!device_may_wakeup(dwmac->dev))
+		phy_power_on(dwmac, false);
+
 	return ret;
 }
 
 static void stm32mp1_resume(struct stm32_dwmac *dwmac)
 {
 	clk_disable_unprepare(dwmac->clk_ethstp);
+
+	/* The PHY was up for Wake-on-Lan. */
+	if (!device_may_wakeup(dwmac->dev))
+		phy_power_on(dwmac, true);
 }
 
 static int stm32mcu_suspend(struct stm32_dwmac *dwmac)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
