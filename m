Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B75AA20D6C
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 16:47:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4407AC78026;
	Tue, 28 Jan 2025 15:47:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBE8DC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=07l2JUwowhU6Kds29hM9ev3VTddwmEBKcHtBEEd7LSM=; b=QuUz8KNS2b6kxIsPGQp11LQfmn
 pQRbY8a2C6byP0dgrbIZWs317/4ADiqxGskxjCzS39sMG2xNWELMEdH5tiIv8dwvEYgKWok05QEQO
 Ya6CWQFJk//ANio8eNOinoMfWBIP2h6FmoKJycxpD94EkMjQNsyJP3ezgCViN0uAICmN5+uFamFM0
 BD+Yh9JXnxANzTf8e6qdCqMsOhnbLUeilkFbelf69Xi5UMdMlhLOIzLqvuoDwTYtZNUVm+pD7ykVY
 42Fq3M1oJgqP+UcZJwWYZ3Vwj8r2mLEbtePI10gkcL1AdlPnxb8wkRQT1eGQmhs/e3JEjJha/zvEY
 bssGk1/Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49236 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tcno7-0007TJ-2S;
 Tue, 28 Jan 2025 15:47:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tcnno-0037GK-7U; Tue, 28 Jan 2025 15:47:00 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tcnno-0037GK-7U@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:00 +0000
Cc: Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 03/22] net: stmmac: dwmac4:
 ensure LPIATE is cleared
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

LPIATE enables the hardware timer for entering LPI mode. To sure that
the correct mode is used, clear LPIATE when using manual/software-timed
mode to prevent the hardware using the timer.

stmmac_main.c avoids this being a problem at the moment by calling
stmmac_set_eee_lpi_timer(..., 0) before switching to software mode.

We no longer need to call stmmac_set_eee_lpi_timer(..., 0) when
disabling EEE as stmmac_reset_eee_mode() will now clear all LPI
settings.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 4 +++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 9ed8620580a8..17bf836eba7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -387,6 +387,7 @@ static void dwmac4_set_eee_mode(struct mac_device_info *hw,
 	 * state.
 	 */
 	value = readl(ioaddr + GMAC4_LPI_CTRL_STATUS);
+	value &= ~GMAC4_LPI_CTRL_STATUS_LPIATE;
 	value |= GMAC4_LPI_CTRL_STATUS_LPIEN | GMAC4_LPI_CTRL_STATUS_LPITXA;
 
 	if (en_tx_lpi_clockgating)
@@ -401,7 +402,8 @@ static void dwmac4_reset_eee_mode(struct mac_device_info *hw)
 	u32 value;
 
 	value = readl(ioaddr + GMAC4_LPI_CTRL_STATUS);
-	value &= ~(GMAC4_LPI_CTRL_STATUS_LPIEN | GMAC4_LPI_CTRL_STATUS_LPITXA);
+	value &= ~(GMAC4_LPI_CTRL_STATUS_LPIATE | GMAC4_LPI_CTRL_STATUS_LPIEN |
+		   GMAC4_LPI_CTRL_STATUS_LPITXA);
 	writel(value, ioaddr + GMAC4_LPI_CTRL_STATUS);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7480825389e9..e6a6aaa74185 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -493,7 +493,6 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 			netdev_dbg(priv->dev, "disable EEE\n");
 			priv->eee_sw_timer_en = false;
 			del_timer_sync(&priv->eee_ctrl_timer);
-			stmmac_disable_hw_lpi_timer(priv);
 			stmmac_reset_eee_mode(priv, priv->hw);
 			stmmac_set_eee_timer(priv, priv->hw, 0,
 					     STMMAC_DEFAULT_TWT_LS);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
