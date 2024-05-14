Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478A8C5C0E
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 22:08:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A817DC6C838;
	Tue, 14 May 2024 20:08:55 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31432C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 20:08:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 52DE2CE1310;
 Tue, 14 May 2024 20:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97B4C2BD10;
 Tue, 14 May 2024 20:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715717323;
 bh=D/T7x/GG4sZteF0hVP4VnwbmWL5m6mNjYQaNHV88+8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G+wgz9O0/+LJ+UzfkiiqqUlnPDJXJVvsRiJdvQD/k1BmIZ7d9UGuTrP0scGeO7rvg
 nnmvjBDC7ReKN8pG+weKlpvksHGnpyJPMSK1cpUQfD7sKBE/l4EmVPCHtNt1WhL2PL
 Cs82IQU8wi7jA+ENznDsDHnHNl0lNEXJxT8R/XZL0GTwsE79YmCD7E9nC65TzM+/yC
 V0ryknc6CAHXBBf+X+l1JpGgAvLQj0Fq1lb3Lf/loSoGyfGEHRXudON0n4Hrm1gXJH
 X4V7XLpwSzSH6fXNC8XfnFuLXgD8f15rexDG19YGJgCkBOGiS+sui4ssXhKnN9cKuD
 AIrsaBhCeoZ2Q==
Date: Tue, 14 May 2024 21:08:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20240514-entryway-idealize-fcd5ed0e1de7@spud>
References: <20240513095605.218042-1-patrick.delaunay@foss.st.com>
 <20240513115601.v3.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
 <615dfdcb-cbda-426f-895e-810f03a8ce60@denx.de>
 <20240513-stabilize-proofread-81f0f9ee38b9@spud>
 <d73d4435-75d6-4cea-b38e-07c7ceae3980@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <d73d4435-75d6-4cea-b38e-07c7ceae3980@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: regulator: st,
 stm32mp1-pwr-reg: add compatible for STM32MP13
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
Content-Type: multipart/mixed; boundary="===============4141234207176127226=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4141234207176127226==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v5WMLClVVf+t+TTk"
Content-Disposition: inline


--v5WMLClVVf+t+TTk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 08:02:21PM +0200, Patrick DELAUNAY wrote:
> Hi,
>=20
> On 5/13/24 17:16, Conor Dooley wrote:
> > On Mon, May 13, 2024 at 04:34:20PM +0200, Marek Vasut wrote:
> > > On 5/13/24 11:56 AM, Patrick Delaunay wrote:
> > > > Add new compatible "st,stm32mp13-pwr-reg" for STM32MP13 SoC family.
> > > >=20
> > > > Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > > > ---
> > > >=20
> > > > Changes in v3:
> > > > - Replace oneOf/const by enum; solve the V2 issues for dt_binding_c=
heck
> > > >=20
> > > > Changes in v2:
> > > > - update for Rob review, only add compatible for STM32MP13 family
> > > >=20
> > > >    .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml    | =
4 +++-
> > > >    1 file changed, 3 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp=
1-pwr-reg.yaml b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pw=
r-reg.yaml
> > > > index c9586d277f41..c766f0a15a31 100644
> > > > --- a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-r=
eg.yaml
> > > > +++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-r=
eg.yaml
> > > > @@ -11,7 +11,9 @@ maintainers:
> > > >    properties:
> > > >      compatible:
> > > > -    const: st,stm32mp1,pwr-reg
> > > > +    enum:
> > > > +      - st,stm32mp1,pwr-reg
> > > > +      - st,stm32mp13-pwr-reg
> > > Should the st,stm32mp1,pwr-reg be treated as fallback compatible for
> > > st,stm32mp13-pwr-reg or not ?
> > >=20
> > > In other words, should the DT contain:
> > > compatible =3D "st,stm32mp13-pwr-reg", "st,stm32mp1,pwr-reg";
> > > or
> > > compatible =3D "st,stm32mp13-pwr-reg";
> > > ? Which one is preferable ?
> > >=20
> > > I think the former one, since the MP13 PWR block could also be operat=
ed by
> > > older MP1(5) PWR block driver(s) without any adverse effects, except =
the SD
> > > IO domain configuration won't be available, right ?
> > Aye, the fallback sounds like what should be being used here, especially
> > if another user of the DT might not need to implement the extra domain.
>=20
>=20
> Yes it is the the only difference but I think that type of fallback is no
> more recommended for different device and
>=20
> the PWR device on STM32MP13 and on STM32MP15 are different.
>=20
>=20
> The other user of the non-secure device tree don't use the yet the PWR
> driver for STM32MP13,
>=20
> so for me the fallback is not needed for non secure world (Linux/U-Boot).
>=20
>=20
> So I prefer to introduce a new compatible in Linux kernel before the
> STM32MP13 PWR node is really used=A0 to avoid ABI break in futur.

How is it going to break an ABI? If the mp13 implements a functional
subset of what the mp1 does, then that's what fallback compatibles
are intended for. Marek's mail suggests that this is the case, and
therefore a fallback should be used.

If code written for the mp1 would not work on the mp13, then a fallback
should not be used.

Neither I nor Marek are saying that a new compatible should not be
created, in case you misunderstood that. This only affects the binding
patch, and your driver etc are free to use the mp13 compatible.

Thanks,
Conor.

--v5WMLClVVf+t+TTk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkPExgAKCRB4tDGHoIJi
0lZxAPwIDe/A/kGb5gcwIj8lI3dHHZQdauZu9LR30h2gq4Wi1gD+Loqv0IXxNvGo
Kbchr2W1JHnBZNmnJCbCA/PPPTAfWAs=
=vWSp
-----END PGP SIGNATURE-----

--v5WMLClVVf+t+TTk--

--===============4141234207176127226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4141234207176127226==--
