Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30497AA4725
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 11:29:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDC2CC78F98;
	Wed, 30 Apr 2025 09:29:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0F0FC78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 09:29:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 960FF43181;
 Wed, 30 Apr 2025 09:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746005390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2OzPyycrHdBOFNYlaedmLd2bDrUmkg8qhEXCLfUTANg=;
 b=KDDKM6cWxY7JZnVAYB2Fe3yny9Ai6C/bj2+8pZ79gBRIscyJX9q9/yxRPRMz7jDbDiCK19
 LBw4sl41yaYp4vJvsFJLkqBBLb4Wvgr4pWnnuVi3NP1NI1muVlKtaI7KGn5DvsJ9wHfxCG
 JOe6Io0gNCwYu/IgfJrsBcVWExhWe2WEiYnd9XVp/9nC1fVunvLSleF51EWyO5GhF6Miom
 FkzHk/vmdWl8AsmX9ofhuCEM5VQswUKDevi6PScwlD4A2RoCCYkQ6xrbpkobZ39eyxfLbH
 rKLfZff+JNJkiILxnoR0IF6QCQsvwFbUr9SKw1dIjdPIJI/6hrPhPWoXC2y1TQ==
Date: Wed, 30 Apr 2025 11:29:44 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Message-ID: <20250430112944.1b39caab@booty>
In-Reply-To: <553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
 <553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeifeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeelpdhrtghpthhtohepvhhitghtohhrrdhlihhusehngihprdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 30/34] drm/bridge:
 imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API
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

On Tue, 29 Apr 2025 10:10:55 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> Hi,
> 
> On 04/25/2025, Luca Ceresoli wrote:
> > This is the new API for allocating DRM bridges.
> > 
> > This driver embeds an array of channels in the main struct, and each
> > channel embeds a drm_bridge. This prevents dynamic, refcount-based
> > deallocation of the bridges.
> > 
> > To make the new, dynamic bridge allocation possible:
> > 
> >  * change the array of channels into an array of channel pointers
> >  * allocate each channel using devm_drm_bridge_alloc()
> >  * adapt the code wherever using the channels
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> > @@ -345,8 +351,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
> >  free_child:
> >  	of_node_put(child);
> >  
> > -	if (i == 1 && pc->ch[0].next_bridge)
> > -		drm_bridge_remove(&pc->ch[0].bridge);
> > +	if (i == 1 && pc->ch[0]->next_bridge)  
> 
> Since this patch makes pc->ch[0] and pc->ch[1] be allocated separately,
> pc->ch[0] could be NULL if channel0 is not available, hence a NULL pointer
> dereference here...

See below for this.

> > +		drm_bridge_remove(&pc->ch[0]->bridge);
> >  
> >  	pm_runtime_disable(dev);
> >  	return ret;
> > @@ -359,7 +365,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
> >  	int i;
> >  
> >  	for (i = 0; i < 2; i++) {
> > -		ch = &pc->ch[i];
> > +		ch = pc->ch[i];
> >  
> >  		if (!ch->is_available)  
> 
> ...and here too.

This is indeed a bug, I should have checked the pointer for being
non-NULL.

Looking at that more closely, I think the is_available flag can be
entirely removed now. The allocation itself (ch != NULL) now is
equivalent. Do you think my reasoning is correct?

Ouch! After writing the previous paragraph I realized you proposed this
a few lines below! OK, removing is_available. :)

[...]

> On top of this patch series, this issue doesn't happen if I apply the below
> change:

[...]

> @@ -351,7 +349,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>  free_child:
>         of_node_put(child);
>  
> -       if (i == 1 && pc->ch[0]->next_bridge)
> +       if (i == 1 && pc->ch[0])
>                 drm_bridge_remove(&pc->ch[0]->bridge);

Unrelated to this patch, but as I looked at it more in depth now, I'm
not sure this whole logic is robust, even in the original code.

The 'i == 1' check here seems to mean "if some error happened when
handling channel@1, that means channel@0 was successfully initialized,
so let's clean up channel 0".

However my understanding of the bindings is that device tree is allowed
to have the channel@1 node before the channel@0 node (or even channel@1
without channel@0, but that's less problematic here).

In such case (channel@1 before channel@0), this would happen:

 1. alloc and init ch[1], all OK
 2. alloc and init ch[0], an error happens
    (e.g. of_graph_get_remote_node() fails)

So we'd reach the free_child: label, and we should call
drm_bridge_remove() for ch[1]->bridge, but there's no code to do that.

To be robust in such a case, I think both channels need to be checked
independently, as the status of one does not imply the status of the
other. E.g.:

  for (i = 0; i < 2; i++)
      if (pc->ch[i] && pc->ch[i]->next_bridge)
          drm_bridge_remove(&pc->ch[i]->bridge);

(which is similar to what .remove() does after the changes discussed in
this thread, and which I have queued for v3)

What's your opinion? Do you think I missed anything?

Thanks for taking the time to dig into this!

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
