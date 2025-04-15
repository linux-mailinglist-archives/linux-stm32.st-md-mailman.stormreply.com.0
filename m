Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7FEA8A466
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 18:43:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2FDFC78023;
	Tue, 15 Apr 2025 16:43:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B006CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 16:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ygajSd1GoADtgJHoVQD1nG09yoLswhvg7GNMQk1G7Ts=; b=m4EjXFXOke+PyYG0vZ0RghbcyP
 HzNUpBXNynINV4KieJZcX+97P4vS78uPA/HwlohSjU4CnDfYHZAuzX0J6FMiHpGEFO49G/fey2Xct
 y8PTmuL4RnbN2waGULstWrBlsmoTdorLqTKOH6So0ai1TrvIYN6kIYswW5UT0IfrFeR9Wm+731M6l
 kqKfXJugRikahFA0IDA9J6MUL+ZArBn4jMjPURNVOzzUZYYA0J0CWIKXmakOHochX99Who7oTm/zU
 Q5i8XX1HYQsnQm245bMw7FOkTF4zv9GcuOtYVv/zqR99TpL9vvHNqnJTG1fb4qwXGXIhNN9O6nDGD
 BcIhCVaQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35468 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4jNF-0008Vr-1c;
 Tue, 15 Apr 2025 17:43:01 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4jMd-000rCG-VU; Tue, 15 Apr 2025 17:42:24 +0100
In-Reply-To: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
References: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4jMd-000rCG-VU@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 17:42:23 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: sti: use
 phy_interface_mode_is_rgmii()
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

Replace the custom IS_PHY_IF_MODE_RGMII() macro with our generic
phy_interface_mode_is_rgmii() inline function.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index be57c6c12c1c..c580647ff9dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -23,12 +23,7 @@
 
 #define DWMAC_50MHZ	50000000
 
-#define IS_PHY_IF_MODE_RGMII(iface)	(iface == PHY_INTERFACE_MODE_RGMII || \
-			iface == PHY_INTERFACE_MODE_RGMII_ID || \
-			iface == PHY_INTERFACE_MODE_RGMII_RXID || \
-			iface == PHY_INTERFACE_MODE_RGMII_TXID)
-
-#define IS_PHY_IF_MODE_GBIT(iface)	(IS_PHY_IF_MODE_RGMII(iface) || \
+#define IS_PHY_IF_MODE_GBIT(iface)	(phy_interface_mode_is_rgmii(iface) || \
 					 iface == PHY_INTERFACE_MODE_GMII)
 
 /* STiH4xx register definitions (STiH407/STiH410 families)
@@ -148,7 +143,7 @@ static void stih4xx_fix_retime_src(void *priv, int spd, unsigned int mode)
 			src = TX_RETIME_SRC_CLKGEN;
 			freq = DWMAC_50MHZ;
 		}
-	} else if (IS_PHY_IF_MODE_RGMII(dwmac->interface)) {
+	} else if (phy_interface_mode_is_rgmii(dwmac->interface)) {
 		/* On GiGa clk source can be either ext or from clkgen */
 		freq = rgmii_clock(spd);
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
