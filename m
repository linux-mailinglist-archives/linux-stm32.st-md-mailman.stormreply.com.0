Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1695B78C508
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Aug 2023 15:20:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A82C7C6A60C;
	Tue, 29 Aug 2023 13:20:45 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80686C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 13:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1693315244; x=1724851244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rsg+3I5nwAao024D777CO27I/mKvRlEcVFmehdDKmio=;
 b=Sy7fz9vcHcRv0PFcCbx8+3A+XL/TZoiH2EhZ3ryLJesL0ONEJe2tCFX4
 FfGDVlTcjXw3aZKZ8B3l5tYRwezFZ+ySURlge5Nu9tqLxNVvOctTLDVss
 BkTk+ac4e41Atj9gwfPI4vJQLzJ4WUeTwM0FU3RspocjpjR52pC6DY370
 oyIwQyNe71LDN/er0b4TgauQjGX7sgCEdyWCReikbbVrrjXhKbCeqFtOc
 IVGIyUY65ztXDriK8+LRssNBrQU3H3um5hth1Ve6wuF7QiCCTpmcQXav0
 30SLKxQZcuVGV+JHEcH8dTAN8cFq7BhMJsza3RMNGE6Z2yFNB1qHqv9+v g==;
X-IronPort-AV: E=Sophos;i="6.02,210,1688421600"; d="scan'208";a="32678579"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 29 Aug 2023 15:20:43 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 65E39280045;
 Tue, 29 Aug 2023 15:20:43 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Date: Tue, 29 Aug 2023 15:20:43 +0200
Message-ID: <5966848.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZO3uUIFgtkIHHqjL@shell.armlinux.org.uk>
References: <E1qZq83-005tts-6K@rmk-PC.armlinux.org.uk>
 <12274852.O9o76ZdvQC@steina-w> <ZO3uUIFgtkIHHqjL@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Feiyang Chen <chenfeiyang@loongson.cn>, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: clarify difference
	between "interface" and "phy_interface"
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Am Dienstag, 29. August 2023, 15:10:40 CEST schrieb Russell King (Oracle):
> On Tue, Aug 29, 2023 at 02:38:33PM +0200, Alexander Stein wrote:
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c index
> > > ff330423ee66..35f4b1484029 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > @@ -419,9 +419,9 @@ stmmac_probe_config_dt(struct platform_device *pd=
ev,
> > > u8
> > > *mac) return ERR_PTR(phy_mode);
> > > =

> > >  	plat->phy_interface =3D phy_mode;
> > > =

> > > -	plat->interface =3D stmmac_of_get_mac_mode(np);
> > > -	if (plat->interface < 0)
> > > -		plat->interface =3D plat->phy_interface;
> > > +	plat->mac_interface =3D stmmac_of_get_mac_mode(np);
> > > +	if (plat->mac_interface < 0)
> > =

> > This check is never true as mac_interface is now an unsigned enum
> > (phy_interface_t). Thus mac_interface is not set to phy_interface
> > resulting in an invalid mac_interface. My platform
> > (arch/arm64/boot/dts/freescale/imx8mp- tqma8mpql-mba8mpxl.dts) fails to
> > probe now.
> =

> Thanks for catching that. Does this patch fix it for you?
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c index
> 231152ee5a32..0451d2c2aa43 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -420,9 +420,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, =
u8
> *mac) return ERR_PTR(phy_mode);
> =

>  	plat->phy_interface =3D phy_mode;
> -	plat->interface =3D stmmac_of_get_mac_mode(np);
> -	if (plat->interface < 0)
> -		plat->interface =3D plat->phy_interface;
> +
> +	rc =3D stmmac_of_get_mac_mode(np);
> +	plat->interface =3D rc < 0 ? plat->phy_interface : rc;

I need to use plat->mac_interface on top of your patch. But despite that th=
is =

fixes the probe error.

Thanks and best regards,
Alexander

> =

>  	/* Some wrapper drivers still rely on phy_node. Let's save it while
>  	 * they are not converted to phylink. */


-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
