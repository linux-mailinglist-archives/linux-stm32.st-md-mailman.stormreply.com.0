Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 258033C7AC
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 11:53:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D26E0D23C64
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 09:53:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E16BD23C62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 09:53:23 +0000 (UTC)
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr
 [90.88.159.246]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C88DFC000B;
 Tue, 11 Jun 2019 09:53:17 +0000 (UTC)
Date: Tue, 11 Jun 2019 11:53:17 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20190611095317.l55zjuomxqfvpqlo@flea>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <664da05aaf9a7029494d72d7c536baa192672fbe.1560158667.git-series.maxime.ripard@bootlin.com>
 <20190610143730.GH28724@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <20190610143730.GH28724@lunn.ch>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 06/11] dt-bindings: net: sun4i-mdio:
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
Content-Type: multipart/mixed; boundary="===============8080842003924312889=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8080842003924312889==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nt34jhbgjztm3vnl"
Content-Disposition: inline


--nt34jhbgjztm3vnl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

On Mon, Jun 10, 2019 at 04:37:30PM +0200, Andrew Lunn wrote:
> On Mon, Jun 10, 2019 at 11:25:45AM +0200, Maxime Ripard wrote:
> > Switch our Allwinner A10 MDIO controller binding to a YAML schema to enable
> > the DT validation.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Should there be a generic part to cover what is listed in:
>
> Documentation/devicetree/bindings/net/mdio.txt

Thanks for pointing that out, I'll convert it as well.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nt34jhbgjztm3vnl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP96DQAKCRDj7w1vZxhR
xemGAQDeKHYJUTJ7pEQdZKX1WZEmIhNHWPhuhjM7yYBI+DFawgEA5Hrj2kSgRSzG
FFEkc4IqWkvbt0d584kNLqDInxO1VAY=
=DaeR
-----END PGP SIGNATURE-----

--nt34jhbgjztm3vnl--

--===============8080842003924312889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8080842003924312889==--
