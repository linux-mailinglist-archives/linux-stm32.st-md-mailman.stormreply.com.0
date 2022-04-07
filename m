Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C51BE4F7B1D
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Apr 2022 11:11:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BDB1C628A2;
	Thu,  7 Apr 2022 09:11:40 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7826C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Apr 2022 09:11:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 006981F45D10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649322699;
 bh=rEVxd+xPGVMs/CpV12WmQkqmi9WRB6BMXNDaHReiDOY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GrHSP7XETyXeNfXB7qFfIC5PMGX8gULYeCFWgeYatt24/x3Cr++PSBrZXXEDOvVQD
 zs/hr7ro9iJT7vjFMHNtOcMVD8QHi0pAnLEnnAcdmYxUxe1fTTq/obSmiTWobVpv3E
 hZRrdJd8Kgj2aZqdQjH3pcoY+ZJ4oWJHUmNaiSP0NJv+reCJ1XFkG1PxhPkzFpoRNG
 espsRguBhGk7UZj63QcytFBdirmkJRI4z8iQC5UgB2I/SbPZGvrlwQgg1LTZKfey3t
 kh4ISTovwspxDqmtknZb180gcLm95u4P6CNEQFX2DHMUeou+QzWEClZ5WL31R9Yewh
 m+zptKh4mDY7A==
Message-ID: <8d5c41c0-ac7c-ed1e-726b-0d738bf22fed@collabora.com>
Date: Thu, 7 Apr 2022 11:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
 <20220407030409.9664-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220407030409.9664-4-jason-jh.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com, hsinyi@chromium.org,
 postmaster@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, roy-cw.yeh@mediatek.com,
 Daniel Vetter <daniel@ffwll.ch>,
 John 'Warthog9' Hawley <warthog9@eaglescrag.net>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND v17 3/7] soc: mediatek: add mtk-mmsys
 support for mt8195 vdosys0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Il 07/04/22 05:04, jason-jh.lin ha scritto:
> 1. Add mt8195 mmsys compatible for vdosys0.
> 2. Add mt8195 routing table settings and fix build fail.
> 3. Add clock name, clock driver name and routing table into the driver data
>     of mt8195 vdosys0.
> 4. Add get match data by clock name function and clock platform labels
>     to identify which mmsys node is corresponding to vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   2 +-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
>   drivers/soc/mediatek/mt8167-mmsys.h         |   2 +-
>   drivers/soc/mediatek/mt8183-mmsys.h         |   2 +-
>   drivers/soc/mediatek/mt8186-mmsys.h         |   4 +-
>   drivers/soc/mediatek/mt8192-mmsys.h         |   4 +-
>   drivers/soc/mediatek/mt8195-mmsys.h         | 370 ++++++++++++++++++++
>   drivers/soc/mediatek/mt8365-mmsys.h         |   4 +-
>   drivers/soc/mediatek/mtk-mmsys.c            |  62 ++++
>   drivers/soc/mediatek/mtk-mmsys.h            |   1 +
>   drivers/soc/mediatek/mtk-mutex.c            |   8 +-
>   include/linux/soc/mediatek/mtk-mmsys.h      |  13 +-
>   12 files changed, 461 insertions(+), 17 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 

..snip..

> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 4fc4c2c9ea20..b2fa239c5f5f 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -4,6 +4,8 @@
>    * Author: James Liao <jamesjj.liao@mediatek.com>
>    */
>   
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
>   #include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/io.h>
> @@ -17,6 +19,7 @@
>   #include "mt8183-mmsys.h"
>   #include "mt8186-mmsys.h"
>   #include "mt8192-mmsys.h"
> +#include "mt8195-mmsys.h"
>   #include "mt8365-mmsys.h"
>   
>   static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> @@ -72,12 +75,24 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
> +	.clk_name = "cfg_vdo0",
> +	.clk_driver = "clk-mt8195-vdo0",
> +	.routes = mmsys_mt8195_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8365-mm",
>   	.routes = mt8365_mmsys_routing_table,
>   	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
>   };
>   
> +static const struct of_device_id mtk_clk_platform_labels[] = {
> +	{ .compatible = "mediatek,mt8195-mmsys",
> +	  .data = (void *)"clk-mt8195"},

I have a hunch that MT8195 won't be the first and last SoC having multiple
mmsys channels. I would tend to think that there will be more....

....so, to make it clean from the beginning, I think that you should, at
this point, assign a struct to that .data pointer, instead of declaring a
drvdata struct into mtk_mmsys_get_match_data_by_clk_name().

Besides, I think that this kind of usage for __clk_get_name() may be an API
abuse... but I'm not sure about that... in any case:
- if it's not an abuse, then you should simply pass mt8195_vdosys0_driver_data,
   or an array of pointers to mtk_mmsys_driver_data;
- if this is an abuse, you can do the same checks by looking at the iostart
   (mmio base address) of the vdosys{0,1} node(s).

Honestly, though, I'm not even sure that you need this different of_device_id
array here... since you could simply wrap the mtk_mmsys_driver_data in the
of_match_mtk_mmsys that you have below... here's another idea:

struct mtk_mmsys_match_data {
	const struct mtk_mmsys_driver_data *drv_data[];
	unsigned short num_drv_data;
};

...so that:

static int some_function_handling_multi_mmsys(struct mtk_mmsys *mmsys,
					      struct mtk_mmsys_match_data *match)
{
	int i;

	i = [ logic to find the right match->drv_data entry here ]

	return i;
}

static int mtk_mmsys_probe()
{
	.... variables, something else ....

	if (match_data->num_drv_data > 1) {
		/* This SoC has multiple mmsys channels */
		ret = some_function_handling_multi_mmsys(mmsys);
		if (ret < 0)
			return ret;

		mmsys->data = match_data->drv_data[ret];
	} else {
		dev_dbg(dev, "Using single mmsys channel\n");
		mmsys->data = match_data->drv_data[0];
	}

	...everything else that mtk_mmsys_probe does ...
}

What I'm trying to communicate with this is that the currently chosen solution
looks a bit fragile and needs to be made robust.
In comparison, even if it's not technically right to have two different compatibles
for the same hardware (and shall not be done), the former solution, even if wrong,
was more robust than this one, imo.

Regards,
Angelo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
