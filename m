Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D69CDC5AE88
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 02:25:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 883FFC628D4;
	Fri, 14 Nov 2025 01:25:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F13DC628B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 01:25:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 94F06441E8;
 Fri, 14 Nov 2025 01:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67573C2BCB0;
 Fri, 14 Nov 2025 01:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763083540;
 bh=jUpqsgzm9mQmlDwIMnmXwws2iJVd0X9NrGflGeH7Iqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z09gLaMZlZrJHbraZakAvPZQ2kqgik/E3cfI2zd2AjI6xpvGjYqFZURz2b+UzBcTc
 8SwRLAul1ddhZmoa7yCwX9IFyPmrEIhWuLBuE4sFEpMh/Xj2ayDrZBOlDWhT8JFLCn
 K8AAzeBFl1lClijNSqUnLKDYyGpjtc9SHPUCKg3gZQchcPRcFs1kpedjTT0p80gN33
 nBZ3PHgGXXwZFMdtT0BOjlUvnj/c7xeVt5LlNIMMGA7Rv/7IaPLQFA1I2DV7S1aZEx
 +YQAP3xbmuM/xOibvOJvy24sED0Q4VX4dZwkiNH1jFlFvXA+HctaCLc3x8eQyQz83/
 u7OWf0KRaOl4w==
Date: Fri, 14 Nov 2025 01:25:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20251114-apache-sprung-f1a29b873696@spud>
References: <20251114003805.494387-1-inochiama@gmail.com>
 <20251114003805.494387-2-inochiama@gmail.com>
 <yjl3gnf2gwh327wbbwcbkxwnqy5tyhwutffovlxhcm7b4vr2xu@he4tg6bcrduu>
MIME-Version: 1.0
In-Reply-To: <yjl3gnf2gwh327wbbwcbkxwnqy5tyhwutffovlxhcm7b4vr2xu@he4tg6bcrduu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Yao Zi <ziyao@disroot.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, sophgo@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v8 1/3] dt-bindings: net: sophgo,
 sg2044-dwmac: add phy mode restriction
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
Content-Type: multipart/mixed; boundary="===============1887621956127995480=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1887621956127995480==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NIRjo9fMfQbx0LeW"
Content-Disposition: inline


--NIRjo9fMfQbx0LeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 08:44:15AM +0800, Inochi Amaoto wrote:
> On Fri, Nov 14, 2025 at 08:38:03AM +0800, Inochi Amaoto wrote:
> > As the ethernet controller of SG2044 and SG2042 only supports
> > RGMII phy. Add phy-mode property to restrict the value.
> >=20
> > Also, since SG2042 has internal rx delay in its mac, make
> > only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> >=20
> > Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add suppor=
t for Sophgo SG2042 dwmac")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> > ---
> >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.=
yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > index ce21979a2d9a..e8d3814db0e9 100644
> > --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > @@ -70,6 +70,25 @@ required:
> > =20
> >  allOf:
> >    - $ref: snps,dwmac.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: sophgo,sg2042-dwmac
> > +    then:
> > +      properties:
> > +        phy-mode:
> > +          enum:
>=20
> > +            - rgmii-rxid
> > +            - rgmii-id
>=20
> Hi, Conor,
>=20
> I have restricted the phy-mode with wrong mode here, it should be
> rgmii-rxid instead of rgmii-txid as the SG2042 always add rx delay
> in their mac. As this is more like a mistake for me when writing
> the binding, I keep you tag with the fix. If you need something
> further, please let me know.

Yeah that's fine chief. In general, if it is some hardware detail
that I couldn't possibly know was correct or incorrect without
reading the device's documentation then I probably don't care about
the binding change required for it when it's so minimal. Probably the
same goes for Rob and Krzysztof.

--NIRjo9fMfQbx0LeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRaFDAAKCRB4tDGHoIJi
0sHeAQCiwuHrj6CHOoRLG+GG2NyvoAYv/ledOLpXXMp9wFne6AD/ac6tU8Z1tAkf
gGLcZaOgphtF9IndUwUcVjxW0F1kDAM=
=Gnn9
-----END PGP SIGNATURE-----

--NIRjo9fMfQbx0LeW--

--===============1887621956127995480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1887621956127995480==--
