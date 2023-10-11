Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8427C58A7
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Oct 2023 17:56:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CDF5C6B44B;
	Wed, 11 Oct 2023 15:56:04 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA56C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Oct 2023 15:56:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CB5E9CE2461;
 Wed, 11 Oct 2023 15:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5EBC433C9;
 Wed, 11 Oct 2023 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697039758;
 bh=l9SFEh6GumGFUG+DXwfjem9vY8NkT0tXT2M7UKxvr+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ixz6+3ToD5gCvDW97nhaKCvGkg+zuAa66qnUIYhJxKe8kNBhHm2Kcov3Ggelcst9i
 gCuJyp9AUNk/QELshcUjFj0lTDxx2hxty9VRcvCceAtmIYNmsQaSYciVbweYPfD+QT
 PaAS5v9GBATPOL+MQPemncG7EnSSAETrqt1nMcyVyZho0hjP69D9eJHZcSPQLh0gLq
 Zcwghmsthja+tv1QeN0SZmKhbZ87cTA90Ijeuct3i+wfsAUXKNED9EUCKIKU5HBlwY
 DqbyU8yLOZk9J+mr71itTN70mVjLDa/ElG2Fn+OZAaLbYJefXMY+gAPTBnvyrilY3U
 vhMRPbSWgnBQQ==
Date: Wed, 11 Oct 2023 16:55:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Message-ID: <20231011-jogger-designing-0eb6e2daacba@spud>
References: <20231010091643.3666290-1-hugues.fruchet@foss.st.com>
 <20231010091643.3666290-2-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231010091643.3666290-2-hugues.fruchet@foss.st.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/5] dt-bindings: media: Document
 STM32MP25 VDEC & VENC video codecs
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
Content-Type: multipart/mixed; boundary="===============1340817224910504204=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1340817224910504204==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HQXQfP5KdaxdfgWJ"
Content-Disposition: inline


--HQXQfP5KdaxdfgWJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Tue, Oct 10, 2023 at 11:16:39AM +0200, Hugues Fruchet wrote:
> Add STM32MP25 VDEC video decoder & VENC video encoder bindings.
>=20
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
>  .../media/st,stm32mp25-video-codec.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32mp25-=
video-codec.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-video-c=
odec.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-video-code=
c.yaml
> new file mode 100644
> index 000000000000..479566171568
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.ya=
ml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/st,stm32mp25-video-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32MP25 VDEC video decoder & VENC video enco=
der
> +
> +maintainers:
> +  - Hugues Fruchet <hugues.fruchet@foss.st.com>
> +
> +description:
> +  The STMicroelectronics STM32MP25 SOCs embeds a VDEC video hardware
> +  decoder peripheral based on Verisilicon VC8000NanoD IP (former Hantro =
G1)
> +  and a VENC video hardware encoder peripheral based on Verisilicon
> +  VC8000NanoE IP (former Hantro H1).
> +
> +properties:
> +  compatible:
> +    items:

This "items:" is not needed, the enum on its own is enough.

> +      - enum:
> +          - st,stm32mp25-vdec
> +          - st,stm32mp25-venc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    vdec: video-codec@580d0000 {

The node labels for both nodes here are not used & should be dropped.

Otherwise, this seems fine to me.

Cheers,
Conor.

> +        compatible =3D "st,stm32mp25-vdec";
> +        reg =3D <0x580d0000 0x3c8>;
> +        interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&ck_icn_p_vdec>;
> +    };
> +  - |
> +    venc: video-codec@580e0000 {
> +        compatible =3D "st,stm32mp25-venc";
> +        reg =3D <0x580e0000 0x800>;
> +        interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&ck_icn_p_venc>;
> +    };
> --=20
> 2.25.1
>=20

--HQXQfP5KdaxdfgWJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSbFhgAKCRB4tDGHoIJi
0t0uAQCP6ge+y1j9+kMRyc0k7z2mmqF+5BxIUEKWEn3WUxp1vgD+NYj7GsuoXHij
EdPldWL1H+xzD4wuI5OWRDd2WLQiMQY=
=H1kq
-----END PGP SIGNATURE-----

--HQXQfP5KdaxdfgWJ--

--===============1340817224910504204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1340817224910504204==--
