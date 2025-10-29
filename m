Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0B9C1C9BA
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 18:55:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 958CBC62D55;
	Wed, 29 Oct 2025 17:54:59 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93EF8C5663C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 17:54:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 12B0160503;
 Wed, 29 Oct 2025 17:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99C8C4CEF7;
 Wed, 29 Oct 2025 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761760496;
 bh=bCXLipd8jw4UWfF/s5HKsZqILEHRwryjypVy7tkLUjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2tj5JN387EOqfUzqfbcncN6EFYT4OwAISQxnGTNRwt+7QYfTddUa14wSsM/M0eA/
 lY+4h6ETkKg7o3jpW85ZU0y2lae7avMVcvFP7v/SEFsbARyqbD0oNiAiLvpe1CYzaT
 IuuzqvjzurbH11uNGwmCPkUZ546lWRVfgAUGPFrvFYOTckwvUFggfO++KsGCS+GWm1
 /xbtIUCkwcQ31tp67OcF3lTVc55SJPPSso6hov6boz113Vahc+Jifr4Q5NNedVELLK
 jLA5Jby4dX9uSizqMTZpb9knFrinWRP79P6aK0nswAcv++PSsewUjwlZK90MSo9Nlt
 NG/j0vZNGZQHQ==
Date: Wed, 29 Oct 2025 17:54:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20251029-fading-expulsion-f0911c28d23d@spud>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-2-inochiama@gmail.com>
 <20251028-parka-proud-265e5b342b8e@spud>
 <rclupbdjyk67fee2lgf74k6tkf7mnjcxzwcjvyk2bohgpetqt5@toxvy3m5orm2>
MIME-Version: 1.0
In-Reply-To: <rclupbdjyk67fee2lgf74k6tkf7mnjcxzwcjvyk2bohgpetqt5@toxvy3m5orm2>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
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
Subject: Re: [Linux-stm32] [PATCH v4 1/3] dt-bindings: net: sophgo,
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
Content-Type: multipart/mixed; boundary="===============7239908249889911273=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7239908249889911273==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xiR9j6m1veV/qNYv"
Content-Disposition: inline


--xiR9j6m1veV/qNYv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 08:56:09AM +0800, Inochi Amaoto wrote:
> On Tue, Oct 28, 2025 at 07:22:37PM +0000, Conor Dooley wrote:
> > On Tue, Oct 28, 2025 at 08:38:56AM +0800, Inochi Amaoto wrote:
> > > As the ethernet controller of SG2044 and SG2042 only supports
> > > RGMII phy. Add phy-mode property to restrict the value.
> > >=20
> > > Also, since SG2042 has internal rx delay in its mac, make
> > > only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> >=20
> > Should this have a fixes tag?
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
>=20
> Although I add a fixes tag to the driver, I am not sure whether the
> binding requires it. But if it is required, I think it should be

Kinda depends for bindings, amending a binding for completeness probably
doesn't need one but amending it to actually permit a functional
configuration does. This is somewhere in-between I suppose. If a driver
change is coming along with it which is likely to be backported, that'd
be a vote in favour of a fixes tag here too, so that the binding and
driver match in stable.

>=20
> Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support =
for Sophgo SG2042 dwmac")
>=20
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++++++++++=
++
> > >  1 file changed, 20 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwma=
c.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > index ce21979a2d9a..916ef8f4838a 100644
> > > --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > @@ -70,6 +70,26 @@ required:
> > > =20
> > >  allOf:
> > >    - $ref: snps,dwmac.yaml#
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: sophgo,sg2042-dwmac
> > > +    then:
> > > +      properties:
> > > +        phy-mode:
> > > +          enum:
> > > +            - rgmii-txid
> > > +            - rgmii-id
> > > +    else:
> > > +      properties:
> > > +        phy-mode:
> > > +          enum:
> > > +            - rgmii
> > > +            - rgmii-rxid
> > > +            - rgmii-txid
> > > +            - rgmii-id
> > > +
> > > =20
> > >  unevaluatedProperties: false
> > > =20
> > > --=20
> > > 2.51.1
> > >=20
>=20
>=20

--xiR9j6m1veV/qNYv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJU6QAKCRB4tDGHoIJi
0r18AP9YHrFoYXPV2dEPqru+c49A0QRQ0TNcKAkMQ1H/ppaEYgD9FQ3HpD0h2vUk
e+BRSTPq5uaZbxl+044FWdyYYKRVCQE=
=moFb
-----END PGP SIGNATURE-----

--xiR9j6m1veV/qNYv--

--===============7239908249889911273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7239908249889911273==--
