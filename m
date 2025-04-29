Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFD9AA077D
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Apr 2025 11:39:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDD0EC78024;
	Tue, 29 Apr 2025 09:39:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5266BC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 09:28:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DE5D43AD6;
 Tue, 29 Apr 2025 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745918880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdpP6+IZV0QYmrFxTy58B29gyyja9aTG1LwyoYVwA54=;
 b=b3QffBEWXOkepRbRJBAxG56ebIFGpWNAlbC+KLQo0RM4CJOdHofw9LcRaXOlQzjEbdB3RX
 Z+03iDitY3AAR93mhf5d6WLE4XuT3QGY7QachEbLrEI4kcECt5/wn0GKM7h1OqhW4SjOpz
 HOTdVe7S/cZE605Z0+HeFU5eI+Z3o6g8ShHK76B/FqbRAkibTMzruH5CF/IoUuGm4GYVXs
 sFtz6X9pJP9Yj6BYgD109FXC4ES1/uz4pLgGybsGQHMDOgyJx5zG6q/WG2yh6+/TQM4XDc
 hqGRyOgKhSdGaqn9GMqCPbl95bREdu4X3Ttbed9zcOzDQJjjJUJriSfQHcCMEg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
Message-Id: <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:27:51 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejheeiledvkeeigeeluddtleejvdfhleefleffffeitdetvdeltddttddtgfelteenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddutddprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopehjsghruhhnvghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtp
 hhtthhopeguvghllhgvrhesghhmgidruggvpdhrtghpthhtoheprhhgrghllhgrihhsphhouhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: louis.chauvet@bootlin.com
X-Mailman-Approved-At: Tue, 29 Apr 2025 09:39:24 +0000
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Anusha Srivatsa <asrivats@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 Inki Dae <inki.dae@samsung.com>, Pin-yen Lin <treapking@chromium.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Phong LE <ple@baylibre.com>, Christoph Fritz <chf.fritz@googlemail.com>,
 freedreno@lists.freedesktop.org, Martyn Welch <martyn.welch@collabora.co.uk>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Helge Deller <deller@gmx.de>, Paul Kocialkowski <paulk@sys-base.io>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Ian Ray <ian.ray@ge.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 "Rob Herring \(Arm\)" <robh@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 imx@lists.linux.dev, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vitalii Mordan <mordan@ispras.ru>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Benson Leung <bleung@chromium.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Adam Ford <aford173@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Janne Grunau <j@jannau.net>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Russell King <linux@armlinux.org.uk>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On Thu, 24 Apr 2025 20:59:07 +0200, Luca Ceresoli wrote:
> devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
> bridge, and the only one supported from now on. It is also necessary for
> implementing reference counting and thus needed to support removal of
> bridges from a still existing DRM pipeline without use-after-free.
> 
> This series converts all DRM bridges to the new API.
> 
> [...]

Applied, thanks!

[02/34] platform: arm64: acer-aspire1-ec: convert to devm_drm_bridge_alloc() API
        commit: 411465d35bc56877c33e2498ac697acfcf484e6b
[03/34] drm/bridge: analogix-anx6345: convert to devm_drm_bridge_alloc() API
        commit: 53ddeb25159781b029fda404226af600e76f975f
[06/34] drm/bridge: display-connector: convert to devm_drm_bridge_alloc() API
        commit: 4e90a3d96a6185e143041273f9867a1092dd4a71
[07/34] drm/bridge: lt9611uxc: convert to devm_drm_bridge_alloc() API
        commit: 6287ffd9eff6eea65865e64b9d4c45e115fa5ecf
[11/34] drm/bridge: dw-hdmi: convert to devm_drm_bridge_alloc() API
        commit: ed6987b674185873ebed7a619a646da6dd1a78fa
[12/34] drm/bridge: tda998x: convert to devm_drm_bridge_alloc() API
        commit: 7fe58bf1a9a24b533875c262a3222581a3f759e4
[13/34] drm/bridge: ti-sn65dsi86: convert to devm_drm_bridge_alloc() API
        commit: a4754ae9cfa76fbce79f023c268a5bac56f36321
[14/34] drm/exynos: mic: convert to devm_drm_bridge_alloc() API
        commit: 91c5c7b5bb2dd09b43b025bce6d790d3c79f4518
[15/34] drm/mcde: convert to devm_drm_bridge_alloc() API
        commit: 40c25b9ec641f43ba17c7b788ac16ec23f8daaa8
[16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
        commit: b2aabe5c6b65516d88214aba4b12ce2ca78bac6c
[17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
        commit: fffc8847743e45604c4478f554d628481b985556
[18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
        commit: e11532be87e437648521a8ed5358c56df11933b4
[27/34] drm/vc4: convert to devm_drm_bridge_alloc() API
        commit: 9545c91ed75ff65e114761a7729de0e1b440aec6
[31/34] drm/bridge: imx8*-ldb: convert to devm_drm_bridge_alloc() API
        commit: e74b84cd83962e357329a695ba348b3dfe37395c

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
