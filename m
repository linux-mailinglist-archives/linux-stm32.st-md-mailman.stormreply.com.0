Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E79AD5C7
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 22:49:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89502C71287;
	Wed, 23 Oct 2024 20:49:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCD4BC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 20:49:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8C795C5E31;
 Wed, 23 Oct 2024 20:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612EEC4CEC6;
 Wed, 23 Oct 2024 20:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729716581;
 bh=D6rOAupw7nWaOfhbwJhOxY7u+4yNaJ1nMm3CkyxSZ4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SbsmEFuBcYBJxfd9aKYJEJhvm5sOCBpuq3Gkw8XBVAgaBVAtodo4MzzFydgz9lmre
 lYFf+4Bc3gblOkDrHaTeXYplOKsx+ARhDq7I84evZ9AqNJW6sdl8mkvHTdvLRiNWq7
 HIxQV0FTIhIlXU1I0UWU0dYoCb4/La4ArGqqwj83V1yPu64TjVihcSJtg+Lv4hnx7j
 nsU4mql2Gn/IGBFQELdRYpyG77D96qEA7RspsiJJx3jVWn3y5NFarKPXPlN+Fhh4du
 ljtB6NwbDGGW5+zuy3s8XNOWGeFaUUoztmYHWjCyMnJg20bW3Ehuw32LgawaSV0yAA
 ne0ctkmBg3+FQ==
Date: Wed, 23 Oct 2024 21:49:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20241023-paper-crease-befa8239f7f0@spud>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <20241022-crisply-brute-45f98632ef78@spud>
 <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
MIME-Version: 1.0
In-Reply-To: <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
Cc: Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Chen Wang <unicorn_wang@outlook.com>, Jose Abreu <joabreu@synopsys.com>,
 Inochi Amaoto <inochiama@outlook.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: net: Add support for
	Sophgo SG2044 dwmac
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
Content-Type: multipart/mixed; boundary="===============1772117205950916052=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1772117205950916052==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HZ3OWjJABGOCrTlm"
Content-Disposition: inline


--HZ3OWjJABGOCrTlm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 08:31:24AM +0800, Inochi Amaoto wrote:
> On Tue, Oct 22, 2024 at 06:28:06PM +0100, Conor Dooley wrote:
> > On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> > > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > > with some extra clock.
> > >=20
> > > Add necessary compatible string for this device.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> > >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++=
++
> > >  2 files changed, 146 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg20=
44-dwmac.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/=
Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > index 3c4007cb65f8..69f6bb36970b 100644
> > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > @@ -99,6 +99,7 @@ properties:
> > >          - snps,dwmac-5.30a
> > >          - snps,dwxgmac
> > >          - snps,dwxgmac-2.10
> > > +        - sophgo,sg2044-dwmac
> > >          - starfive,jh7100-dwmac
> > >          - starfive,jh7110-dwmac
> > > =20
> > > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwma=
c.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > new file mode 100644
> > > index 000000000000..93c41550b0b6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > @@ -0,0 +1,145 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: StarFive JH7110 DWMAC glue layer
> > > +
> > > +maintainers:
> > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > +
> > > +select:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        enum:
> > > +          - sophgo,sg2044-dwmac
> > > +  required:
> > > +    - compatible
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: sophgo,sg2044-dwmac
> > > +      - const: snps,dwmac-5.30a
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: GMAC main clock
> > > +      - description: PTP clock
> > > +      - description: TX clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: stmmaceth
> > > +      - const: ptp_ref
> > > +      - const: tx
> > > +
> > > +  sophgo,syscon:
> >=20
> > How many dwmac instances does the sg2044 have?
> >=20
>=20
> Only one, there is another 100G dwxgmac instance, but it does not
> use this syscon.

That dwxgmac is a different device, with a different compatible etc?

--HZ3OWjJABGOCrTlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxlhXgAKCRB4tDGHoIJi
0pO0AQD5Swmhv1mfvz5DiD/5f5DGV3m+rvoUAhPp697EkSD9KgD/fnWAmf29z3yR
O/N/hNkW71ULWbchz7jsFDwGdd6q4Ao=
=k7np
-----END PGP SIGNATURE-----

--HZ3OWjJABGOCrTlm--

--===============1772117205950916052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1772117205950916052==--
