Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E754ED15F
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Mar 2022 03:44:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5D75C60496;
	Thu, 31 Mar 2022 01:44:41 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CECCC60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Mar 2022 01:44:39 +0000 (UTC)
X-UUID: ca2ca1f7ce0641319e9e23fe5e4d21e9-20220331
X-UUID: ca2ca1f7ce0641319e9e23fe5e4d21e9-20220331
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 800871722; Thu, 31 Mar 2022 09:44:33 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 31 Mar 2022 09:44:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 09:44:30 +0800
Message-ID: <524f93ebeaa9c2ad74b0f5dbb2703afa4c8e0bac.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 31 Mar 2022 09:44:30 +0800
In-Reply-To: <72e5b8ed21a796f6f756b0ee42b363c158f18cd3.camel@mediatek.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-6-jason-jh.lin@mediatek.com>
 <72e5b8ed21a796f6f756b0ee42b363c158f18cd3.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 roy-cw.yeh@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v16 5/8] soc: mediatek: add mtk-mutex
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

On Fri, 2022-03-18 at 15:21 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Mon, 2022-03-07 at 11:28 +0800, jason-jh.lin wrote:
> > Add mtk-mutex support for mt8195 vdosys0.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c | 103
> > ++++++++++++++++++++++++++++++-
> >  1 file changed, 100 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index aaf8fc1abb43..1c7ffcdadcea 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -17,6 +17,9 @@
> >  #define MT8183_MUTEX0_MOD0			0x30
> >  #define MT8183_MUTEX0_SOF0			0x2c
> >  
> > +#define MT8195_DISP_MUTEX0_MOD0			0x30
> > +#define MT8195_DISP_MUTEX0_SOF			0x2c
> > +
> >  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 *
> > (n))
> >  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
> >  #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 *
> > (n))
> > @@ -96,6 +99,36 @@
> >  #define MT8173_MUTEX_MOD_DISP_PWM1		24
> >  #define MT8173_MUTEX_MOD_DISP_OD		25
> >  

[snip]

> > > +#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
> > > +#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
> > > +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	22
> > > 
> > > Useless, remove.
> > > 
> > > > +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	23
> > > 
> > > Ditto.
> > > 
> > > Regards,
> > > CK
> > 
> > Although these definitions are not used, they represent the
> > functionality provided by this register.
> > 
> > I think we can show that we have these capabilities by defining
> them.
> > 
> > Can we keep these definitions?
> 
> OK, but add some information that we could know how to use it. What's
> these DL_RELAY and when should we add these to mutex?
> 
> Regards,
> CK

DL_RELAY is used for the cross mmsys mux settings.
We won't use these setting currently, so I think
I just remove these useless define.

Thanks.

Regards,
Jason-JH.Lin


[snip]

-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
