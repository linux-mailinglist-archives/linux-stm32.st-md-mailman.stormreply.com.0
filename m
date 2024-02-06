Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442184B667
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 14:31:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C70BAC6B476;
	Tue,  6 Feb 2024 13:31:23 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0376C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 13:31:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-34-85-nat.elisa-mobile.fi
 [85.76.34.85])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAB3874A;
 Tue,  6 Feb 2024 14:29:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707226198;
 bh=KMA/bJybbnWogXygT+8vj+CljyBc90aEvqxIQixKXiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jJt87ajWVdK89Rfyb+jiky4gvmowtfZOCJZtCWAdBzrxqQjYl8RkDAWw1GjNPt3rj
 Jenek9xQ8efrqfbQWdR/MAB0bf8AjF6cNDJomTaxkqGCx5MqRkTc5onD0kUQ+f/BDi
 E1GhB9QNoRnXcHEKttDqnEeZ9R8xAGJsVuVXKMVI=
Date: Tue, 6 Feb 2024 15:31:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20240206133122.GA2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87sf26nvy2.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sf26nvy2.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [Linux-stm32] [PATCH 1/4] gpu: drm: replace
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

Hello Morimoto-san,

Thank you for the patch.

On Tue, Feb 06, 2024 at 02:55:01AM +0000, Kuninori Morimoto wrote:
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
>  drivers/gpu/drm/drm_of.c                              | 2 +-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 177b600895d3..c2eae9296012 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -516,7 +516,7 @@ struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev)
>  	/*
>  	 * Get first endpoint child from device.
>  	 */
> -	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);

This assumes that the DSI device's port@0 will also be the input. That's
fine for current users of this function, but we should at least document
it.

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..012c4d04cf51 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -504,6 +504,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
  * Gets parent DSI bus for a DSI device controlled through a bus other
  * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
  *
+ * This function assumes that the device's port@0 is the DSI input.
+ *
  * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
  * request is unsupported, -EPROBE_DEFER if the DSI host is found but
  * not available, or -ENODEV otherwise.

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	if (!endpoint)
>  		return ERR_PTR(-ENODEV);
>  
> diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> index 4618c892cdd6..e10e469aa7a6 100644
> --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> @@ -400,7 +400,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c)
>  	rpi_touchscreen_i2c_write(ts, REG_POWERON, 0);
>  
>  	/* Look up the DSI host.  It needs to probe before we do. */
> -	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
>  	if (!endpoint)
>  		return -ENODEV;
>  
> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
> index e5b10e41554a..04d0053b9315 100644
> --- a/drivers/gpu/drm/tiny/arcpgu.c
> +++ b/drivers/gpu/drm/tiny/arcpgu.c
> @@ -288,7 +288,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  	 * There is only one output port inside each device. It is linked with
>  	 * encoder endpoint.
>  	 */
> -	endpoint_node = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
> +	endpoint_node = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
>  	if (endpoint_node) {
>  		encoder_node = of_graph_get_remote_port_parent(endpoint_node);
>  		of_node_put(endpoint_node);

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
