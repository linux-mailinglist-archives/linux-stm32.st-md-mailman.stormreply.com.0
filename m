Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D34F8BD4
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 03:28:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31C69C628B2;
	Fri,  8 Apr 2022 01:28:18 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 868CDC628AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 01:28:15 +0000 (UTC)
X-UUID: b923c1f18c9e42a49e9ebade0122da11-20220408
X-UUID: b923c1f18c9e42a49e9ebade0122da11-20220408
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1942514810; Fri, 08 Apr 2022 09:28:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 8 Apr 2022 09:28:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 09:28:05 +0800
Message-ID: <1f1692b6d14280fed40e53f464145ed70b67135f.camel@mediatek.com>
From: CK Hu <ck.hu@mediatek.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Fri, 8 Apr 2022 09:28:05 +0800
In-Reply-To: <d8711b8e4d233240eda73db54a625e88b9b3970b.camel@mediatek.com>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
 <20220407030409.9664-4-jason-jh.lin@mediatek.com>
 <67b3e42d6a094108f724ed9b8c73f5cd6b2ce219.camel@mediatek.com>
 <d8711b8e4d233240eda73db54a625e88b9b3970b.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, moudy.ho@mediatek.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com, hsinyi@chromium.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, postmaster@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Fabien
 Parent <fparent@baylibre.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, roy-cw.yeh@mediatek.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 John 'Warthog9' Hawley <warthog9@eaglescrag.net>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi, Jason:

