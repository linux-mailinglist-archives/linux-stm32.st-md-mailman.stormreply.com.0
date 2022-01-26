Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DB649C293
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 05:18:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6AFBC5F1D5;
	Wed, 26 Jan 2022 04:18:16 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 574E0C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 04:18:15 +0000 (UTC)
X-UUID: bf269328d4f74b1ba8d5510d6c5114ba-20220126
X-UUID: bf269328d4f74b1ba8d5510d6c5114ba-20220126
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 740193489; Wed, 26 Jan 2022 12:18:11 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 26 Jan 2022 12:18:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 12:18:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Jan 2022 12:18:09 +0800
Message-ID: <54aa0b9c88cf421eb382def79f3e06ef93d33c02.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 26 Jan 2022 12:18:09 +0800
In-Reply-To: <72aa6c751db15e4aac813247c309fae622180056.camel@mediatek.com>
References: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
 <20220107101425.6917-9-jason-jh.lin@mediatek.com>
 <72aa6c751db15e4aac813247c309fae622180056.camel@mediatek.com>
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
Subject: Re: [Linux-stm32] [PATCH v14 08/12] soc: mediatek: add mtk-mmsys
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

On Tue, 2022-01-25 at 11:44 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Fri, 2022-01-07 at 18:14 +0800, jason-jh.lin wrote:
> > Add mt8195 vdosys0 clock driver name and routing table to
> > the driver data of mtk-mmsys.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> > The vdosys1 impelmentation patch [1] will be dependened on this
> > patch.
> > [1] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
> > - 
> > 
https://patchwork.kernel.org/project/linux-mediatek/patch/20211208024426.15595-6-nancy.lin@mediatek.com/
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h    | 220
> > +++++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c       |  11 ++
> >  include/linux/soc/mediatek/mtk-mmsys.h |   9 +
> >  3 files changed, 240 insertions(+)
> >  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > new file mode 100644
> > index 000000000000..e04cabdfa2dc
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -0,0 +1,220 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> > +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> > +
> > +#define MT8195_VDO0_OVL_MOUT_EN					
> > 0xf14
> > +/*
> > + * MT8195_VDO0_OVL_MOUT[2:0]: DISP_OVL0
> > + *   BIT(0) : DISP_RDMA0
> > + *   BIT(1) : DISP_WDMA0
> > + *   BIT(2): DISP_OVL1
> 
> I think these information is not necessary because we could get these
> information from mmsys_mt8195_routing_table[].
> 
> Regards,
> CK
> 
These comments was suggest by Fei at:

https://patchwork.kernel.org/project/linux-mediatek/patch/20210921155218.10387-10-jason-jh.lin@mediatek.com/#24546317

I've discussed with him that removing these information is fine.
So' I'll remove it at the next version.

> > + */
> > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			
> > BIT(0)
> > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			
> > BIT(1)
> > +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)
> > +/*
> > + * MT8195_VDO0_OVL_MOUT[6:4]: DISP_OVL1
> > + *   BIT(0) : DISP_RDMA1
> > + *   BIT(1) : DISP_WDMA1
> > + *   BIT(2): DISP_OVL0
> > + */
> > 
> 
> [snip]
> 
> > +
> > +static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[]
> > =
> > {
> > +	{
> > +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> > +		MT8195_VDO0_OVL_MOUT_EN,
> > MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0,
> > +		MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0
> > +	}, {
> > +		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
> > +		MT8195_VDO0_OVL_MOUT_EN,
> > MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1,
> > +		MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT,

> Why this mask MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT is 0?

> > +		MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
> > +	}, {
> > +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> > +		MT8195_VDO0_SEL_IN,

> Why this mask MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE is 0?

> > +		MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0,
> > +		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT,

> Why this mask MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0 is 0?

> Regards,
> CK

I'll fix the 0 mask problem with the define of GENMASK(h, l) for each
mux settings.

Regards,
Jason-JH.Lin

> > +		MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_IN,
> > MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0,
> > +		MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> > +		MT8195_VDO0_SEL_OUT,
> > MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN,
> > +		MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
> > +	}, {
> > +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_DSI0,
> > +		MT8195_SOUT_DISP_DITHER0_TO_DSI0
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> > +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0,
> > +		MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0
> > +	}, {
> > +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> > +		MT8195_VDO0_SEL_OUT,
> > MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE,
> > +		MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
> > +	}, {
> > +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> > +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_DP_INTF0,
> > +		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
> > +	}
> > +};
> > +
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
