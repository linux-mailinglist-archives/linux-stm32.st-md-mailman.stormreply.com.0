Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6BAAA0411
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Apr 2025 09:08:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFDA6C78034;
	Tue, 29 Apr 2025 07:08:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 660E8C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 07:08:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22CA543A5D;
 Tue, 29 Apr 2025 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745910488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kd3lI03kG0Wm60ssPsZRZZBpZE8tAduMDQ2Hf34LlN8=;
 b=fcJKYscBr/b/jTAU/vdTWM1YVAZaQiKZf9U4AtTZtpc5ho823NHoDeZMuLwHQVD5ogMz4d
 l4pHVstABt7F5anu7rX+Is4pzCVclLJyVW2RUnk7sXHFitWtcyzJ1ZDZppcaYxqIMmzxD2
 Sfc1sxFBGdTgBwDEHAPbC2rd0KV+kllYzYprQVDyppacSAp3Fkyy+/iDCZutuZh3ARu+US
 34h4mqj6xj55AWEBMBTArFMS0lwr+TdUdaA1KbDVw07BZOaEQry3xl1MPhcnU/8hzfGqQG
 6tTsndglheT+XJYQtJe0j1GjXXfJp3D7sz7UMZVYzpF8m9ZxqhKhClOsZxv+aQ==
Date: Tue, 29 Apr 2025 09:07:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Message-ID: <20250429090759.3a6e87bc@booty>
In-Reply-To: <810dc089-4789-4efb-a88f-4ab8da1519d4@nxp.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <810dc089-4789-4efb-a88f-4ab8da1519d4@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepieekpdhrtghpthhtohepvhhitghtohhrrdhlihhusehngihprdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vitalii Mordan <mordan@ispras.ru>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Simona Vetter <simona@ffwll.ch>, chrome-platform@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Janne Grunau <j@jannau.net>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Phong LE <ple@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jesse Van Gavere <jesseevg@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Christoph Fritz <chf.fritz@googlemail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, Shawn Guo <shawnguo@kernel.org>,
 Aleksandr Mishin <amishin@t-argos.ru>
Subject: Re: [Linux-stm32] [PATCH v2 01/34] drm: convert many bridge drivers
 from devm_kzalloc() to devm_drm_bridge_alloc() API
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

Hello Liu,

On Tue, 29 Apr 2025 10:19:27 +0800
Liu Ying <victor.liu@nxp.com> wrote:

[...]

> > diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> > index f072c6ed39ef183b10518b43bd6d979bc89e36f9..8069c4881e9058f5462f99116799b589bd52b19e 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> > @@ -59,9 +59,10 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
> >  	struct imx_legacy_bridge *imx_bridge;
> >  	int ret;
> >  
> > -	imx_bridge = devm_kzalloc(dev, sizeof(*imx_bridge), GFP_KERNEL);
> > -	if (!imx_bridge)
> > -		return ERR_PTR(-ENOMEM);
> > +	imx_bridge = devm_drm_bridge_alloc(dev, struct imx_legacy_bridge,
> > +					   base, &imx_legacy_bridge_funcs);
> > +	if (IS_ERR(imx_bridge))
> > +		return PTR_ERR(imx_bridge);
> >  
> >  	ret = of_get_drm_display_mode(np,
> >  				      &imx_bridge->mode,
> > @@ -71,8 +72,6 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
> >  		return ERR_PTR(ret);
> >  
> >  	imx_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
> > -  
> 
> Nit: Can you please leave this blank line undeleted?  And I see similar
> situations where lines are unnecessarily deleted by this patch, so this applies
> to the entire patch.

I agree some empty lines removals are not nice in this patch. However I
have no idea how to avoid that with spatch, so I'd have to redo [a part
of] the changes manually to avoid it. :-(

Anyway, those I spotted look quite innocuous. So I'll assume it is "OK
enough" as is, unless there are strong requests to do differently.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
