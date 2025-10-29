Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC94C17740
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 01:03:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B42DEC62D26;
	Wed, 29 Oct 2025 00:03:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA65AC5A4D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 00:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l04AWp8VlL6VNXvTGxfhs7KxruzEM9sIHa9ZCvAn6Nk=; b=Hsq6QadRq9X+xAgbre4vH0GPxi
 b5u8mIbcMUM5DEgRHU9EsRyfPaKCh7LjWR92zFLrh2yLnYOUVuI2n+ZEHyBZSzNsaCsPLe9EohFgd
 zKgUvkaP/wHAJ2eNv0mjFXc1Di6icA/fXWTBV4sHm79AHA4gOkauWhhIIBnmx8ObupfCYvciAbxLz
 6/lznSBxn++d4vSqqf5sXhPl1eSaxmLGhdTmjTqo3+ZVGijB7g+OOzrdRENpxeCFktjmoFkfXC7oL
 eIRQ11cuCqs+v180Xw0dASCAIAuCL8C1l1vcpf0FIa4Kn19HXWVkkzZyfvyJc4vNubR9AxNkpj8De
 hdp5A68g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54968 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vDteh-000000003gW-1yNW;
 Wed, 29 Oct 2025 00:03:11 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vDteg-0000000CCBr-2m7q; Wed, 29 Oct 2025 00:03:10 +0000
In-Reply-To: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
References: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vDteg-0000000CCBr-2m7q@rmk-PC.armlinux.org.uk>
Date: Wed, 29 Oct 2025 00:03:10 +0000
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 1/8] net: stmmac: move version
 handling into own function
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

Move the version handling out of stmmac_hwif_init() and into its own
function, returning the version information through a structure.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 42 +++++++++++++++-------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 41a7e1841227..4924e74997e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -13,6 +13,11 @@
 #include "dwmac4_descs.h"
 #include "dwxgmac2.h"
 
+struct stmmac_version {
+	u8 snpsver;
+	u8 dev_id;
+};
+
 static u32 stmmac_get_id(struct stmmac_priv *priv, u32 id_reg)
 {
 	u32 reg = readl(priv->ioaddr + id_reg);
@@ -40,6 +45,24 @@ static u32 stmmac_get_dev_id(struct stmmac_priv *priv, u32 id_reg)
 	return (reg & GENMASK(15, 8)) >> 8;
 }
 
+static void stmmac_get_version(struct stmmac_priv *priv,
+			       struct stmmac_version *ver)
+{
+	enum dwmac_core_type core_type = priv->plat->core_type;
+
+	ver->dev_id = 0;
+
+	if (core_type == DWMAC_CORE_GMAC) {
+		ver->snpsver = stmmac_get_id(priv, GMAC_VERSION);
+	} else if (dwmac_is_xmac(core_type)) {
+		ver->snpsver = stmmac_get_id(priv, GMAC4_VERSION);
+		if (core_type == DWMAC_CORE_XGMAC)
+			ver->dev_id = stmmac_get_dev_id(priv, GMAC4_VERSION);
+	} else {
+		ver->snpsver = 0;
+	}
+}
+
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
 {
 	struct mac_device_info *mac = priv->hw;
@@ -292,23 +315,15 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 {
 	enum dwmac_core_type core_type = priv->plat->core_type;
 	const struct stmmac_hwif_entry *entry;
+	struct stmmac_version version;
 	struct mac_device_info *mac;
 	bool needs_setup = true;
-	u32 id, dev_id = 0;
 	int i, ret;
 
-	if (core_type == DWMAC_CORE_GMAC) {
-		id = stmmac_get_id(priv, GMAC_VERSION);
-	} else if (dwmac_is_xmac(core_type)) {
-		id = stmmac_get_id(priv, GMAC4_VERSION);
-		if (core_type == DWMAC_CORE_XGMAC)
-			dev_id = stmmac_get_dev_id(priv, GMAC4_VERSION);
-	} else {
-		id = 0;
-	}
+	stmmac_get_version(priv, &version);
 
 	/* Save ID for later use */
-	priv->synopsys_id = id;
+	priv->synopsys_id = version.snpsver;
 
 	/* Lets assume some safe values first */
 	if (core_type == DWMAC_CORE_GMAC4) {
@@ -344,7 +359,8 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 		/* Use synopsys_id var because some setups can override this */
 		if (priv->synopsys_id < entry->min_id)
 			continue;
-		if (core_type == DWMAC_CORE_XGMAC && (dev_id ^ entry->dev_id))
+		if (core_type == DWMAC_CORE_XGMAC &&
+		    (version.dev_id ^ entry->dev_id))
 			continue;
 
 		/* Only use generic HW helpers if needed */
@@ -380,7 +396,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	}
 
 	dev_err(priv->device, "Failed to find HW IF (id=0x%x, gmac=%d/%d)\n",
-		id, core_type == DWMAC_CORE_GMAC,
+		version.snpsver, core_type == DWMAC_CORE_GMAC,
 		core_type == DWMAC_CORE_GMAC4);
 	return -EINVAL;
 }
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
