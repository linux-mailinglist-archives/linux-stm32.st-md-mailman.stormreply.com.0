Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB7D97ECB0
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 16:01:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C80A3C78006;
	Mon, 23 Sep 2024 14:01:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C0F4C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 14:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=isI9/PQ4DNC7EKY1B/11YlS7bxB+io0C0j25LXSzHHY=; b=xJNnFaT2NHx16n7wv0Nu4a1Rsf
 xNjbRMpG15/iOSxgO1mVSTXH82KTiZhtgKVzonPbF1ultXD1sed1nqg4lSFTAOZdddVRixh54vIOv
 QcX3eFkCoGp7gkspMvZ+db81CPVX/ZBiBpQ7E8BcBfzqn+W5zhneQr03+yToAtbeW79upE91OliXe
 WUjcMjnV49JuAK5DFkbnd7a903cz5g/EZ6PVNmsrNar3xtXBVxjIqkQEX3QklnM0/vuz7l7Uvtjj+
 xJx7LD5MhvJSyJ8U6G6Jc0kwWcgVmvJwne50TaNB89ew91OG2pIY53mr3kDgCT9k0zQI9GwKSZXSD
 IzqPTChQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56744 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ssjcl-0004HY-1o;
 Mon, 23 Sep 2024 15:01:11 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ssjck-005Nrr-2B; Mon, 23 Sep 2024 15:01:10 +0100
In-Reply-To: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ssjck-005Nrr-2B@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Sep 2024 15:01:10 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 03/10] net: pcs: xpcs: get rid of
 xpcs_init_iface()
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

xpcs_init_iface() no longer does anything with the interface mode, and
now merely does configuration related to the PMA ID. Move this back
into xpcs_create() as it doesn't warrant being a separate function
anymore.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 2d8cc3959b4c..8765b01c0b5d 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1483,16 +1483,6 @@ static int xpcs_init_id(struct dw_xpcs *xpcs)
 	return 0;
 }
 
-static int xpcs_init_iface(struct dw_xpcs *xpcs)
-{
-	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
-		xpcs->pcs.poll = false;
-	else
-		xpcs->need_reset = true;
-
-	return 0;
-}
-
 static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
 {
 	struct dw_xpcs *xpcs;
@@ -1510,9 +1500,10 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
 	if (ret)
 		goto out_clear_clks;
 
-	ret = xpcs_init_iface(xpcs);
-	if (ret)
-		goto out_clear_clks;
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
+		xpcs->pcs.poll = false;
+	else
+		xpcs->need_reset = true;
 
 	return xpcs;
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
