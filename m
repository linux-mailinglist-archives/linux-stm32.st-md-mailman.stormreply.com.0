Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DC7AC1076
	for <lists+linux-stm32@lfdr.de>; Thu, 22 May 2025 17:56:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A4C3C7A827;
	Thu, 22 May 2025 15:56:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5CA6C7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 15:56:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62288439A5;
 Thu, 22 May 2025 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747929396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDrRfxUh05bF14pzZXQ+mC3f/tIJuaPORyh0q5iuGpM=;
 b=LrOFkxjDWfPYlaJ27v0bKylFL4XWO+4kvvgStRLZlUDRYZHdyChNIb2pfDuGENtsuftdv/
 wGbOCWfZtxzREyaEFwnH82wXULSKdAdYw/PBXzq/zAP46MQh+2qKay6Pd/jwy3zwxJN8dw
 rgJTGQYyYqHyrBnB5+bbAyyUPyuK4SQmrz1l5b6bKlFTJX3baN6Ej14byKnrUchMCQnb3+
 vJDkRIAED2cQX+6NzREg8KVZNhwI6WQ0582mb8M9FYZVQz3yCa/TIqtPexDE/d9Fb/Krsm
 aRFHR6fwOi/MpKAjV481sgJjj5EABYXpHVIjb+acU9Q+t95PRAEbZnkSC880OA==
Date: Thu, 22 May 2025 17:56:23 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <20250522175623.1a6d9b14@booty>
In-Reply-To: <20250522-amphibian-shiny-chachalaca-cf05ba@houat>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
 <20250522-amphibian-shiny-chachalaca-cf05ba@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeifeejucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfejhffgjeelkeeftdekfefgteekgefhleelueeijeffieekieeigefhledtffetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelhedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhho
 hhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Maxime,

On Thu, 22 May 2025 16:57:30 +0200
Maxime Ripard <mripard@kernel.org> wrote:

[...]

> > As the commit was a mistake, I'm applying the revert by the end of this
> > week (i.e. on Friday) unless there are better instructions.  
> 
> Given the lack of answers, and that it looks correct to me, just leave
> it there. We can always revert later on if things turned out to be
> broken.

OK, I'll leave the commit and drop the revert in v4.

> > >       drm: convert many bridge drivers from devm_kzalloc() to devm_drm_bridge_alloc() API  
> > 
> > This patch affects multiple drivers. Running get_maintainers.pl
> > points at Shawn Guo's repository. After reviewing the MAINTAINERS file,
> > this looks like due to the 'N:' line in:
> > 
> > ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> > M:	Shawn Guo <shawnguo@kernel.org>
> > M:	Sascha Hauer <s.hauer@pengutronix.de>
> > R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> > ...
> > T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> > N:	imx
> > ...
> > 
> > (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAINTAINERS?ref_type=heads#L2511-2528)
> > 
> > Here 'imx' matches the 'drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c'
> > file that is touched by the patch. That regexp appears overly generic to me.  
> 
> I agree, or at least, we shouldn't wait for Shawn or Sasha...
> 
> > Shawn, can it be fixed by making it less generic?
> > 
> > If not, can we at least add a band-aid 'X:' entry for
> > drivers/gpu/drm/bridge/imx?
> > 
> > I think the other matching entry is the one to consider:
> > 
> > DRM DRIVERS FOR FREESCALE IMX BRIDGE
> > M:	Liu Ying <victor.liu@nxp.com>
> > L:	dri-devel@lists.freedesktop.org
> > S:	Maintained
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> > F:	drivers/gpu/drm/bridge/imx/
> > 
> > (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAINTAINERS?ref_type=heads#L7940-7948)  
> 
> ... As long as Ying is fine with it, because it does look like they are
> the actual maintainer.

Ack, thanks for confirming this.

Bottom line, given that large patch has your Acked-by, and given the
shawnguo repo was ruled out, the conclusion is it can apply it to
drm-misc-next.

Having that large patch applied will be relieving me a lot! I think
next time I'm going to split any imilar change in per-driver patches,
even if it is spatch-automated.

> > >       drm/todo: add entry to remove devm_drm_put_bridge()  
> > 
> > This involves documentation maintained on another tree. Where should it
> > be applied? There are two matching entries in MAINTAINERS:
> > 
> >  * DRM DRIVERS -> the drm tree
> >  * DRM DRIVERS AND MISC GPU PATCHES -> the drm-misc tree
> > 
> > To me it looks like the second is obviously the closest match as we are
> > dealing with DRM bridges, so I'm applying this as well on Friday unless
> > there are better instructions.  
> 
> Yes, they should be applied to drm-misc.

OK, will do soon.

> That being said, putting a two days timeout on *any* email is really
> over-the-top. I doubt you reply to any of your mail in such a short
> timeframe. We have rules for a reason, I'd expect you to follow them, no
> matter how frustrating the lack of answers can be.

Apologies if that was too much.

I was indeed nervous about the revert. A patch got applied by mistake
and I believe it should have been reverted very quickly, if need be.
Both Louis and I didn't want to break the process again. So we asked,
but not having answer after 2+ weeks I must admit I got a bit nervous
about it.

Sorry about that and thanks for the feedback about my questions.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
