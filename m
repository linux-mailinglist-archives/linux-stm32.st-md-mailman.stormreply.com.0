Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC83789FA7
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Aug 2023 15:53:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C67CAC6B44D;
	Sun, 27 Aug 2023 13:53:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E31EBC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 13:53:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D767262BD9;
 Sun, 27 Aug 2023 13:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EFAC433CB;
 Sun, 27 Aug 2023 13:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693144435;
 bh=Kr78mWGRf6MBDQoDlE1Lr7eQQGJaKlhNBXFLknzw88E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C7vmYP/FTlRo1iYOX8JaWg3RpiLfbWcc9THwvP5MyglGp/uzIsXymKqNF+fpKxm04
 zo6hBgBwaq718v9Z4/9Zm0nqRgWr9S+lbD+C+yGAQCjH7uFda/RUm1sDTJLLDepUeY
 w03vlgFGfE6epFLES3kwrH0haVsSwlF5zcBtC7ROqx1yeEOXzUxhc48b01H0/hzZfB
 9ktrd0wdZseXfGo2Z39S1+8Z4NRKxRimxKmWW2nJxgAmxcQy25S+MidFIQRa8DrbwT
 2kmo57GpHGbLueVXJMUal/jtTGcyrdVvGYZfHrCdhbro5oBNIiNVwSdvfzDCCGvgkA
 SwhQjXvaMXnig==
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
Date: Sun, 27 Aug 2023 21:41:50 +0800
Message-Id: <20230827134150.2918-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230827134150.2918-1-jszhang@kernel.org>
References: <20230827134150.2918-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-starfive:
	remove unnecessary clk_get_rate()
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

In starfive_dwmac_fix_mac_speed(), the rate gotten by clk_get_rate()
is not necessary, remove the clk_get_rate() calling.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index b68f42795eaa..422138ef565e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -30,8 +30,6 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigne
 	unsigned long rate;
 	int err;
 
-	rate = clk_get_rate(dwmac->clk_tx);
-
 	switch (speed) {
 	case SPEED_1000:
 		rate = 125000000;
@@ -44,7 +42,7 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigne
 		break;
 	default:
 		dev_err(dwmac->dev, "invalid speed %u\n", speed);
-		break;
+		return;
 	}
 
 	err = clk_set_rate(dwmac->clk_tx, rate);
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
