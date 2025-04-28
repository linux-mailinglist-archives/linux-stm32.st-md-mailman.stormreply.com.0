Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E906EA9F4C3
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 17:42:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A436C78011;
	Mon, 28 Apr 2025 15:42:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69754C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 15:42:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECD3343873;
 Mon, 28 Apr 2025 15:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEECBC4CEE4;
 Mon, 28 Apr 2025 15:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745854969;
 bh=v1wxPJqJwcRBd+Zf9DhXdrSlgaAgxRvLpZcQSS65jKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pu+kSF+BladpeWcXiuiENFdFn46ujOtJFltyRXiwYjBEcQIbAkLc0J1YCDGvMzbqY
 S73DdgdDQdz2n6gaLUsVTaplCP+E84bCG5dmhdsDfDXy1WCTrvRLp2frlKVbKUtcYU
 p/7d+fKwIZReS0i5+txm3aiNrIs6Z4iNCG37cuj7LKmo6MbMLwBGOUGHNDkY6opwsk
 4p4IWycnZP+a6DYdHrMKljYfQVBj36+gENfIFSO2IHFhUFAjuW9KovC+UDDdm36qWO
 iQkg18SHzakolr2QfubyS7cW/AnEAqdsocrmBM4+o4gP+Vt1vHbjGPGfb4uPxz67E+
 21ywqGpVUibhA==
Date: Mon, 28 Apr 2025 17:42:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20250428-colossal-fiery-alpaca-8c5fee@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250428172457.23e23df5@booty>
MIME-Version: 1.0
In-Reply-To: <20250428172457.23e23df5@booty>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Herve Codina <herve.codina@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Adam Ford <aford173@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Inki Dae <inki.dae@samsung.com>, Pin-yen Lin <treapking@chromium.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Phong LE <ple@baylibre.com>, Christoph Fritz <chf.fritz@googlemail.com>,
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
 linux-amlogic@lists.infradead.org, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
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
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Benson Leung <bleung@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Aleksandr Mishin <amishin@t-argos.ru>,
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
 Yannick Fertre <yannick.fertre@foss.st.com>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
Subject: Re: [Linux-stm32] [PATCH v2 00/34] drm: convert all bridges to
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
Content-Type: multipart/mixed; boundary="===============9026292076446238242=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============9026292076446238242==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="2raebolozc6scwuc"
Content-Disposition: inline


--2raebolozc6scwuc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 05:24:57PM +0200, Luca Ceresoli wrote:
> Hi Maxime, other DRM maintainers,
>=20
> On Thu, 24 Apr 2025 20:59:07 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>=20
> > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a=
 DRM
> > bridge, and the only one supported from now on. It is also necessary for
> > implementing reference counting and thus needed to support removal of
> > bridges from a still existing DRM pipeline without use-after-free.
> >=20
> > This series converts all DRM bridges to the new API.
> >=20
> > Patch 1 uses a coccinelle semantic patch to mass-convert some of those
> > drivers -- thanks Maxime for having suggested the patch that served as a
> > starting point for me. I was unable to come up with a better patch
> > converting more drivers though, so I converted all others manually. Mos=
t of
> > them were trivial. I left the non-trivial ones at the end of the series=
 to
> > help reviewers know where to look at more carefully.
> >=20
> > Due to the large number of touched files, the list of recipients genera=
ted
> > by get_maintainers (b4 actually) was huge, 60~70 people (not counting
> > mailing lists), so I took the liberty of trimming the list as reasonabl=
y as
> > I could to DRM maintainers and frequent contributors, and added all oth=
er
> > recipients individually per-patch. I hope this is fine. Don't hesitate =
to
> > suggest more people which should be Cc-ed in a future series, or a bett=
er
> > Cc policy.
> >=20
> > Current plan and status of the DRM bridge refcounting work:
> >=20
> >  A. =E2=9C=94 add new alloc API and refcounting -> (now in drm-misc-nex=
t)
> >  B. =E2=9E=9C convert all bridge drivers to new API (this series)
> >  C. =E2=80=A6 documentation, kunit tests, debugfs improvements (v1 unde=
r discussion)
> >  D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
> >  E. after (B), convert accessors; this is a large work and can be done
> >     in chunks
>
> Maintaining this long series is quite painful. Do you think at least
> patches with a R-by or T-by tag could be merged before I send v3, so
> we can relieve the maintenance effort, mail servers, and everybody's
> inboxes?

Yes?

What's stopping you though? You have at least a colleague that can apply
them, and you could just as well apply for commit rights yourself.

Maxime

--2raebolozc6scwuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaA+h8QAKCRAnX84Zoj2+
dgkUAX9tFFbvseMFaQXzWUw2OjrRYi8WG/Yp2SJ+OTXVeByAp2uwMV+kec7LR3tM
jzFzO5ABf0/CNdY6/kmufsxoaKp4Uok0FEFCQQDlpYtNbGVMZZEfpl0A+QVfRQbR
RD4U9HjfrQ==
=6DAB
-----END PGP SIGNATURE-----

--2raebolozc6scwuc--

--===============9026292076446238242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9026292076446238242==--
