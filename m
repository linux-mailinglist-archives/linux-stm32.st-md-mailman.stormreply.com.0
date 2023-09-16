Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 733897A2EA6
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Sep 2023 10:12:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B7E7C6B47C;
	Sat, 16 Sep 2023 08:12:34 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 554A7C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Sep 2023 08:12:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6162B80AC2;
 Sat, 16 Sep 2023 08:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA1DC433CA;
 Sat, 16 Sep 2023 08:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694851951;
 bh=DVz+nB8IvJqLf9Cq3iqAIJu8nG0D+BltvLR73sQ0FZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tqQi4l3gKamyFboFFuqRRarjM3pBQv0SYmxFUubNe9E/38XV8jubhV32c8CSdulmn
 3S/2f0zO0l5A8dA7JivgOlqsGxrv+gdxZTWoFAg7d4fDLDOXGc4Jhhj/9fOJnvWh/y
 /3n7V1gEdN/DxJusPP3eDX+CmhRodrFxEMiGJFVKWNgYXv1HJ7stuAS2Nj7l9+0lGr
 C22lw/Taeh7UDWv9/jJj5YIr4LOIMhNte5sgbFz0qylskwGx1rQ2Wm9RcYiEHibBxW
 OpGj6j9VMQaJcPyltsfUeUCGnc6WnXZliKPi9dxgEViwNl8mQhEJUVw8KOXSHbVd6z
 IhQYOdnmBIiTA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Sat, 16 Sep 2023 15:58:23 +0800
Message-Id: <20230916075829.1560-18-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 17/23] net: stmmac: dwmac-stm32:
	use devm_stmmac_probe_config_dt()
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

Simplify the driver's probe() function by using the devres
variant of stmmac_probe_config_dt().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c   | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 26ea8c687881..ab4324ed46da 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -370,21 +370,18 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
 	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
-	if (!dwmac) {
-		ret = -ENOMEM;
-		goto err_remove_config_dt;
-	}
+	if (!dwmac)
+		return -ENOMEM;
 
 	data = of_device_get_match_data(&pdev->dev);
 	if (!data) {
 		dev_err(&pdev->dev, "no of match data provided\n");
-		ret = -EINVAL;
-		goto err_remove_config_dt;
+		return -EINVAL;
 	}
 
 	dwmac->ops = data;
@@ -393,14 +390,14 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 	ret = stm32_dwmac_parse_data(dwmac, &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to parse OF data\n");
-		goto err_remove_config_dt;
+		return ret;
 	}
 
 	plat_dat->bsp_priv = dwmac;
 
 	ret = stm32_dwmac_init(plat_dat);
 	if (ret)
-		goto err_remove_config_dt;
+		return ret;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
@@ -410,8 +407,6 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 
 err_clk_disable:
 	stm32_dwmac_clk_disable(dwmac);
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
