Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 559BCADE946
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 12:41:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ABB8C36B30;
	Wed, 18 Jun 2025 10:41:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD15DC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 10:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cm/933WhUbzY2Ue6anpW6daO4H0jv7g+t//DGt737a8=; b=KmCEIcKFhTTTC5XlkVRRdi6Q6L
 gfoMjuP0cDyjUGyz6KEdDcJ4zuuhX1KMcLtXoxV8o8d3WaE170hQxYgs1LCHMXnbmT8GzEgoxu7eT
 JkAWuUVRWRg5kFGOnCZ3b6p2L8eK6I+9U2qGgn4b+RM07Ii0Zgys1xaiDlj+UCrV/9e+EVBDNvkgn
 +I0YA/ADwi77krhLJI5A0+xuqPOm+2SviJzaI/OosZh/q48Jb6AjhXYz0HvTTmm6drETWag1lHHQT
 Og5Sbx2F2kpBkYZ6E7CgL5yccMDomgqa7y8S55Rwy2vW0q7fyji2C+zrUJPhB30SPp2rWGGE3FeQG
 0AhIcjxw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60256 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uRqEn-0006Ia-2s;
 Wed, 18 Jun 2025 11:41:49 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uRqE9-004c7G-CB; Wed, 18 Jun 2025 11:41:09 +0100
In-Reply-To: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Jun 2025 11:41:09 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: loongson1: provide
 match data struct
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

Provide a structure for match data rather than using the function
pointer as match data. This allows stronger type-checking for the
function itself, and allows extensions to the match data.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 3e86810717d3..78d9540be10c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -46,6 +46,10 @@ struct ls1x_dwmac {
 	struct regmap *regmap;
 };
 
+struct ls1x_data {
+	int (*init)(struct platform_device *pdev, void *bsp_priv);
+};
+
 static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 {
 	struct ls1x_dwmac *dwmac = priv;
@@ -143,9 +147,9 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
+	const struct ls1x_data *data;
 	struct regmap *regmap;
 	struct ls1x_dwmac *dwmac;
-	int (*init)(struct platform_device *pdev, void *priv);
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -159,8 +163,8 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
 				     "Unable to find syscon\n");
 
-	init = of_device_get_match_data(&pdev->dev);
-	if (!init) {
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data) {
 		dev_err(&pdev->dev, "No of match data provided\n");
 		return -EINVAL;
 	}
@@ -175,21 +179,29 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->init = init;
+	plat_dat->init = data->init;
 	dwmac->plat_dat = plat_dat;
 	dwmac->regmap = regmap;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct ls1x_data ls1b_dwmac_data = {
+	.init = ls1b_dwmac_syscon_init,
+};
+
+static const struct ls1x_data ls1c_dwmac_data = {
+	.init = ls1c_dwmac_syscon_init,
+};
+
 static const struct of_device_id ls1x_dwmac_match[] = {
 	{
 		.compatible = "loongson,ls1b-gmac",
-		.data = &ls1b_dwmac_syscon_init,
+		.data = &ls1b_dwmac_data,
 	},
 	{
 		.compatible = "loongson,ls1c-emac",
-		.data = &ls1c_dwmac_syscon_init,
+		.data = &ls1c_dwmac_data,
 	},
 	{ }
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
