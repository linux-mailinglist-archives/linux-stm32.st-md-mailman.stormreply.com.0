Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4171A120F35
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 17:19:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06787C36B0B;
	Mon, 16 Dec 2019 16:19:42 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE71CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 16:11:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id E3E5A28FC78
Message-ID: <ca0c26d124a0139de31405eacb7d098173897d16.camel@collabora.com>
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-rockchip@lists.infradead.org
Date: Mon, 16 Dec 2019 13:10:52 -0300
In-Reply-To: <20191202193359.703709-2-adrian.ratiu@collabora.com>
References: <20191202193359.703709-1-adrian.ratiu@collabora.com>
 <20191202193359.703709-2-adrian.ratiu@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Dec 2019 16:19:41 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-imx@nxp.com,
 kernel@collabora.com, Emil Velikov <emil.velikov@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v4 1/4] drm: bridge: dw_mipi_dsi: access
 registers via a regmap
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

Hi Adrian,

Thanks for the patch. This is nice consolidation work.
I'm Ccing Heiko for the Rockchip part.

See below for some comments.

On Mon, 2019-12-02 at 21:33 +0200, AdrianAdrian Ratiu wrote:
> Convert the common bridge code and the two rockchip & stm drivers
> which currently use it to the regmap API in anticipation for further
> changes to make it more generic and add older DSI host controller
> support as found on i.mx6 based devices.
> 
> The regmap becomes an internal state of the bridge. No functional
> changes other than requiring the platform drivers to use the
> pre-configured regmap supplied by the bridge after its probe() call
> instead of ioremp'ing the registers themselves.
> 
> In subsequent commits the bridge will become able to detect the
> DSI host core version and init the regmap with different register
> layouts. The platform drivers will continue to use the regmap without
> modifications or worrying about the specific layout in use (in other
> words the layout is abstracted away via the regmap).
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 215 ++++++++++--------
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  17 +-

At least for Rockchip, I'd rather see this done in two
steps: first some regmap infrastructure introduced,
and then in a follow-up patch, the rockchip driver
moved to it.

It's safer, and better from a bisection POV, and from
a first look it seems doable.

>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         |  34 ++-

It would be good to do try the same for STM. It's also
simpler to review that way.

>  include/drm/bridge/dw_mipi_dsi.h              |   2 +-
>  4 files changed, 145 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index b6e793bb653c..6cb57807f3f9 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  
>  #include <video/mipi_display.h>
> @@ -226,7 +227,7 @@ struct dw_mipi_dsi {
>  	struct mipi_dsi_host dsi_host;
>  	struct drm_bridge *panel_bridge;
>  	struct device *dev;
> -	void __iomem *base;
> +	struct regmap *regs;
> 

You have the regmap here...
>  
>  	struct clk *pclk;
>  
[..]
> @@ -954,7 +952,6 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
>  	}
>  
>  	dsi->dev = dev;
> -	dsi->pdata.base = dsi->base;
>  	dsi->pdata.max_data_lanes = dsi->cdata->max_data_lanes;
>  	dsi->pdata.phy_ops = &dw_mipi_dsi_rockchip_phy_ops;
>  	dsi->pdata.host_ops = &dw_mipi_dsi_rockchip_host_ops;
> @@ -970,6 +967,8 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
>  		goto err_clkdisable;
>  	}
>  
> +	dsi->regs = dsi->pdata.regs;
> +

... and this goes for both STM and Rockchip: I don't think you need neither
the struct dw_mipi_dsi_plat_data.regs nor the
structdw_mipi_dsi_{rockchip, stm}.regs. You should be able to
just access the regmap via the struct dw_mipi_dsi.

[..]
>  
>  err_dsi_probe:
> @@ -474,7 +472,7 @@ static struct platform_driver dw_mipi_dsi_stm_driver = {
>  	.remove		= dw_mipi_dsi_stm_remove,
>  	.driver		= {
>  		.of_match_table = dw_mipi_dsi_stm_dt_ids,
> -		.name	= "stm32-display-dsi",
> +		.name	= DRIVER_NAME,

Unrelated change, please drop it.

>  		.pm = &dw_mipi_dsi_stm_pm_ops,
>  	},
>  };

Thanks,
Ezequiel

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
