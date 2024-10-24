Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 139099AED13
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 19:04:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0FB9C78F6B;
	Thu, 24 Oct 2024 17:04:47 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1A14C78F69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 17:04:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1DCD2A455D3;
 Thu, 24 Oct 2024 17:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29819C4CEC7;
 Thu, 24 Oct 2024 17:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729789478;
 bh=ywLWv1DymM9Q8rNWDVKF/A2+zd9RhYsw+C3ioFEB2fo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dBaqX6iQKVO2I3p6DrGwLpuLJB3LSA0XH7X+UprC50IkkggRW+Y2RLdcIiDwDCh1X
 k+uJyk8o/qqWWHi++gPxZfzbD15LyxpL7tsAN911NmSofjDWqtsMyWrv9j8+PQ/chd
 KKLAcTKow+XkNETi9/tPj7EgkZb4/bv4CB27O4p8I8fTzDI6cgXZ9K8Uy1q3PbZJgY
 NDAPrF/8A+KBJZchG6LgnkuCzfmc7S2vi96lqSFyQsbJKNlo6Orqoj44edCGXhcRbv
 duePaGbfb7zsTbuX4hn7EHv1IC6gyoJce7RQg5U1tvB2KYrPrVUH2+ag7ZbxPjeP1M
 FygRhSMkxMAiw==
Date: Thu, 24 Oct 2024 18:04:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20241024-wad-dusk-3d49f9ac4dff@spud>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <20241022-crisply-brute-45f98632ef78@spud>
 <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
 <20241023-paper-crease-befa8239f7f0@spud>
 <5cv7wcdddxa4ruggrk36cwaquo5srcrjqqwefqzcju2s3yhl73@ekpyw6zrpfug>
MIME-Version: 1.0
In-Reply-To: <5cv7wcdddxa4ruggrk36cwaquo5srcrjqqwefqzcju2s3yhl73@ekpyw6zrpfug>
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
Content-Type: multipart/mixed; boundary="===============0682183549613210838=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0682183549613210838==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r+PW8kyxnTDRk3Vc"
Content-Disposition: inline


--r+PW8kyxnTDRk3Vc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 06:38:29AM +0800, Inochi Amaoto wrote:
> On Wed, Oct 23, 2024 at 09:49:34PM +0100, Conor Dooley wrote:
> > On Wed, Oct 23, 2024 at 08:31:24AM +0800, Inochi Amaoto wrote:
> > > On Tue, Oct 22, 2024 at 06:28:06PM +0100, Conor Dooley wrote:
> > > > On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> > > > > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > > > > with some extra clock.
> > > > >=20
> > > > > Add necessary compatible string for this device.
> > > > >=20
> > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > ---
> > > > >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> > > > >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++=
++++++
> > > > >  2 files changed, 146 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,=
sg2044-dwmac.yaml
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yam=
l b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > index 3c4007cb65f8..69f6bb36970b 100644
> > > > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > @@ -99,6 +99,7 @@ properties:
> > > > >          - snps,dwmac-5.30a
> > > > >          - snps,dwxgmac
> > > > >          - snps,dwxgmac-2.10
> > > > > +        - sophgo,sg2044-dwmac
> > > > >          - starfive,jh7100-dwmac
> > > > >          - starfive,jh7110-dwmac
> > > > > =20
> > > > > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-=
dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..93c41550b0b6
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.y=
aml
> > > > > @@ -0,0 +1,145 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: StarFive JH7110 DWMAC glue layer
> > > > > +
> > > > > +maintainers:
> > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > +
> > > > > +select:
> > > > > +  properties:
> > > > > +    compatible:
> > > > > +      contains:
> > > > > +        enum:
> > > > > +          - sophgo,sg2044-dwmac
> > > > > +  required:
> > > > > +    - compatible
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - const: sophgo,sg2044-dwmac
> > > > > +      - const: snps,dwmac-5.30a
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    items:
> > > > > +      - description: GMAC main clock
> > > > > +      - description: PTP clock
> > > > > +      - description: TX clock
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: stmmaceth
> > > > > +      - const: ptp_ref
> > > > > +      - const: tx
> > > > > +
> > > > > +  sophgo,syscon:
> > > >=20
> > > > How many dwmac instances does the sg2044 have?
> > > >=20
> > >=20
> > > Only one, there is another 100G dwxgmac instance, but it does not
> > > use this syscon.
> >=20
> > That dwxgmac is a different device, with a different compatible etc?
>=20
> Yes, it needs a different compatiable, and maybe a new binding is needed
> since the 100G and 1G IP are different.

In that case, you don't /need/ a syscon property at all, much less one
with offsets. You can just look up the syscon by compatible and hard
code the offset in the driver.

--r+PW8kyxnTDRk3Vc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxp+HgAKCRB4tDGHoIJi
0mRYAQC5zNH78v/p+H9bscKX2XQ4j6+YJ0OaAX6+AvjpwXd/WAEAzV4GkyhyPnWN
1Bs5WxGAGbqBkGnxejt/DzUIguij7wc=
=/5rz
-----END PGP SIGNATURE-----

--r+PW8kyxnTDRk3Vc--

--===============0682183549613210838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0682183549613210838==--
