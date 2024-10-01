Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F6C98C226
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2024 18:04:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3177C7801D;
	Tue,  1 Oct 2024 16:04:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6838DC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GgfhbirJwQyLShHHDUmwT1nOPTwLg0zxTxgh9d2blI0=; b=rZa45PICuvvUtmMJcptq+KXDJv
 Sn+uq7heKi3UnM1ynm1liEdE2H6o/w5RS7gdlE1v9nZ30eayDSuagVqxhvGnWNGEDBg2yBzrX95SG
 wj202KIyIqNM+bnKx19M0T1So/9uZ49173QtAgqQxSs6FGMt64kJx15PoGXLoPyK4h6P7rEzpYevs
 7tRIv/kpmcnTJvQHcumKDGNaEDa4tUcoQRzDUgv3Ha8t4Bp9PVEb0k8iMVtjm2gXO38wllF2hMZa4
 JZMpCm2MVhCUM8HWFxmZLSYDZ9wejTbzGy7Xkbe561QTMOJqvf1q7EibQ/Sh15xwwT5JW/EVKT9O5
 GADzzr/Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34708 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1svfMH-00065K-1y;
 Tue, 01 Oct 2024 17:04:17 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1svfMG-005ZI9-3k; Tue, 01 Oct 2024 17:04:16 +0100
In-Reply-To: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1svfMG-005ZI9-3k@rmk-PC.armlinux.org.uk>
Date: Tue, 01 Oct 2024 17:04:16 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 02/10] net: pcs: xpcs: drop interface
 argument from internal functions
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

Now that we no longer use the "interface" argument when creating the
XPCS sub-driver, remove it from xpcs_create() and xpcs_init_iface().

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 7c6c40ddf722..2d8cc3959b4c 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1483,7 +1483,7 @@ static int xpcs_init_id(struct dw_xpcs *xpcs)
 	return 0;
 }
 
-static int xpcs_init_iface(struct dw_xpcs *xpcs, phy_interface_t interface)
+static int xpcs_init_iface(struct dw_xpcs *xpcs)
 {
 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
 		xpcs->pcs.poll = false;
@@ -1493,8 +1493,7 @@ static int xpcs_init_iface(struct dw_xpcs *xpcs, phy_interface_t interface)
 	return 0;
 }
 
-static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
-				   phy_interface_t interface)
+static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
 {
 	struct dw_xpcs *xpcs;
 	int ret;
@@ -1511,7 +1510,7 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 	if (ret)
 		goto out_clear_clks;
 
-	ret = xpcs_init_iface(xpcs, interface);
+	ret = xpcs_init_iface(xpcs);
 	if (ret)
 		goto out_clear_clks;
 
@@ -1546,7 +1545,7 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 	if (IS_ERR(mdiodev))
 		return ERR_CAST(mdiodev);
 
-	xpcs = xpcs_create(mdiodev, interface);
+	xpcs = xpcs_create(mdiodev);
 
 	/* xpcs_create() has taken a refcount on the mdiodev if it was
 	 * successful. If xpcs_create() fails, this will free the mdio
@@ -1584,7 +1583,7 @@ struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode,
 	if (!mdiodev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	xpcs = xpcs_create(mdiodev, interface);
+	xpcs = xpcs_create(mdiodev);
 
 	/* xpcs_create() has taken a refcount on the mdiodev if it was
 	 * successful. If xpcs_create() fails, this will free the mdio
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
