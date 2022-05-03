Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC696518AAA
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 19:02:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62BDFC60467;
	Tue,  3 May 2022 17:02:59 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32E67C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 17:02:58 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id y21so20589350edo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 May 2022 10:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ebsl3t9Q4A5ZhggZdMt0K6huVQ4nPLjVF1HT4eHwHY=;
 b=HaGnyx7pBoke+0aSLZ+0Cl9i2Z3rtc277xsE07lgnGx2lIPgKNR+/cHf1BHMJd+tWY
 xLxDVjfXM0LpLkK6W47aSnLqvt4qcngT1GxJ9qnMFGWSSL68ZSpCJur0Qp+flnz9TG9V
 8iSPz7fXNdaty2uNHB4TWoNsqJrz0v03bb5rxLo5UKkUbCeepA8IK+d4f511ABt2QcWd
 ZpC42ODRQgilCYofK3JnmcBW/XdrLxgbLavwJlZDJe38uRpGjKQRfb1xNvaHi8pmKFwS
 8RYFI+ibpzWIAh8L22MX0fUODrvS/rlJYgws3AcC0d8zDmBJEhPw91evXIyGqHtd9B1w
 9Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ebsl3t9Q4A5ZhggZdMt0K6huVQ4nPLjVF1HT4eHwHY=;
 b=0svMzVFF2BDOIJfChPVLCsTzEab2SI1jtlLnXP5ywcotHDvloJfVMFvoCfUn1fAmvM
 uf9mj4sMYhhNlNp51Uc+wxKWHsrkYHWG3bnKv7sxTqQeksPAcsA/2GOHoe60utfgtVQr
 svXgnZqfA7QknIUMOHGsWTmhMZxcNz3wY4siy4vLZNJsdzADW+t1jfz7gwZyv4iW0sAL
 qKv72uaHRkOiuCO7otF4GewrPHy5QIepniA2now96DhVkGIgowD2e+/DHLqHJOaUcyCX
 aL5Z+MBVycuVPAJXglM0ENOFK/257N/E+EOHwkVROkUrOeuRZ/ly1j2IfFawG/WoWcr8
 YAoQ==
X-Gm-Message-State: AOAM5309D0JS/kHj9zSoq971fLZmGTQGENH8p+UGmdwvGj6q+mdLH5pY
 7DbyfUIuwbJ0SqQpWvQwmIY=
X-Google-Smtp-Source: ABdhPJwhqGbymFuBTyPLL+yyc+nnpILMy/ni7d7XOhYbnZCBoZ0oS8dRxaoc/0h9PTlfn8SevSJmlw==
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id
 f1-20020a056402194100b00413282209c8mr18716302edz.13.1651597377548; 
 Tue, 03 May 2022 10:02:57 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
 by smtp.gmail.com with ESMTPSA id
 q8-20020aa7cc08000000b0042617ba637esm8000905edt.8.2022.05.03.10.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 10:02:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
Date: Tue, 03 May 2022 19:02:54 +0200
Message-ID: <2626921.mvXUDI8C0e@kista>
In-Reply-To: <20220503071540.471667-3-javierm@redhat.com>
References: <20220503071540.471667-1-javierm@redhat.com>
 <20220503071540.471667-3-javierm@redhat.com>
MIME-Version: 1.0
Cc: linux-aspeed@lists.ozlabs.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v3 2/3] drm/fb-helper: Rename
	preferred_bpp drm_fbdev_generic_setup() parameter
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

Dne torek, 03. maj 2022 ob 09:15:39 CEST je Javier Martinez Canillas 
napisal(a):
> By default the bits per pixel for the emulated framebuffer device is set
> to dev->mode_config.preferred_depth, but some devices need another value.
> 
> Since this second parameter is only used by a few drivers, and to allow
> drivers to use it for passing other configurations when registering the
> fbdev, rename @preferred_bpp to @options and make it a multi-field param.
> 
> The DRM_FB_OPTION() and DRM_FB_GET_OPTION() macros are provided to drivers
> for computing options bitfield values and getting the values respectively
> 
> For now, only the DRM_FB_BPP option exists but other options can be added.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> Changes in v3:
> - Drop the preferred_bpp local variable (Laurent Pinchart).
> - Add a const qualifier to options parameter (Laurent Pinchart).
> 
> Changes in v2:
> - Rename DRM_FB_SET_OPTION() to DRM_FB_OPTION() and make more clear in
>   the kernel-doc what this macro does (Laurent Pinchart).
> - Fix some kernel-doc issues I didn't notice in v1.
> - Add Reviewed-by tags from Thomas and Laurent.
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +++--
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
>  drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
>  drivers/gpu/drm/drm_drv.c                     |  2 +-
>  drivers/gpu/drm/drm_fb_helper.c               | 26 ++++++++++++-------
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
>  drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
>  drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
>  drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
>  drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
>  drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
>  drivers/gpu/drm/stm/drv.c                     |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-

For sun4i:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regard,
Jernej

>  drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
>  drivers/gpu/drm/tiny/bochs.c                  |  2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  2 +-
>  include/drm/drm_fb_helper.h                   | 14 +++++++++-
>  33 files changed, 64 insertions(+), 42 deletions(-)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
