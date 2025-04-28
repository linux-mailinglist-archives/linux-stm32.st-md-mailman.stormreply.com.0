Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1BBA9F3F7
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 17:00:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0B9FC78011;
	Mon, 28 Apr 2025 15:00:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B38AECFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 15:00:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F84F4397F;
 Mon, 28 Apr 2025 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745852455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/KM50XoeWonitoxoMaOHFeoOtZjamWkVO4Sfztxz2s=;
 b=cTAHqyDfWqZQRajnA0jCJJTRWgntMZ9qCGKU473NOxESwutCLvKkGP9L3GMlUIUf1TVfoJ
 rSml0e13bS9W5xL7vpWnRG/Gf8DwWyNIkXZ07glmnEui2hZC2Xoq/8/xjrvJp5r3ePSFuU
 njtoTq8LUpcrENa9NLXi3tWAr4COusan12TyNUvMZQZfaHrdfuVf/DcDoxsqC3HUZd6Oxa
 xFrGUT/PhDw09LZJgn+fTcnrJMlbI4kHX39u8mbqL16gwmh6HE2DuFmuNLvVbhBpuVI1WK
 hOs5l7kG8ZpIdaFhDwnEIRvdHjqsZaRpzN9lTpgipOlJKjv7cuiqF1qRk9Zf2g==
Date: Mon, 28 Apr 2025 17:00:45 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Andy Yan" <andyshrk@163.com>
Message-ID: <20250428170045.5ca315ce@booty>
In-Reply-To: <656e493e.a551.1967c6d0c53.Coremail.andyshrk@163.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <656e493e.a551.1967c6d0c53.Coremail.andyshrk@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepieelpdhrtghpthhtoheprghnugihshhhrhhkseduieefrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vitalii Mordan <mordan@ispras.ru>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko
 Stuebner <heiko@sntech.de>, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Detlev Casanova <detlev.casanova@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sugar
 Zhang <sugar.zhang@rock-chips.com>, Janne
 Grunau <j@jannau.net>, Dharma Balasubiramani <dharma.b@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Phong
 LE <ple@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
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
 Neil Armstrong <neil.armstrong@linaro.org>, Jesse Van
 Gavere <jesseevg@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 freedreno@lists.freedesktop.org, Douglas
 Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org, Christoph
 Fritz <chf.fritz@googlemail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Andy
 Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Aleksandr Mishin <amishin@t-argos.ru>
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

Hallo Andy,

On Mon, 28 Apr 2025 20:44:03 +0800 (CST)
"Andy Yan" <andyshrk@163.com> wrote:

> Hi ,
> 
> At 2025-04-25 02:59:08, "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
> >devm_drm_bridge_alloc() is the new API to be used for allocating (and
> >partially initializing) a private driver struct embedding a struct
> >drm_bridge.
> >
> >For many drivers having a simple code flow in the probe function, this
> >commit does a mass conversion automatically with the following semantic
> >patch. The changes have been reviewed manually for correctness as well as
> >to find any false positives.
> >
> >  @@
> >  type T;
> >  identifier C;
> >  identifier BR;
> >  expression DEV;
> >  expression FUNCS;
> >  @@
> >  -T *C;
> >  +T *C;
> >   ...
> >  (
> >  -C = devm_kzalloc(DEV, ...);
> >  -if (!C)
> >  -    return -ENOMEM;
> >  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
> >  +if (IS_ERR(C))
> >  +     return PTR_ERR(C);
> >  |
> >  -C = devm_kzalloc(DEV, ...);
> >  -if (!C)
> >  -    return ERR_PTR(-ENOMEM);
> >  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
> >  +if (IS_ERR(C))
> >  +     return PTR_ERR(C);
> >  )
> >   ...
> >  -C->BR.funcs = FUNCS;
> >
> >Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> >diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >index 5e5f8c2f95be1f5c4633f1093b17a00f9425bb37..9b1dfdb5e7ee528c876c01916c9821d550cad679 100644
> >--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >@@ -1045,9 +1045,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> > 		return ERR_PTR(-ENODEV);
> > 	}
> > 
> >-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> >-	if (!hdmi)
> >-		return ERR_PTR(-ENOMEM);
> >+	hdmi = devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
> >+				     &dw_hdmi_qp_bridge_funcs);
> >+	if (IS_ERR(hdmi))
> >+		return PTR_ERR(hdmi);  
> 
>            This should return hdmi or ERR_CAST(hdmi);

Indeed, thanks!

My coccinelle patch is clearly not clever enough. I'll see whether I
can fix it, otherwise I'll handle these 3 special cases manually, along
with another similar one (imx/imx-legacy-bridge.c) I just spotted after
your report.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
