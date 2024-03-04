Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB6687043C
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Mar 2024 15:34:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07954C6B45E;
	Mon,  4 Mar 2024 14:34:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B2A6C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fYuXqjHSU4wWS8NC0tCBb8q7KcSGmYLkLI7d+Z6Xpls=; b=vO+Obnrv9UbTf4BIiOBNluFHwQ
 HzZDmnwV5Jx68lAk5kYKNUCXw6TrVub00LpaLuymAkqt1ybxMzAFRQVDJuEoG6DuhrANwE1rgMSM+
 6AnSNenf09xQKxhLAuUCxspi+SKwV7TRkOOi+i7hGJVs8RSHezOnrMuiUgx60pqZ4RsCE+WIwi2lt
 V8LuTQ3OGjkGMGua22xKF41j/ZGSUe82HW49qiqBLFeaB/pCBbk4bzsS7AN+EYMvUq1omTCJKvwbg
 niZOSzqqb73MjebA/FHeEE49+w/9RrOnVJRm1zfapQJkQ2WFvGseben159NC47a6J031Ovzy0D+6W
 82S/Gk8w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46300)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rh9OX-0005mA-0e;
 Mon, 04 Mar 2024 14:34:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rh9OU-0004Yu-TA; Mon, 04 Mar 2024 14:34:18 +0000
Date: Mon, 4 Mar 2024 14:34:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <ZeXb6p/RpJj1HRgn@shell.armlinux.org.uk>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-5-8dac30230050@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-5-8dac30230050@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v5 5/7] net: stmmac: Signal to
 PHY/PCS drivers to keep RX clock on
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

On Fri, Mar 01, 2024 at 04:35:02PM +0100, Romain Gantois wrote:
> There is a reocurring issue with stmmac controllers where the MAC fails to
> initialize its hardware if an RX clock signal isn't provided on the MAC/P=
HY
> link.
> =

> This causes issues when PHY or PCS devices either go into suspend while
> cutting the RX clock or do not bring the clock signal up early enough for
> the MAC to initialize successfully.
> =

> Set the mac_requires_rxc flag in the stmmac phylink config so that PHY/PCS
> drivers know to keep the RX clock up at all times.
> =

> Reported-by: Clark Wang <xiaoning.wang@nxp.com>
> Link: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@=
nxp.com/
> Reported-by: Cl=E9ment L=E9ger <clement.leger@bootlin.com>
> Link: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-cl=
ement.leger@bootlin.com/
> Suggested-by: Russell King <linux@armlinux.org.uk>

This should be:
Co-developed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 79844dbe4258..2290f4808d7e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1218,6 +1218,9 @@ static int stmmac_phy_setup(struct stmmac_priv *pri=
v)
>  	priv->phylink_config.type =3D PHYLINK_NETDEV;
>  	priv->phylink_config.mac_managed_pm =3D true;
>  =

> +	/* Stmmac always requires an RX clock for hardware initialization */
> +	priv->phylink_config.mac_requires_rxc =3D true;
> +
>  	mdio_bus_data =3D priv->plat->mdio_bus_data;
>  	if (mdio_bus_data)
>  		priv->phylink_config.ovr_an_inband =3D
> @@ -3408,6 +3411,10 @@ static int stmmac_hw_setup(struct net_device *dev,=
 bool ptp_register)
>  	u32 chan;
>  	int ret;
>  =

> +	/* Make sure RX clock is enabled */
> +	if (priv->hw->phylink_pcs)
> +		phylink_pcs_pre_init(priv->phylink, priv->hw->phylink_pcs);
> +
>  	/* DMA initialization and SW reset */
>  	ret =3D stmmac_init_dma_engine(priv);
>  	if (ret < 0) {
> =

> -- =

> 2.43.2
> =

> =


-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
