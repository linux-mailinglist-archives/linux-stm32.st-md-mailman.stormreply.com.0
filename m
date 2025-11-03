Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7F7C2B815
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:50:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9CA5C62D2D;
	Mon,  3 Nov 2025 11:50:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01780C628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6W0DkUMzifwuDMlc9DiSUqRLpgMXFIVqdSysIfR+dbQ=; b=gYh3Se3MQRjmnvmEL8hRKs1HC6
 EHX/zY77CnBzHwWKNZbz6WznbHtCMypMvDNyQFMsffbLDiOomjpAe+TyiqHSPswFC/zccbnX8Ek0K
 t0VwQ3Z7/d5V0QYBYDPDdy1l+xmSuwke8rdmLABJnZdjUcjmiOxtF0A4oD09lHC7T38iildrHsTTq
 f3sQqOm8ERg+JfB/xVWi0Aq1pUyYIOkIOyo6lwc21daWSOz4OgGFvXD9EHTpyHZ8gQzAUJcdO/lDu
 0eVL8bsL5BQmIYLUAKy3HySTgtBhIJzWoaEvyUwFmr9nxtJJBG9ytrdju8NXvoifDzCxCvLzo2P5/
 JMZu3J5A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39006 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vFt4T-000000000fS-26LA;
 Mon, 03 Nov 2025 11:50:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vFt4S-0000000ChoS-2Ahi; Mon, 03 Nov 2025 11:50:00 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:00 +0000
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 02/11] net: stmmac: s32: move
 PHY_INTF_SEL_x definitions out of the way
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

S32's PHY_INTF_SEL_x definitions conflict with those for the dwmac
cores as they use a different bitmapping. Add a S32 prefix so that
they are unique.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index ee095ac13203..2b7ad64bfdf7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -24,10 +24,10 @@
 #define GMAC_INTF_RATE_125M	125000000	/* 125MHz */
 
 /* SoC PHY interface control register */
-#define PHY_INTF_SEL_MII	0x00
-#define PHY_INTF_SEL_SGMII	0x01
-#define PHY_INTF_SEL_RGMII	0x02
-#define PHY_INTF_SEL_RMII	0x08
+#define S32_PHY_INTF_SEL_MII	0x00
+#define S32_PHY_INTF_SEL_SGMII	0x01
+#define S32_PHY_INTF_SEL_RGMII	0x02
+#define S32_PHY_INTF_SEL_RMII	0x08
 
 struct s32_priv_data {
 	void __iomem *ioaddr;
@@ -40,7 +40,7 @@ struct s32_priv_data {
 
 static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
 {
-	writel(PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
 
 	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
