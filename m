Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D25EFA593BC
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 13:11:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A4DEC7802E;
	Mon, 10 Mar 2025 12:11:05 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0461C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 12:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yzZe1gV6CHm+hAifr5i33tZFqQ6giFyv3lN1GIZuF9M=; b=Z1RyWBPbYpVSmho+mXWzi6iJaA
 CNh2NaTUMZvLuxbbSeJ29xlqBLX+n7gG/ImOrqRlvLV++R1fVlGx9Yo7EQkHQkPCSUA5aqrTWF4KO
 ai89LWlgj4o5LQSChjxU1IcW2MhZJnwKWN/lqbPLYWqpqujiOJYoA+6RuBchlRAMpIgtt1txSOTTE
 Qe/wXeft3MB3TwbG8Uen5/45dF6QG8zd8SGeWdRGl0HiCGt+NgPDJRlKGSQZYemE9XgD+XknA/0wi
 lh7wD5mBDAhEHQUZK5qXQG0qXjTJhn5DRbW182NfBlEJjzME89u8c2uCSnXQ+0LYmGcFOi4K/gjnq
 3cXF+AcA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40488 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1trby6-0002YW-0z;
 Mon, 10 Mar 2025 12:10:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1trbxk-005qYA-Up; Mon, 10 Mar 2025 12:10:28 +0000
In-Reply-To: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1trbxk-005qYA-Up@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:28 +0000
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 3/9] net: stmmac: remove
	of_get_phy_mode()
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

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Rearrange the initialisation order so we can pass plat_dat into
anarion_config_dt(), thereby providing plat_dat->phy_interface as
necessary there.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-anarion.c    | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index ef99ef3f1ab4..fe47a5c337f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -59,7 +59,9 @@ static void anarion_gmac_exit(struct platform_device *pdev, void *priv)
 	gmac_write_reg(gmac, GMAC_RESET_CONTROL_REG, 1);
 }
 
-static struct anarion_gmac *anarion_config_dt(struct platform_device *pdev)
+static struct anarion_gmac *
+anarion_config_dt(struct platform_device *pdev,
+		  struct plat_stmmacenet_data *plat_dat)
 {
 	struct anarion_gmac *gmac;
 	phy_interface_t phy_mode;
@@ -79,11 +81,7 @@ static struct anarion_gmac *anarion_config_dt(struct platform_device *pdev)
 
 	gmac->ctl_block = ctl_block;
 
-	err = of_get_phy_mode(pdev->dev.of_node, &phy_mode);
-	if (err)
-		return ERR_PTR(err);
-
-	switch (phy_mode) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		fallthrough;
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -111,14 +109,14 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	gmac = anarion_config_dt(pdev);
-	if (IS_ERR(gmac))
-		return PTR_ERR(gmac);
-
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	gmac = anarion_config_dt(pdev, plat_dat);
+	if (IS_ERR(gmac))
+		return PTR_ERR(gmac);
+
 	plat_dat->init = anarion_gmac_init;
 	plat_dat->exit = anarion_gmac_exit;
 	anarion_gmac_init(pdev, gmac);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
