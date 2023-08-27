Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5FD789FA6
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Aug 2023 15:53:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA3E0C6B44D;
	Sun, 27 Aug 2023 13:53:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5715C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 13:53:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA02961A73;
 Sun, 27 Aug 2023 13:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888A8C433CA;
 Sun, 27 Aug 2023 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693144430;
 bh=2bvndDeKIa1am5zfMWn8oY7XCThEt0L62331HK8Om4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HpsKqOzZidGunvuUuKkUzRb3nxHPc6vpjly9uclBMCkpdnASEMbh1YnJNIzuIbDs7
 YwPRHtAGPCt0WsivqZnsO/4j80+ouaxH2miPPoKo+rWIj31qs9kXie4PLbSMlmHwCP
 MM1fG7LvhxkHPtPod8gs8W8m93I6nxiQdniWVkYsm3BfU6+paCY7ZtlP2O6vGb0Icc
 sjJb8ffbiBVdGNnWamtfou93biN5+pYsY+gWElJtkrWDnRLG18sNjH0gg3MaBiYRyu
 njcB1BQ9+akEOgCe7fu1pN/JXOGheQfy7Wxjb6nqDwuVHu/6SiVGMcZ7vtfZg4rf5f
 wZqSpIl1vo4+A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sun, 27 Aug 2023 21:41:49 +0800
Message-Id: <20230827134150.2918-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230827134150.2918-1-jszhang@kernel.org>
References: <20230827134150.2918-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: dwmac-starfive:
	improve error handling during probe
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

After stmmac_probe_config_dt() succeeds, when error happens later,
stmmac_remove_config_dt() needs to be called for proper error handling.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 892612564694..b68f42795eaa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -111,18 +111,24 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 
 	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
-	if (!dwmac)
-		return -ENOMEM;
+	if (!dwmac) {
+		err = -ENOMEM;
+		goto err_remove_config_dt;
+	}
 
 	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
-	if (IS_ERR(dwmac->clk_tx))
-		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
-				     "error getting tx clock\n");
+	if (IS_ERR(dwmac->clk_tx)) {
+		err = dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
+				    "error getting tx clock\n");
+		goto err_remove_config_dt;
+	}
 
 	clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
-	if (IS_ERR(clk_gtx))
-		return dev_err_probe(&pdev->dev, PTR_ERR(clk_gtx),
-				     "error getting gtx clock\n");
+	if (IS_ERR(clk_gtx)) {
+		err = dev_err_probe(&pdev->dev, PTR_ERR(clk_gtx),
+				    "error getting gtx clock\n");
+		goto err_remove_config_dt;
+	}
 
 	/* Generally, the rgmii_tx clock is provided by the internal clock,
 	 * which needs to match the corresponding clock frequency according
@@ -139,15 +145,17 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 
 	err = starfive_dwmac_set_mode(plat_dat);
 	if (err)
-		return err;
+		goto err_remove_config_dt;
 
 	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (err) {
-		stmmac_remove_config_dt(pdev, plat_dat);
-		return err;
-	}
+	if (err)
+		goto err_remove_config_dt;
 
 	return 0;
+
+err_remove_config_dt:
+	stmmac_remove_config_dt(pdev, plat_dat);
+	return err;
 }
 
 static const struct of_device_id starfive_dwmac_match[] = {
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
