Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4D6A220A1
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 16:41:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3DB4C78034;
	Wed, 29 Jan 2025 15:41:56 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5635C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 15:41:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 41033A41A78;
 Wed, 29 Jan 2025 15:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0D5C4CED1;
 Wed, 29 Jan 2025 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738165308;
 bh=x9FQ10F4P9ene0avOkX6SJRwE4duJpiylNTvH2FHki0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Doq+/rNzHg+crI9ZcWtKePHsQc6DCfqlblaynmX5rkNKoSR8aoRtfLCo8hlplQT8S
 SszLnZ7/buZh6jfPwyw7MFwtzbCqliYr1x8R26ffuKILIzG4Dcrlo2vauyEx+ZCa7Q
 fGMA+W95aCCNzgyEj0Sl5Hjc6GbfuxBPEg/1VR+9jrU8RajCzwLijwt9d05XfTVIdU
 pXcYBPgl+if4aDVy8x6uvii+g9qXvXmGsdU6tc8eW1deajAWLklzKK93vVc7zEKfTM
 LfkYLXOkbdJxFMvmKe1KH7TkEg/csOuMkrEGGxXdWVtbhKJsIm3GZwQaznV1b1oyxx
 udzvX+QKPoOSw==
Date: Wed, 29 Jan 2025 16:41:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Message-ID: <fkck6okku766yn4bpfbiykpvvsj5k7tgebko7pvybon3rctn7w@gkl5z2o3bcf2>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-7-0d1609a29587@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250128-cocci-memory-api-v1-7-0d1609a29587@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH 07/14] drm/rockchip: move to
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
Content-Type: multipart/mixed; boundary="===============4440020286389050800=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4440020286389050800==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="n2rj4zmziwj6lmg7"
Content-Disposition: inline


--n2rj4zmziwj6lmg7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 07/14] drm/rockchip: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 05:29:31PM -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource(pdev,...);
> -ioremap_res =3D devm_ioremap_resource(...);
> +ioremap_res =3D devm_platform_ioremap_resource(pdev,0);
>=20
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Heiko St=FCbner <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_vop.c
> index 57747f1cff26e444ef3569983d6a7f7922f03ff7..4c639f7c868907fc35ce22f2e=
f7e281ad85c2d9e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -2187,7 +2187,6 @@ static int vop_bind(struct device *dev, struct devi=
ce *master, void *data)
>  	const struct vop_data *vop_data;
>  	struct drm_device *drm_dev =3D data;
>  	struct vop *vop;
> -	struct resource *res;
>  	int ret, irq;
> =20
>  	vop_data =3D of_device_get_match_data(dev);
> @@ -2207,8 +2206,7 @@ static int vop_bind(struct device *dev, struct devi=
ce *master, void *data)
> =20
>  	vop_win_init(vop);
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	vop->regs =3D devm_ioremap_resource(dev, res);
> +	vop->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(vop->regs))
>  		return PTR_ERR(vop->regs);
>  	vop->len =3D resource_size(res);

This one will result in a compile failure too, you removed res but it's
still used on the last line.

Maxime

--n2rj4zmziwj6lmg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5pMOAAKCRAnX84Zoj2+
dm9sAX95MxW28qLtlCcTTmdQkMrfL23sMFhwLQtAuxzLU6cNJTr4Laq62TyMz0tE
fkKBU/cBgOoSJ8YDN8x0kWdfzBz+S1fj4kdxPGLwpdkIMLxH7u1CgpGzqotO9jni
7iTsYM6fhw==
=I0Jf
-----END PGP SIGNATURE-----

--n2rj4zmziwj6lmg7--

--===============4440020286389050800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4440020286389050800==--
