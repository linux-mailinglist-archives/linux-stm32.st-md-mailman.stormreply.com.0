Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D89E7688
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 17:57:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8F7FC6DD9D;
	Fri,  6 Dec 2024 16:57:15 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 139F4C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 16:57:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 61D77A4430C;
 Fri,  6 Dec 2024 16:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63A8C4CED1;
 Fri,  6 Dec 2024 16:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733504228;
 bh=IlbyNXzPNPA3XWALgOApHSlRf9t/sdvMEQkGLZZhe2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BKFuZvVHuFHoCSNTrhMzKMGPYetsabsJvzKRQduJkh2nmwUv2hWQ4m3yXQLJ1/fnZ
 L1o7TBpt6IpSo0pXNvUwIyjEcNlG5VaKfVgVX/sS8BoYVTsioyQygrbznr86Gw8aX+
 rADfDYdzNjthGrzunUaadGx2yVOLtHeXbLbGA+JrTz6vhIYemmRmuGWcaOtrPyawxu
 kgnnG9ceBfSJKzjHgJg5wRhOaO/Era+tKF8MZ7xLPr1vtpjXiUJq+IcWTCRjA6B1zF
 WyGZlhzMo2s7+CXpIbGsRYq+CHT5ciGpfYoH1xzP/PL346ARbkbrCHaxnHKYYYQiMP
 2KyT+RG/0Pfwg==
Date: Fri, 6 Dec 2024 16:57:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <20241206-wrought-jailbreak-52cc4a21a713@spud>
References: <20241205125640.1253996-1-o.rempel@pengutronix.de>
 <20241205125640.1253996-2-o.rempel@pengutronix.de>
 <20241205-immortal-sneak-8c5a348a8563@spud>
 <Z1KxZmRekrYGSdd4@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <Z1KxZmRekrYGSdd4@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v1 1/5] dt-bindings: net: Add TI DP83TD510
	10BaseT1L PHY
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
Content-Type: multipart/mixed; boundary="===============5221617023598279393=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5221617023598279393==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1+XZodfQGimtFoRM"
Content-Disposition: inline


--1+XZodfQGimtFoRM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 09:10:14AM +0100, Oleksij Rempel wrote:
> On Thu, Dec 05, 2024 at 05:18:59PM +0000, Conor Dooley wrote:
> > On Thu, Dec 05, 2024 at 01:56:36PM +0100, Oleksij Rempel wrote:
> > > Introduce devicetree binding for the Texas Instruments DP83TD510
> > > Ultra Low Power 802.3cg 10Base-T1L Single Pair Ethernet PHY.
> > >=20
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > ---
> > >  .../devicetree/bindings/net/ti,dp83td510.yaml | 35 +++++++++++++++++=
++
> > >  1 file changed, 35 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/net/ti,dp83td51=
0.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/ti,dp83td510.yaml =
b/Documentation/devicetree/bindings/net/ti,dp83td510.yaml
> > > new file mode 100644
> > > index 000000000000..cf13e86a4017
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/ti,dp83td510.yaml
> > > @@ -0,0 +1,35 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/net/ti,dp83td510.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: TI DP83TD510 10BaseT1L PHY
> > > +
> > > +maintainers:
> > > +  - Oleksij Rempel <o.rempel@pengutronix.de>
> > > +
> > > +description:
> > > +  DP83TD510E Ultra Low Power 802.3cg 10Base-T1L 10M Single Pair Ethe=
rnet PHY
> > > +
> > > +allOf:
> > > +  - $ref: ethernet-phy.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - ethernet-phy-id2000.0181
> >=20
> > There's nothing specific here, can someone remind me why the generic
> > binding is not enough?
>=20
> The missing binding was blamed by checkpatch. Haw should I proceed with t=
his
> patch?

Does dtbs_check complain when you use it in a dts? What you have here
matches against the pattern ^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$
so I think it won't. checkpatch might be too dumb to evaluate the regex?

--1+XZodfQGimtFoRM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1Ms3QAKCRB4tDGHoIJi
0lUpAP9+qqmvW19GgRq0c+lbiZOY7fIICF4B/h1qoUeHagDQTQD/fDngZjYfswC5
hPbbjp55rWg5MrwOXxr3+f02ruaodws=
=XnGn
-----END PGP SIGNATURE-----

--1+XZodfQGimtFoRM--

--===============5221617023598279393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5221617023598279393==--
