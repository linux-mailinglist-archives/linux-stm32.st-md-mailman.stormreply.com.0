Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808F97ECB8
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 16:01:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0072CC78006;
	Mon, 23 Sep 2024 14:01:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9EA5C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 14:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hB4I6KNKXW2Of1mZXzVBxj2ILyGc9/N2QyfLd6lRRSE=; b=eV/gtFO5ACfI2pgNzUHzlhT/1f
 9vNEDev20UCjA0Bek+OhAQzQgrPSbWOAbmJGoLdJU9DuLi6eitAWXTQx2/Ffj2EToUGKbPAa0uBdR
 6PBVcPyEZEwQrWpZKP236TqV2adXw0AGMvv/8zs2PHG4m8nzDpSsL04rWCnFydhij2U4pbEeDOV5Y
 203YcECJ6Z4Zp0dA/G3hUjI0LEA0B+4pUhpDYu1IG+V+cXB3EQtVTxT9mrkkow8ISDLD5/X79eUXx
 TugKK/Awr4aGu6/aF+oYCQ+JhW3tAHKeb85mpr7EAp1g2V1EGXCWvPxzZeL7q9hBnIyA9jADoQl98
 pPLrFprw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42210 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ssjd6-0004Ih-2u;
 Mon, 23 Sep 2024 15:01:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ssjd4-005NsF-Gt; Mon, 23 Sep 2024 15:01:30 +0100
In-Reply-To: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ssjd4-005NsF-Gt@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Sep 2024 15:01:30 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 07/10] net: dsa: sja1105: call
 PCS config/link_up via pcs_ops structure
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

Call the PCS operations through the ops structure, which avoids needing
to export xpcs internal functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/sja1105/sja1105_main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index b95c64b7e705..8ef1a1931a33 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -2375,6 +2375,7 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
 
 	for (i = 0; i < ds->num_ports; i++) {
 		struct dw_xpcs *xpcs = priv->xpcs[i];
+		struct phylink_pcs *pcs;
 		unsigned int neg_mode;
 
 		mac[i].speed = mac_speed[i];
@@ -2385,12 +2386,15 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
 		if (!xpcs)
 			continue;
 
+		pcs = &xpcs->pcs;
+
 		if (bmcr[i] & BMCR_ANENABLE)
 			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
 		else
 			neg_mode = PHYLINK_PCS_NEG_OUTBAND;
 
-		rc = xpcs_do_config(xpcs, priv->phy_mode[i], NULL, neg_mode);
+		rc = pcs->ops->pcs_config(pcs, neg_mode, priv->phy_mode[i],
+					  NULL, true);
 		if (rc < 0)
 			goto out;
 
@@ -2406,8 +2410,8 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
 			else
 				speed = SPEED_10;
 
-			xpcs_link_up(&xpcs->pcs, neg_mode, priv->phy_mode[i],
-				     speed, DUPLEX_FULL);
+			pcs->ops->pcs_link_up(pcs, neg_mode, priv->phy_mode[i],
+					      speed, DUPLEX_FULL);
 		}
 	}
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
