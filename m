Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B386549C2BC
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 05:43:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C961C5F1D5;
	Wed, 26 Jan 2022 04:43:28 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89475C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 04:43:26 +0000 (UTC)
X-UUID: f1b0db587b614d41aa688a5655f85114-20220126
X-UUID: f1b0db587b614d41aa688a5655f85114-20220126
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 518999993; Wed, 26 Jan 2022 12:43:20 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 26 Jan 2022 12:43:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 12:43:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Jan 2022 12:43:18 +0800
Message-ID: <23915f6d4890d6c7115a01202b84b7aa63d51e36.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 26 Jan 2022 12:43:18 +0800
In-Reply-To: <6e23ceaac55d64b7c74c5ce6d7114936354c2011.camel@mediatek.com>
References: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
 <20220107101425.6917-10-jason-jh.lin@mediatek.com>
 <6e23ceaac55d64b7c74c5ce6d7114936354c2011.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 roy-cw.yeh@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 moudy.ho@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v14 09/12] soc: mediatek: add mtk-mutex
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

Hi CK,

Thanks for the reviews.

On Mon, 2022-01-24 at 17:13 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Fri, 2022-01-07 at 18:14 +0800, jason-jh.lin wrote:
> > Add mtk-mutex support for mt8195 vdosys0.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> > This patch is base on [1]
> > [1] Add mmsys and mutex support for MDP
> > - 
> > 
https://patchwork.kernel.org/project/linux-mediatek/cover/20220104091712.25670-1-moudy.ho@mediatek.com/
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c | 95
> > +++++++++++++++++++++++++++++++-
> >  1 file changed, 92 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index 615c42260a50..89daab7e6863 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -21,6 +21,9 @@
> >  #define MT8183_MUTEX0_MOD0			0x30
> >  #define MT8183_MUTEX0_SOF0			0x2c

[snip]

> >  
> > +static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
> > +	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> > +	[MUTEX_SOF_DSI0] = MT8195_MUTEX_SOF_DSI0 |
> > MT8195_MUTEX_EOF_DSI0,
> > +	[MUTEX_SOF_DSI1] = MT8195_MUTEX_SOF_DSI1 |
> > MT8195_MUTEX_EOF_DSI1,
> > +	[MUTEX_SOF_DPI0] = MT8195_MUTEX_SOF_DPI0 |
> > MT8195_MUTEX_EOF_DPI0,
> > +	[MUTEX_SOF_DPI1] = MT8195_MUTEX_SOF_DPI1 |
> > MT8195_MUTEX_EOF_DPI1,
> > +	[MUTEX_SOF_DP_INTF0] =
> > +		MT8195_MUTEX_SOF_DP_INTF0 | MT8195_MUTEX_EOF_DP_INTF0,
> 
> Why add EOF? Add comment for this.
> 
> Regards,
> CK
> 
OK, I' ll add this comment:

/*
 * To support refresh mode(video mode), DISP_REG_MUTEX_SOF should
 * select the EOF source and configure the EOF plus timing from the 
 * module that provides the timing signal.
 * So that MUTEX can not only send a STREAM_DONE event to GCE
 * but also detect the error at end of frame(EAEOF) when EOF signal
 * arrives.
 */

Regards,
Jason-JH.Lin

> > +	[MUTEX_SOF_DP_INTF1] =
> > +		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
> > +};
> > +
> >  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
> >  	.mutex_mod = mt2701_mutex_mod,
> >  	.mutex_sof = mt2712_mutex_sof,
> > @@ -355,6 +431,13 @@ static const struct mtk_mutex_data
> > mt8192_mutex_driver_data = {
> >  	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> >  };
> >  
> > +static const struct mtk_mutex_data mt8195_mutex_driver_data = {
> > +	.mutex_mod = mt8195_mutex_mod,
> > +	.mutex_sof = mt8195_mutex_sof,
> > +	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
> > +	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
> > +};
> > +
> >  struct mtk_mutex *mtk_mutex_get(struct device *dev)
> >  {
> >  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> > @@ -442,6 +525,9 @@ void mtk_mutex_add_comp(struct mtk_mutex
> > *mutex,
> >  	case DDP_COMPONENT_DPI1:
> >  		sof_id = MUTEX_SOF_DPI1;
> >  		break;
> > +	case DDP_COMPONENT_DP_INTF0:
> > +		sof_id = MUTEX_SOF_DP_INTF0;
> > +		break;
> >  	default:
> >  		if (mtx->data->mutex_mod[id] < 32) {
> >  			offset = DISP_REG_MUTEX_MOD(mtx->data-
> > > mutex_mod_reg,
> > 
> > @@ -481,6 +567,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex
> > *mutex,
> >  	case DDP_COMPONENT_DSI3:
> >  	case DDP_COMPONENT_DPI0:
> >  	case DDP_COMPONENT_DPI1:
> > +	case DDP_COMPONENT_DP_INTF0:
> >  		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
> >  			       mtx->regs +
> >  			       DISP_REG_MUTEX_SOF(mtx->data-
> > > mutex_sof_reg,
> > 
> > @@ -678,6 +765,8 @@ static const struct of_device_id
> > mutex_driver_dt_match[] = {
> >  	  .data = &mt8183_mutex_driver_data},
> >  	{ .compatible = "mediatek,mt8192-disp-mutex",
> >  	  .data = &mt8192_mutex_driver_data},
> > +	{ .compatible = "mediatek,mt8195-disp-mutex",
> > +	  .data = &mt8195_mutex_driver_data},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
