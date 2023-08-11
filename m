Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC0779350
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Aug 2023 17:37:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66442C6B474;
	Fri, 11 Aug 2023 15:37:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0061FC6B472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 15:37:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E24E960B76;
 Fri, 11 Aug 2023 15:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04ACC433C8;
 Fri, 11 Aug 2023 15:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691768220;
 bh=IwOupUYX4uwoK+O9WEdepYooynfek5GkO6Od3LDdjAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BI6tLwYsm/mibN4q/5jKOlxwgQh6m0Wn8lC4eZwJZ4nvEIHRHLsvQieg8qZcfWMDe
 tSD7XyPgEtXeUsVZbxWOlJHpXStb5D4LK7/QFTsks9LyCXkaKWjxgntIKJO714QKg8
 XYqKupscCU+jdlz1FQh5pr9X+ke75OJl6FA27MguxGkQjxpXUWpAWC9hryXOsLN0ms
 96/Piq6UBnaO9hqIrE2ECj2l2jZXkSC0Pm855wpUQMovvdeSMInxFdubciIaGPY4Sh
 U5AhvmwaL2l32Z4bS3dXTdvBE99hv+qyAtHiyEwgIUO+yCLfzbqxHZoUjfSAYQQd6o
 ztQAQQ+zxVuyw==
Date: Fri, 11 Aug 2023 16:36:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Message-ID: <20230811-imminent-fancied-89663c373ab5@spud>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230719-mcrc-upstream-v2-3-4152b987e4c2@ti.com>
 <20230811-crestless-gratify-21c9bb422375@spud>
MIME-Version: 1.0
In-Reply-To: <20230811-crestless-gratify-21c9bb422375@spud>
Cc: Nishanth Menon <nm@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/6] dt-bindings: crypto: Add Texas
	Instruments MCRC64
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
Content-Type: multipart/mixed; boundary="===============1320161902253871717=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1320161902253871717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yk7Io+ad3L2jbO+M"
Content-Disposition: inline


--yk7Io+ad3L2jbO+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 04:34:33PM +0100, Conor Dooley wrote:
> On Fri, Aug 11, 2023 at 12:58:50AM +0530, Kamlesh Gurudasani wrote:
> > Add binding for Texas Instruments MCRC64
> >=20
> > MCRC64 engine calculates 64-bit cyclic redundancy checks (CRC)
> > according to the ISO 3309 standard.
> >=20
> > The ISO 3309 64-bit CRC model parameters are as follows:
> >     Generator Polynomial: x^64 + x^4 + x^3 + x + 1
> >     Polynomial Value: 0x000000000000001B
> >     Initial value: 0x0000000000000000
> >     Reflected Input: False
> >     Reflected Output: False
> >     Xor Final: 0x0000000000000000
> >=20
> > Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> > ---
> >  Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml | 47 +++++++++=
++++++++++++++++++++++++++++++++++++++
> >  MAINTAINERS                                             |  5 +++++
> >  2 files changed, 52 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml b/=
Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
> > new file mode 100644
> > index 000000000000..38bc7efebd68
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/crypto/ti,mcrc64.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments MCRC64
> > +
> > +description: The MCRC64 engine calculates 64-bit cyclic redundancy che=
cks
>=20
> A newline after "description" please.
>=20
> > +  (CRC) according to the ISO 3309 standard.
> > +
> > +maintainers:
> > +  - Kamlesh Gurudasani <kamlesh@ti.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,am62-mcrc64
>=20
> Is the am62 an SoC or a family of SoCs? I googled a wee bit for am62 &
> there seems to be an am625 and an am623?

Or is it an am62p5, in which case the compatible should contain
ti,am62p5 I suppose. Sorry for my confusion here, its not really clear
me too since I've been seeing many different-but-similar product names
the last few days.

Thanks,
Conor.

>=20
> Otherwise, this looks good to me.
>=20
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> > +
> > +    crc@30300000 {
> > +      compatible =3D "ti,am62-mcrc64";
> > +      reg =3D <0x30300000 0x1000>;
> > +      clocks =3D <&k3_clks 116 0>;
> > +      power-domains =3D <&k3_pds 116 TI_SCI_PD_EXCLUSIVE>;
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 02a3192195af..66b51f43d196 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -21481,6 +21481,11 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/iio/adc/ti,lmp92064.yaml
> >  F:	drivers/iio/adc/ti-lmp92064.c
> > =20
> > +TI MEMORY CYCLIC REDUNDANCY CHECK (MCRC64) DRIVER
> > +M:	Kamlesh Gurudasani <kamlesh@ti.com>
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/crypto/ti,mcrc64.yaml
> > +
> >  TI PCM3060 ASoC CODEC DRIVER
> >  M:	Kirill Marinushkin <kmarinushkin@birdec.com>
> >  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> >=20
> > --=20
> > 2.34.1
> >=20



--yk7Io+ad3L2jbO+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNZVlgAKCRB4tDGHoIJi
0uHpAP4hfYrFNPj0CkA40P9EKD3r/FKiAc6X2K23ePY3vww/XAEA6WukF13gDiEn
uOcZZtE+v9yuqJykNIKHzEe9ishk3gI=
=Qk3W
-----END PGP SIGNATURE-----

--yk7Io+ad3L2jbO+M--

--===============1320161902253871717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1320161902253871717==--
