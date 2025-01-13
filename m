Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7702A0B5F6
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 12:46:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E780C78024;
	Mon, 13 Jan 2025 11:46:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED37EC030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eHGBpnOJSbQXIJIcFls+W2wBz5McA8yNE0ntaczE2hE=; b=07IgX5hzLIa68QEHroPBGdGykk
 ylc62DhROu9kE3gMANoaYDxGIaU7Lm8Ffz6GSzTB1TjeMDowHqmiPFG/gVaKxzu+wF3BjC0nn9Qks
 L+hyXuq8L3k95XzNlCZE0j23Il+PClcGVKTIDmDzaOVYNJZkdPU/btLl2TphPtDrbBMAbMJXSyPqK
 vsdKhyd2ubop0qIlcejcA8k8cbmVaQsrhDLRxFQJX6CYEPzqxJnCb3EgSHgMUg8lIPHHx2KU+VmfJ
 QQtUrMj8Sl4QXQhPc4mkjACkpUX0UXbwByEHqfopxwNgjP4FZhxLXNCQmKAOljmEaCMv7BEEunLYu
 9Dt05LNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35704 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tXItf-0006Vx-14;
 Mon, 13 Jan 2025 11:46:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tXItM-000MBI-CX; Mon, 13 Jan 2025 11:46:00 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tXItM-000MBI-CX@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:46:00 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Woudstra <ericwouds@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/9] net: stmmac: add
	stmmac_try_to_start_sw_lpi()
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

There are two places which call stmmac_enable_eee_mode() and follow it
immediately by modifying the expiry of priv->eee_ctrl_timer. Both code
paths are trying to enable LPI mode. Remove this duplication by
providing a function for this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 26ff1ded4e3d..2bb61757e320 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -426,6 +426,13 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
 	return 0;
 }
 
+static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
+{
+	if (stmmac_enable_eee_mode(priv))
+		mod_timer(&priv->eee_ctrl_timer,
+			  STMMAC_LPI_T(priv->tx_lpi_timer));
+}
+
 /**
  * stmmac_stop_sw_lpi - stop transmitting LPI
  * @priv: driver private structure
@@ -449,8 +456,7 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
 {
 	struct stmmac_priv *priv = from_timer(priv, t, eee_ctrl_timer);
 
-	if (stmmac_enable_eee_mode(priv))
-		mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
+	stmmac_try_to_start_sw_lpi(priv);
 }
 
 /**
@@ -2782,10 +2788,8 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 			xmits = budget;
 	}
 
-	if (priv->eee_sw_timer_en && !priv->tx_path_in_lpi_mode) {
-		if (stmmac_enable_eee_mode(priv))
-			mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
-	}
+	if (priv->eee_sw_timer_en && !priv->tx_path_in_lpi_mode)
+		stmmac_try_to_start_sw_lpi(priv);
 
 	/* We still have pending packets, let's call for a new scheduling */
 	if (tx_q->dirty_tx != tx_q->cur_tx)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
