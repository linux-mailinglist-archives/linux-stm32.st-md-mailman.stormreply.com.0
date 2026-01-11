Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E106ED0EF71
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jan 2026 14:15:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEB4DC349C4;
	Sun, 11 Jan 2026 13:15:40 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA5ECC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mhHZZmL/NcTBBpVOifiOT25mcW059BgaRnaZdAmQTz8=; b=EV/49LMBt6VNFsFdpMQS8rgGvP
 3EZCbcdowNm30Qx4X/rGGaAzNvX24gj4Od6dqcYBsDuKu2d435qDJ0QGIr4oXPWT4Uk3r77U+vjXG
 WepGdjMn/fAFgatj+IpYBgY+4+nO+sfnj1ke3ch/DKGd85eQj+GBGRFlb3S8fH3qu6jSKyl718e34
 MOcWu5wspOxCURrtrMyCpyLHG2gc523QyC44AHjsa4c4uSkRL9NPh8dye1ucb0v/XDrbgO++IQM7g
 sLe1qQk+0bLUsK4wYi350fW5mRCt34gF+qRd9UsLAoD/EqiaxyGiVQDteML20UiPGAdtcQ08U1lRH
 OEbkPkNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48912 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vevI3-000000005Uz-0nSI;
 Sun, 11 Jan 2026 13:15:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vevI1-00000002Yp8-3cM3; Sun, 11 Jan 2026 13:15:29 +0000
In-Reply-To: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
References: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vevI1-00000002Yp8-3cM3@rmk-PC.armlinux.org.uk>
Date: Sun, 11 Jan 2026 13:15:29 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: report PCS link
	changes to phylink
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

Report PCS link changes to phylink, which will allow phylink's inband
support to respoind to link events once the PCS is appropriately
configured.

An expected behavioural change is that should the PCS report that its
link has failed, but phylink is operating in outband mode and the PHY
reports that link is up, this event will cause the netdev's link to
momentarily drop, making the event more noticable, rather than just
producing a "stmmac_pcs: Link Down" message.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 28748e7ef7dd..2f826fe7229b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -62,6 +62,8 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 		x->irq_pcs_link_n++;
 		dev_info(priv->device, "PCS Link %s\n",
 			 val & GMAC_AN_STATUS_LS ? "Up" : "Down");
+
+		phylink_pcs_change(&spcs->pcs, val & GMAC_AN_STATUS_LS);
 	}
 }
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
