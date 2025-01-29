Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEA0A22095
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 16:40:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B701AC78034;
	Wed, 29 Jan 2025 15:40:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7EECC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 15:40:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9307C5C5DC1;
 Wed, 29 Jan 2025 15:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770ABC4CED3;
 Wed, 29 Jan 2025 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738165245;
 bh=rtnZjFO/UfiH1j0rluxhcjeVmz12h1zDXZJJ3+0MvRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZM+cZRtiXnmi0hHc4n40eYcHanFML/aIc6MX0XZhPdogHoKUulxVjPXm6RULnPVkC
 iX8Qospo0x/ND4+0f525c7Zu8xxc7Daz/PjoUL8HDbN4/QMLPeR65aHCueaEp1uWIU
 DurPDhK4SIaKCpip8GwEy8LkumP3/EdZeVc0QSWZOObMvQAc45nvMv2WpqBGHp6RxU
 EYpA95fiVbOw32agYO2Sfqvb3U5f/ACokeGKatfzJ+LRaXLQdUYJ/gCmPWhPOAFOAp
 Zr7OInp3vF/BKz0JLCt0vxcL0M2B+OHTkOofX3sauEdMMjc3170klpqg28aRYRHFvC
 +wc9LrlSw92yQ==
Date: Wed, 29 Jan 2025 16:40:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Message-ID: <ieknc4dm5ntnqaqz6zdlinphocm2omsn4ll34vlbrohqcddl43@kg35irldnkuw>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-5-0d1609a29587@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250128-cocci-memory-api-v1-5-0d1609a29587@redhat.com>
Cc: imx@lists.linux.dev, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Tian Tao <tiantao6@hisilicon.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 05/14] drm/meson: move to
 devm_platform_ioremap_resource() usage
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
Content-Type: multipart/mixed; boundary="===============0458470140829008812=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0458470140829008812==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wmuf2lutfjid5aqu"
Content-Disposition: inline


--wmuf2lutfjid5aqu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 05/14] drm/meson: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 05:29:29PM -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource_byname + devm_ioremap
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> @rule_3@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap =3D devm_ioremap(...);
> +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
>=20
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 81d2ee37e7732dca89d02347b9c972300b38771a..6c805805b7a7f675f8bb03944=
318972eb4df864e 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -184,7 +184,6 @@ static int meson_drv_bind_master(struct device *dev, =
bool has_components)
>  	const struct meson_drm_match_data *match;
>  	struct meson_drm *priv;
>  	struct drm_device *drm;
> -	struct resource *res;
>  	void __iomem *regs;
>  	int ret, i;
> =20
> @@ -220,14 +219,8 @@ static int meson_drv_bind_master(struct device *dev,=
 bool has_components)
>  	}
> =20
>  	priv->io_base =3D regs;
> -
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
> -	if (!res) {
> -		ret =3D -EINVAL;
> -		goto free_drm;
> -	}
>  	/* Simply ioremap since it may be a shared register zone */
> -	regs =3D devm_ioremap(dev, res->start, resource_size(res));
> +	regs =3D devm_platform_ioremap_resource_byname(pdev, "hhi");

Given the comment, this one should probably be skipped.

Maxime

--wmuf2lutfjid5aqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5pL+QAKCRAnX84Zoj2+
dpWQAYDuVxaraj2eKojNueyW+NChDy3YtnstWS0E/hE4JNegqss7vQXSWOthuO4R
73qWnq0BfRFtK3i2Os+sXuDOS+LkWHx5AsRtEcQCCeX0wT3sQVfWN3Edu+Ky/NDa
3DmrzReHUw==
=Tstn
-----END PGP SIGNATURE-----

--wmuf2lutfjid5aqu--

--===============0458470140829008812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0458470140829008812==--
