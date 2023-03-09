Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBAA6B26B1
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 15:22:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67708C6A60D;
	Thu,  9 Mar 2023 14:22:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 491D6C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678359883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=rIKq23+uaKpJ1OE/0bOsZp271hw8KGnFAFpE9HnsfKM=;
 b=UNga34wB14jZIEOSkbnx2HCFmp8EtUXZV6fIhPfyu4mYqONezpbT8CBnfmP3iY5S8zKBL0
 G7NIkEq6ou04p4ttPTZZ8qkTsUKZQclMuxAwcCuqLBxC+ev6Ad/EHesSZ4urSNr8y/FXJj
 duKcuBn93QN9d2ysN9VTEB90L5d0Q0c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-YlfVF3CdOPCya1GcYI9b1w-1; Thu, 09 Mar 2023 06:04:34 -0500
X-MC-Unique: YlfVF3CdOPCya1GcYI9b1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo527468wms.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678359873;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rIKq23+uaKpJ1OE/0bOsZp271hw8KGnFAFpE9HnsfKM=;
 b=6uEIkO4aDTwKMBQDn/5MMuKlZfCoxROM8MeeeoKc1PCLqeIeFAT5GE75pwG3oTG3TO
 sMobz18rMry+wBmV8IOpPUS4ImnjS9BFPpvUC2GpkvrA+FIzwj0xc7C9UI9/wSUmeR1O
 XQghjo9i54btz6/+Vo5tQKf2HizyHep1belmuTrHRxZtiYPMhOLueO9H8mqzdXwQkgxi
 8tQv2XR8p43XHBZ3o1ICkhHzvmrrJe+eRX0w69wf6FrA6ApbO4crAVehcPlyevoLaDmF
 ohNr9Qn/dVUPLH421c0e3X1R0zPO5BkS20R/mUqaOu+PHTWr+9xdp6YzcRIfjvqlhjKA
 cWHw==
X-Gm-Message-State: AO0yUKWQ38tLdYN+gVe6Jx1N/pWo6/saeiehxbjL/K1vUW1i8JDQrRJ6
 1tEppozpCklHW4xjJEvMXD/LuBDekp1qCs9y8bMz1mYoItY/dNQqnT1OyK7E3EUGGr7dSeqRaVy
 AOONmiQezlMMeGYTTv10vlYno3BczGGpI513dCvHY
X-Received: by 2002:adf:dd4d:0:b0:2c7:dfc:47a8 with SMTP id
 u13-20020adfdd4d000000b002c70dfc47a8mr13928113wrm.66.1678359873464; 
 Thu, 09 Mar 2023 03:04:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/WEjfKPC+jhxXW6ijuedDfyidmiJJoYJDI9DsQt9cbEhaxwvCHVmnIbZ4cOwrnEzJA2b9WDA==
X-Received: by 2002:adf:dd4d:0:b0:2c7:dfc:47a8 with SMTP id
 u13-20020adfdd4d000000b002c70dfc47a8mr13928071wrm.66.1678359873107; 
 Thu, 09 Mar 2023 03:04:33 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o6-20020a5d6706000000b002c573778432sm17174423wru.102.2023.03.09.03.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:04:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
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
In-Reply-To: <20230301153101.4282-2-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:04:31 +0100
Message-ID: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Thu, 09 Mar 2023 14:22:45 +0000
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/22] drm/fbdev-dma: Implement fbdev
 emulation for GEM DMA helpers
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Implement fbdev emulation that is optimized for drivers that use
> DMA helpers. The buffers may no tbe moveable, may not require damage

"may not be"

Is may the correct verb here though? I guess you meant "shall not".

> handling and have to be located in system memory. This allows fbdev
> emulation to operate directly on the buffer and mmap it to userspace.
>
> Besides those constraints, the emulation works like in the generic
> code. As an internal DRM client provides, it receives hotplug, restore
> and unregister events. The DRM client is independent from the fbdev
> probing, which runs on the first successful hotplug event.
>
> The emulation is part of the DMA helper module and not build unless
> DMA helpers and fbdev emulation has been configured.
>
> Tested with vc4.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +static int drm_fbdev_dma_fb_open(struct fb_info *info, int user)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +
> +	/* No need to take a ref for fbcon because it unbinds on unregister */
> +	if (user && !try_module_get(fb_helper->dev->driver->fops->owner))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int drm_fbdev_dma_fb_release(struct fb_info *info, int user)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +
> +	if (user)
> +		module_put(fb_helper->dev->driver->fops->owner);
> +
> +	return 0;
> +}
> +

These two functions are the same than what's used by the generic fbdev
emulation. Maybe they could be moved to drivers/gpu/drm/drm_fb_helper.c
and be reused ?

> +static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
> +					 struct drm_fb_helper_surface_size *sizes)
> +{
> +	struct drm_client_dev *client = &fb_helper->client;
> +	struct drm_device *dev = fb_helper->dev;
> +	struct drm_client_buffer *buffer;
> +	struct drm_gem_dma_object *dma_obj;
> +	struct drm_framebuffer *fb;
> +	struct fb_info *info;
> +	u32 format;
> +	struct iosys_map map;
> +	int ret;
> +
> +	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
> +		    sizes->surface_width, sizes->surface_height,
> +		    sizes->surface_bpp);
> +
> +	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
> +	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
> +					       sizes->surface_height, format);
> +	if (IS_ERR(buffer))
> +		return PTR_ERR(buffer);
> +	dma_obj = to_drm_gem_dma_obj(buffer->gem);
> +
> +	fb = buffer->fb;
> +	if (drm_WARN_ON(dev, fb->funcs->dirty)) {
> +		ret = -ENODEV; /* damage handling not supported; use generic emulation */
> +		goto err_drm_client_buffer_delete;
> +	}

