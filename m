Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71261C0650E
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 14:49:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11196C5F1E0;
	Fri, 24 Oct 2025 12:49:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E02CAC5F1DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 12:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LSUmh1jpI9zBrymiusXEbO1vxH7E1qauVBHlErgl6Kw=; b=oHMgLBVrg5KBb2fU69311Vqy0l
 w+HeOIWpqQ7I17VsKLY6Xv7aJSZzRXxebS7Ln5YV5QrtIyDGbE2bgBx4/9sIFrFUfO5Mg1T4BKKux
 m5ve0ouUDp0hHM4M3ofHmkNUvV4S5Z5SsmsgaRv7XzUVtgmzlimGJp9/bWn7h+PqsMb8za2yrTxHU
 G0KSeRyte6gorOOjteyNhYTudj8wBfmsdaTEABA+jMsGDTlWTr/l+4a/ZzNAuBBLUxa7iISXGjd5s
 graFyTF4Ezchy1PkF8EnM3fosGL9FZJBDafT6UFemUqTI4jT+r0y6QolV09qzjzQMnRHn4Kk+kzmv
 DTUfgVcw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51300 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vCHEK-000000007aF-14PD;
 Fri, 24 Oct 2025 13:49:16 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vCHEJ-0000000BPTs-1fkA; Fri, 24 Oct 2025 13:49:15 +0100
In-Reply-To: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vCHEJ-0000000BPTs-1fkA@rmk-PC.armlinux.org.uk>
Date: Fri, 24 Oct 2025 13:49:15 +0100
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 3/8] net: stmmac: consolidate
 version reading and validation
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

There is no need to read the version register twice, once in
stmmac_get_id() and then again in stmmac_get_dev_id(). Consolidate
this into stmmac_get_version() and pass each of these this value.

As both functions unnecessarily issue the same warning for a zero
register value, also move this into stmmac_get_version().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 29 ++++++++--------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 6b001d3f57c6..699c94acfeff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -18,30 +18,16 @@ struct stmmac_version {
 	u8 dev_id;
 };
 
-static u32 stmmac_get_id(struct stmmac_priv *priv, u32 id_reg)
+static u32 stmmac_get_id(struct stmmac_priv *priv, u32 reg)
 {
-	u32 reg = readl(priv->ioaddr + id_reg);
-
-	if (!reg) {
-		dev_info(priv->device, "Version ID not available\n");
-		return 0x0;
-	}
-
 	dev_info(priv->device, "User ID: 0x%x, Synopsys ID: 0x%x\n",
 			(unsigned int)(reg & GENMASK(15, 8)) >> 8,
 			(unsigned int)(reg & GENMASK(7, 0)));
 	return reg & GENMASK(7, 0);
 }
 
-static u32 stmmac_get_dev_id(struct stmmac_priv *priv, u32 id_reg)
+static u32 stmmac_get_dev_id(struct stmmac_priv *priv, u32 reg)
 {
-	u32 reg = readl(priv->ioaddr + id_reg);
-
-	if (!reg) {
-		dev_info(priv->device, "Version ID not available\n");
-		return 0x0;
-	}
-
 	return (reg & GENMASK(15, 8)) >> 8;
 }
 
@@ -50,6 +36,7 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 {
 	enum dwmac_core_type core_type = priv->plat->core_type;
 	unsigned int version_offset;
+	u32 version;
 
 	ver->snpsver = 0;
 	ver->dev_id = 0;
@@ -62,9 +49,15 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 	else
 		version_offset = GMAC4_VERSION;
 
-	ver->snpsver = stmmac_get_id(priv, version_offset);
+	version = readl(priv->ioaddr + version_offset);
+	if (version == 0) {
+		dev_info(priv->device, "Version ID not available\n");
+		return;
+	}
+
+	ver->snpsver = stmmac_get_id(priv, version);
 	if (core_type == DWMAC_CORE_XGMAC)
-		ver->dev_id = stmmac_get_dev_id(priv, version_offset);
+		ver->dev_id = stmmac_get_dev_id(priv, version);
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
