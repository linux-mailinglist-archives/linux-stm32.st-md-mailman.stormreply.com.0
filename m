Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FA1A0B5F8
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 12:46:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 881E3C78024;
	Mon, 13 Jan 2025 11:46:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A319CC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g+VsXR88odtwMSlVe7f6Y99n5yB+/8EudxncAOgJLec=; b=uaDiXOvuAhAd7fvqgtJPK3Pzym
 JAW2BZnk22M1VKV7SwEZ6cxmi5u/3PMN2R2W0KjhbZ/ljPtCkf4HgyVg0xpM1l+P+yNl4EwrW4xky
 +ttjAuCONpJey143HFrHBiazoXZAEWkELODOTbYoszY298Bw3vm5fb45teYwa+p7IavOGYgIH4Wja
 U87ONwH7CH8l7hYIlTPG3zK7hCCYt7fLfBRJbPG2qq6eCBZDu5/U61bE76wBxkHk2PHupTRtVnKjO
 CLz+BWNNrJjf/pQs0XfdkBs2toSBItyL3bI8xTuF+hiMTT6Gf+MKKRZiwKDe2KtQWz1wV2wXTUoEo
 MIfy/HJw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45898 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tXItk-0006WI-1l;
 Mon, 13 Jan 2025 11:46:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tXItR-000MBO-GF; Mon, 13 Jan 2025 11:46:05 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tXItR-000MBO-GF@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:46:05 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Woudstra <ericwouds@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 6/9] net: stmmac: provide
	stmmac_eee_tx_busy()
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

Extract the code which checks whether there's still work to do on any
of the stmmac transmit queues. This will allow us to combine
stmmac_enable_eee_mode() with stmmac_try_to_start_sw_lpi() in the
next patch.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2bb61757e320..ddbcbe3886c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -400,13 +400,7 @@ static void stmmac_enable_hw_lpi_timer(struct stmmac_priv *priv)
 	stmmac_set_eee_lpi_timer(priv, priv->hw, priv->tx_lpi_timer);
 }
 
-/**
- * stmmac_enable_eee_mode - check and enter in LPI mode
- * @priv: driver private structure
- * Description: this function is to verify and enter in LPI mode in case of
- * EEE.
- */
-static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
+static bool stmmac_eee_tx_busy(struct stmmac_priv *priv)
 {
 	u32 tx_cnt = priv->plat->tx_queues_to_use;
 	u32 queue;
@@ -416,9 +410,23 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
 		struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 
 		if (tx_q->dirty_tx != tx_q->cur_tx)
-			return -EBUSY; /* still unfinished work */
+			return true; /* still unfinished work */
 	}
 
+	return false;
+}
+
+/**
+ * stmmac_enable_eee_mode - check and enter in LPI mode
+ * @priv: driver private structure
+ * Description: this function is to verify and enter in LPI mode in case of
+ * EEE.
+ */
+static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
+{
+	if (stmmac_eee_tx_busy(priv))
+		return -EBUSY; /* still unfinished work */
+
 	/* Check and enter in LPI mode */
 	if (!priv->tx_path_in_lpi_mode)
 		stmmac_set_eee_mode(priv, priv->hw,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