Should we have a similar check for drm_fbdev_use_shadow_fb(fb_helper)
and warn on ?

> +
> +	ret = drm_client_buffer_vmap(buffer, &map);
> +	if (ret) {
> +		goto err_drm_client_buffer_delete;
> +	} else if (drm_WARN_ON(dev, map.is_iomem)) {
> +		ret = -ENODEV; /* I/O memory not supported; use generic emulation */

I also wonder if here and above instead of the warn on, there should
just be a normal check and print more verbose warning messages.

[...]

> +static void drm_fbdev_dma_client_unregister(struct drm_client_dev *client)
> +{
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +
> +	if (fb_helper->info) {
> +		drm_fb_helper_unregister_info(fb_helper);
> +	} else {
> +		drm_client_release(&fb_helper->client);
> +		drm_fb_helper_unprepare(fb_helper);
> +		kfree(fb_helper);
> +	}
> +}

This is again the same than drm_fbdev_client_unregister() so I think
that can be made a helper and shared bewteen the two implementations.

> +
> +static int drm_fbdev_dma_client_restore(struct drm_client_dev *client)
> +{
> +	drm_fb_helper_lastclose(client->dev);
> +
> +	return 0;
> +}

Same for this one.

> +
> +static int drm_fbdev_dma_client_hotplug(struct drm_client_dev *client)
> +{
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +	struct drm_device *dev = client->dev;
> +	int ret;
> +
> +	if (dev->fb_helper)
> +		return drm_fb_helper_hotplug_event(dev->fb_helper);
> +
> +	ret = drm_fb_helper_init(dev, fb_helper);
> +	if (ret)
> +		goto err_drm_err;
> +
> +	if (!drm_drv_uses_atomic_modeset(dev))
> +		drm_helper_disable_unused_functions(dev);
> +
> +	ret = drm_fb_helper_initial_config(fb_helper);
> +	if (ret)
> +		goto err_drm_fb_helper_fini;
> +
> +	return 0;
> +
> +err_drm_fb_helper_fini:
> +	drm_fb_helper_fini(fb_helper);
> +err_drm_err:
> +	drm_err(dev, "fbdev-dma: Failed to setup generic emulation (ret=%d)\n", ret);
> +	return ret;
> +}

And this one.

> +/**
> + * drm_fbdev_dma_setup() - Setup fbdev emulation for GEM DMA helpers
> + * @dev: DRM device
> + * @preferred_bpp: Preferred bits per pixel for the device.
> + *                 @dev->mode_config.preferred_depth is used if this is zero.
> + *
> + * This function sets up fbdev emulation for GEM DMA drivers that support
> + * dumb buffers with a virtual address and that can be mmap'ed.
> + * drm_fbdev_dma_setup() shall be called after the DRM driver registered
> + * the new DRM device with drm_dev_register().
> + *
> + * Restore, hotplug events and teardown are all taken care of. Drivers that do
> + * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
> + * Simple drivers might use drm_mode_config_helper_suspend().
> + *
> + * This function is safe to call even when there are no connectors present.
> + * Setup will be retried on the next hotplug event.
> + *
> + * The fbdev is destroyed by drm_dev_unregister().
> + */
> +void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
> +{
> +	struct drm_fb_helper *fb_helper;
> +	int ret;
> +
> +	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
> +	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
> +
> +	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> +	if (!fb_helper)
> +		return;
> +	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_dma_helper_funcs);
> +
> +	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_dma_client_funcs);
> +	if (ret) {
> +		drm_err(dev, "Failed to register client: %d\n", ret);
> +		goto err_drm_client_init;
> +	}
> +
> +	ret = drm_fbdev_dma_client_hotplug(&fb_helper->client);
> +	if (ret)
> +		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
> +
> +	drm_client_register(&fb_helper->client);
> +
> +	return;
> +
> +err_drm_client_init:
> +	drm_fb_helper_unprepare(fb_helper);
> +	kfree(fb_helper);
> +}
> +EXPORT_SYMBOL(drm_fbdev_dma_setup);

And this one could also be shared AFAICT if drm_fbdev_client_hotplug()
is used instead.

> diff --git a/include/drm/drm_fbdev_dma.h b/include/drm/drm_fbdev_dma.h
> new file mode 100644
> index 000000000000..2da7ee784133
> --- /dev/null
> +++ b/include/drm/drm_fbdev_dma.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef DRM_FBDEV_DMA_H
> +#define DRM_FBDEV_DMA_H
> +
> +struct drm_device;
> +
> +#ifdef CONFIG_DRM_FBDEV_EMULATION
> +void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp);
> +#else
> +static inline void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
> +{ }
> +#endif
> +
> +#endif
> -- 

And you should be able to drop this header too if split the common
helpers from drm_fbdev_generic.c or maybe I'm missing something ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
