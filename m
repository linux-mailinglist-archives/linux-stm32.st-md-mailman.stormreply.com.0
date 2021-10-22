Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 406C543754F
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Oct 2021 12:13:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC2BFC5C857;
	Fri, 22 Oct 2021 10:13:33 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 211C9C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 10:13:29 +0000 (UTC)
X-UUID: d80e3027f026469f9531ae037f3ae4a0-20211022
X-UUID: d80e3027f026469f9531ae037f3ae4a0-20211022
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1832692527; Fri, 22 Oct 2021 18:13:24 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Oct 2021 18:13:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Oct 2021 18:13:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 18:13:22 +0800
Message-ID: <29992126d39a7f381a516fdb9cd6e39f1e51afdb.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
Date: Fri, 22 Oct 2021 18:13:22 +0800
In-Reply-To: <8b509551-7cfa-f55c-fc0f-db7d0a3886eb@collabora.com>
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-10-jason-jh.lin@mediatek.com>
 <8b509551-7cfa-f55c-fc0f-db7d0a3886eb@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com, Yongqiang
 Niu <yongqiang.niu@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, roy-cw.yeh@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v11 09/16] soc: mediatek: add mtk-mmsys
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

Hi Angelo,

Thanks for the reviews.


On Thu, 2021-10-14 at 16:05 +0200, AngeloGioacchino Del Regno wrote:
> > Add mt8195 vdosys0 clock driver name and routing table to
> > the driver data of mtk-mmsys.
> > 

[snip]

> >  
> > ---
> 
> Hello Jason,
> thanks for the patch! However, there are a few things to improve:
> 

[snip]

> > +#define MT8195_VDO0_SEL_IN					0xf34
> > +#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		(0 <<
> > 0)
> 
> Bitshifting 0 by 0 bits == 0, so this is simply 0.
> 
> > +#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		(1 <<
> > 0)
> 
> I would write 0x1 here
> 
> > +#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		(2 <<
> > 0)
> 
> ....and 0x2 here: bitshifting of 0 bits makes little sense.
> 
> > +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		
> > (0 << 4)
> 
> Bitshifting 0 by 4 bits is still 0, so this is again 0.
> This is repeated too many times, so I will not list it for all of the
> occurrences.
> 
> > +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		(1 <<
> > 4)
> 
> This is BIT(4).
> 
> > +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		
> > (0 << 5) > +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE	
> > 	(1 << 5)
> 
> ...and this is BIT(5)
> 
> > +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		(0 <<
> > 8)
> > +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		
> > (1 << 8)
> 
> BIT(8)
> 
> > +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		
> > (0 << 9)
> > +#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		(0 <<
> > 12)
> > +#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			
> > (1 << 12)
> 
> BIT(12)
> 
> > +#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		(2 <<
> > 12)
> 
> BIT(13)
> 
> ... and please, use the BIT(nr) macro for all these bit definitions,
> it's way more
> readable like that.
> 
> Regards,
> - Angelo

Because the HW register design of MT8195_VDO0_SEL_IN 0xf34 is like
this:

bit[1:0] as MT8195_SEL_IN_VPP_MERGE and
  value: 0 as MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
  value: 1 as MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1
  value: 2 as MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0
bit[4:4] as MT8195_SEL_IN_DSC_WRAP0_IN and
  value 0 as MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
  value 1 as MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE
bit[5:5] as MT8195_SEL_IN_DSC_WRAP1_IN and
  value 0 as
MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1
  value 1 as
MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE
and so on...

I think using BIT(nr) macro directly is not easy to debug.


Is it better to define another MACRO like this?

#define BIT_VAL(val, bit)  ((val) << (bit))
#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0  BIT_VAL(0, 4)
#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE  BIT_VAL(1, 4)
...

or

#define MT8195_SEL_IN_DSC_WRAP0_IN (4)
#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0  (0
<< MT8195_SEL_IN_DSC_WRAP0_IN)
#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE  (1 <<
MT8195_SEL_IN_DSC_WRAP0_IN)
...

What do you think?


Regards,
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
