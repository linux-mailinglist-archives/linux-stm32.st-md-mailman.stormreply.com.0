Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4209B8B37B0
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 15:00:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07756C6A61D;
	Fri, 26 Apr 2024 13:00:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D439CC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 13:00:50 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q8OSKt007203;
 Fri, 26 Apr 2024 15:00:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=r29KcA+intOgLdhWqhs454h8+L7M40E0ehfxZAjqxz4=; b=vF
 6mzR6AXLHEbBF1PdZmseQ4u4NhIDaexwBClmE915S9ekCHwxlZG7csCUAoARUWM9
 8yy3Oy3rS2av2qoE++7LLQckXwRWMyNOZ1rE6pPUvsSyiCj3rB1H64WoYrUOR1BU
 qkxnB7ItNdS7jfhYAcw5Rypd6X99tWOddxfGy83LIoFgnkgyBGm8UVbbFV7WDRKo
 7XyvUihUD1wX3gzG930puMWsdjy4wxwUmpDwU42/y+4qICmdoBKHBlz/7MbMurX4
 RUGGP6eg4lic2A+l+bvwYFPVdhZYF0tEURw7J86S9tXEtAxKIyYjLvfTz+xMOhlt
 lNhcMGw3fgrsCRfhkW/g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmq9108ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 15:00:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7325840045;
 Fri, 26 Apr 2024 15:00:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FE73222CB2;
 Fri, 26 Apr 2024 14:59:17 +0200 (CEST)
Received: from localhost (10.252.17.191) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 14:59:17 +0200
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
Date: Fri, 26 Apr 2024 14:57:02 +0200
Message-ID: <20240426125707.585269-7-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426125707.585269-1-christophe.roullier@foss.st.com>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.17.191]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 06/11] net: stmmac: dwmac-stm32: clean the
	way to manage wol irqwake
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

On STM32 platforms it is no longer needed to use a dedicated wakeup to
wake up system from CStop. This patch removes the dedicated wake up usage
and clean the way to register the wake up irq.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 66 +++++++++----------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index e648c4e790a7..5d8f4eac4bc0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -81,7 +81,6 @@ struct stm32_dwmac {
 	int enable_eth_ck;
 	int eth_clk_sel_reg;
 	int eth_ref_clk_sel_reg;
-	int irq_pwr_wakeup;
 	u32 mode_reg;		 /* MAC glue-logic mode register */
 	u32 mode_mask;
 	struct regmap *regmap;
@@ -312,9 +311,7 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
 			       struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
-	int err = 0;
 
 	/* Ethernet PHY have no crystal */
 	dwmac->ext_phyclk = of_property_read_bool(np, "st,ext-phyclk");
@@ -346,29 +343,24 @@ static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
 	if (IS_ERR(dwmac->syscfg_clk))
 		dwmac->syscfg_clk = NULL;
 
-	/* Get IRQ information early to have an ability to ask for deferred
-	 * probe if needed before we went too far with resource allocation.
-	 */
-	dwmac->irq_pwr_wakeup = platform_get_irq_byname_optional(pdev,
-							"stm32_pwr_wakeup");
-	if (dwmac->irq_pwr_wakeup == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-
-	if (!dwmac->clk_eth_ck && dwmac->irq_pwr_wakeup >= 0) {
-		err = device_init_wakeup(&pdev->dev, true);
-		if (err) {
-			dev_err(&pdev->dev, "Failed to init wake up irq\n");
-			return err;
-		}
-		err = dev_pm_set_dedicated_wake_irq(&pdev->dev,
-						    dwmac->irq_pwr_wakeup);
-		if (err) {
-			dev_err(&pdev->dev, "Failed to set wake up irq\n");
-			device_init_wakeup(&pdev->dev, false);
-		}
-		device_set_wakeup_enable(&pdev->dev, false);
+	return 0;
+}
+
+static int stm32_dwmac_wake_init(struct device *dev,
+				 struct stmmac_resources *stmmac_res)
+{
+	int err;
+
+	device_set_wakeup_capable(dev, true);
+
+	err = dev_pm_set_wake_irq(dev, stmmac_res->wol_irq);
+	if (err) {
+		dev_err(dev, "Failed to set wake up irq\n");
+		device_set_wakeup_capable(dev, false);
+		return err;
 	}
-	return err;
+
+	return 0;
 }
 
 static int stm32_dwmac_probe(struct platform_device *pdev)
@@ -406,11 +398,17 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (stmmac_res.wol_irq && !dwmac->clk_eth_ck) {
+		ret = stm32_dwmac_wake_init(&pdev->dev, &stmmac_res);
+		if (ret)
+			goto err_wake_init_disable;
+	}
+
 	plat_dat->bsp_priv = dwmac;
 
 	ret = stm32_dwmac_init(plat_dat, false);
 	if (ret)
-		return ret;
+		goto err_wake_init_disable;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
@@ -420,7 +418,11 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 
 err_clk_disable:
 	stm32_dwmac_clk_disable(dwmac, false);
-
+err_wake_init_disable:
+	if (stmmac_res.wol_irq && !dwmac->clk_eth_ck) {
+		dev_pm_clear_wake_irq(&pdev->dev);
+		device_set_wakeup_capable(&pdev->dev, false);
+	}
 	return ret;
 }
 
@@ -428,16 +430,12 @@ static void stm32_dwmac_remove(struct platform_device *pdev)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct stm32_dwmac *dwmac = priv->plat->bsp_priv;
 
 	stmmac_dvr_remove(&pdev->dev);
+	stm32_dwmac_clk_disable(priv->plat->bsp_priv, false);
 
-	stm32_dwmac_clk_disable(dwmac, false);
-
-	if (dwmac->irq_pwr_wakeup >= 0) {
-		dev_pm_clear_wake_irq(&pdev->dev);
-		device_init_wakeup(&pdev->dev, false);
-	}
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
 }
 
 static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
