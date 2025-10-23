Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7ACC0048A
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 11:37:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB791C5EC54;
	Thu, 23 Oct 2025 09:37:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF081C5EC4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4IR15YmOi30IOFo+C5GF3Vg22Y2q6B0Iun6RgdkPXEg=; b=CdN6Ceka+/zjQIEZ8kYbkAcKqA
 REh4YekMIC8ImXyLWn0Es2/GWoS6q2jsC49Y0B06JerTuFKvhxrJjlED/URWgtNUPqMVjXBmKXOUM
 QJyuCJelnd3IKKXy3ubjQnwhPgGkQwCCwj1nvOKu7LPX08iTAwVXuuItWPsG4yhTXLOaH0wqwNoTb
 0ciV4iAHofBCXhoH591b8E0pyxxT0wDfOZq7q8fXVoZhc9mTsC0m2xYruUdrETBbn4XwhcUq6eKnY
 i+hO/8Iljq98bLJQA4fCxxcElvxlGELI3sn2LQb8urgAadM0kNIMSyphn4pxypsD/TsgYIbeRGQSO
 7czPVxMA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37978 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vBrlC-0000000064v-0l63;
 Thu, 23 Oct 2025 10:37:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vBrlB-0000000BMPs-1eS9; Thu, 23 Oct 2025 10:37:29 +0100
In-Reply-To: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vBrlB-0000000BMPs-1eS9@rmk-PC.armlinux.org.uk>
Date: Thu, 23 Oct 2025 10:37:29 +0100
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/8] net: stmmac: simplify
	stmmac_get_version()
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

We can simplify stmmac_get_version() by pre-initialising the version
members to zero, detecting the MAC100 core and returning, otherwise
determining the version register offset separately from calling
stmmac_get_id() and stmmac_get_dev_id(). Do this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 44e34b6ab90a..7ee304e3599a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -49,18 +49,22 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 			       struct stmmac_version *ver)
 {
 	enum dwmac_core_type core_type = priv->plat->core_type;
+	unsigned int version_offset;
 
+	ver->snpsver = 0;
 	ver->dev_id = 0;
 
-	if (core_type == DWMAC_CORE_GMAC) {
-		ver->snpsver = stmmac_get_id(priv, GMAC_VERSION);
-	} else if (dwmac_is_xmac(core_type)) {
-		ver->snpsver = stmmac_get_id(priv, GMAC4_VERSION);
-		if (core_type == DWMAC_CORE_XGMAC)
-			ver->dev_id = stmmac_get_dev_id(priv, GMAC4_VERSION);
-	} else {
-		ver->snpsver = 0;
-	}
+	if (core_type == DWMAC_CORE_MAC100)
+		return;
+
+	if (core_type == DWMAC_CORE_GMAC)
+		version_offset = GMAC_VERSION;
+	else
+		version_offset = GMAC4_VERSION;
+
+	ver->snpsver = stmmac_get_id(priv, version_offset);
+	if (core_type == DWMAC_CORE_XGMAC)
+		ver->dev_id = stmmac_get_dev_id(priv, verison_offset);
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
