Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD67B806BE
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Sep 2025 17:12:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F98CC3F954;
	Wed, 17 Sep 2025 15:12:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07B77C3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ph+6qPy2QNKs5BgX9sm2D+uM01/NCEd/eq2joeWRxo=; b=oBVhKLo1YaiyOxQi76g8GribMm
 EGCqGO6VkHYVszdRnJfnCifHuXV8F/PMqtHwZ9WvGNTdxV6DJP/kx1zx7s1JGzcQVoeid9N3M5ZQH
 juhcaDg86+s3KL+8Fk5yKQ+sRbqTLFFOz/wxzxzXGvCv+DsPgtHr59usBcKwMNZI0WHKo9is5VznN
 KtUCfT5pB0iVwXaa3b/rX+ybQbx/Ar1SlNyLyJ4wOQv1PnjuNdcbw0L4Yi8qwlwJWb7yeuaaCVQCE
 KjRqjH5Stj1Cfods5ZDr1lFa2x2oQEqK2x1+DVhLB9tZxRLA9YhuRGEEBK0COxTssNO75lpee7fyV
 KyFNaVLA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36642 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uytpH-000000004k7-1Ja2;
 Wed, 17 Sep 2025 16:12:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uytpG-00000006H29-1Ltk; Wed, 17 Sep 2025 16:12:06 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uytpG-00000006H29-1Ltk@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:06 +0100
Cc: Drew Fustini <fustini@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 imx@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Minda Chen <minda.chen@starfivetech.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 02/10] net: stmmac: use phy_interface
 in stmmac_check_pcs_mode()
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

In the majority, if not all cases, mac_interface and phy_interface
are the same with the exception of some drivers that I have suggested
only use phy_interface and set mac_interface to PHY_INTERFACE_MODE_NA.

The only two that currently set mac_interface to PHY_INTERFACE_MODE_NA
are dwmac-loongson and dwmac-lpc18xx, neither of which use RGMII nor
SGMII.

In order to phase out the use of mac_interface, we need to have a path
for existing drivers so they can update to only using phy_interface
without causing regressions.

Therefore, in order to keep the "pcs" code working, we need to choose
the STMMAC integrated PCS mode based on phy_interface if mac_interface
is PHY_INTERFACE_MODE_NA.

This will allow more drivers to set mac_interface to
PHY_INTERFACE_MODE_NA without risking regressions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8c8ca5999bd8..a23017a886f3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1120,6 +1120,9 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 {
 	int interface = priv->plat->mac_interface;
 
+	if (interface == PHY_INTERFACE_MODE_NA)
+		interface = priv->plat->phy_interface;
+
 	if (priv->dma_cap.pcs) {
 		if ((interface == PHY_INTERFACE_MODE_RGMII) ||
 		    (interface == PHY_INTERFACE_MODE_RGMII_ID) ||
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