On Thu, 2022-04-07 at 14:27 +0800, Jason-JH Lin wrote:
> Hi CK,
> 
> Thanks for the reviews.
> 
> On Thu, 2022-04-07 at 13:45 +0800, CK Hu wrote:
> > Hi, Jason:
> > 
> > On Thu, 2022-04-07 at 11:04 +0800, jason-jh.lin wrote:
> > > 1. Add mt8195 mmsys compatible for vdosys0.
> > > 2. Add mt8195 routing table settings and fix build fail.
> > > 3. Add clock name, clock driver name and routing table into the
> > > driver data
> > >    of mt8195 vdosys0.
> > > 4. Add get match data by clock name function and clock platform
> > > labels
> > >    to identify which mmsys node is corresponding to vdosys0.
> > > 
> > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   2 +-
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
> > >  drivers/soc/mediatek/mt8167-mmsys.h         |   2 +-
> > >  drivers/soc/mediatek/mt8183-mmsys.h         |   2 +-
> > >  drivers/soc/mediatek/mt8186-mmsys.h         |   4 +-
> > >  drivers/soc/mediatek/mt8192-mmsys.h         |   4 +-
> > >  drivers/soc/mediatek/mt8195-mmsys.h         | 370
> > > ++++++++++++++++++++
> > >  drivers/soc/mediatek/mt8365-mmsys.h         |   4 +-
> > >  drivers/soc/mediatek/mtk-mmsys.c            |  62 ++++
> > >  drivers/soc/mediatek/mtk-mmsys.h            |   1 +
> > >  drivers/soc/mediatek/mtk-mutex.c            |   8 +-
> > >  include/linux/soc/mediatek/mtk-mmsys.h      |  13 +-
> > >  12 files changed, 461 insertions(+), 17 deletions(-)
> > >  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> > > 
> > 
> > [snip]
> > 
> > > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > > b/drivers/soc/mediatek/mtk-mmsys.c
> > > index 4fc4c2c9ea20..b2fa239c5f5f 100644
> > > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > > @@ -4,6 +4,8 @@
> > >   * Author: James Liao <jamesjj.liao@mediatek.com>
> > >   */
> > >  
> > > +#include <linux/clk.h>
> > > +#include <linux/clk-provider.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/device.h>
> > >  #include <linux/io.h>
> > > @@ -17,6 +19,7 @@
> > >  #include "mt8183-mmsys.h"
> > >  #include "mt8186-mmsys.h"
> > >  #include "mt8192-mmsys.h"
> > > +#include "mt8195-mmsys.h"
> > >  #include "mt8365-mmsys.h"
> > >  
> > >  static const struct mtk_mmsys_driver_data
> > > mt2701_mmsys_driver_data
> > > =
> > > {
> > > @@ -72,12 +75,24 @@ static const struct mtk_mmsys_driver_data
> > > mt8192_mmsys_driver_data = {
> > >  	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
> > >  };
> > >  
> > > +static const struct mtk_mmsys_driver_data
> > > mt8195_vdosys0_driver_data
> > > = {
> > > +	.clk_name = "cfg_vdo0",
> > > +	.clk_driver = "clk-mt8195-vdo0",
> > > +	.routes = mmsys_mt8195_routing_table,
> > > +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > > +};
> > > +
> > >  static const struct mtk_mmsys_driver_data
> > > mt8365_mmsys_driver_data
> > > =
> > > {
> > >  	.clk_driver = "clk-mt8365-mm",
> > >  	.routes = mt8365_mmsys_routing_table,
> > >  	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
> > >  };
> > >  
> > > +static const struct of_device_id mtk_clk_platform_labels[] = {
> > > +	{ .compatible = "mediatek,mt8195-mmsys",
> > > +	  .data = (void *)"clk-mt8195"},
> > > +};
> > > +
> > >  struct mtk_mmsys {
> > >  	void __iomem *regs;
> > >  	const struct mtk_mmsys_driver_data *data;
> > > @@ -85,6 +100,45 @@ struct mtk_mmsys {
> > >  	struct reset_controller_dev rcdev;
> > >  };
> > >  
> > > +static int mtk_mmsys_get_match_data_by_clk_name(const struct
> > > mtk_mmsys_driver_data **data,
> > > +						struct device *dev)
> > > +{
> > > +	int i;
> > > +	struct clk *clk;
> > > +	const char *clk_name;
> > > +	const struct of_device_id *of_id =
> > > of_match_node(mtk_clk_platform_labels,
> > > +							 dev->of_node);
> > > +	const struct mtk_mmsys_driver_data *drvdata[] = {
> > > +		&mt8195_vdosys0_driver_data,
> > > +	};
> > > +
> > > +	if (!of_id || !of_id->data) {
> > > +		dev_err(dev, "Can't find match clk platform labels\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	clk = devm_clk_get(dev, NULL);
> > > +	if (IS_ERR(clk)) {
> > > +		dev_err(dev, "failed to get mmsys clk\n");
> > > +		return PTR_ERR(clk);
> > > +	}
> > > +
> > > +	clk_name = __clk_get_name(clk);
> > > +	if (!clk_name) {
> > > +		dev_err(dev, "invalid mmsys clk name\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(drvdata); i++)
> > > +		if (strncmp(drvdata[i]->clk_name, clk_name,
> > > strlen(clk_name)) == 0 &&
> > > +		    strncmp(drvdata[i]->clk_driver, of_id->data,
> > > strlen(of_id->data)) == 0) {
> > 
> > I think clk_name is enough to identify the mmsys, why do you need
> > clk_driver?
> 
> I think there might be another chip that needs to get driver data by
> clk_name .
> So I use "clk-mt8195" in clk_driver to identify the corresponding
> platform whose clk_name of mmsys is also "cfg_vod0".

We usually don't care the future because the future may not happen. If
it's sure that would happen, I think clk_driver is not a good choice.
For now, the clk_driver name is different for each SoC, but it could be
the same for each SoC because only one clock driver would be compiled.
I think "compatible" would be different for each SoC.

Regards,
CK

> 
> > > +			*data = drvdata[i];
> > > +			return 0;
> > > +		}
> > > +
> > > +	return -EINVAL;
> > > +}
> > > +
> > >  void mtk_mmsys_ddp_connect(struct device *dev,
> > >  			   enum mtk_ddp_comp_id cur,
> > >  			   enum mtk_ddp_comp_id next)
> > > @@ -206,6 +260,11 @@ static int mtk_mmsys_probe(struct
> > > platform_device *pdev)
> > >  	}
> > >  
> > >  	mmsys->data = of_device_get_match_data(&pdev->dev);
> > > +	if (!mmsys->data &&
> > > mtk_mmsys_get_match_data_by_clk_name(&mmsys->data, dev) < 0) {
> > > +		dev_err(dev, "Couldn't get match driver data\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > >  	platform_set_drvdata(pdev, mmsys);
> > >  
> > >  	clks = platform_device_register_data(&pdev->dev, mmsys->data-
> > > > clk_driver,
> > > 
> > > @@ -260,6 +319,9 @@ static const struct of_device_id
> > > of_match_mtk_mmsys[] = {
> > >  		.compatible = "mediatek,mt8192-mmsys",
> > >  		.data = &mt8192_mmsys_driver_data,
> > >  	},
> > > +	{
> > > +		.compatible = "mediatek,mt8195-mmsys",
> > > +	},
> > >  	{
> > >  		.compatible = "mediatek,mt8365-mmsys",
> > >  		.data = &mt8365_mmsys_driver_data,
> > > 
> > 
> > [snip]
> > 
> > > b/include/linux/soc/mediatek/mtk-mmsys.h
> > > index 4bba275e235a..fb719fd1281c 100644
> > > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > > @@ -16,14 +16,25 @@ enum mtk_ddp_comp_id {
> > >  	DDP_COMPONENT_CCORR,
> > >  	DDP_COMPONENT_COLOR0,
> > >  	DDP_COMPONENT_COLOR1,
> > > -	DDP_COMPONENT_DITHER,
> > > +	DDP_COMPONENT_DITHER0,
> > 
> > I would like soc and drm modification to go through different tree,
> > so
> > this setting would not modify drm driver in this patch.
> > 
> > DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
> > 
> > Then modify drm driver after this patch.
> > 
> > Regards,
> > CK
> 
> OK, I will use this modification at the next version.
> Thanks!
> 
> Regards,
> Jason-JH.Lin
> 
> > 
> > > +	DDP_COMPONENT_DITHER1,
> > > +	DDP_COMPONENT_DP_INTF0,
> > > +	DDP_COMPONENT_DP_INTF1,
> > >  	DDP_COMPONENT_DPI0,
> > >  	DDP_COMPONENT_DPI1,
> > > +	DDP_COMPONENT_DSC0,
> > > +	DDP_COMPONENT_DSC1,
> > >  	DDP_COMPONENT_DSI0,
> > >  	DDP_COMPONENT_DSI1,
> > >  	DDP_COMPONENT_DSI2,
> > >  	DDP_COMPONENT_DSI3,
> > >  	DDP_COMPONENT_GAMMA,
> > > +	DDP_COMPONENT_MERGE0,
> > > +	DDP_COMPONENT_MERGE1,
> > > +	DDP_COMPONENT_MERGE2,
> > > +	DDP_COMPONENT_MERGE3,
> > > +	DDP_COMPONENT_MERGE4,
> > > +	DDP_COMPONENT_MERGE5,
> > >  	DDP_COMPONENT_OD0,
> > >  	DDP_COMPONENT_OD1,
> > >  	DDP_COMPONENT_OVL0,
> > 
> > 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
