Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB099AC0F04
	for <lists+linux-stm32@lfdr.de>; Thu, 22 May 2025 16:57:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51578C7A826;
	Thu, 22 May 2025 14:57:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AA75C7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 14:57:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8BA2C5C5D5C;
 Thu, 22 May 2025 14:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3816C4CEEA;
 Thu, 22 May 2025 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747925853;
 bh=5G+CU34zmKz9PE5a5J7jN90cu5Gxk5UtkArIIi8NlfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s3wma8DglmgLQ+hMVFjvtfjc4AGN1CkhvK3aJgPdEeop7ZdSKHWrh+jFnDK9fS1Bt
 k4DPjLZirixi4RiNSCPaqTeQgbbYCGh34naxvV1r976lLS74g+aZn2NIJWPxU9Bk2h
 5lhBFpwnMYqpXLlbfQyJNLBIPkBOwrbgXjydFtJry7hB5vIcXzHiBLTIOBsTw60ofP
 Sbe3oHlRv+SrSkLUAyO4OvF2SWUXfIQoAWSdBVx6gLBXEtHN69lIJ+ngwI0pTb/j5i
 982RPFTGUmNJf2N7qI0n6pT07RfEnvluDICTfTYoG8Smrgr1WlqJE6p9LO4kvWBltm
 OmAchw1yswU2w==
Date: Thu, 22 May 2025 16:57:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20250522-amphibian-shiny-chachalaca-cf05ba@houat>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
MIME-Version: 1.0
In-Reply-To: <20250521162216.79dd3290@booty>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Adam Ford <aford173@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Inki Dae <inki.dae@samsung.com>, Pin-yen Lin <treapking@chromium.org>,
 Ian Ray <ian.ray@gehealthcare.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Phong LE <ple@baylibre.com>, Christoph Fritz <chf.fritz@googlemail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org, Martyn Welch <martyn.welch@collabora.co.uk>,
 linux-doc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Aradhya Bhatia <a-bhatia1@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Helge Deller <deller@gmx.de>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Liu Ying <victor.liu@nxp.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-amlogic@lists.infradead.org, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Andy Yan <andy.yan@rock-chips.com>,
 imx@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Vitalii Mordan <mordan@ispras.ru>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Benson Leung <bleung@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>, Aleksandr Mishin <amishin@t-argos.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Janne Grunau <j@jannau.net>, "Rob Herring \(Arm\)" <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
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
Content-Type: multipart/mixed; boundary="===============1741533664307003565=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1741533664307003565==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fe7madz4h5tk5u3n"
Content-Disposition: inline


--fe7madz4h5tk5u3n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Wed, May 21, 2025 at 04:22:16PM +0200, Luca Ceresoli wrote:
> Hello Maxime, Shawn, Liu, all,
>=20
> On Fri, 09 May 2025 15:53:26 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>=20
> > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a=
 DRM
> > bridge, and the only one supported from now on. It is the first milesto=
ne
> > towards removal of bridges from a still existing DRM pipeline without
> > use-after-free.
>=20
> I applied on drm-misc-next patches 3-17,20-21 as they match all the
> criteria:
>  - At least a Acked-by (or R-by maintainers)
>  - patch is for drm-misc
>=20
> Being my very first commits to drm-misc, I tried to be careful, and
> double checked all the patches with Louis (thanks!).
>=20
> Here are the pending questions and plan for the remaining patches.
>=20
> >       Revert "drm/exynos: mic: convert to devm_drm_bridge_alloc() API"
>=20
> This reverts the commit applied my mistake:
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91c5c7b5bb2dd09b4=
3b025bce6d790d3c79f4518
>=20
> Neither the  original patch nor the revert has been reviewed/acked.
>=20
> As the commit was a mistake, I'm applying the revert by the end of this
> week (i.e. on Friday) unless there are better instructions.

Given the lack of answers, and that it looks correct to me, just leave
it there. We can always revert later on if things turned out to be
broken.

> >       drm: convert many bridge drivers from devm_kzalloc() to devm_drm_=
bridge_alloc() API
>=20
> This patch affects multiple drivers. Running get_maintainers.pl
> points at Shawn Guo's repository. After reviewing the MAINTAINERS file,
> this looks like due to the 'N:' line in:
>=20
> ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> M:	Shawn Guo <shawnguo@kernel.org>
> M:	Sascha Hauer <s.hauer@pengutronix.de>
> R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> ...
> T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> N:	imx
> ...
>=20
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAIN=
TAINERS?ref_type=3Dheads#L2511-2528)
>=20
> Here 'imx' matches the 'drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c'
> file that is touched by the patch. That regexp appears overly generic to =
me.

I agree, or at least, we shouldn't wait for Shawn or Sasha...

> Shawn, can it be fixed by making it less generic?
>=20
> If not, can we at least add a band-aid 'X:' entry for
> drivers/gpu/drm/bridge/imx?
>=20
> I think the other matching entry is the one to consider:
>=20
> DRM DRIVERS FOR FREESCALE IMX BRIDGE
> M:	Liu Ying <victor.liu@nxp.com>
> L:	dri-devel@lists.freedesktop.org
> S:	Maintained
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-com=
biner.yaml
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-lin=
k.yaml
> F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.y=
aml
> F:	drivers/gpu/drm/bridge/imx/
>=20
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAIN=
TAINERS?ref_type=3Dheads#L7940-7948)

=2E.. As long as Ying is fine with it, because it does look like they are
the actual maintainer.

> However it does not list any trees. I _guess_ drm-misc applies here as
> a fallback as well as common sense.
>=20
> Liu, should this entry have a 'T:' line for drm/misc?
>=20
> >       drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_al=
loc() API
>=20
> Not acked/reviewed, some discussion happened. I am resending it in v4,
> possibly with updates based on the discussion.
>=20
> But it has the same issue discussed above, with get_maintiners.pl
> pointing at Shawn Guo's tree, so in the future I'm assuming this goes
> to drm-misc unless there are news about that.
>=20
> >       drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
>=20
> No feedback, resending in v4.
>=20
> >       drm/todo: add entry to remove devm_drm_put_bridge()
>=20
> This involves documentation maintained on another tree. Where should it
> be applied? There are two matching entries in MAINTAINERS:
>=20
>  * DRM DRIVERS -> the drm tree
>  * DRM DRIVERS AND MISC GPU PATCHES -> the drm-misc tree
>=20
> To me it looks like the second is obviously the closest match as we are
> dealing with DRM bridges, so I'm applying this as well on Friday unless
> there are better instructions.

Yes, they should be applied to drm-misc.

That being said, putting a two days timeout on *any* email is really
over-the-top. I doubt you reply to any of your mail in such a short
timeframe. We have rules for a reason, I'd expect you to follow them, no
matter how frustrating the lack of answers can be.

Maxime

--fe7madz4h5tk5u3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC87WgAKCRAnX84Zoj2+
do0iAYDmirWaXC3jRPAWe+k6egrSRuRKSb9T+TBMm48WnW6SNhJrwyOYhX8DpsOL
IHaDlR4BfiFZ6a345YL/OKfebcrONxA8UY50Y3/kmzH9OdWsvkfvJSWcHiCEeu26
nklxCgQuzA==
=mXOq
-----END PGP SIGNATURE-----

--fe7madz4h5tk5u3n--

--===============1741533664307003565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1741533664307003565==--
