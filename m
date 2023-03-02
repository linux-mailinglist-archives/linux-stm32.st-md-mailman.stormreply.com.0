Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3786A89BE
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Mar 2023 20:47:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 700AAC6A601;
	Thu,  2 Mar 2023 19:47:42 +0000 (UTC)
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC98AC6A5FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Mar 2023 19:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=BtNi97NVqmGApn3BCpFm47tB4evorZmaN6Pi5IgjHRY=;
 b=TYQvjvixOf/3rzSA5RmgEfx7465TZ4sZXzQtCp7dAVX3dgOixLCPjD+rbwhqy+CDyF+qXDx1/jUSx
 rcsdK7CMokFMUVYsTaNX7BG0G+QVYdP9DiUpqrYGRxRZCvK1UsPA+r8d1Ah8sNPtH5fo6e9OidjQjM
 cShBXyNDlYWFwEe7499JUEKg6hb5tSsiqaVT8jPzzimGo22ryQxRNW9lsNP9V3tJr60ogap68Hft82
 j7Z2VAram2dQ4f8wUTTwSk/sTr4zxoypWxXn2UJ/rJsdGJ09+rgmt6PH03mGL4u2h6Jl2YL0nn2QHR
 JYeihHU7gOcMm5Aku6byl6o9rOadexg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=BtNi97NVqmGApn3BCpFm47tB4evorZmaN6Pi5IgjHRY=;
 b=Z7zbinB+9V6oieKcPqyRWSc+qnO8WPOFDAC9HEXYAK2WDzv6DzcUA32mQ0nEibyXIJDKJL+pbTnKq
 OxtBCqcBQ==
X-HalOne-ID: 155bb931-b933-11ed-8805-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 155bb931-b933-11ed-8805-7703b0afff57;
 Thu, 02 Mar 2023 19:47:40 +0000 (UTC)
Date: Thu, 2 Mar 2023 20:47:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ZAD9WnhAcwAdQPqT@ravnborg.org>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230301153101.4282-6-tzimmermann@suse.de>
Cc: linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org,
 edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, anitha.chrisanthus@intel.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, samuel@sholland.org, airlied@gmail.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, linux-imx@nxp.com,
 linux-sunxi@lists.linux.dev, p.zabel@pengutronix.de, daniel@ffwll.ch,
 martin.blumenstingl@googlemail.com, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 laurentiu.palcu@oss.nxp.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 hyun.kwon@xilinx.com, tomba@kernel.org, andrew@aj.id.au, jyri.sarha@iki.fi,
 yannick.fertre@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com,
 shawnguo@kernel.org, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH 05/22] drm/atmel-hlcdc: Use GEM DMA fbdev
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

On Wed, Mar 01, 2023 at 04:30:44PM +0100, Thomas Zimmermann wrote:
> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 4e806b06d35d..29603561d501 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -19,7 +19,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_module.h>
> @@ -760,7 +760,7 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unload;
>  
> -	drm_fbdev_generic_setup(ddev, 24);
> +	drm_fbdev_dma_setup(ddev, 24);
>  
>  	return 0;
>  
> -- 
> 2.39.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
