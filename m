Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4DA35A8F
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 10:44:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96781C78F8D;
	Fri, 14 Feb 2025 09:44:10 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12154C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 09:44:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 334F5A42555;
 Fri, 14 Feb 2025 09:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C057C4CED1;
 Fri, 14 Feb 2025 09:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739526247;
 bh=euxH5xTB3npndNEOhGf9KR+p/1GlHm5dq8S6R5vtFvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QKgThIZQsDXvHi250nXVACftNulY+hDA56lG4gV0mWDqpQmEI/IeByxEkZ30VumCF
 L+r2W1g/8OTElc/khx4mIaSFrKtauo7k7wzOS5jT9SBbtUlYjgOkI86coP9+s3NYwT
 y3Pkf0q3FPGmXw9gDN2jBCwdfFjlwHIM6NMKxRNfAHvOj6MfdWa4J64sZrCZ+2mWp8
 rvLAPOGA4lz6JczHmcz0aTOHczOZk73pBCHAN90DCEiXiuHnMIe8lrWw5JBzcFdPvS
 NBKHdwztH01NncybK/yA9xE55/oALEeW+VtQObpTVt07tlkncpFvbP/wa1DsJj+6au
 giWDWVolgoUpA==
Date: Fri, 14 Feb 2025 10:44:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Message-ID: <20250214-quixotic-fossa-of-art-b8bb9f@houat>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
 <20250206-hallowed-ultra-tiger-cfec8e@houat>
 <CAN9Xe3SpTG7r2UkN7_pH0uMXhU5u+dkWhaM9+w5VyOQZp9byNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN9Xe3SpTG7r2UkN7_pH0uMXhU5u+dkWhaM9+w5VyOQZp9byNg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4160609428407695613=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4160609428407695613==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="tmymxs4x7znmvcxa"
Content-Disposition: inline


--tmymxs4x7znmvcxa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
MIME-Version: 1.0

On Tue, Feb 11, 2025 at 12:08:57PM -0500, Anusha Srivatsa wrote:
> On Thu, Feb 6, 2025 at 11:13=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
>=20
> > On Wed, Feb 05, 2025 at 03:08:07PM -0500, Anusha Srivatsa wrote:
> > > Replace platform_get_resource_byname + devm_ioremap_resource
> > > with just devm_platform_ioremap_resource()
> > >
> > > Used Coccinelle to do this change. SmPl patch:
> > > //rule s/(devm_)platform_get_resource_byname +
> > > //(devm_)ioremap/devm_platform_ioremap_resource.
> > > @rule_3@
> > > identifier res;
> > > expression ioremap;
> > > identifier pdev;
> > > constant mem;
> > > expression name;
> > > @@
> > > -struct resource *res;
> > > <+...
> > > -res =3D platform_get_resource_byname(pdev,mem,name);
> > > <...
> > > -if (!res) {
> > > -...
> > > -}
> > > ...>
> > > -ioremap =3D devm_ioremap(...);
> > > +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> > > ...+>
> > >
> > > v2: Change the SmPl patch to work on multiple occurences of
> > > the pattern. This also fixes the compilation error.
> > >
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Cc: Ma=C3=ADra Canal <mcanal@igalia.com>
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 55
> > +++++++++++-------------------------------
> > >  1 file changed, 14 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index
> > 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845b0c573d=
80ce7c88595
> > 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct
> > drm_device *drm,
> > >  {
> > >       struct platform_device *pdev =3D vc4_hdmi->pdev;
> > >       struct device *dev =3D &pdev->dev;
> > > -     struct resource *res;
> > >       int ret;
> > >
> > > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdm=
i");
> > > -     if (!res)
> > > -             return -ENODEV;
> > > -
> > > -     vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> > > -                                            resource_size(res));
> > > +     vc4_hdmi->hdmicore_regs =3D
> > devm_platform_ioremap_resource_byname(pdev,
> > > +
> >  "hdmi");
> > >       if (!vc4_hdmi->hdmicore_regs)
> > >               return -ENOMEM;
> > >
> > > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd"=
);
> > > -     if (!res)
> > > -             return -ENODEV;
> > > -
> > > -     vc4_hdmi->hd_regs =3D devm_ioremap(dev, res->start,
> > resource_size(res));
> > > +     vc4_hdmi->hd_regs =3D devm_platform_ioremap_resource_byname(pde=
v,
> > "hd");
> > >       if (!vc4_hdmi->hd_regs)
> > >               return -ENOMEM;
> >
> > I *think* that one is shared between both HDMI controllers on the
> > RaspberryPi4, so we can't claim them from both instances. We should add
> > a comment there to document that it's on purpose.
>
> How about vc4_hdmi->hdmicore_regs? It also has another instance
> vc4_hdmi_init_resources(). Looks like that also doesnt need any converting
> and shold be left as is.

No, each controller will have its own set of registers there, so it can
be converted.

Maxime

--tmymxs4x7znmvcxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ68QXwAKCRAnX84Zoj2+
dnJFAX44qxSqH4/9r1lPWe6YsBKR9clH1sZQRZaWBdRICp0iE+/MJiNA/tJghQgy
Xb2262kBgMGvJFpuBmHvz9HJegWf00i39I2+ctkME/qrOcHQhoIwF07ezVrQyZOZ
z9Q+kadHOg==
=d/Gf
-----END PGP SIGNATURE-----

--tmymxs4x7znmvcxa--

--===============4160609428407695613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4160609428407695613==--
