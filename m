Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C354A9F560A
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 19:24:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6182BC71292;
	Tue, 17 Dec 2024 18:24:55 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD81AC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 18:24:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4C579A40FA3;
 Tue, 17 Dec 2024 18:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A90C4CED3;
 Tue, 17 Dec 2024 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734459887;
 bh=WmVhbvyITgDCUN/Q9QgBlJc5BHM0NXp2JvRUV7TbNx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TlQT8h2Gba0qDyGj0NxRkEsTbuCxVEUeTs9AR2Zg/fj4qjjAgZfxdNs8hk2E2P/5h
 TyjVTn5z+6DwPfYTjhhTiGOP3le/rTpuCeX4rIru5835orQ3MLq4cmsqiI6nXTRxMG
 QYbirz1BpNceUoIDBYa5GZonOsOD0DRbVPCyRA3qSukm6Cp7V53kEDBNDlal18jojY
 FJOc7loci9KKJPtMEFZVGMp7IJJjF4pAMp3ihHDdNAVr/HlICmvD8+TTssKvdy8E80
 RZqZBVZzR5spmQJE9wZcVbjF88m+5hcI6Ctq2lQSoX277tBS4mbef77dV/mIQDWZRN
 Qbgge9+ybbO/w==
Date: Tue, 17 Dec 2024 18:24:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20241217-crawfish-tiring-792c535301d0@spud>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: media: clarify stm32 csi
 & simplify example
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
Content-Type: multipart/mixed; boundary="===============0763105475588719528=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0763105475588719528==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xXE3zBG6hEnuSLIF"
Content-Disposition: inline


--xXE3zBG6hEnuSLIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> Clarify the description of the stm32 csi by mentioning CSI-2 and
> D-PHY.

> Remove the bus-type property from the example.

Why? What's there to gain from the example being (seemingly?) less
comprehensive?

>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yam=
l b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> index 33bedfe41924..e9fa3cfea5d2 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> @@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: STMicroelectronics STM32 CSI controller
> =20
>  description:
> -  The STM32 CSI controller allows connecting a CSI based
> -  camera to the DCMIPP camera pipeline.
> +  The STM32 CSI controller, coupled with a D-PHY allows connecting a CSI=
-2
> +  based camera to the DCMIPP camera pipeline.
> =20
>  maintainers:
>    - Alain Volmat <alain.volmat@foss.st.com>
> @@ -109,7 +109,6 @@ examples:
>                  endpoint {
>                      remote-endpoint =3D <&imx335_ep>;
>                      data-lanes =3D <1 2>;
> -                    bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
>                  };
>              };
> =20
>=20
> --=20
> 2.34.1
>=20

--xXE3zBG6hEnuSLIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HB6gAKCRB4tDGHoIJi
0igKAPoDrf1wD6vhulE5XAy6M4DSbGrhREGhL8rIC2ao7oWAHwD/TCNKL8PFi+YB
35xu7mty1a7YqzisPAib+kIEA3XxSAw=
=g7v+
-----END PGP SIGNATURE-----

--xXE3zBG6hEnuSLIF--

--===============0763105475588719528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0763105475588719528==--
