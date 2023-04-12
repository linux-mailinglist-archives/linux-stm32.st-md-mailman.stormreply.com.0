Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 232386E07C7
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 09:33:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0E71C69063;
	Thu, 13 Apr 2023 07:33:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C157C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 07:48:57 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7F04B4000E;
 Wed, 12 Apr 2023 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1681285737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CO47OM0miczfYcaLLJYgDjAY1lPzp2g2IISvLCCABNc=;
 b=P8YtNKGxa0ZteNm/HSo7UkplEN7TLavuugUsieYDZskuQgqyp6Ja97SogaYUcP2L8xSyBG
 qiB/c+iO6BHoZmha1EkOU0nqyUpXBxcNyrVIm+j68l6aFYhGAQIq5T/BZYDkwheVp5W10/
 y4RuDXZUDf6yt2VcIIE0b1c2OknnwFY0Z9wEbvxXWkc4R+xTWGIe6YL+H6WqYTpvO2Op5a
 iMZjWcf0D1BVml4jZC3DDEcJYEiFl5z4579iaC6aYCuqEv2ouvvYHFoWgex6ybiOoF5HVj
 OewvemiOr+4AaS6Xgh1XopLYg0nWkiqCk9GDyQuGjq2XrR5v4d9hhFJozmGOhA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net, Sit Michael Wei Hong <michael.wei.hong.sit@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32 @ st-md-mailman . stormreply . com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "alexis . lothore @ bootlin . com" <alexis.lothore@bootlin.com>
Date: Wed, 12 Apr 2023 09:48:50 +0200
Message-Id: <20230412074850.41260-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Apr 2023 07:33:37 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net] net: phylink: check for SFP bus presence
	in phylink_expects_phy
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

When an SFP bus is present, we don't expect a PHY to be attached
directly from the MAC driver, it will be handled by phylink at SFP
attach time.

Fixes: 653a180957a8 ("net: phylink: add phylink_expects_phy() method")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
This was tested on dwmac_socfpga, following discussion here [1]

[1] : https://lore.kernel.org/netdev/PH0PR11MB758766370DD16A5107B1FAB69D9B9@PH0PR11MB7587.namprd11.prod.outlook.com/

 drivers/net/phy/phylink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a4111f1be375..334018f1028d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1594,7 +1594,8 @@ EXPORT_SYMBOL_GPL(phylink_destroy);
  */
 bool phylink_expects_phy(struct phylink *pl)
 {
-	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
+	if (pl->sfp_bus ||
+	    pl->cfg_link_an_mode == MLO_AN_FIXED ||
 	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
 	     phy_interface_mode_is_8023z(pl->link_config.interface)))
 		return false;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
