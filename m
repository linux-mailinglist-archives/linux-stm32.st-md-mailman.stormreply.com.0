Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B208BC6465
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 20:24:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA668C555A9;
	Wed,  8 Oct 2025 18:24:40 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5330AC5558A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759947878;
 bh=RsqMaJC2iID86BNt1juQ80CEq7yoPe8omJ1X2/PwyHw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=bzSgeTZ3E18DyQkDMnSOfYGpMjtoDFZvvo78LBcjUURbElc4ao00lQH9dYuLOZcqU
 JOxb9e347HFhmvKnjDQIMW3q+OSgVHHIJeTQApfGf76L3wrNwEroinPW2bX1EgIYaW
 W86Yw0pFFcXTsQJ5wyp/dieERtH9/meTkf4zdErkfhdxcKU8P/1UIgKDgPp3+96K1q
 yiQfkGFa2KgTuYf1O8MY5rgsE2USEndGBW+gejfCS344Q+DbhA0Kmo2OX4N4R6BEG0
 PSQxfjQER6VYl8eX2q7QP10sAM0FXCyxrwOpCDdhZQfXE8Q3qcJxCTbveFWheB/t6y
 jd3kzJwO68jOg==
Received: from [IPv6:2606:6d00:17:ebd3::c41] (unknown
 [IPv6:2606:6d00:17:ebd3::c41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nicolas)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FB3517E0579;
 Wed,  8 Oct 2025 20:24:32 +0200 (CEST)
Message-ID: <205478244873d09cad5b77bd887f6a836c31c7ec.camel@collabora.com>
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org
Date: Wed, 08 Oct 2025 14:24:30 -0400
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Heiko Stuebner <heiko@sntech.de>, Devarsh Thakkar <devarsht@ti.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matthew Majewski <mattwmajewski@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bin Liu <bin.liu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Benoit Parrot <bparrot@ti.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Hans Verkuil <hverkuil@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Ming Qian <ming.qian@nxp.com>
Subject: Re: [Linux-stm32] [PATCH 00/25] media: v4l2-mem2mem: Reduce
	cargo-cult
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
Content-Type: multipart/mixed; boundary="===============1265625377636111008=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1265625377636111008==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-LjFEnUafECFwApd/yAvu"


--=-LjFEnUafECFwApd/yAvu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 08 octobre 2025 =C3=A0 20:50 +0300, Laurent Pinchart a =C3=A9cr=
it=C2=A0:
> Hello,
>=20
> The v4l2_m2m_get_vq() function never returns NULL, but many mem2mem
> drivers still check its return value and consider NULL as an error. This
> may have originated a long time ago from valid checks when
> v4l2_m2m_get_vq() could return NULL, with drivers then just copying the
> checks. This series attempts to stop the cargo-cult behaviour.
>=20
> Patch 01/25 starts by explicitly stating in kerneldoc that the
> v4l2_m2m_get_vq() function never returns NULL. All the other patches
> drop NULL checks from drivers.
>=20
> I have carefully checked all patched locations in all drivers. They fall
> in 3 categories:
>=20
> - Checks in the VIDIOC_G_FMT, VIDIOC_TRY_FMT and VIDIOC_S_FMT handlers:
> =C2=A0 Those may have been added to ensure that the format type has a val=
id
> =C2=A0 value, but that is ensured by the V4L2 ioctl core before calling t=
he
> =C2=A0 handlers. The checks can be dropped without a need to replace them
> =C2=A0 with proper type checks.
>=20
> - Checks in the VIDIOC_S_SELECTION handler: The only location where this
> =C2=A0 is performed has an explicit type check, so the NULL check can als=
o be
> =C2=A0 dropped.
>=20
> - Checks in other locations where the type parameter to the
> =C2=A0 v4l2_m2m_get_vq() function is hardcoded: The hardcoded type is val=
id,
> =C2=A0 so the NULL check can't have been meant to check the type. It can =
also
> =C2=A0 be removed.
>=20
> There's no dependency between any of those patches so they can be merged
> in any order.
>=20
> Laurent Pinchart (25):
> =C2=A0 media: v4l2-mem2mem: Document that v4l2_m2m_get_vq() never returns
> =C2=A0=C2=A0=C2=A0 NULL
> =C2=A0 media: allgro-dvt: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: amphion: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: coda: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: imagination: e5010: Drop unneeded v4l2_m2m_get_vq() NULL ch=
eck
> =C2=A0 media: m2m-deinterlace: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: mediatek: jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL chec=
k
> =C2=A0 media: dw100: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: imx-pxp: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: nxp: imx8-isi: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: mx2_emmaprp: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: qcom: iris: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: qcom: venus: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq() NULL check

Why not "renesas: jpu" to match the fdp1 patch naming ?

> =C2=A0 media: platform: rga: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: samsung: s5p-g2d: Drop unneeded v4l2_m2m_get_vq() NULL chec=
k
> =C2=A0 media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL che=
ck
> =C2=A0 media: stm32: dma2d: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: ti: vpe: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: vicodec: Drop unneeded v4l2_m2m_get_vq() NULL check
> =C2=A0 media: vim2m: Drop unneeded v4l2_m2m_get_vq() NULL check

I reviewed the list and it seems complete to me.

Nicolas

>=20
> =C2=A0drivers/media/platform/allegro-dvt/allegro-core.c=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 --
> =C2=A0drivers/media/platform/amlogic/meson-ge2d/ge2d.c=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 5 -----
> =C2=A0drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/media/platform/amphion/venc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0.../media/platform/chips-media/coda/coda-common.c=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ----
> =C2=A0drivers/media/platform/imagination/e5010-jpeg-enc.c=C2=A0 |=C2=A0 4=
 ----
> =C2=A0drivers/media/platform/m2m-deinterlace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 -------
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |=C2=A0 7 ----=
---
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 -------
> =C2=A0.../vcodec/decoder/vdec/vdec_av1_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 --------
> =C2=A0drivers/media/platform/nxp/dw100/dw100.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 -------
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ----
> =C2=A0drivers/media/platform/nxp/imx-pxp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
7 -------
> =C2=A0drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c=C2=A0=C2=A0 |=C2=
=A0 2 --
> =C2=A0drivers/media/platform/nxp/mx2_emmaprp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 -------
> =C2=A0drivers/media/platform/qcom/iris/iris_vdec.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/media/platform/qcom/venus/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/media/platform/qcom/venus/venc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/media/platform/renesas/rcar_fdp1.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ---
> =C2=A0drivers/media/platform/renesas/rcar_jpu.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 --------
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ----
> =C2=A0drivers/media/platform/samsung/s5p-g2d/g2d.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ----
> =C2=A0drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c=C2=A0 |=C2=A0 7=
 -------
> =C2=A0drivers/media/platform/st/stm32/dma2d/dma2d.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 -----
> =C2=A0drivers/media/platform/ti/vpe/vpe.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 7 -------
> =C2=A0drivers/media/test-drivers/vicodec/vicodec-core.c=C2=A0=C2=A0=C2=A0=
 |=C2=A0 7 -------
> =C2=A0drivers/media/test-drivers/vim2m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 12 ------------
> =C2=A0drivers/media/v4l2-core/v4l2-mem2mem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +-----------
> =C2=A0include/media/v4l2-mem2mem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A031 files changed, 4 insertions(+), 153 deletions(-)
>=20
>=20
> base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a

--=-LjFEnUafECFwApd/yAvu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOasXgAKCRDZQZRRKWBy
9F8oAP92tHDSFRd6mdp01gSe1GDFGPRn1q4aOR2d4zEl8W2BoQEAuXK4NGidjdie
sOQmoarDKx/ErFatR3/qQmk9d+ZaGAY=
=Bmyy
-----END PGP SIGNATURE-----

--=-LjFEnUafECFwApd/yAvu--

--===============1265625377636111008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1265625377636111008==--
