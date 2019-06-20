Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A72334CA56
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2019 11:09:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59F41C0DB25
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2019 09:09:04 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AACCC0DB25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 09:09:03 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 145D4FF80E;
 Thu, 20 Jun 2019 09:08:57 +0000 (UTC)
Date: Thu, 20 Jun 2019 11:08:57 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20190620090857.z6gru4cilq6z7e4w@flea>
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <20190619140314.GC18352@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <20190619140314.GC18352@lunn.ch>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 01/16] dt-bindings: net: Add YAML
 schemas for the generic Ethernet options
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
Content-Type: multipart/mixed; boundary="===============5879051982056613184=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5879051982056613184==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="52tq5ryctgrkeugj"
Content-Disposition: inline


--52tq5ryctgrkeugj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

On Wed, Jun 19, 2019 at 04:03:14PM +0200, Andrew Lunn wrote:
> > +  phy-connection-type:
> > +    description:
> > +      Operation mode of the PHY interface
> > +    enum:
> > +      # There is not a standard bus between the MAC and the PHY,
> > +      # something proprietary is being used to embed the PHY in the
> > +      # MAC.
>
> ...
>
> > +
> > +  phy-mode:
> > +    $ref: "#/properties/phy-connection-type"
> > +    deprecated: true
>
> I don't think phy-mode is actually deprecated. ethernet.txt actually says:
>
> "This is now a de-facto standard property;" and no mentions that is
> should not be used. Looking at actual device trees, phy-mode is by far
> more popular than phy-connection-type.

Looking at the phy-connection-type documentation, I was under this
impression, sorry.

I'll drop it then.

> fwnode_get_phy_mode() first looks for phy-mode and only falls back to
> phy-connection-type if it is not present. The same is true for
> of_get_phy_mode().
>
> > +  fixed-link:
> > +    allOf:
> > +      - if:
> > +          type: array
> > +        then:
> > +          minItems: 1
> > +          maxItems: 1
> > +          items:
> > +            items:
> > +              - minimum: 0
> > +                maximum: 31
> > +                description:
> > +                  Emulated PHY ID, choose any but unique to the all
> > +                  specified fixed-links
> > +
> > +              - enum: [0, 1]
> > +                description:
> > +                  Duplex configuration. 0 for half duplex or 1 for
> > +                  full duplex
> > +
> > +              - enum: [10, 100, 1000]
> > +                description:
> > +                  Link speed in Mbits/sec.
> > +
> > +              - enum: [0, 1]
> > +                description:
> > +                  Pause configuration. 0 for no pause, 1 for pause
> > +
> > +              - enum: [0, 1]
> > +                description:
> > +                  Asymmetric pause configuration. 0 for no asymmetric
> > +                  pause, 1 for asymmetric pause
> > +
>
> This array of 5 values format should be marked as deprecated.

Right, I'll add it.

> > +
> > +      - if:
> > +          type: object
> > +        then:
> > +          properties:
> > +            speed:
> > +              allOf:
> > +                - $ref: /schemas/types.yaml#definitions/uint32
> > +                - enum: [10, 100, 1000]
>
> This recently changed, depending on context. If PHYLINK is being used,
> any speed is allowed. If phylib is used, then only these speeds are
> allowed. And we are starting to see some speeds other than listed
> here.

phylink seems to be described in a separate binding document, maybe we
can adjust that later?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--52tq5ryctgrkeugj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQtNKQAKCRDj7w1vZxhR
xU1mAP9UxX/bUs/+sGjv2lf1IVQAuWCDAFQPe+SNpltGaaRbzAD/Z9kZa0JhhgBo
aIO1LH2YT0uPFhUlcf7U7bvipC2mnQ0=
=QITW
-----END PGP SIGNATURE-----

--52tq5ryctgrkeugj--

--===============5879051982056613184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5879051982056613184==--
