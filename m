Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39772C00493
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 11:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8B18C5EC54;
	Thu, 23 Oct 2025 09:37:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FEFDC5EC4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A1wvuOZT4tI8K196PYO4I+xxIuiyng5VUqBfHYf3Qao=; b=ib+UnU65NZ75YBlcJpGFAzYl0F
 nvXoxGCSfLSydHOARb9OeQZkQ0f60KCce6UWfyaUqHpJ0O8hwSHdcryBEkpTu2PBCdrvzvsOieBwo
 8iGeDYa7aVrNAPUeDepYd26KsPZrY1ztZgjkPgmew+21HoL94HgwuD2tgwOxWEa7O1qgShsJs/FMi
 /VNNvIPuu8BqNORcLCi2LS3YPh8lfKhvyq7QpJohZ04si4Wn8GYEC4rV+q2FwBqYzsycfwi++Nubf
 1OvGZJVZgg4wu2pbiVwZusEQhoJquIzZ7AabQlQ6T0hSma+WJKsJx/p0haF1iDwnwVH6XGife/Rqb
 v1W3DTjQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53282 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vBrlM-0000000065X-30IK;
 Thu, 23 Oct 2025 10:37:40 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vBrlL-0000000BMQ4-2Zlg; Thu, 23 Oct 2025 10:37:39 +0100
In-Reply-To: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vBrlL-0000000BMQ4-2Zlg@rmk-PC.armlinux.org.uk>
Date: Thu, 23 Oct 2025 10:37:39 +0100
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/8] net: stmmac: move
 stmmac_get_*id() into stmmac_get_version()
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

Move the contents of both stmmac_get_id() and stmmac_get_dev_id() into
stmmac_get_version() as it no longer makes sense for these to be
separate functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index c446fafdd804..c156edb54ae6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -18,19 +18,6 @@ struct stmmac_version {
 	u8 dev_id;
 };
 
-static u32 stmmac_get_id(struct stmmac_priv *priv, u32 reg)
-{
-	dev_info(priv->device, "User ID: 0x%x, Synopsys ID: 0x%x\n",
-			(unsigned int)(reg & GENMASK(15, 8)) >> 8,
-			(unsigned int)(reg & GENMASK(7, 0)));
-	return reg & GENMASK(7, 0);
-}
-
-static u32 stmmac_get_dev_id(struct stmmac_priv *priv, u32 reg)
-{
-	return (reg & GENMASK(15, 8)) >> 8;
-}
-
 static void stmmac_get_version(struct stmmac_priv *priv,
 			       struct stmmac_version *ver)
 {
@@ -55,9 +42,13 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 		return;
 	}
 
-	ver->snpsver = stmmac_get_id(priv, version);
+	dev_info(priv->device, "User ID: 0x%x, Synopsys ID: 0x%x\n",
+		 (unsigned int)(version & GENMASK(15, 8)) >> 8,
+		 (unsigned int)(version & GENMASK(7, 0)));
+
+	ver->snpsver = version & GENMASK(7, 0);
 	if (core_type == DWMAC_CORE_XGMAC)
-		ver->dev_id = stmmac_get_dev_id(priv, verison);
+		ver->dev_id = (version & GENMASK(15, 8)) >> 8;
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
