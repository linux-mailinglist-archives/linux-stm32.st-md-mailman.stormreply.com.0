Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8B5816254
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Dec 2023 22:09:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55517C6DD6F;
	Sun, 17 Dec 2023 21:09:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 661CDC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Dec 2023 21:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 940ECB80B8A;
 Sun, 17 Dec 2023 21:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317F9C433C8;
 Sun, 17 Dec 2023 21:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702847388;
 bh=pDlIZybXRI8LmSUJwxQ9swF4niWXVQabD7yDs33HQw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FsxGX/S/ViVVCvVazbG/67dop8rBwKNAK0dNrdbW9ku1xUK7Uy3PWJ/3prB6KR7A3
 jaGh7tY7oq7+/vcSnaDXXTMuXA2Qm1tnkWSGSHx5C6c4RYOUrIiREi7tXvCgTG3Lej
 eSmpo0Y6z/UH6KL13F/6r8JOuERk45EhQAXHJjBn96lWKFrBXLgK4GafN+SukoCDkj
 ZllSmcsT95dO8YHkqIUK3VFP0Al0dgbjW4iZoSw4DLVvwOMLHv4r69rdXPz7OHuISH
 Bi2J87TZYPASi2rtj4daAGOhyXv7leeDj8PRokk4Ts0ne4ym7UJYLGGF45GYkYwY11
 EMg0VORZNSAeg==
Date: Sun, 17 Dec 2023 21:09:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <20231217-spray-livestock-a59d630b751e@spud>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
 <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
 <65fd52f1-6861-42b0-9148-266766d054b1@sifive.com>
 <6c62e3b2-acde-4580-9b67-56683289e45e@collabora.com>
MIME-Version: 1.0
In-Reply-To: <6c62e3b2-acde-4580-9b67-56683289e45e@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Michael Turquette <mturquette@baylibre.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, kernel@collabora.com,
 linux-clk@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, LKML <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 2/9] dt-bindings: net: starfive,
 jh7110-dwmac: Add JH7100 SoC compatible
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
Content-Type: multipart/mixed; boundary="===============7380587055016712310=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7380587055016712310==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="npmbwANzcjocFUKY"
Content-Disposition: inline


--npmbwANzcjocFUKY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 11:03:24PM +0200, Cristian Ciocaltea wrote:
> On 12/15/23 22:59, Samuel Holland wrote:
> > On 2023-12-15 2:47 PM, Jessica Clarke wrote:
> >> On 15 Dec 2023, at 20:40, Cristian Ciocaltea <cristian.ciocaltea@colla=
bora.com> wrote:
> >>>
> >>> The Synopsys DesignWare MAC found on StarFive JH7100 SoC is mostly
> >>> similar to the newer JH7110, but it requires only two interrupts and a
> >>> single reset line, which is 'ahb' instead of the commonly used
> >>> 'stmmaceth'.
> >>>
> >>> Since the common binding 'snps,dwmac' allows selecting 'ahb' only in
> >>> conjunction with 'stmmaceth', extend the logic to also permit exclusi=
ve
> >>> usage of the 'ahb' reset name.  This ensures the following use cases =
are
> >>> supported:
> >>>
> >>>  JH7110: reset-names =3D "stmmaceth", "ahb";
> >>>  JH7100: reset-names =3D "ahb";
> >>>  other:  reset-names =3D "stmmaceth";
> >>>
> >>> Also note the need to use a different dwmac fallback, as v5.20 applies
> >>> to JH7110 only, while JH7100 relies on v3.7x.
> >>>
> >>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>> ---
> >>> .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +-
> >>> .../bindings/net/starfive,jh7110-dwmac.yaml   | 74 +++++++++++++------
> >>> 2 files changed, 55 insertions(+), 22 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/=
Documentation/devicetree/bindings/net/snps,dwmac.yaml
> >>> index 5c2769dc689a..c1380ff1c054 100644
> >>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> >>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> >>> @@ -95,6 +95,7 @@ properties:
> >>>         - snps,dwmac-5.20
> >>>         - snps,dwxgmac
> >>>         - snps,dwxgmac-2.10
> >>> +        - starfive,jh7100-dwmac
> >>>         - starfive,jh7110-dwmac
> >>>
> >>>   reg:
> >>> @@ -146,7 +147,7 @@ properties:
> >>>   reset-names:
> >>>     minItems: 1
> >>>     items:
> >>> -      - const: stmmaceth
> >>> +      - enum: [stmmaceth, ahb]
> >>>       - const: ahb
> >>
> >> I=E2=80=99m not so well-versed in the YAML bindings, but would this no=
t allow
> >> reset-names =3D "ahb", "ahb"?
> >=20
> > Yes, it would. You need something like:
> >=20
> > reset-names:
> >   oneOf:
> >     - enum: [stmmaceth, ahb]
> >     - items:
> >         - const: stmmaceth
> >         - const: ahb
>=20
> Oh yes, I always forget about the "oneOf" thing. Thanks!

Won't this also relax the naming for all devices that allow a single
reset, but expect the stmmaceth one? I'm not sure that that actually
matters, I think the consumer bindings have constraints themselves.

--npmbwANzcjocFUKY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZX9jlAAKCRB4tDGHoIJi
0u2kAQDwhBC97TRp152I+1W+AAVbbj170OQONz+W/j8kuDieIwD/cY+M0Ecr1wRq
sRFbcJiO+jHPZHDgTTISrvusYc5QxwU=
=mt/n
-----END PGP SIGNATURE-----

--npmbwANzcjocFUKY--

--===============7380587055016712310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7380587055016712310==--
