Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3333B3B59A9
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 09:20:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3841C59781;
	Mon, 28 Jun 2021 07:20:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5381C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Jun 2021 08:55:23 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 l21-20020a05600c1d15b02901e7513b02dbso4554645wms.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Jun 2021 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ptTxiGNRR9tLNMxRNvuOfTEawaDh7PBZAwJYDWExn6A=;
 b=WXZPto5hzmyq5c5odNy0McigPUrb1U8D3ElSea0YA6x/fugujmRnICRwcXvzB0modn
 RFnxjMlR5rE8gEr/sN5IsPfVueKZ85sDhJDqHVQdokVO1mBkU5H75gAJjv02f5wgE+hn
 9LbJ/Lux2MkBxb4hmXxfyM2A54N/Inefn2dzazJZSSLXMuZel802aLRLHm61C95k4Knf
 Qzq1O1q8UbX4z+Di3lo98MSoo9TmKjBJp0IDDBkY80mplsdN197X8ah2DRZiZXdVKiON
 Ys/9hFDExx35ZaHsv4nZKEgcmZoYISMbZ7YT3aQ1MdLsDQFfdmlLJG04Z4poXicy4dGf
 XV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ptTxiGNRR9tLNMxRNvuOfTEawaDh7PBZAwJYDWExn6A=;
 b=hNItP7NiOokHxBH9QjGkh2/WkIO7L8codjJh6muD0hZ4aW9JdVWjz2zkPIJ4rEEbBZ
 4bJTt5hwUcs/Cy2Qw1pjUxRqoMqy3wHw9gAnfKcg9tLaI8AwQac3dsifbsG2i8SYkX4p
 7WUAMkCP/2m+P0lX2A/i6vaG8DRwn6R2044JotLsPNgqMfesIYd56XjycfSv+FYGczZ5
 4D26fzdU2eqOzXucX/FDU32mufQ/NSuiTLr8j09vqECIvaVicmXhKExIK8YnjdYwqMaB
 IwxM5t5w3qeSH875NYYeBLIE+RQUWITRkEoLRqRYq51PGtyaSmRc7BC1SU/Z03Oqk+Y1
 f3ug==
X-Gm-Message-State: AOAM532D/CqjJqpi6MSdxbMZoBftUr1VjxpP+yNbJrhw9f4ae/zX8LuD
 GQwGygrMAJKz8ZhOZoSOKLE=
X-Google-Smtp-Source: ABdhPJw6/VYXiHMo3tYPsIdCX2Czl9c8v5+Wa4nye0fP9/XfYl++WvluOveXRSNeUl+JlD1lODFXkg==
X-Received: by 2002:a05:600c:2243:: with SMTP id
 a3mr15630087wmm.86.1624697723317; 
 Sat, 26 Jun 2021 01:55:23 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id n8sm7967502wrt.95.2021.06.26.01.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jun 2021 01:55:22 -0700 (PDT)
Date: Sat, 26 Jun 2021 09:55:13 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210626085513.akf4cwyqpbchmycf@smtp.gmail.com>
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-25-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210625082222.3845-25-tzimmermann@suse.de>
X-Mailman-Approved-At: Mon, 28 Jun 2021 07:20:31 +0000
Cc: hamohammed.sa@gmail.com, heiko@sntech.de, emma@anholt.net, airlied@linux.ie,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, liviu.dudau@arm.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, linux@armlinux.org.uk,
 mihail.atanassov@arm.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, krzysztof.kozlowski@canonical.com,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wens@csie.org, jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 rodrigosiqueiramelo@gmail.com, john.stultz@linaro.org,
 jani.nikula@linux.intel.com, laurentiu.palcu@oss.nxp.com,
 matthias.bgg@gmail.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com, tomba@kernel.org,
 jyri.sarha@iki.fi, yannick.fertre@foss.st.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, christian.koenig@amd.com,
 kyungmin.park@samsung.com, kieran.bingham+renesas@ideasonboard.com,
 daniel@ffwll.ch, alexander.deucher@amd.com, tiantao6@hisilicon.com,
 shawnguo@kernel.org, brian.starkey@arm.com, zackr@vmware.com,
 l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v4 24/27] drm/vkms: Don't set struct
 drm_device.irq_enabled
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

On 06/25, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in vkms.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've also checked here, lgtm.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 027ffe759440..496de38ad983 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -163,8 +163,6 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
>  
> -	vkms_device->drm.irq_enabled = true;
> -
>  	ret = drm_vblank_init(&vkms_device->drm, 1);
>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
> -- 
> 2.32.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
