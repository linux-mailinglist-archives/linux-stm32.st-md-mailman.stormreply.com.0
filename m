Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D46C40C57
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 17:09:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27FB7C06935;
	Fri,  7 Nov 2025 16:09:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B716CC290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fwpXxoU8iEmC+DaN7Cr9PGN8QVIi8rUJqHbS4C13YiQ=; b=vn3cbOu+GFQMbus8RTESyhk+QD
 l4MSz/4gSrLSWpMwTcHMS8POSDqXlYoqW6hd0IVlrkrHN0rw/yZ1S8tjbRotxVZckRVVD5aRb8bPB
 u2YW04OZjQkWBC/IllYfMqxS3Dir+tyGqw82YW/NF7mlLI684toDkm0bSBsVAcqCbYiV7/jxwioKY
 +/pe49r2zq2ujlFEiw4kOmyaMOLhRepjPkmnOJVla7Zg8W/csk11yTw9Aw59+2MoFRvcckO8KEMVM
 IwqMBuTNFDkx39IA961qvS8bRUtzUhe9fuWfVrlXNzSefV5rCz9+Bo9Qr7u3Tve04azN7os0yDbxA
 N0fCfdkQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32908)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vHP1N-000000006sy-0WaB;
 Fri, 07 Nov 2025 16:09:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vHP1F-000000007hv-1jzX; Fri, 07 Nov 2025 16:08:57 +0000
Date: Fri, 7 Nov 2025 16:08:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Emil Renner Berthing <kernel@esmil.dk>
Message-ID: <aQ4ZmXB_eFjKXgIv@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
 <CANBLGczzW+kjvSqYm5YVt+2sdLtgyZfa=fhsU1Q-nUjSVvB4cw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGczzW+kjvSqYm5YVt+2sdLtgyZfa=fhsU1Q-nUjSVvB4cw@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 11/16] net: stmmac: starfive: use
 stmmac_get_phy_intf_sel()
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

On Fri, Nov 07, 2025 at 11:00:35AM -0500, Emil Renner Berthing wrote:
> Quoting Russell King (Oracle) (2025-11-07 15:28:55)
> > Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> > phy_intf_sel value, validate the result and use that to set the
> > control register to select the operating mode for the DWMAC core.
> >
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 22 +++++--------------
> >  1 file changed, 6 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > index 1ef72576c6f1..00078b7a6486 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > @@ -35,25 +35,15 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> >         struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
> >         struct regmap *regmap;
> >         unsigned int args[2];
> > -       unsigned int mode;
> > +       int phy_intf_sel;
> >         int err;
> >
> > -       switch (plat_dat->phy_interface) {
> > -       case PHY_INTERFACE_MODE_RMII:
> > -               mode = STARFIVE_DWMAC_PHY_INFT_RMII;
> > -               break;
> > -
> > -       case PHY_INTERFACE_MODE_RGMII:
> > -       case PHY_INTERFACE_MODE_RGMII_ID:
> > -       case PHY_INTERFACE_MODE_RGMII_RXID:
> > -       case PHY_INTERFACE_MODE_RGMII_TXID:
> > -               mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
> > -               break;
> 
> After these two patches the STARFIVE_DWMAC_PHY_INFT_RMII and ..RGMII macros are
> left unused.

Thanks, I'll remove them in this patch.

> Maybe just squash the patches and remove the definitions?

It's two logical changes, thus two patches. Reviewers find that this
makes it easier to review.

Given the number of platform glues that I'm modifying, I don't want
to change some of them using one big all encompassing patch and
others as a set of logical changes - that would be totally insane
to manage.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
