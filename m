Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38077403821
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Sep 2021 12:43:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 054F0C5AB8A;
	Wed,  8 Sep 2021 10:43:41 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2259C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Sep 2021 10:13:12 +0000 (UTC)
X-UUID: 4a9d616f80a246e4a61403695f9c254f-20210908
X-UUID: 4a9d616f80a246e4a61403695f9c254f-20210908
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 314132779; Wed, 08 Sep 2021 18:13:07 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 18:13:06 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Sep 2021 18:13:06 +0800
Message-ID: <7b375cc4f2899408d8f49867cf8cab16b93b10d2.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 8 Sep 2021 18:13:06 +0800
In-Reply-To: <8de99666-f9be-320d-96c0-b9e140d3d4b4@collabora.com>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
 <20210908060312.24007-2-jason-jh.lin@mediatek.com>
 <8de99666-f9be-320d-96c0-b9e140d3d4b4@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 08 Sep 2021 10:43:36 +0000
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v10 01/17] dt-bindings: arm: mediatek:
 mmsys: add power and gce properties
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

Hi Enric,

Thanks for the reviews.

On Wed, 2021-09-08 at 10:32 +0200, Enric Balletbo i Serra wrote:
> Hi Jason,
> 
> Thank you for your patch. One small comment below.
> 
> On 8/9/21 8:02, jason-jh.lin wrote:
> > Power:
> > 1. Add description for power-domains property.
> > 
> > GCE:
> > 1. Add description for mboxes property.
> > 2. Add description for mediatek,gce-client-reg property.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 30
> > ++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index 2d4ff0ce387b..a2e7bddfed03 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -39,6 +39,30 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  power-domains:
> > +    description:
> > +      A phandle and PM domain specifier as defined by bindings
> > +      of the power controller specified by phandle. See
> > +      Documentation/devicetree/bindings/power/power-domain.yaml
> > for details.
> > +
> > +  mboxes:
> > +    description:
> > +      Using mailbox to communicate with GCE, it should have this
> > +      property and list of phandle, mailbox specifiers. See
> > +      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for
> > details.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +  mediatek,gce-client-reg:
> > +    description:
> > +      The register of client driver can be configured by gce with
> > 4 arguments
> > +      defined in this property, such as phandle of gce, subsys id,
> > +      register offset and size.
> > +      Each subsys id is mapping to a base address of display
> > function blocks
> > +      register which is defined in the gce header
> > +      include/dt-bindings/gce/<chip>-gce.h.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    maxItems: 1
> > +
> >    "#clock-cells":
> >      const: 1
> >  
> > @@ -53,6 +77,10 @@ examples:
> >    - |
> >      mmsys: syscon@14000000 {
> >          compatible = "mediatek,mt8173-mmsys", "syscon";
> > -        reg = <0x14000000 0x1000>;
> > +        reg = <0 0x14000000 0 0x1000>;
> 
> Why this change?
> 
> Thanks,
>   Enric
> 

I think the first version of this example is not correct.
I,ve checked the first version of mt8173.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64/boot/dts/mediatek/mt8173.dtsi?id=b3a37248415716663ea2d752da4a5f765fc87442

Because #address-cells and #size-cells of parent node are defined as 2.

e.g.

soc {
	#address-cells = <2>;
	#size-cells = <2>;
...

};


Regards,
Jason-JH.Lin

> 
> > +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> >          #clock-cells = <1>;
> > +        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> > +                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> > +        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> >      };
> > 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
