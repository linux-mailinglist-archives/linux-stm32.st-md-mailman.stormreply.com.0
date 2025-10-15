Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC0BDF197
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 16:36:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D7B0C56639;
	Wed, 15 Oct 2025 14:36:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 552BEC56638
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:36:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 08EC644471;
 Wed, 15 Oct 2025 14:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A66C4CEF8;
 Wed, 15 Oct 2025 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760538958;
 bh=CQlnQCZTcQjCMg9gXM5j/h/j9QBEe/QKt7u0yZHQbQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V1u6Wi/bA8yzs2VzytUSKwlOdJY627sho9aV934PlC9av+KzwXYa2BrrFU9y6Ptwo
 J+TUilM0Y8GtatWIY8ATBQIDQwY9kOqNlj344/MlQSTKbJywS1GziAxbxbP9w61X+9
 A3TSqCq6Yo5Tf/TYyPlYvL0pajqjSFWDamK27jsbDrPDxmEqidk9uRAslM99epdfbh
 dERs70VvRyfwG7Lez+yG8I2jkm1DQgffLXYES6OtZBxrEGN9KBqYSIg0MKAAG1/igN
 GjfCspVtrmiKyau0OERse5FwxKji55mnzZwUn3IZ5zfNdpuPYNhdc8/qQS79azJjVh
 Pxjs2x59J2QEQ==
Date: Wed, 15 Oct 2025 15:35:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <20251015-headstand-impulse-95aa736e7633@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
 <20251014-affection-voltage-8b1764273a06@spud>
 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 09/10] dt-bindings: pinctrl: stm32:
 Support I/O synchronization parameters
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
Content-Type: multipart/mixed; boundary="===============5465064306502082269=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5465064306502082269==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RrT1Ouiw7gUB6N03"
Content-Disposition: inline


--RrT1Ouiw7gUB6N03
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 02:56:56PM +0200, Antonio Borneo wrote:
> On Tue, 2025-10-14 at 19:10 +0100, Conor Dooley wrote:
> > On Tue, Oct 14, 2025 at 04:04:50PM +0200, Antonio Borneo wrote:

> >=20
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 st,io-sync:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 description: |
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IO synchronization through r=
e-sampling or inversion
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0: data or clock GPIO pass-t=
hrough
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1: clock GPIO inverted
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2: data GPIO re-sampled on c=
lock rising edge
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3: data GPIO re-sampled on c=
lock falling edge
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4: data GPIO re-sampled on b=
oth clock edges
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $ref: /schemas/types.yaml#/definit=
ions/uint32
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum: [0, 1, 2, 3, 4]
> >=20
> > I really don't like this kinds of properties that lead to "random"
> > numbers in devicetree. I'd much rather see a string list here.
>=20
> Agree!
> I just need to figure out some reasonably short but still meaningful
> string for them.

pass-through
inverted
rising-edge
falling-edge
both-edges

perhaps?

--RrT1Ouiw7gUB6N03
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO+xRgAKCRB4tDGHoIJi
0lfAAP9Wmew99Hvt1yhCWck5hvyNjlO7jQxH+64gBF5XK6BLXgEAjBA58Y45RCl0
7cO7Pj2cMcMbSBMMf8uhGjNZlOnz5Qs=
=XBKe
-----END PGP SIGNATURE-----

--RrT1Ouiw7gUB6N03--

--===============5465064306502082269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5465064306502082269==--
