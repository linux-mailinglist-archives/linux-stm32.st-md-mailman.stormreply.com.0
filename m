Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAFF4366F
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2019 15:25:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA7AECB36F1
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2019 13:25:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C59DCB36EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2019 13:25:30 +0000 (UTC)
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr
 [90.88.159.246]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B224FC0002;
 Thu, 13 Jun 2019 13:25:15 +0000 (UTC)
Date: Tue, 11 Jun 2019 16:58:56 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Message-ID: <20190611145856.ua2ggkn6ccww6vpp@flea>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <d198d29119b37b2fdb700d8992b31963e98b6693.1560158667.git-series.maxime.ripard@bootlin.com>
 <20190610143139.GG28724@lunn.ch>
 <CAL_JsqJahCJcdu=+fA=ewbGezuEJ2W6uwMVxkQpdY6w+1OWVVA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJahCJcdu=+fA=ewbGezuEJ2W6uwMVxkQpdY6w+1OWVVA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7122882756162846980=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7122882756162846980==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="akgu3rpnhcjfd75m"
Content-Disposition: inline


--akgu3rpnhcjfd75m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Mon, Jun 10, 2019 at 12:59:29PM -0600, Rob Herring wrote:
> On Mon, Jun 10, 2019 at 8:31 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - phy
> > > +  - allwinner,sram
> >
> > Quoting ethernet.txt:
> >
> > - phy: the same as "phy-handle" property, not recommended for new bindings.
> >
> > - phy-handle: phandle, specifies a reference to a node representing a PHY
> >   device; this property is described in the Devicetree Specification and so
> >   preferred;
> >
> > Can this be expressed in Yaml? Accept phy, but give a warning. Accept
> > phy-handle without a warning? Enforce that one or the other is
> > present?
>
> The common schema could have 'phy: false'. This works as long as we've
> updated (or plan to) all the dts files to use phy-handle. The issue is
> how far back do you need kernels to work with newer dtbs.

I guess another question being raised by this is how hard do we want
to be a deprecating things, and should the DT validation be a tool to
enforce that validation.

For example, you've used in you GPIO meta-schema false for anything
ending with -gpio, since it's deprecated. This means that we can't
convert any binding using a deprecated property without introducing a
build error in the schemas, which in turn means that you'll have a lot
of friction to support schemas, since you would have to convert your
driver to support the new way of doing things, before being able to
have a schema for your binding.

And then, we need to agree on how to express the deprecation. I guess
we could allow the deprecated keyword that will be there in the
draft-8, instead of ad-hoc solutions?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--akgu3rpnhcjfd75m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP/BsAAKCRDj7w1vZxhR
xU7tAQDcrE7AmbrNpKlW8XjNBwjZBTaNMJbwICwP0nzygayxHQD+MjHzz6TZnhQF
Qm1qbD7O25WDq9BPnYW8XMjLhY6IgQE=
=f1jE
-----END PGP SIGNATURE-----

--akgu3rpnhcjfd75m--

--===============7122882756162846980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7122882756162846980==--
