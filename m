Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF03D85D8A6
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 14:04:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80687C6C820;
	Wed, 21 Feb 2024 13:04:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A5E8C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 13:04:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B728E000D;
 Wed, 21 Feb 2024 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708520641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRGNGZcqgoCOXv3VnpuOzxbccKn6jF8lp/JWdRUtrtM=;
 b=meQ8RTT38F8cz3r6Yc7dYhO6F62SSbh9v8w9KL7P9K+6OEayGmGz7xoJMmn6BURnso1Qoy
 7W+q7qsfkLJXgd0AwYLNKSDRNLVsJeP7LgUpbrjOLEkhuqF+GhJZyumBAj20o6Tg4FyQ2Z
 c5QE0CXJ7jggwRKUNQuTiR9Pc9upNrcfteM/FpoQvOcysKqcI3lv1dHF4G9B6fgkeAYolF
 x2yI+NR5ndyjznK8kwftVSce3UPvKmr/KYcm8/6SdwZvtui1elu4A7iNSdDaJNeY9XDrlD
 HrkdlXfzpsS3d4BhsmancighrjB526vNCSmppKSbF8+lqjTlzhLa3IGHi1AFqQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 21 Feb 2024 14:04:20 +0100
MIME-Version: 1.0
Message-Id: <20240221-rxc_bugfix-v4-3-4883ee1cc7b1@bootlin.com>
References: <20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com>
In-Reply-To: <20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 3/7] net: stmmac: don't rely on
 lynx_pcs presence to check for a PHY
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

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

When initializing attached PHYs, there are some cases where we don't expect
any PHY to be connected. The logic uses conditions based on various local
PCS configuration, but also calls-in phylink_expects_phy() via
stmmac_init_phy(), which is enough to ensure we don't try to initialize a
PHY when using a Lynx PCS, as long as we have the phy_interface set to a
802.3z mode and are using inband negociation.

Drop the lynx check, making the stmmac generic code more pcs_lynx-agnostic.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[rgantois: commit log]
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9159d93ceb03..47cd8666af43 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3959,8 +3959,7 @@ static int __stmmac_open(struct net_device *dev,
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI &&
 	    (!priv->hw->xpcs ||
-	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73) &&
-	    !priv->hw->lynx_pcs) {
+	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
 		ret = stmmac_init_phy(dev);
 		if (ret) {
 			netdev_err(priv->dev,

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
