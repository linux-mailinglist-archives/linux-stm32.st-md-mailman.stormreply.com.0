Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FED9D978C
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:52:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAE89C78021;
	Tue, 26 Nov 2024 12:52:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FA34C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hM2Me0R442AO8DdVkavZVZg2yJn2icgsmunMOQ2V1M8=; b=wX1MOib1+DBlN4WWej5Q/tAJhg
 REEjg+iOgD99ePnruIdxN3PHit10xMAL0SCEtX+1ivn5+3Uig2LSQ7jWOTTLZZ3tP7mvEOYaDx3MI
 w7RqcHlIQ0DpabuMDYzrm40JdYp6B1sMSVu+94MOTjjVIRaqDMWZd1oT6Ii3Y4GKske7T09MbDKMl
 Xr/pZblsQCeWm6dQay6GbIVcjKMa3Bgo/2ppNP4ePpIoQbvn31CTVkFIoG/pIQhwqtNEua1/fpAAW
 p6ClYCvzdA9pA4C9QW4ymb6YPqSh0JcfGk3XfCTw03tcaHi7LQxY3PNpnYgaKnryQcbdHxuv4O6O+
 fGhRk24Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34386 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tFv3a-0006sx-2x;
 Tue, 26 Nov 2024 12:52:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tFv3Z-005yhr-Os; Tue, 26 Nov 2024 12:52:41 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tFv3Z-005yhr-Os@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:52:41 +0000
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 06/23] net: phy: update
 phy_ethtool_get_eee() documentation
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

Update the phy_ethtool_get_eee() documentation to make it clear that
all members of struct ethtool_keee are written by this function.

keee.supported, keee.advertised, keee.lp_advertised and keee.eee_active
are all written by genphy_c45_ethtool_get_eee().

keee.tx_lpi_timer, keee.tx_lpi_enabled and keee.eee_enabled are all
written by eeecfg_to_eee().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 18109f843e39..8caef54a60e0 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1648,8 +1648,8 @@ EXPORT_SYMBOL(phy_get_eee_err);
  * @phydev: target phy_device struct
  * @data: ethtool_keee data
  *
- * Description: reports the Supported/Advertisement/LP Advertisement
- * capabilities, etc.
+ * Description: get the current EEE settings, filling in all members of
+ * @data.
  */
 int phy_ethtool_get_eee(struct phy_device *phydev, struct ethtool_keee *data)
 {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
