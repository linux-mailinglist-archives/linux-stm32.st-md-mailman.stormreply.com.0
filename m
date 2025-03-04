Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3695A4D5AA
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 09:04:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51737C7803D;
	Tue,  4 Mar 2025 08:04:56 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97834C7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 08:04:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52D5EA45302;
 Tue,  4 Mar 2025 07:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCBEC4CEE5;
 Tue,  4 Mar 2025 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741075492;
 bh=vIjLPcUzgSKENXMFoyq8MSR3rL6XCeonIPvrarBTHfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MTMooLPO8Bbb2GKqdM1BuZCtLRVMLpPUiZewyqhTUOANTZEdA7zKLpNVpc2b4+pde
 qLxD1GPfTrr2crKHjmFBRkbsQhLcZE/wIdMSn7xP+K7vJd7ZRJEAH9qDQUxuZcs5kx
 PTy2NgT0nWNSVjrgvdi0A9uofQ0NxTbml1X58f1jrN3deGiad5mCcW/u5Oh/f1kNxH
 WkgVk5ns/TvPqpAEbTVtWOTQmUYqzcBtq42vbowT/RyyDgHhCJdC0cKAvbzxnmEotI
 4k4ylvc9gwaqMoZC+TRzV16b9VRVTbQY41zF+zC/l+py0e6GMwaWsk+QqwNP9zvG1O
 WP0yWgzyy+/YA==
Date: Tue, 4 Mar 2025 09:04:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Message-ID: <20250304-astute-curvy-ladybug-f9ff15@houat>
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
 <20250225-memory-drm-misc-next-v1-7-9d0e8761107a@redhat.com>
 <24958ae8-6153-4798-abeb-e770d66ca8e4@foss.st.com>
 <CAN9Xe3Q8=_Tz51i6gxNM6445p-rhNiK7B5Ljcga8g_Nn676dCQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN9Xe3Q8=_Tz51i6gxNM6445p-rhNiK7B5Ljcga8g_Nn676dCQ@mail.gmail.com>
Cc: imx@lists.linux.dev,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Fabio Estevam <festevam@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Tian Tao <tiantao6@hisilicon.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH RESEND 07/12] drm/sti: move to
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
Content-Type: multipart/mixed; boundary="===============0712768634465400501=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0712768634465400501==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3cvx2hh6lak7gb3g"
Content-Disposition: inline


--3cvx2hh6lak7gb3g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND 07/12] drm/sti: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0

On Mon, Mar 03, 2025 at 12:29:19PM -0500, Anusha Srivatsa wrote:
> On Wed, Feb 26, 2025 at 5:19=E2=80=AFAM Raphael Gallais-Pou <
> raphael.gallais-pou@foss.st.com> wrote:
>=20
> >
> > On 2/25/25 23:20, Anusha Srivatsa wrote:
> > > Replace platform_get_resource/_byname + devm_ioremap
> > > with just devm_platform_ioremap_resource()
> > >
> > > Used Coccinelle to do this change. SmPl patch:
> > >
> > > @rule@
> > > identifier res;
> > > expression ioremap;
> > > identifier pdev;
> > > constant mem;
> > > expression name;
> > > @@
> > > -struct resource *res;
> > > ...
> > > -res =3D platform_get_resource_byname(pdev,mem,name);
> > > <...
> > > -if (!res) {
> > > -...
> > > -}
> > > ...>
> > > -ioremap =3D devm_ioremap(...);
> > > +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> > >
> > > and
> > > @rule_2@
> > > identifier res;
> > > expression ioremap;
> > > identifier pdev;
> > > @@
> > > -struct resource *res;
> > > ...
> > > -res =3D platform_get_resource(pdev,...);
> > > <...
> > > -if (!res) {
> > > -...
> > > -}
> > > ...>
> > > -ioremap =3D devm_ioremap(...);
> > > +ioremap =3D devm_platform_ioremap_resource(pdev,0);
> > >
> > > v2: Fix compilation error.
> >
> >
> > Hi Anusha,
> >
> >
> > You did not take into account my comment regarding the changelog. :-)
> >
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
commentary
> >
> > While the commit summary do not specify the version, this changelog
> > suggests
> > that the version of your series as been incremented.
> > If this is a v2, then a version descriptor should be applied to the
> > patchset.
> >
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
subject-line
> >
> > Hi  Raphael,
>=20
> That is correct. While this patch is a v2, there is another patch or two =
in
> the same series that is on v4 when it got acked and reviewed. Having
> patches belonging to the same series with different version prefixes seem=
ed
> odd when I sent the series. Hence added what exactly changed in the commit
> log.

This breaks a lot of tools though. If your series changes, you need to
increase the version number, no matter how small or insignificant it
changed compared to the previous one. resend is only meant to be used
when you send the exact same series.

Maxime

--3cvx2hh6lak7gb3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8a0GwAKCRAnX84Zoj2+
dvPAAX0T6CB5j6he9IlacsjKLYZXt0M1IhAKVugJHAC1WHuswlCAJSgEyELEpzS1
ddcuQ7kBf3wXscEAe3lhr3vk0F2KVEj4r8JtBnUwxNM0o1E63auMQV7dNPG5Z5Ku
4gxKbq/wJQ==
=hPVI
-----END PGP SIGNATURE-----

--3cvx2hh6lak7gb3g--

--===============0712768634465400501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0712768634465400501==--
