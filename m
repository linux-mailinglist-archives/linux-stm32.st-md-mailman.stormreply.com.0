Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2119A2AD61
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 17:13:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47D4DC78F86;
	Thu,  6 Feb 2025 16:13:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55795C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 16:13:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23F095C64A4;
 Thu,  6 Feb 2025 16:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07F8C4CEDD;
 Thu,  6 Feb 2025 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738858425;
 bh=yugtap81E+1XEiUSlot9N/ao/3tXx/zIxbLqkf5yQ2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dYCFPFSLLiDASvYd4s42uud1DtC2OYpyDgEeLT35r+DrvE2jij76XmTWQ9G67IkkY
 GXlKlZixxwv1mXchRyKAC2XLHInGz7nXltb/sepWggEKQB2TlbKf/zl7RmfFuI/bgH
 POQtLfiwx3vOBe+qHPtYDAHCNvMvnzxOt413CP2Ky6rkPlhy2ILdMwAJlRvRLqD0vj
 Zr7POyxFiXm5+iQmgkdVq1+ZtMEZUnmtN8vK+HRSG+ejF6wz2rbhMHSIENz/QYTel5
 LTPtPbUTgV8Ae2h5Vlge1PtDZVU6vqHxlAMGJQmuO06gQkxOszYi8GtT6wvI2wkZns
 f+nG5+ZFP0G5A==
Date: Thu, 6 Feb 2025 17:13:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Message-ID: <20250206-hallowed-ultra-tiger-cfec8e@houat>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
Cc: imx@lists.linux.dev, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Simona Vetter <simona@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Fabio Estevam <festevam@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Tian Tao <tiantao6@hisilicon.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 11/12] drm/vc4: move to
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
Content-Type: multipart/mixed; boundary="===============2292274292804526704=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2292274292804526704==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nds2ddkwji5fimma"
Content-Disposition: inline


--nds2ddkwji5fimma
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 03:08:07PM -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource_byname + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> //rule s/(devm_)platform_get_resource_byname +
> //(devm_)ioremap/devm_platform_ioremap_resource.
> @rule_3@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> <+...
> -res =3D platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap =3D devm_ioremap(...);
> +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> ...+>
>=20
> v2: Change the SmPl patch to work on multiple occurences of
> the pattern. This also fixes the compilation error.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Ma=EDra Canal <mcanal@igalia.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 55 +++++++++++-------------------------=
------
>  1 file changed, 14 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845b0c=
573d80ce7c88595 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct drm_dev=
ice *drm,
>  {
>  	struct platform_device *pdev =3D vc4_hdmi->pdev;
>  	struct device *dev =3D &pdev->dev;
> -	struct resource *res;
>  	int ret;
> =20
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi");
> -	if (!res)
> -		return -ENODEV;
> -
> -	vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> -					       resource_size(res));
> +	vc4_hdmi->hdmicore_regs =3D devm_platform_ioremap_resource_byname(pdev,
> +									"hdmi");
>  	if (!vc4_hdmi->hdmicore_regs)
>  		return -ENOMEM;
> =20
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
> -	if (!res)
> -		return -ENODEV;
> -
> -	vc4_hdmi->hd_regs =3D devm_ioremap(dev, res->start, resource_size(res));
> +	vc4_hdmi->hd_regs =3D devm_platform_ioremap_resource_byname(pdev, "hd");
>  	if (!vc4_hdmi->hd_regs)
>  		return -ENOMEM;

I *think* that one is shared between both HDMI controllers on the
RaspberryPi4, so we can't claim them from both instances. We should add
a comment there to document that it's on purpose.

The rest looks good.

Maxime

--nds2ddkwji5fimma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6TftgAKCRAnX84Zoj2+
drfXAYDBINKHBSckIuo/kq/HoUvq16io0SUMaLB/CVkeidnE3EXaDz9M3WhZ60Ha
n8d4HmABf0i2bHqp4iPr3Cr3YiSEnV9zX0sFLdFl/FejJMglsT19c+7lwsGMwuaH
8nnPGZ1q6A==
=1kXI
-----END PGP SIGNATURE-----

--nds2ddkwji5fimma--

--===============2292274292804526704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2292274292804526704==--
