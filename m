Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 184A584BAD6
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 17:25:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2939C6B476;
	Tue,  6 Feb 2024 16:25:09 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40D44C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 16:25:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D1FD74A;
 Tue,  6 Feb 2024 17:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707236623;
 bh=cRGugGe3vMdyYUzmY6ibc8zGO91KtGUAeJq34ioopeE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2mDxwEPkq0Gp4DKPue6/bHS301VB9ekDUD0fNHaQGMcAKsyVK+3fj+pWE2UjHqt1
 ygrHRt5jezVLRrmeKoL2clc0j1PEkqXlqp2D/j/Rj7b+ehJl9q17tU4+cmf2cgI6dk
 A/c+ObDu6t4fy/YzUUcEpSyVoGStFsOOoyPD1G0c=
Date: Tue, 6 Feb 2024 18:25:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20240206162506.GC2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87plxanvx1.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87plxanvx1.wl-kuninori.morimoto.gx@renesas.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, Helge Deller <deller@gmx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 =?utf-8?Q?=22Uwe_Kleine-K=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-media@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Eugen Hristev <eugen.hristev@collabora.com>, linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-fbdev@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] media: platform: replace
	of_graph_get_next_endpoint()
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

Hi Morimoto-san,

Thank you for the patch.

On Tue, Feb 06, 2024 at 02:55:38AM +0000, Kuninori Morimoto wrote:
> From DT point of view, in general, drivers should be asking for a
> specific port number because their function is fixed in the binding.
> 
> of_graph_get_next_endpoint() doesn't match to this concept.
> 
> Simply replace
> 
> 	- of_graph_get_next_endpoint(xxx, NULL);
> 	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);
> 
> Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/media/platform/atmel/atmel-isi.c              | 4 ++--
>  drivers/media/platform/intel/pxa_camera.c             | 2 +-
>  drivers/media/platform/samsung/exynos4-is/fimc-is.c   | 2 +-
>  drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 2 +-
>  drivers/media/platform/st/stm32/stm32-dcmi.c          | 4 ++--
>  drivers/media/platform/ti/davinci/vpif.c              | 3 +--
>  6 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
> index 4046212d48b4..f615aee85968 100644
> --- a/drivers/media/platform/atmel/atmel-isi.c
> +++ b/drivers/media/platform/atmel/atmel-isi.c
> @@ -831,7 +831,7 @@ static int atmel_isi_parse_dt(struct atmel_isi *isi,
>  	isi->pdata.full_mode = 1;
>  	isi->pdata.frate = ISI_CFG1_FRATE_CAPTURE_ALL;
>  
> -	np = of_graph_get_next_endpoint(np, NULL);
> +	np = of_graph_get_endpoint_by_regs(np, 0, -1);
>  	if (!np) {
>  		dev_err(&pdev->dev, "Could not find the endpoint\n");
>  		return -EINVAL;
> @@ -1155,7 +1155,7 @@ static int isi_graph_init(struct atmel_isi *isi)
>  	struct device_node *ep;
>  	int ret;
>  
> -	ep = of_graph_get_next_endpoint(isi->dev->of_node, NULL);
> +	ep = of_graph_get_endpoint_by_regs(isi->dev->of_node, 0, -1);
>  	if (!ep)
>  		return -EINVAL;
>  
> diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
> index 59b89e421dc2..d904952bf00e 100644
> --- a/drivers/media/platform/intel/pxa_camera.c
> +++ b/drivers/media/platform/intel/pxa_camera.c
> @@ -2207,7 +2207,7 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
>  		pcdev->mclk = mclk_rate;
>  	}
>  
> -	np = of_graph_get_next_endpoint(np, NULL);
> +	np = of_graph_get_endpoint_by_regs(np, 0, -1);
>  	if (!np) {
>  		dev_err(dev, "could not find endpoint\n");
>  		return -EINVAL;
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> index a08c87ef6e2d..39aab667910d 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> @@ -175,7 +175,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
>  		return -EINVAL;
>  	}
>  
> -	ep = of_graph_get_next_endpoint(node, NULL);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return -ENXIO;
>  
> diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> index 686ca8753ba2..3f8bea2e3934 100644
> --- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> +++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> @@ -728,7 +728,7 @@ static int s5pcsis_parse_dt(struct platform_device *pdev,
>  				 &state->max_num_lanes))
>  		return -EINVAL;
>  
> -	node = of_graph_get_next_endpoint(node, NULL);
> +	node = of_graph_get_endpoint_by_regs(node, 0, -1);

This is not correct, see
Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml.

>  	if (!node) {
>  		dev_err(&pdev->dev, "No port node at %pOF\n",
>  				pdev->dev.of_node);
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 8cb4fdcae137..4c00aae013af 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -1856,7 +1856,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
>  	struct device_node *ep;
>  	int ret;
>  
> -	ep = of_graph_get_next_endpoint(dcmi->dev->of_node, NULL);
> +	ep = of_graph_get_endpoint_by_regs(dcmi->dev->of_node, 0, -1);
>  	if (!ep) {
>  		dev_err(dcmi->dev, "Failed to get next endpoint\n");
>  		return -EINVAL;
> @@ -1915,7 +1915,7 @@ static int dcmi_probe(struct platform_device *pdev)
>  				     "Could not get reset control\n");
>  
>  	/* Get bus characteristics from devicetree */
> -	np = of_graph_get_next_endpoint(np, NULL);
> +	np = of_graph_get_endpoint_by_regs(np, 0, -1);
>  	if (!np) {
>  		dev_err(&pdev->dev, "Could not find the endpoint\n");
>  		return -ENODEV;
> diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
> index 63cdfed37bc9..f4e1fa76bf37 100644
> --- a/drivers/media/platform/ti/davinci/vpif.c
> +++ b/drivers/media/platform/ti/davinci/vpif.c
> @@ -465,8 +465,7 @@ static int vpif_probe(struct platform_device *pdev)
>  	 * so their devices need to be registered manually here
>  	 * for their legacy platform_drivers to work.
>  	 */
> -	endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
> -					      endpoint);
> +	endpoint = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
>  	if (!endpoint)
>  		return 0;
>  	of_node_put(endpoint);

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
