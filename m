Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 221626AFF5B
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D60E3C6C821;
	Wed,  8 Mar 2023 07:00:30 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4F90C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Mar 2023 14:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:Cc:To:Message-ID:From:Content-Transfer-Encoding:
 Content-Type:Date:MIME-Version:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5DMLJzQKqdF6oeNoZF8t9+eClq9ynzLjSSrN4tmUXPA=; b=BXjkskeT2aCDjWBkFBi1gJSE0o
 KxttfCw6RT9DA1gOSi4J8shGJu4zeme59ibiNNsvkb2rcdRzl+RzXgjtRJUQHlpW9ES6pOJXlcMkQ
 1YUunvfpuepMFk47fKFBEH+mHsl/MVkWXlkZMKwvtMZzfk5wOgCVTk5Dy+lPayv9jc9+Cq1I4kveh
 sRcaJZ6kguPGCQxRbtimP/mOXWCLp6qzl6IBCYsIw0WnrMvQuWcqIHof8zj4Mvy/2HNbKpmJr3vt2
 GfvjpvMMFUnBZZSI07Rxijc/DJ7u8UP3CCDrVyYwjMBmB67yAbqwP2ef5iI8eloeedS7kNS9dDn/k
 F60VybOw==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sarha@kapsi.fi>)
 id 1pZXxt-005UaU-Pn; Tue, 07 Mar 2023 16:06:54 +0200
MIME-Version: 1.0
Date: Tue, 07 Mar 2023 14:06:52 +0000
From: sarha@kapsi.fi
Message-ID: <25a439e6a6d58701e5a73b33ed0d7a4a0d9a68e2@kapsi.fi>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: sarha@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=no autolearn_force=no version=3.4.6
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:00:24 +0000
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 18/22] drm/tilcdc: Use GEM DMA fbdev
	emulation
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

March 1, 2023 at 5:30 PM, "Thomas Zimmermann" <tzimmermann@suse.de mailto:tzimmermann@suse.de?to=%22Thomas%20Zimmermann%22%20%3Ctzimmermann%40suse.de%3E > wrote:

> 
> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Acked-by: Jyri Sarha <jyri.s

> 
> ---
> drivers/gpu/drm/tilcdc/tilcdc_drv.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 4ca426007dc8..fe56beea3e93 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -16,7 +16,7 @@
> #include <drm/drm_atomic_helper.h>
> #include <drm/drm_debugfs.h>
> #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
> #include <drm/drm_fourcc.h>
> #include <drm/drm_gem_dma_helper.h>
> #include <drm/drm_gem_framebuffer_helper.h>
> @@ -384,7 +384,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
> goto init_failed;
> priv->is_registered = true;
> 
> - drm_fbdev_generic_setup(ddev, bpp);
> + drm_fbdev_dma_setup(ddev, bpp);
> return 0;
> 
> init_failed:
> -- 
> 2.39.2
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
