Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A0AA48B7
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 12:39:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D6FAC78F98;
	Wed, 30 Apr 2025 10:39:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFBE0C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 10:39:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E379168430;
 Wed, 30 Apr 2025 10:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B910BC4CEE9;
 Wed, 30 Apr 2025 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746009560;
 bh=pa/oq7Iq9DFQzLAcYNPUeUzLf26wbsIriyzXBSer2gM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ba2+wqLpY4w4Dwob5uYJx95CKmUelGELftsNTS3eHspzZ58Ikjl7LtL2k/WEVojg3
 6RNboZgAoPsRSceBSrJQ4gI0KI+kLh/x/+zVe369vcEYvsrJcpw+MaLGq1dvO0dhzT
 UXRNIHNfOndCAVL8bp8Vk+mUt5Z7AOA9GNYnov13fOSdNL5ZdZ+HunWP8UpY2BZFVS
 kcUcVI8My66bOlI48dIaW0RnArzM3AEdSf4RJwXFrBtI9GNBMwHbLfcRwpMdomOayN
 rqMkzFB+G2QvvC7JpYRvfRaEQX3MjkSQYncUy0phaJL6pWidajSYs2KXlz01S2iNTQ
 1tZFXEK+iUgRg==
Date: Wed, 30 Apr 2025 12:39:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Message-ID: <20250430-scorpion-of-majestic-argument-7f59b4@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
 <sdiwpe7nnhud3fvkgijjbfyenlwpchbxgehyxmsy7c5loo257h@hkfcawkjrlhd>
 <efcf3798-9ac1-42a7-8a12-24d931cbf771@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <efcf3798-9ac1-42a7-8a12-24d931cbf771@bootlin.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Herve Codina <herve.codina@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Adam Ford <aford173@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Jani Nikula <jani.nikula@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Pin-yen Lin <treapking@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Phong LE <ple@baylibre.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Guenter Roeck <groeck@chromium.org>, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Fabio Estevam <festevam@gmail.com>,
 Helge Deller <deller@gmx.de>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 Ian Ray <ian.ray@ge.com>, Dharma Balasubiramani <dharma.b@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Kevin Hilman <khilman@baylibre.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 imx@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Vitalii Mordan <mordan@ispras.ru>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Benson Leung <bleung@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>, Aleksandr Mishin <amishin@t-argos.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Janne Grunau <j@jannau.net>, Russell King <linux@armlinux.org.uk>,
 "Rob Herring \(Arm\)" <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [Linux-stm32] (subset) [PATCH v2 00/34] drm: convert all
 bridges to devm_drm_bridge_alloc()
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
Content-Type: multipart/mixed; boundary="===============5570452536066510785=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5570452536066510785==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="n3uft3wwvexxpcog"
Content-Disposition: inline


--n3uft3wwvexxpcog
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Wed, Apr 30, 2025 at 10:21:48AM +0200, Louis Chauvet wrote:
>=20
>=20
> Le 29/04/2025 =E0 16:42, Dmitry Baryshkov a =E9crit=A0:
> > On Tue, Apr 29, 2025 at 11:27:51AM +0200, Louis Chauvet wrote:
> > >=20
> > > On Thu, 24 Apr 2025 20:59:07 +0200, Luca Ceresoli wrote:
> > > > devm_drm_bridge_alloc() [0] is the new API to allocate and initiali=
ze a DRM
> > > > bridge, and the only one supported from now on. It is also necessar=
y for
> > > > implementing reference counting and thus needed to support removal =
of
> > > > bridges from a still existing DRM pipeline without use-after-free.
> > > >=20
> > > > This series converts all DRM bridges to the new API.
> > > >=20
> > > > [...]
> > >=20
> > > Applied, thanks!
> > >=20
> >=20
> > [...]
> >=20
> > > [16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
> > >          commit: b2aabe5c6b65516d88214aba4b12ce2ca78bac6c
> > > [17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
> > >          commit: fffc8847743e45604c4478f554d628481b985556
> > > [18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
> > >          commit: e11532be87e437648521a8ed5358c56df11933b4
> >=20
> > Why? These drivers are explicitly handled outside of drm-misc. Please be
> > more careful next time.
> >=20
>=20
> Sorry, I was not aware that msm also have his own repository.
>=20
> TBH, I was not aware that other repositories existed for drm (I should ha=
ve
> looked at MAINTAINERS, it is totally my fault). DIM and doc[1] only list
> drm, drm-misc, drm-xe, drm-intel, so I just tough "intel is special", not
> "drm is divided in many repositories".

It's mentioned in the drm-misc section:

https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-misc.ht=
ml

> This repository consists mostly of the core drm code as well as DRM
> drivers that do not have a dedicated repository.

Feel free to send a patch to improve the doc. If you missed it, someone
else will.

Maxime

--n3uft3wwvexxpcog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBH91QAKCRAnX84Zoj2+
dtaAAYD+vw3ijG0Npi7DNS7E4rH/Y/pmL5jn26rshJDKKon86xXDKPf7qxcxUMUk
GcIwPpABfiK4x23dgB5GWaHnby7RQQrps8EcAVNJ5CjGxA14hgs3XZLzSy+6xbQn
WiWn0Tn6mA==
=/a61
-----END PGP SIGNATURE-----

--n3uft3wwvexxpcog--

--===============5570452536066510785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5570452536066510785==--
