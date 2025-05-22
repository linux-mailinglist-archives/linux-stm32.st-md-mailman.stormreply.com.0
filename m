Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFACAC0F43
	for <lists+linux-stm32@lfdr.de>; Thu, 22 May 2025 17:02:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1F00C7A826;
	Thu, 22 May 2025 15:02:02 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20584C7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 15:02:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 148DEA4EB04;
 Thu, 22 May 2025 15:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A09C4CEE4;
 Thu, 22 May 2025 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747926119;
 bh=1AAQm9CHyytzF4+9O6MKBfp9oHP7mXu2dEOCXa+XQ60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oz+QvmtPcLQhIfHb7Dmv2r8M+WiSoRM5qPUWyn0k87l+wT8VAirzhjzTpBW0eGBlb
 UmHr0bWOMyDkznyYF5LwH3teEaFZ1uE9qr6HXEdA+j0uBq3hgFzQ6nt0ZspVQXE85T
 OIIkY81dtcbV0m2gziJg01/r6Y2SIPkamj7M1kl4Hwl0qo9CYgYZTmBxYNa7ftFs4G
 zPja9fq08Kq/yFwJiQQ67CJDZJ1PPEHri6tbgslerK1on4Zw3xOpk7dM39CBPgwm8x
 voI88BFxvrFhvQuMo4HtIGvK0M5a3QE0bAoKlVQx3xcpqnnkL1paG+vNMl/2NKstkd
 Ah2lYGSdfnOWQ==
Date: Thu, 22 May 2025 17:01:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Message-ID: <20250522-eager-cautious-dragon-c09cbe@houat>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
 <36ade269-a590-4243-889c-006f37d9ae6e@nxp.com>
MIME-Version: 1.0
In-Reply-To: <36ade269-a590-4243-889c-006f37d9ae6e@nxp.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Adam Ford <aford173@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Jani Nikula <jani.nikula@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Pin-yen Lin <treapking@chromium.org>, Ian Ray <ian.ray@gehealthcare.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Phong LE <ple@baylibre.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, linux-doc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Aradhya Bhatia <a-bhatia1@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Helge Deller <deller@gmx.de>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
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
 imx@lists.linux.dev, Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 platform-driver-x86@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Vitalii Mordan <mordan@ispras.ru>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============5202006385004572878=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5202006385004572878==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lkfsaolmoihne3h2"
Content-Disposition: inline


--lkfsaolmoihne3h2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Thu, May 22, 2025 at 11:20:17AM +0800, Liu Ying wrote:
> >>       drm: convert many bridge drivers from devm_kzalloc() to devm_drm=
_bridge_alloc() API
> >=20
> > This patch affects multiple drivers. Running get_maintainers.pl
> > points at Shawn Guo's repository. After reviewing the MAINTAINERS file,
> > this looks like due to the 'N:' line in:
> >=20
> > ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> > M:	Shawn Guo <shawnguo@kernel.org>
> > M:	Sascha Hauer <s.hauer@pengutronix.de>
> > R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> > ...
> > T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> > N:	imx
> > ...
> >=20
> > (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MA=
INTAINERS?ref_type=3Dheads#L2511-2528)
> >=20
> > Here 'imx' matches the 'drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c'
> > file that is touched by the patch. That regexp appears overly generic t=
o me.
> >=20
> > Shawn, can it be fixed by making it less generic?
> >=20
> > If not, can we at least add a band-aid 'X:' entry for
> > drivers/gpu/drm/bridge/imx?
> >=20
> > I think the other matching entry is the one to consider:
> >=20
> > DRM DRIVERS FOR FREESCALE IMX BRIDGE
> > M:	Liu Ying <victor.liu@nxp.com>
> > L:	dri-devel@lists.freedesktop.org
> > S:	Maintained
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-c=
ombiner.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-l=
ink.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi=
=2Eyaml
> > F:	drivers/gpu/drm/bridge/imx/
> >=20
> > (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MA=
INTAINERS?ref_type=3Dheads#L7940-7948)
> >=20
> > However it does not list any trees. I _guess_ drm-misc applies here as
> > a fallback as well as common sense.
> >=20
> > Liu, should this entry have a 'T:' line for drm/misc?
>=20
> These bridge drivers also don't have a 'T:' line:
>=20
> DRM DRIVER FOR CHIPONE ICN6211 MIPI-DSI to RGB CONVERTER BRIDGE
> DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
> DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
> DRM DRIVER FOR TI SN65DSI86 BRIDGE CHIP
> LONTIUM LT8912B MIPI TO HDMI BRIDGE
> MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES
> MICROCHIP SAM9x7-COMPATIBLE LVDS CONTROLLER
>=20
> I think that they fallback to drm-misc since "DRM DRIVERS FOR BRIDGE CHIP=
S"
> covers them.  I don't have strong opinion on adding a "T" line to them, at
> least to "DRM DRIVERS FOR FREESCALE IMX BRIDGE".  Anyway, it would be good
> to know comments from maintainers for "DRM DRIVERS FOR BRIDGE CHIPS" and
> "DRM DRIVERS".

That's good enough to me. drivers/gpu/drm/bridge is indeed under the
maintenance of drm-misc and there's no exception afaik.

get_maintainers.pl also properly reports it, so I'm not sure we need to
do anything there.

Maxime

--lkfsaolmoihne3h2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC88ZAAKCRAnX84Zoj2+
djG+AX9azcCjWg3uajj8kpv9U5tIOYfiLFB/+gEceKcg1OKQ4lA85Sy7O401gsKA
sHQZxUMBf0Vj0sOJiWj/u8nCjMwjpC+xsQThFbSdD/ITqF4PFVw2BCwG7J/5XsKx
gWgLGdqwyQ==
=0NYb
-----END PGP SIGNATURE-----

--lkfsaolmoihne3h2--

--===============5202006385004572878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5202006385004572878==--
