Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF603B2CCD
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jun 2021 12:47:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30990C57196;
	Thu, 24 Jun 2021 10:47:46 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4641C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 10:47:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 842B9532;
 Thu, 24 Jun 2021 12:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624531659;
 bh=ZNycYCdpm5oEjlFfF/sEqNXjEFO/n03c+byQ10Bt5bw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CGN9DVFsEHoPFf+pGvo+BS5Oqq8sbq0BRLQS9wPa02YfsZbZHe42KSDL8SiS8nknQ
 Dlh8v3FIrtFZ+aIelYdI0hq6VcbgqVLgvJq3npv5I27MKCnHAHxEiouigFeN+ZPJ+I
 gY9uoWeAbXhjpnjIo6lsntNy9MnvXU5it7HqZ5l0=
Date: Thu, 24 Jun 2021 13:47:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <YNRirARS1AIVncc+@pendragon.ideasonboard.com>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-17-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624072916.27703-17-tzimmermann@suse.de>
Cc: hamohammed.sa@gmail.com, heiko@sntech.de, emma@anholt.net, airlied@linux.ie,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, liviu.dudau@arm.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, melissa.srw@gmail.com, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, amd-gfx@lists.freedesktop.org,
 benjamin.gaignard@linaro.org, linux@armlinux.org.uk, mihail.atanassov@arm.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wens@csie.org, jernej.skrabec@gmail.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 rodrigosiqueiramelo@gmail.com, john.stultz@linaro.org,
 jani.nikula@linux.intel.com, laurentiu.palcu@oss.nxp.com,
 matthias.bgg@gmail.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 hyun.kwon@xilinx.com, tomba@kernel.org, jyri.sarha@iki.fi,
 yannick.fertre@foss.st.com, Xinhui.Pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, christian.koenig@amd.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, tiantao6@hisilicon.com, shawnguo@kernel.org,
 brian.starkey@arm.com, zackr@vmware.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 16/27] drm/rcar-du: Don't set struct
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

Hi Thomas,

Thank you for the patch.

On Thu, Jun 24, 2021 at 09:29:05AM +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in rcar-du.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index bfbff90588cb..e289a66594a7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -593,8 +593,6 @@ static int rcar_du_probe(struct platform_device *pdev)
>  		goto error;
>  	}
>  
> -	rcdu->ddev.irq_enabled = 1;
> -
>  	/*
>  	 * Register the DRM device with the core and the connectors with
>  	 * sysfs.

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
