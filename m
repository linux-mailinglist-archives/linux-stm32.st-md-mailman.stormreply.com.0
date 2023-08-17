Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F02F77FC92
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 19:09:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9D1CC6B478;
	Thu, 17 Aug 2023 17:09:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B235C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 17:09:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C799A675B9;
 Thu, 17 Aug 2023 17:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4C9C43391;
 Thu, 17 Aug 2023 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692292177;
 bh=4IGcaQBS31O4UxIqmGLC17t6CNsWT5osrD81dv+HBug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m3Ecdo94iULh102ihxFOsBgvc/1wjMNN1TBd/yV9CJ2QXFoLCfRS/tftGeX+pFDDy
 zOoqoSgYlFjX/ZtEqsbGx5lhzi6xuIA5NMf4yyHPjuViJvsenCN7NCbYLS5W8mrb99
 DCD9Sq1518sj/JXp9G+pKv1Xd7nxilp89P/0C5JuoQGKU7KjDIfXaAwNrxP8q+U1Tw
 jAZEj/+/U46IDJDmnJ0Obpr8B9r1ykPeaT6w+5D34mqNOEsa7KkITEa2Xd8f7wKcjy
 zGezq4lKcHBRK511EfQZruiuMHkJi+RLLpsdYg2GsyJZMSwcMkaLOFU2ydd38gxIA6
 0wbkKhuJaqwqQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Fri, 18 Aug 2023 00:57:41 +0800
Message-Id: <20230817165749.672-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230817165749.672-1-jszhang@kernel.org>
References: <20230817165749.672-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v5 1/9] net: stmmac: correct RX COE
	parsing for xgmac
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

xgmac can support RX COE, but there's no two kinds of COE, I.E type 1
and type 2 COE.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Alexandre TORGUE <alexandre.torgue@foss.st.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 733b5e900817..3d90ca983389 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7035,7 +7035,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (priv->plat->rx_coe) {
 		priv->hw->rx_csum = priv->plat->rx_coe;
 		dev_info(priv->device, "RX Checksum Offload Engine supported\n");
-		if (priv->synopsys_id < DWMAC_CORE_4_00)
+		if (priv->synopsys_id < DWMAC_CORE_4_00 && !priv->plat->has_xgmac)
 			dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csum);
 	}
 	if (priv->plat->tx_coe)
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
