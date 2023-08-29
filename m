Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E637B78C54F
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Aug 2023 15:29:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96520C6A613;
	Tue, 29 Aug 2023 13:29:58 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4E63C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DjC9ZMxD102H+JhE6xrIC7pYAF3Sy1Cq4pNKP95ISo=; b=IHAfui+2D5PmkRyzYMMcFRVUbF
 W/+LyN4pJIICbtHlxoFQAcev9qqFYcdp7y1Nd9qSEEvOLTVjNqsa4o94UEE5+mow3zIow4470l0mF
 cUaRA+9EV6xzxGCEGCl+6/PWWeD2XCFLllSPghtFef7u7GsWf30lqIsrGEIN7wr5fyHC8QNys7H83
 VXaixUcXQ2VOjwVCcubgHvgag3LNRR+48CyE26fzPIzDH218vsZDHBKUCEQT0ogIk3Vtzw4EP56NH
 i+w/Pfh3ALQNpswloxyYgsWmAlzp6gaHvlyfAgcw9/HT69AEdaNziIlhzapj0CKn4+YvdyYRJJiu+
 s1h9cezA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36568 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qayn0-0000WA-0a;
 Tue, 29 Aug 2023 14:29:50 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qayn0-006Q8J-GE; Tue, 29 Aug 2023 14:29:50 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qayn0-006Q8J-GE@rmk-PC.armlinux.org.uk>
Date: Tue, 29 Aug 2023 14:29:50 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: failure to probe
 without MAC interface specified
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

Alexander Stein reports that commit a014c35556b9 ("net: stmmac: clarify
difference between "interface" and "phy_interface"") caused breakage,
because plat->mac_interface will never be negative. Fix this by using
the "rc" temporary variable in stmmac_probe_config_dt().

Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
I don't think the net tree is up to date with the net-next, so this
patch needs applying to net-next preferably before the pull request
to fix a regression.

Thanks.

 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 35f4b1484029..0f28795e581c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -419,9 +419,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		return ERR_PTR(phy_mode);
 
 	plat->phy_interface = phy_mode;
-	plat->mac_interface = stmmac_of_get_mac_mode(np);
-	if (plat->mac_interface < 0)
-		plat->mac_interface = plat->phy_interface;
+	rc = stmmac_of_get_mac_mode(np);
+	plat->mac_interface = rc < 0 ? plat->phy_interface : rc;
 
 	/* Some wrapper drivers still rely on phy_node. Let's save it while
 	 * they are not converted to phylink. */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
