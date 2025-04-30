Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0482CAA4892
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 12:37:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE702C78F98;
	Wed, 30 Apr 2025 10:37:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3DC9C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 10:37:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59B1343155;
 Wed, 30 Apr 2025 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746009420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCqPYAYDeSC4T6gsM+8/d4/R4hTjtWts9K3/InF+2yg=;
 b=j5IGpt96m3GS1GgdAQYb0DMF9BS9VJKNh0+D/2DDE2MQcbaP8QshRiOSUeBtDIq10LHfcK
 da6Rz6IPzqh72skLr3qzo8sCS1PQhKF2edPzJp4eG6QBBwrh5nrxL51ckveG3zavYd3qUP
 J2jx1+yN1XlBcUb/xgzlUVBCN3TYadasJXfR27IzS3EZ5METDQ7Zoy8F1/pK4SrZPTMcLs
 EeISxDq5NZi4vcUbvqFr2+DghQmkq4QWjiUcMCuSrjLoJhKePJalZDcGyOqVuDEsI237bq
 COMqwTuYqRY83cpYZO0vAcYqKCUzKgW8Qg5QF6JVH87BqsDr4JvKUr2eOLVdmQ==
Date: Wed, 30 Apr 2025 12:36:51 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: <Manikandan.M@microchip.com>
Message-ID: <20250430123651.37be3e38@booty>
In-Reply-To: <e90b9ef2-ace0-4b98-9d49-5a62e529cf8a@microchip.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <e90b9ef2-ace0-4b98-9d49-5a62e529cf8a@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeigeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeikedprhgtphhtthhopeforghnihhkrghnuggrnhdrofesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, sui.jingfeng@linux.dev, fnkl.kernel@gmail.com,
 thomas.petazzoni@bootlin.com, mordan@ispras.ru, paulk@sys-base.io,
 linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 bleung@chromium.org, groeck@chromium.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, simona@ffwll.ch,
 chrome-platform@lists.linux.dev, krzk@kernel.org, rfoss@kernel.org,
 airlied@gmail.com, asrivats@redhat.com, detlev.casanova@collabora.com,
 jernej.skrabec@gmail.com, sugar.zhang@rock-chips.com, j@jannau.net,
 Dharma.B@microchip.com, matthias.bgg@gmail.com, jagan@amarulasolutions.com,
 ple@baylibre.com, p.zabel@pengutronix.de, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, adrien.grassein@gmail.com,
 chunkuang.hu@kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 jani.nikula@intel.com, linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, tomi.valkeinen+renesas@ideasonboard.com,
 Hui.Pu@gehealthcare.com, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, jesseevg@gmail.com, lumag@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 linux-renesas-soc@vger.kernel.org, chf.fritz@googlemail.com,
 kieran.bingham+renesas@ideasonboard.com, asahi@lists.linux.dev,
 tzimmermann@suse.de, khilman@baylibre.com, cristian.ciocaltea@collabora.com,
 andy.yan@rock-chips.com, victor.liu@nxp.com, shawnguo@kernel.org,
 amishin@t-argos.ru
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

Hello Manikandan,

On Wed, 30 Apr 2025 09:42:16 +0000
<Manikandan.M@microchip.com> wrote:

[...]

> > diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
> > index 1d4ae0097df847d9f93c79eecff0c4587ae331ba..9f4ff82bc6b49010f8727da3b367f5a744a28edc 100644
> > --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> > +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> > @@ -157,9 +157,10 @@ static int mchp_lvds_probe(struct platform_device *pdev)
> >          if (!dev->of_node)
> >                  return -ENODEV;
> > 
> > -       lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
> > -       if (!lvds)
> > -               return -ENOMEM;
> > +       lvds = devm_drm_bridge_alloc(&pdev->dev, struct mchp_lvds, bridge,
> > +                                    &mchp_lvds_bridge_funcs);
> > +       if (IS_ERR(lvds))
> > +               return PTR_ERR(lvds);
> > 
> >          lvds->dev = dev;
> > 
> > @@ -192,7 +193,6 @@ static int mchp_lvds_probe(struct platform_device *pdev)
> > 
> >          lvds->bridge.of_node = dev->of_node;
> >          lvds->bridge.type = DRM_MODE_CONNECTOR_LVDS;
> > -       lvds->bridge.funcs = &mchp_lvds_bridge_funcs;
> > 
> >          dev_set_drvdata(dev, lvds);
> >          ret = devm_pm_runtime_enable(dev);  
> 
> Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Thanks for reviewing!

In v3 this patch will be slightly different from v2. See the reply I
just sent to Doug for the details.

If your Reviewed-by tag refers only to the microchip-lvds driver, for
which there will be no change in v3, I think it's correct to take your
tag and add a comment like:

 Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com> # microchip-lvds.c

Anything against this?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
