Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6508C43F7
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 17:17:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2C1DC6A61D;
	Mon, 13 May 2024 15:17:02 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 424C7C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 15:16:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B6C13CE0F24;
 Mon, 13 May 2024 15:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15316C113CC;
 Mon, 13 May 2024 15:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715613408;
 bh=HU9Kthyf9AMvfavUhbOcA41Vuir/Y1fnNqQMRB+ThnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lxrHjuKhb3JXMA3yvXcjLCZF753vbE9sWINCd0Ep1XXA/LSaBp0ZDXvT/q/5gKO++
 Lzw2/twgMrGiuEScOAO2zDy7CNwaxX60tVhSo6+rkjF/wCWkAWuAVKl9TgahRpbc2W
 txo0MSgdR8a7Xaa22nzigdLN+L/2/TNXt1OtiXtpcY8l07zZwtDiquDwe/NfbOsgJI
 /pznRwlM7FwQt7kBN7vaWpxl23/sqHvUTabMWXUG+WBr8X8Oa+Dba4lawv9R6hE1Dg
 5QdcD1DRFHRnjtvt7PtcdVMh+mR+jzwqk1ZMF0ipkEChrgIvzW9RgXC5vjYDCTZU+b
 v5p+29TQr+oxw==
Date: Mon, 13 May 2024 16:16:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20240513-stabilize-proofread-81f0f9ee38b9@spud>
References: <20240513095605.218042-1-patrick.delaunay@foss.st.com>
 <20240513115601.v3.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
 <615dfdcb-cbda-426f-895e-810f03a8ce60@denx.de>
MIME-Version: 1.0
In-Reply-To: <615dfdcb-cbda-426f-895e-810f03a8ce60@denx.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Pascal Paillet <p.paillet@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
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
Content-Type: multipart/mixed; boundary="===============8237352726747300057=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8237352726747300057==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7WL8bDW+3sE8qEPT"
Content-Disposition: inline


--7WL8bDW+3sE8qEPT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 04:34:20PM +0200, Marek Vasut wrote:
> On 5/13/24 11:56 AM, Patrick Delaunay wrote:
> > Add new compatible "st,stm32mp13-pwr-reg" for STM32MP13 SoC family.
> >=20
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > ---
> >=20
> > Changes in v3:
> > - Replace oneOf/const by enum; solve the V2 issues for dt_binding_check
> >=20
> > Changes in v2:
> > - update for Rob review, only add compatible for STM32MP13 family
> >=20
> >   .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml    | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pw=
r-reg.yaml b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-re=
g.yaml
> > index c9586d277f41..c766f0a15a31 100644
> > --- a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.y=
aml
> > +++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.y=
aml
> > @@ -11,7 +11,9 @@ maintainers:
> >   properties:
> >     compatible:
> > -    const: st,stm32mp1,pwr-reg
> > +    enum:
> > +      - st,stm32mp1,pwr-reg
> > +      - st,stm32mp13-pwr-reg
>=20
> Should the st,stm32mp1,pwr-reg be treated as fallback compatible for
> st,stm32mp13-pwr-reg or not ?
>=20
> In other words, should the DT contain:
> compatible =3D "st,stm32mp13-pwr-reg", "st,stm32mp1,pwr-reg";
> or
> compatible =3D "st,stm32mp13-pwr-reg";
> ? Which one is preferable ?
>=20
> I think the former one, since the MP13 PWR block could also be operated by
> older MP1(5) PWR block driver(s) without any adverse effects, except the =
SD
> IO domain configuration won't be available, right ?

Aye, the fallback sounds like what should be being used here, especially
if another user of the DT might not need to implement the extra domain.

--7WL8bDW+3sE8qEPT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkIu2wAKCRB4tDGHoIJi
0lvfAP9rGyh8L75hqzO31KKo0VjnQVaddbWqnT+TfJuogvhOPgD+K/V4pOzfwW3l
NyOTQkYcM9fqIXgdfeeXPmIZ/6VV3QI=
=kDOI
-----END PGP SIGNATURE-----

--7WL8bDW+3sE8qEPT--

--===============8237352726747300057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8237352726747300057==--
