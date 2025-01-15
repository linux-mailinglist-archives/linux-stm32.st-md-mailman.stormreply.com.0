Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD5A1339B
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 08:14:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5E4AC78F83;
	Thu, 16 Jan 2025 07:14:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEB4FC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=weR9Z/CkPANR3PvdWqGOb/Y+LHB/KJHILnKwZHgGiFY=; b=N0/VZvONhngbqSzpyFGBIJ/qN4
 003l5PbF+73jtiFHm3O2tlNy+gA2/VVmXIVmEFLICiHaoIV4uZae6JFTzqms80aXGnfVJaOSbdlRD
 rdzJMSevekXXjGBSf7tMEAE7KUnzOyhCIfNFPgH9N3vO1pZWAm2sZq2VfmtxVgRas/u4GgeN54dc0
 auw1I2zWE2xzKw0srxWUpMOuoPeAUr4eAfSUwBdG6fGG92uyOUeaov+X4ydb95d4FN6gibmxaKm1k
 hYfAdERvA+03hxA9vloZEPgB3msrh0W4mNGVInWIlzijY/1kZAGDDBsJYcRF/8NvjHD3x7eUzmYR4
 g8IJ0vPw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54728 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tYAE4-0001ij-29;
 Wed, 15 Jan 2025 20:42:56 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tYADl-0014Ph-EV; Wed, 15 Jan 2025 20:42:37 +0000
In-Reply-To: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tYADl-0014Ph-EV@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Jan 2025 20:42:37 +0000
X-Mailman-Approved-At: Thu, 16 Jan 2025 07:13:59 +0000
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>, UNGLinuxDriver@microchip.com,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/9] net: phylink: add
	phylink_link_is_up() helper
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

Add a helper to determine whether the link is up or down. Currently
this is only used in one location, but becomes necessary to test
when reconfiguring EEE.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 31754d5fd659..e3fc1d1be1ed 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1641,20 +1641,21 @@ static void phylink_link_down(struct phylink *pl)
 	phylink_info(pl, "Link is Down\n");
 }
 
+static bool phylink_link_is_up(struct phylink *pl)
+{
+	return pl->netdev ? netif_carrier_ok(pl->netdev) : pl->old_link_state;
+}
+
 static void phylink_resolve(struct work_struct *w)
 {
 	struct phylink *pl = container_of(w, struct phylink, resolve);
 	struct phylink_link_state link_state;
-	struct net_device *ndev = pl->netdev;
 	bool mac_config = false;
 	bool retrigger = false;
 	bool cur_link_state;
 
 	mutex_lock(&pl->state_mutex);
-	if (pl->netdev)
-		cur_link_state = netif_carrier_ok(ndev);
-	else
-		cur_link_state = pl->old_link_state;
+	cur_link_state = phylink_link_is_up(pl);
 
 	if (pl->phylink_disable_state) {
 		pl->link_failed = false;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
