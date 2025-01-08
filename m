Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D80A0629B
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 17:49:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CECAC78F67;
	Wed,  8 Jan 2025 16:49:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91369C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=++e+SDGClfcRyopadSBzqoMp8DLijqiGn3Srrs12xlo=; b=v+FHQnl9Wtbhw5yWW4uWiy+g+d
 f9Qxz4ZbJSIbuWmJJ81czZacO5Gr0CETG2vyREjCnrrW9RE+kb8JYfMeECPFLwy7v0emigc5pMiqw
 aCXIFl2Denk+6oNBOjEPB0VJP3hBn0nPutUQ8bgvF3NyVwIWf9pJnLdE/BIToIqoQwL9ONZQgjPZG
 WJv2N56ZbbHPX5SHgAhbo7Xf5ynkRiKaNGAangRGiqWapFILn02YNr9oKyRwQ4GomTsUt2mEQ+sYu
 jl2MYlDec2e5qgdxszOaAjjit4Piszp8TEuUKwrqzpfJV/TKOdbKQZxb9nno+6EILda3+3yAm/YUg
 0S7qLBOw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56706 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tVZF4-0000z4-2i;
 Wed, 08 Jan 2025 16:49:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tVZEl-0002LK-LA; Wed, 08 Jan 2025 16:48:55 +0000
In-Reply-To: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
References: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tVZEl-0002LK-LA@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Jan 2025 16:48:55 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 17/18] net: stmmac: split hardware
 LPI timer control
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

Provide stmmac_disable_hw_lpi_timer() and stmmac_enable_hw_lpi_timer()
to control the hardware transmit LPI timer.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6d01dcafaf15..05fee963c1c4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -390,14 +390,24 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 	return dirty;
 }
 
-static void stmmac_lpi_entry_timer_config(struct stmmac_priv *priv, bool en)
+static void stmmac_disable_hw_lpi_timer(struct stmmac_priv *priv)
+{
+	stmmac_set_eee_lpi_timer(priv, priv->hw, 0);
+}
+
+static void stmmac_enable_hw_lpi_timer(struct stmmac_priv *priv)
 {
-	u32 tx_lpi_timer;
+	stmmac_set_eee_lpi_timer(priv, priv->hw, priv->tx_lpi_timer);
+}
 
+static void stmmac_lpi_entry_timer_config(struct stmmac_priv *priv, bool en)
+{
 	/* Clear/set the SW EEE timer flag based on LPI ET enablement */
 	priv->eee_sw_timer_en = en ? 0 : 1;
-	tx_lpi_timer = en ? priv->tx_lpi_timer : 0;
-	stmmac_set_eee_lpi_timer(priv, priv->hw, tx_lpi_timer);
+	if (en)
+		stmmac_enable_hw_lpi_timer(priv);
+	else
+		stmmac_disable_hw_lpi_timer(priv);
 }
 
 /**
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
