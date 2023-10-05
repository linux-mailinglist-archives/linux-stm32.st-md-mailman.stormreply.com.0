Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 844157B9CA4
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 12:59:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 163A4C6C835;
	Thu,  5 Oct 2023 10:59:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E303C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 10:59:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0A34EB823ED;
 Thu,  5 Oct 2023 10:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBAFC32784;
 Thu,  5 Oct 2023 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696503589;
 bh=UBDFLeY+PPEBJKSf7kZcYghS/Q9ycdJpp2P0dOU7MX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bHf+IaimHmjzXHj+umSI5gqnp+F5ATSlb291+Lg68bU6aTrVR2AOORQde80aTEtaj
 DxbB+OjPUgEzFbqtjtWt8O+Q8m+28sjEc2VsvYAEWUN/0n6JNnT8Gmfw6H3cOy8ter
 MFJkBgRiZSqwdEI8xdfvB64npda56x4HenxGybY7I3Sh/fPinivGTb92LMM8Hk3eUE
 CVvK7Z3DgIosM8SU24Vz90u4w1esQa8sBKSEgzvheHNhQ6Q1LGaNcsccTBcb3cAZ8T
 Aq9bP2eMUu4vzk+GAjF3lMmXaSw7w8/gfTkEq2o2FT2T1YvJyUZInuQ8fjVXUVlPeV
 4cbNyH7WOsLYQ==
Date: Thu, 5 Oct 2023 11:59:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Message-ID: <20231005-bleach-unknotted-9b11443959b1@spud>
References: <20231004103720.3540436-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231004103720.3540436-1-hugues.fruchet@foss.st.com>
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
Subject: Re: [Linux-stm32] [RFC 0/6] VP8 H1 stateless encoding
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
Content-Type: multipart/mixed; boundary="===============1247261396933468905=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1247261396933468905==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ia4S0Q4OBDpOeXiU"
Content-Disposition: inline


--Ia4S0Q4OBDpOeXiU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2023 at 12:37:14PM +0200, Hugues Fruchet wrote:
> Hi all,
>=20
> Here is an RFC to support VP8 encoding using Hantro H1 hardware
> of STM32MP25 SoCs (Verisilicon VC8000NanoE IP).
> This work is derived from work done to support Rockchip RK3399
> VPU2 in RFC [1] with a reshuffling of registers to match H1
> register set.
>=20
> This has been tested on STM32MP257F-EV1 evaluation board using
> GStreamer userspace [2]:
> gst-launch-1.0 videotestsrc num-buffers=3D500 ! video/x-raw,width=3D640,h=
eight=3D480 \
> ! v4l2slvp8enc ! queue ! matroskamux ! filesink location=3Dtest_vp8.mkv
>=20
> For the sake of simplicity I have embedded here the RFC [1] before the
> changes related to this exact RFC, all rebased on v6.6 + STM32MP25
> hardware codecs support [3].

I don't see any bindings etc here, what is it that you think I would
care about looking at in this RFC series?

Thanks,
Conor.

>=20
> [1] https://lwn.net/ml/linux-media/20230309125651.23911-1-andrzej.p@colla=
bora.com/
> [2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3=
736
> [3] https://patchwork.kernel.org/project/linux-media/list/?series=3D789861
>=20
> Best regards,
> Hugues.
>=20
>=20
> Andrzej Pietrasiewicz (2):
>   media: uapi: Add VP8 stateless encoder controls
>   media: hantro: add VP8 encode support for Rockchip RK3399 VPU2
>=20
> Hugues Fruchet (4):
>   media: hantro: add h1 vp8 encode support
>   media: hantro: add VP8 encode support for STM32MP25 VENC
>   media: hantro: h1: NV12 single-plane support
>   media: hantro: add NV12 single-plane support for STM32MP25 VENC
>=20
>  drivers/media/platform/verisilicon/Makefile   |    3 +
>  drivers/media/platform/verisilicon/hantro.h   |   10 +
>  .../platform/verisilicon/hantro_boolenc.c     |   69 +
>  .../platform/verisilicon/hantro_boolenc.h     |   21 +
>  .../media/platform/verisilicon/hantro_drv.c   |   15 +-
>  .../platform/verisilicon/hantro_h1_jpeg_enc.c |   42 +-
>  .../platform/verisilicon/hantro_h1_regs.h     |   71 +-
>  .../platform/verisilicon/hantro_h1_vp8_enc.c  | 1589 +++++++++++++++++
>  .../media/platform/verisilicon/hantro_hw.h    |   93 +
>  .../media/platform/verisilicon/hantro_v4l2.c  |    5 +-
>  .../media/platform/verisilicon/hantro_vp8.c   |  118 ++
>  .../verisilicon/rockchip_vpu2_hw_vp8_enc.c    | 1574 ++++++++++++++++
>  .../platform/verisilicon/rockchip_vpu2_regs.h |    1 +
>  .../platform/verisilicon/rockchip_vpu_hw.c    |   23 +-
>  .../platform/verisilicon/stm32mp25_venc_hw.c  |   35 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |   13 +
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    5 +
>  include/media/v4l2-ctrls.h                    |    2 +
>  include/uapi/linux/v4l2-controls.h            |   91 +
>  include/uapi/linux/videodev2.h                |    3 +
>  20 files changed, 3755 insertions(+), 28 deletions(-)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_boolenc.c
>  create mode 100644 drivers/media/platform/verisilicon/hantro_boolenc.h
>  create mode 100644 drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
>  create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu2_hw_v=
p8_enc.c
>=20
> --=20
> 2.25.1
>=20

--Ia4S0Q4OBDpOeXiU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZR6XHgAKCRB4tDGHoIJi
0sjvAP0ZC5KOCGnycz1ccSYrmARfxdHqtXmmmQJpUOyX3kDeCwD/Q0VKIfCKL28d
bB3btsN54UkoHILpiUtId0zm3X7Q6gU=
=90H2
-----END PGP SIGNATURE-----

--Ia4S0Q4OBDpOeXiU--

--===============1247261396933468905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1247261396933468905==--
