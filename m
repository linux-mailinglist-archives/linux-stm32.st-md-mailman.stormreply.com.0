Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC424A0B5FA
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 12:46:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92117C78024;
	Mon, 13 Jan 2025 11:46:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DCE6C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OlZYWPX0QNCSKKO5JWx1URTrYTNj5bjTeUg1yJzKm6g=; b=CEVqnTPusTw+aupRrYqlu84HHr
 /uDDsggTdYHG/CMitY1r+ceWHqYlZxEnITYNiOoqAhCbEbg8LuDndZA2x8+B74LGUlk0xjizBemZY
 4MLhDG3qwEc/fn4P8fhTQEL5psw6fJsvJ3xYEJSm7ZoUqaUMBa2cVO4vPDBWEATKxqsPljsEjgAVb
 RAKjZqFXH7GpllEcahl4sbFKHZvhCZH3SgBNFfuzmVNWaD0lZBmaweN1ui4sj2ug2lSy3BAd/L8Q0
 /T94hvXNLMlEKf5R0f9lq8rVBlt8IMk7IuR7XkaCvdH9uKB7207cUoIp/eadNipG0So3kunn+R54S
 sx0BhEeg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45902 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tXItp-0006WZ-26;
 Mon, 13 Jan 2025 11:46:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tXItW-000MBU-KQ; Mon, 13 Jan 2025 11:46:10 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tXItW-000MBU-KQ@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:46:10 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Woudstra <ericwouds@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 7/9] net: stmmac: provide function
 for restarting sw LPI timer
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

Provide a function that encapsulates restarting the software LPI
timer when we have determined that the transmit path is busy, or
whether the EEE parameters have changed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ddbcbe3886c0..677a2172a85f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -416,6 +416,11 @@ static bool stmmac_eee_tx_busy(struct stmmac_priv *priv)
 	return false;
 }
 
+static void stmmac_restart_sw_lpi_timer(struct stmmac_priv *priv)
+{
+	mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
+}
+
 /**
  * stmmac_enable_eee_mode - check and enter in LPI mode
  * @priv: driver private structure
@@ -437,8 +442,7 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
 static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
 {
 	if (stmmac_enable_eee_mode(priv))
-		mod_timer(&priv->eee_ctrl_timer,
-			  STMMAC_LPI_T(priv->tx_lpi_timer));
+		stmmac_restart_sw_lpi_timer(priv);
 }
 
 /**
@@ -526,8 +530,7 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 		/* Use software LPI mode */
 		priv->eee_sw_timer_en = true;
 		stmmac_disable_hw_lpi_timer(priv);
-		mod_timer(&priv->eee_ctrl_timer,
-			  STMMAC_LPI_T(priv->tx_lpi_timer));
+		stmmac_restart_sw_lpi_timer(priv);
 	}
 
 	priv->eee_enabled = true;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
