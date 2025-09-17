Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 187C7B806FD
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Sep 2025 17:13:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3741C3F954;
	Wed, 17 Sep 2025 15:13:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1808C3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/+cmBKge/SratwvlMhVUxHK0tIPiknByDO1rJuSXVm8=; b=SlmhqyFof6KqXA7fToZCjE25Yy
 o0AAvTwle++S1quNnLBsSkVhKVvww69ySqa2zGCigqsKeUU4+QDxcPM0YEwby0YsWD731XCvcH+Kv
 n/dhwMtpmSSh3rgoaDSuTloqwAJCi+Bp/mcQVlMvSX2TdsuxZKMWqTRz2YiGfAtFCZw28UJwl+q6M
 7/1OwJ4c6nc5lFEjP9ZxcgtqNYDnMjSk6ZT9THhK3YELVE2MpJQFX19r67dL09CZ2nSsjq1V9o0bM
 KXGLDeKjwHpbEIqiqk7XEmXeCfKqjJ2uzJH5+anhzui+PsRaGc5hHT3m4HTjJgLRTxhlCT2yM64wJ
 Oeg6d9jg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35114 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uytpf-000000004lf-3YNK;
 Wed, 17 Sep 2025 16:12:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uytpa-00000006H2X-3GWx; Wed, 17 Sep 2025 16:12:26 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uytpa-00000006H2X-3GWx@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:26 +0100
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
Subject: [Linux-stm32] [PATCH net-next 06/10] net: stmmac: starfive: convert
 to use phy_interface
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

dwmac-starfive uses RMII or RGMII interface modes without any PCS,
and selects the dwmac core accordingly using a register field with
the same bit encoding as the core's phy_intf_sel_i signals.

None of the DTS files set "mac-mode", so mac_interface will be
identical to phy_interface.

Convert dwmac-starfive to use phy_interface when determining the
interface mode rather than mac_interface. Also convert the error
prints to use phy_modes() so that we get a meaningful string rather
than a number for the interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 2013d7477eb7..6938dd2a79b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -38,7 +38,7 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	unsigned int mode;
 	int err;
 
-	switch (plat_dat->mac_interface) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RMII:
 		mode = STARFIVE_DWMAC_PHY_INFT_RMII;
 		break;
@@ -51,8 +51,8 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 		break;
 
 	default:
-		dev_err(dwmac->dev, "unsupported interface %d\n",
-			plat_dat->mac_interface);
+		dev_err(dwmac->dev, "unsupported interface %s\n",
+			phy_modes(plat_dat->phy_interface));
 		return -EINVAL;
 	}
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
