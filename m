Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E7B43B2A
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 14:11:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0893C36B1F;
	Thu,  4 Sep 2025 12:11:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 901B0C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 12:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l/7lQhTrFsM5wfoxKtbA8wclhlUecEUrj1EveL4J1o8=; b=WewQF6i6LL+vxLYydpzfZHk7um
 qFsGDuALTh46qh1LZgmV6QQUFEklTE6a0iznzr+IyECjYPrDlDxRaOsekLXprgOKK50mDORkikHAg
 dPAmZKBth5ZS8wxtESWAstXXqWP9cLRKccSGVxpe30S9QbEkkBKQVHNeZO0025Kla5DNpOhChtrgu
 r+YR65Qkea9M06zgcz3fD3GACMsT3aNeOVpdhERmC6SGOD0B5ohNXSKHPwpsx0jkyLNhCr+Sxs3bh
 0UCbnD9xKD4c1tpEW9/K77ITCt0UUEMrhXtSTf7Nw3QwhapNfYjtLwKboEEqDUUASrMM6Yz5rdGFG
 WEO/wjbg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48236 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uu8oN-000000001ye-2e1e;
 Thu, 04 Sep 2025 13:11:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uu8oM-00000001vp4-3DC5; Thu, 04 Sep 2025 13:11:30 +0100
In-Reply-To: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uu8oM-00000001vp4-3DC5@rmk-PC.armlinux.org.uk>
Date: Thu, 04 Sep 2025 13:11:30 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 07/11] net: stmmac: mdio: improve
 mdio register field definitions
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

Include the register name in the definitions, and use a name which
more closely resembles that used in documentation, while still being
descriptive.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index c95e9799273f..f2b4c1b70ef5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -23,9 +23,9 @@
 #include "dwxgmac2.h"
 #include "stmmac.h"
 
-#define MII_BUSY 0x00000001
-#define MII_WRITE 0x00000002
-#define MII_DATA_MASK GENMASK(15, 0)
+#define MII_ADDR_GBUSY			BIT(0)
+#define MII_ADDR_GWRITE			BIT(1)
+#define MII_DATA_GD_MASK		GENMASK(15, 0)
 
 /* GMAC4 defines */
 #define MII_GMAC4_GOC_SHIFT		2
@@ -237,7 +237,7 @@ static u32 stmmac_mdio_format_addr(struct stmmac_priv *priv,
 	return ((pa << mii_regs->addr_shift) & mii_regs->addr_mask) |
 	       ((gr << mii_regs->reg_shift) & mii_regs->reg_mask) |
 	       priv->gmii_address_bus_config |
-	       MII_BUSY;
+	       MII_ADDR_GBUSY;
 }
 
 static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
@@ -252,7 +252,7 @@ static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
 	if (ret < 0)
 		return ret;
 
-	ret = stmmac_mdio_wait(mii_address, MII_BUSY);
+	ret = stmmac_mdio_wait(mii_address, MII_ADDR_GBUSY);
 	if (ret)
 		goto out;
 
@@ -261,12 +261,12 @@ static int stmmac_mdio_access(struct stmmac_priv *priv, unsigned int pa,
 	writel(data, mii_data);
 	writel(addr, mii_address);
 
-	ret = stmmac_mdio_wait(mii_address, MII_BUSY);
+	ret = stmmac_mdio_wait(mii_address, MII_ADDR_GBUSY);
 	if (ret)
 		goto out;
 
 	/* Read the data from the MII data register if in read mode */
-	ret = read ? readl(mii_data) & MII_DATA_MASK : 0;
+	ret = read ? readl(mii_data) & MII_DATA_GD_MASK : 0;
 
 out:
 	pm_runtime_put(priv->device);
@@ -347,7 +347,7 @@ static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 	if (priv->plat->has_gmac4)
 		cmd = MII_GMAC4_WRITE;
 	else
-		cmd = MII_WRITE;
+		cmd = MII_ADDR_GWRITE;
 
 	return stmmac_mdio_write(priv, phyaddr, phyreg, cmd, phydata);
 }
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
