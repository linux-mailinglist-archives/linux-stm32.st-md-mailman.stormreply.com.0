Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6725DB383AC
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 15:27:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 377D2C32E8E;
	Wed, 27 Aug 2025 13:27:58 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7AD2C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bVD8KDKEsQ4zdVl4LrGJ70ulwhHWfhhuvgyYMvpeM10=; b=GSh6z4TW7Nt+CEY/rDh0GgW8B9
 cuauYVIjct/VP6WLiQXy/LQz7rDa1rvTtSPQd3/PRJYMAkajyZtNs7zUGpy4VsWDeHsa1K75pWQ3l
 iPU41l3yVDMqMOMaXduRI8l8g5lha+rttrhGoVfTe+NwmsY0aZzYVFkjcNLpR4saAUQHSlTBvG/Ii
 TlYTIXzwDXLiAdkKi/CXx5D/LApZGu6DXylip/0gaBzJ8or5bItcjnQB6/LrExoQkVEEKGcVxHS1a
 oaN//f3aH1NEGUDCne7iKaXAhrluuznMazMa9c9ZBW0jQZ0ydDmg9HEFfPw+QhselGQTv1EEmzgl6
 DMed0ASA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54398 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1urGBo-000000000UR-2jbe;
 Wed, 27 Aug 2025 14:27:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1urGBn-00000000DCH-3swS; Wed, 27 Aug 2025 14:27:47 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1urGBn-00000000DCH-3swS@rmk-PC.armlinux.org.uk>
Date: Wed, 27 Aug 2025 14:27:47 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: clean up c22/c45
	accessor split
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

The C45 accessors were setting the GR (register number) field twice,
once with the 16-bit register address truncated to five bits, and
then overwritten with the C45 devad. This is harmless since the field
was being cleared prior to being updated with the C45 devad, except
for the extra work.

Remove the redundant code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Untested, as I don't have my Jetson Xavier NX platform with me (and
probably won't do for a few weeks.)

While this patch has been prepared on top of "net: stmmac: mdio: use
netdev_priv() directly" it shouldn't conflict if that patch is not
applied before this one.

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 86021e6b67b2..da4542be756a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -311,12 +311,10 @@ static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 
 	value |= (phyaddr << priv->hw->mii.addr_shift)
 		& priv->hw->mii.addr_mask;
-	value |= (phyreg << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
 		& priv->hw->mii.clk_csr_mask;
 	value |= MII_GMAC4_READ;
 	value |= MII_GMAC4_C45E;
-	value &= ~priv->hw->mii.reg_mask;
 	value |= (devad << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
@@ -409,14 +407,12 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 
 	value |= (phyaddr << priv->hw->mii.addr_shift)
 		& priv->hw->mii.addr_mask;
-	value |= (phyreg << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 
 	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
 		& priv->hw->mii.clk_csr_mask;
 
 	value |= MII_GMAC4_WRITE;
 	value |= MII_GMAC4_C45E;
-	value &= ~priv->hw->mii.reg_mask;
 	value |= (devad << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
