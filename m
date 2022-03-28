Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CAB4E8C9C
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 05:29:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE417C5C842;
	Mon, 28 Mar 2022 03:29:34 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01D46C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 03:29:32 +0000 (UTC)
X-UUID: ef2f024e960a44cbb8fc45a148b95aea-20220328
X-UUID: ef2f024e960a44cbb8fc45a148b95aea-20220328
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 770176710; Mon, 28 Mar 2022 11:29:26 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 11:29:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 11:29:24 +0800
Message-ID: <f52fbaec28ae53667ba101a05406b62e5970eec1.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Mon, 28 Mar 2022 11:29:24 +0800
In-Reply-To: <1daa3b8dabb97017d0f92437a81b250f8375544c.camel@mediatek.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-4-jason-jh.lin@mediatek.com>
 <1daa3b8dabb97017d0f92437a81b250f8375544c.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v16 3/8] dt-bindings: arm: mediatek:
 mmsys: add mt8195 SoC binding
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

On Fri, 2022-03-18 at 14:43 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Mon, 2022-03-07 at 11:28 +0800, jason-jh.lin wrote:
> > There are 2 mmsys, namely vdosys0 and vdosys1 in mt8195.
> > Each of them is bound to a display pipeline, so add their
> > definition in mtk-mmsys documentation with 2 compatibles.
> 
> Could one vdosys be union of vdosys0 and vdosys1? In MT8173, one
> mmsys
> support multiple pipeline. Describe more in commit message to support
> that two vdosys are necessary.
> 
> Regards,
> CK
> 

In the SoC before, such as mt8173, it has 2 pipelines binding to one
mmsys with the same clock driver and the same power domain.

In mt8195, 2 pipelines are binding to different mmsys, such as vdosys0
and vdosys1. Each mmsys uses different clock drivers and different
power domain.

Since each mmsys has its own clock, I have tried to differentiate
vppsys0, vppsys1, vdosys0, vdosys1 by the clock names.
Then I can use one mmsys compatible name for all of them.

I'll apply this method at the next version.
And also sync with Nancy(vdosys1) and Roy(vppsys0, vppsys1).

Regards,
Jason-JH.Lin

> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        |
> > 2
> > ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index 6c2c3edcd443..c5ba515cb0d7 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -32,6 +32,8 @@ properties:
> >                - mediatek,mt8186-mmsys
> >                - mediatek,mt8192-mmsys
> >                - mediatek,mt8365-mmsys
> > +              - mediatek,mt8195-vdosys0
> > +              - mediatek,mt8195-vdosys1
> >            - const: syscon
> >        - items:
> >            - const: mediatek,mt7623-mmsys
> 
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
