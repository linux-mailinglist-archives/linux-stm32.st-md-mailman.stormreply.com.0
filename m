Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B60084BB3E
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 17:44:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1947C6B476;
	Tue,  6 Feb 2024 16:44:31 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F38FC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 16:44:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC30C74A;
 Tue,  6 Feb 2024 17:43:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707237785;
 bh=K6G7EqF6aigFxEzvt49ggiwTXwmHFHPviNYyVpcqf74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cw1+savbvw/X4hlFF49bIw9MtlsD9RU5N4r4Oq3JDohk83TQVv/CsvPp/lJ8RCyrR
 TYKlOwlWfdqjs8IbmUDw2IwG0uliy504d51XqHGImWfnERiyRyvGA9Qy+ASaUlNk6R
 hV5XbBSmp5c2qqNeoHRAUihJllk0Cntj6i3/w1W8=
Date: Tue, 6 Feb 2024 18:44:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20240206164429.GD2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87o7cunvwv.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o7cunvwv.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [Linux-stm32] [PATCH 4/4] video: fbdev: replace
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

On Tue, Feb 06, 2024 at 02:55:45AM +0000, Kuninori Morimoto wrote:
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
>  drivers/video/fbdev/amba-clcd.c               |  2 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
>  drivers/video/fbdev/pxafb.c                   |  2 +-
>  include/video/omapfb_dss.h                    |  3 ---
>  8 files changed, 11 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
> index 0399db369e70..2371b204cfd2 100644
> --- a/drivers/video/fbdev/amba-clcd.c
> +++ b/drivers/video/fbdev/amba-clcd.c

This driver has been deleted in v6.8-rc1.

> @@ -691,7 +691,7 @@ static int clcdfb_of_init_display(struct clcd_fb *fb)
>  	/*
>  	 * Fetch the panel endpoint.
>  	 */
> -	endpoint = of_graph_get_next_endpoint(fb->dev->dev.of_node, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(fb->dev->dev.of_node, 0, -1);
>  	if (!endpoint)
>  		return -ENODEV;
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> index b7eb17a16ec4..1f13bcf73da5 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> @@ -28,6 +28,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/of_platform.h>
>  #include <linux/component.h>
>  
> @@ -5079,7 +5080,7 @@ static int dsi_probe_of(struct platform_device *pdev)
>  	struct device_node *ep;
>  	struct omap_dsi_pin_config pin_cfg;
>  
> -	ep = omapdss_of_get_first_endpoint(node);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return 0;
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> index 0282d4eef139..14965a3fd05b 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> @@ -130,24 +130,6 @@ static struct device_node *omapdss_of_get_remote_port(const struct device_node *
>  	return np;
>  }
>  
> -struct device_node *
> -omapdss_of_get_first_endpoint(const struct device_node *parent)
> -{
> -	struct device_node *port, *ep;
> -
> -	port = omapdss_of_get_next_port(parent, NULL);
> -
> -	if (!port)
> -		return NULL;
> -
> -	ep = omapdss_of_get_next_endpoint(port, NULL);
> -
> -	of_node_put(port);
> -
> -	return ep;
> -}
> -EXPORT_SYMBOL_GPL(omapdss_of_get_first_endpoint);
> -

I *think* replacing omapdss_of_get_first_endpoint() with
of_graph_get_endpoint_by_regs(0, -1) is functionally equivalent in all
cases, but a confirmation from Tomi would be nice. I wonder if it
wouldn't be time to drop the fbdev driver though...

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  struct omap_dss_device *
>  omapdss_of_find_source_for_first_ep(struct device_node *node)
>  {
> @@ -155,7 +137,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
>  	struct device_node *src_port;
>  	struct omap_dss_device *src;
>  
> -	ep = omapdss_of_get_first_endpoint(node);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return ERR_PTR(-EINVAL);
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> index f05b4e35a842..8f407ec134dc 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> @@ -20,6 +20,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/clk.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/component.h>
>  #include <video/omapfb_dss.h>
> @@ -529,7 +530,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
>  	struct device_node *ep;
>  	int r;
>  
> -	ep = omapdss_of_get_first_endpoint(node);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return 0;
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> index 03292945b1d4..4ad219f522b9 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> @@ -25,6 +25,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/clk.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/component.h>
>  #include <video/omapfb_dss.h>
> @@ -561,7 +562,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
>  	struct device_node *ep;
>  	int r;
>  
> -	ep = omapdss_of_get_first_endpoint(node);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return 0;
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> index c9d40e28a06f..0bd80d3b8f1b 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> @@ -24,6 +24,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/component.h>
>  
>  #include <video/omapfb_dss.h>
> @@ -764,7 +765,7 @@ static int venc_probe_of(struct platform_device *pdev)
>  	u32 channels;
>  	int r;
>  
> -	ep = omapdss_of_get_first_endpoint(node);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return 0;
>  
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index fa943612c4e2..2ef56fa28aff 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -2171,7 +2171,7 @@ static int of_get_pxafb_mode_info(struct device *dev,
>  	u32 bus_width;
>  	int ret, i;
>  
> -	np = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	np = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
>  	if (!np) {
>  		dev_err(dev, "could not find endpoint\n");
>  		return -EINVAL;
> diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
> index e8eaac2cb7b8..a8c0c3eeeb5b 100644
> --- a/include/video/omapfb_dss.h
> +++ b/include/video/omapfb_dss.h
> @@ -819,9 +819,6 @@ struct device_node *
>  omapdss_of_get_next_endpoint(const struct device_node *parent,
>  			     struct device_node *prev);
>  
> -struct device_node *
> -omapdss_of_get_first_endpoint(const struct device_node *parent);
> -
>  struct omap_dss_device *
>  omapdss_of_find_source_for_first_ep(struct device_node *node);
>  #else

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
