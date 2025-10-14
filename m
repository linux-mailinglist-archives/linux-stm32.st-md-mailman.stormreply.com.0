Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE5FBDB16E
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 21:40:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 974F7C56612;
	Tue, 14 Oct 2025 19:40:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 607FBC5660E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 19:40:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F05A343ADB;
 Tue, 14 Oct 2025 19:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D77C4CEE7;
 Tue, 14 Oct 2025 19:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760470798;
 bh=O5H/YsuZs738YLiu8CU7UPY57QeILHiPa3/g7uk/1NA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qSLN5Hq5qQqaeRoRL4S6gw3Nbz3N+rvUZnaplautiXAX6nefXQTlvHDiCM4jO2Dxb
 S5IWLDMMJS9ZSDIPTK2YHsMHutYxBoAxatnzI97AnabTbrkTEaHRYgBKH3RArkCPjA
 SGFbcnTfbjB+mobrDoGdydj5sZ46yN146NH3xWbjQh6Qn+RVITJ0r3LT5vF/AzLt87
 gynvyfmfcWo5W1W1MTFLphm4t6YzZgdpKL3klZ1aRsYzb4eOXtKkah5YRJ8iNyId4f
 ZSXSMipjbBH6H0BhQjiPO8XHU97HxkESsQBDiI++fx+agiP7s158V8c2zSbVpfhUlc
 NdnPq0J/RJgsA==
Date: Tue, 14 Oct 2025 20:39:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20251014-water-gown-11558c4eabe7@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
 <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 02/10] dt-bindings: pincfg-node: Add
 properties 'skew-delay-{in, out}put'
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
Content-Type: multipart/mixed; boundary="===============7553953599347689727=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7553953599347689727==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DnZFP0H7yz35f5cB"
Content-Disposition: inline


--DnZFP0H7yz35f5cB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 09:33:14PM +0200, Linus Walleij wrote:
> On Tue, Oct 14, 2025 at 8:04=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Tue, Oct 14, 2025 at 04:04:43PM +0200, Antonio Borneo wrote:
>=20
> > > +  skew-delay-input:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      this affects the expected clock skew on input pins.
> > > +      Typically indicates how many double-inverters are used to
> > > +      delay the signal.
> >
> > This property seems to be temporal, I would expect to see a unit of time
> > mentioned here, otherwise it'll totally inconsistent in use between
> > devices, and also a standard unit suffix in the property name.
> > pw-bot: changes-requested
>=20
> Don't blame the messenger, the existing property skew-delay
> says:
>=20
>   skew-delay:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     description:
>       this affects the expected clock skew on input pins
>       and the delay before latching a value to an output
>       pin. Typically indicates how many double-inverters are
>       used to delay the signal.
>=20
> This in turn comes from the original
> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> document, which in turn comes from this commit:
>=20
> commit e0e1e39de490a2d9b8a173363ccf2415ddada871
> Author: Linus Walleij <linus.walleij@linaro.org>
> Date:   Sat Oct 28 15:37:17 2017 +0200
>=20
>     pinctrl: Add skew-delay pin config and bindings
>=20
>     Some pin controllers (such as the Gemini) can control the
>     expected clock skew and output delay on certain pins with a
>     sub-nanosecond granularity. This is typically done by shunting
>     in a number of double inverters in front of or behind the pin.
>     Make it possible to configure this with a generic binding.
>=20
>     Cc: devicetree@vger.kernel.org
>     Acked-by: Rob Herring <robh@kernel.org>
>     Acked-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
>     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> So by legacy skew-delay is a custom format, usually the number of
> (double) inverters.

Yeah, I actually noticed this after sending the mail. But as you say
below, the new properties can be done with a unit etc

>=20
> I don't recall the reason for this way of defining things, but one reason
> could be that the skew-delay incurred by two inverters is very
> dependent on the production node of the silicon, and can be
> nanoseconds or picoseconds, these days mostly picoseconds.
> Example: Documentation/devicetree/bindings/net/adi,adin.yaml
>=20
> Antonio, what do you say? Do you have the actual skew picosecond
> values for the different settings so we could define this as
>=20
> skew-delay-input-ps:
> skew-delay-output-ps:
>=20
> and translate it to the right register values in the driver?

The patch for the specific binding does have values in units of seconds
assigned to each register value, so I think this should be doable.

>=20
> If we have the proper data this could be a good time to add this
> ISO unit to these two props.
>=20
> Yours,
> Linus Walleij

--DnZFP0H7yz35f5cB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6nCQAKCRB4tDGHoIJi
0qLlAP9810SKsRFfc73sjXKlJV1iLRHPiWHn2M7TKwMkhNAhNQEAoJHsRqsTrOZv
DEfxbqgGD+nWjS0Kv0p8dpJZC6EYfw4=
=BzPH
-----END PGP SIGNATURE-----

--DnZFP0H7yz35f5cB--

--===============7553953599347689727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7553953599347689727==--
