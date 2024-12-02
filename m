Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFA79E1475
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 08:41:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C721AC7803C;
	Tue,  3 Dec 2024 07:41:25 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 791AAC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2024 22:03:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1FE67A4136E;
 Mon,  2 Dec 2024 22:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8534C4AF49;
 Mon,  2 Dec 2024 22:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733177025;
 bh=F4cbjF/9M6ITcKCkPhkzEDR5HNiIhwkdl+T79A6mE8Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Dh7iRQsP1aktNPhrpo01hU5yRN1vLgusFkuhdNuBSHoA8rlteqrxBaHPpjow93iJo
 fQuLACvA769PrPubsDkJ5phrh+FavEljQaO4Isr7WnxjG0xG1ile1Aav7WH4MCzMGN
 /lK70kgx6IsGLa8bJlZKhNkO7bFil3p2EbIMRXIWW/vAusbJ6cdp56u5REuyOY79Pa
 8MHEenU3IFX7epAj8gqw7Kn1woxNVP9zcr3wflvX0jTO9qKwON0Dj1wKAWNgWM0d+O
 7dREoWK8i6eiv2g9hMETySSWCCjDqNuWOj8jwAGP/XCaEahxCrjar3/7xcZ3KehJlG
 lUGCW2Q+UoQig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 80BBEE69E99;
 Mon,  2 Dec 2024 22:03:45 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 02 Dec 2024 23:03:51 +0100
MIME-Version: 1.0
Message-Id: <20241202-upstream_s32cc_gmac-v7-12-bc3e1f9f656e@oss.nxp.com>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
In-Reply-To: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733177022; l=2017;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=E3dKlyRUyP013sEwa3YoW1YOIguttVezMK0ReGNP/J8=;
 b=5EU9Td/kVd7f4K9kEjDJi+349oi1iNwhZveDd+NbdQO1HK6hNFZF1sN6KFKDbDtGKZoUd0cQE
 bWHECNs0viOC6v11NRJYA4/ZXYvX9/tmNblOkNBiTsbNjmEjreDosHe
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailman-Approved-At: Tue, 03 Dec 2024 07:41:23 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 fancer.lancer@gmail.com, 0x1207@gmail.com,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 12/15] net: dwmac-sti: Use helper
	rgmii_clock
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Utilize a new helper function rgmii_clock().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index a6ff02d905a9..eabc4da9e1a9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -21,10 +21,7 @@
 
 #include "stmmac_platform.h"
 
-#define DWMAC_125MHZ	125000000
 #define DWMAC_50MHZ	50000000
-#define DWMAC_25MHZ	25000000
-#define DWMAC_2_5MHZ	2500000
 
 #define IS_PHY_IF_MODE_RGMII(iface)	(iface == PHY_INTERFACE_MODE_RGMII || \
 			iface == PHY_INTERFACE_MODE_RGMII_ID || \
@@ -140,7 +137,7 @@ static void stih4xx_fix_retime_src(void *priv, u32 spd, unsigned int mode)
 	struct sti_dwmac *dwmac = priv;
 	u32 src = dwmac->tx_retime_src;
 	u32 reg = dwmac->ctrl_reg;
-	u32 freq = 0;
+	long freq = 0;
 
 	if (dwmac->interface == PHY_INTERFACE_MODE_MII) {
 		src = TX_RETIME_SRC_TXCLK;
@@ -153,19 +150,14 @@ static void stih4xx_fix_retime_src(void *priv, u32 spd, unsigned int mode)
 		}
 	} else if (IS_PHY_IF_MODE_RGMII(dwmac->interface)) {
 		/* On GiGa clk source can be either ext or from clkgen */
-		if (spd == SPEED_1000) {
-			freq = DWMAC_125MHZ;
-		} else {
+		freq = rgmii_clock(spd);
+
+		if (spd != SPEED_1000 && freq > 0)
 			/* Switch to clkgen for these speeds */
 			src = TX_RETIME_SRC_CLKGEN;
-			if (spd == SPEED_100)
-				freq = DWMAC_25MHZ;
-			else if (spd == SPEED_10)
-				freq = DWMAC_2_5MHZ;
-		}
 	}
 
-	if (src == TX_RETIME_SRC_CLKGEN && freq)
+	if (src == TX_RETIME_SRC_CLKGEN && freq > 0)
 		clk_set_rate(dwmac->clk, freq);
 
 	regmap_update_bits(dwmac->regmap, reg, STIH4XX_RETIME_SRC_MASK,

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
