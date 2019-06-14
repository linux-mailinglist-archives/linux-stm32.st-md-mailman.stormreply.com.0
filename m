Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76349461DC
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 16:59:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 115A8C5CDDA
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 14:59:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C030C5CDDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 14:59:09 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B5937FF806;
 Fri, 14 Jun 2019 14:59:02 +0000 (UTC)
Date: Fri, 14 Jun 2019 16:59:02 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Message-ID: <20190614145902.vjytw74bs5roh2f2@flea>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <d198d29119b37b2fdb700d8992b31963e98b6693.1560158667.git-series.maxime.ripard@bootlin.com>
 <20190610143139.GG28724@lunn.ch>
 <CAL_JsqJahCJcdu=+fA=ewbGezuEJ2W6uwMVxkQpdY6w+1OWVVA@mail.gmail.com>
 <20190611145856.ua2ggkn6ccww6vpp@flea>
 <CAL_Jsq+KwH-j8f+r+fWhMuqJPWcHdBQau+nUz3NRAXYTpsyuvg@mail.gmail.com>
 <20190614095048.j2xwdsucucbakkl2@flea>
 <CAL_Jsq+=yh3WhTg=1G02LUHGLHts6mECR9BQ+n7qHAihFViAxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+=yh3WhTg=1G02LUHGLHts6mECR9BQ+n7qHAihFViAxA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org,
 Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 05/11] dt-bindings: net: sun4i-emac:
 Convert the binding to a schemas
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
Content-Type: multipart/mixed; boundary="===============7182243294749467452=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7182243294749467452==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wmxpz6l3hrzuotke"
Content-Disposition: inline


--wmxpz6l3hrzuotke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Jun 14, 2019 at 07:37:49AM -0600, Rob Herring wrote:
> > > For '-gpio', we may be okay because the suffix is handled in the GPIO
> > > core. It should be safe to update the binding to use the preferred
> > > form.
> >
> > It might require a bit of work though in drivers, since the fallback
> > is only handled if you're using the gpiod API, and not the legacy one.
> >
> > > > And then, we need to agree on how to express the deprecation. I guess
> > > > we could allow the deprecated keyword that will be there in the
> > > > draft-8, instead of ad-hoc solutions?
> > >
> > > Oh, nice! I hadn't seen that. Seems like we should use that. We can
> > > start even without draft-8 support because unknown keywords are
> > > ignored (though we probably have to add it to our meta-schema). Then
> > > at some point we can add a 'disallow deprecated' flag to the tool.
> >
> > So, in the generic ethernet binding, we would have:
> >
> > properties:
> >   phy-handle:
> >     $ref: /schemas/types.yaml#definitions/phandle
> >     description:
> >       Specifies a reference to a node representing a PHY device.
> >
> >   phy:
> >     $ref: "#/properties/phy-handle"
> >     deprecated: true
> >
> >   phy-device:
> >     $ref: "#/properties/phy-handle"
> >     deprecated: true
> >
> > Does that sound good?
>
> Yes.

Great, I'll post that.

> > Now, how do we handle the case above, in the device specific binding?
> > We just require the non-deprecated one, or the three?
>
> Wouldn't that just depend if all the instances of the device specific
> binding have been updated?

You mean in the DTS?

It shouldn't matter, we'll want to have a warning anyway. But yeah,
I'll update them too.

Maxme

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--wmxpz6l3hrzuotke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQO2NgAKCRDj7w1vZxhR
xYYMAQCpuUGZecwJPnE6MJSUbuL1fXyUaH+2U+W+fTF4OHIb8gEAxykOmBXCzeYm
qShBRvc18IIAbeOPCAbqTKJy+kpccgc=
=AR23
-----END PGP SIGNATURE-----

--wmxpz6l3hrzuotke--

--===============7182243294749467452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7182243294749467452==--
