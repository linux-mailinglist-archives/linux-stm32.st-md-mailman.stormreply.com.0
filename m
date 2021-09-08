Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBD3403820
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Sep 2021 12:43:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6C8AC5AB87;
	Wed,  8 Sep 2021 10:43:40 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC8D8C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Sep 2021 07:24:44 +0000 (UTC)
X-UUID: 55abe93ce43d45f18f51a92e5edc81da-20210908
X-UUID: 55abe93ce43d45f18f51a92e5edc81da-20210908
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1865226570; Wed, 08 Sep 2021 15:24:38 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 15:24:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 8 Sep 2021 15:24:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Sep 2021 15:24:36 +0800
Message-ID: <adf8bebaccba94a3d84f6c3400628ea8adaebed1.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Date: Wed, 8 Sep 2021 15:24:36 +0800
In-Reply-To: <5ffef736524f3d7fb69f97332576ee9913032bcd.camel@pengutronix.de>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
 <20210908060312.24007-8-jason-jh.lin@mediatek.com>
 <5ffef736524f3d7fb69f97332576ee9913032bcd.camel@pengutronix.de>
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
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v10 07/17] dt-bindings: display: mediatek:
 merge: add additional prop for mt8195
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

Hi Philipp,

Thanks for the reviews.

On Wed, 2021-09-08 at 08:39 +0200, Philipp Zabel wrote:
> Hi Jason,
> 
> On Wed, 2021-09-08 at 14:03 +0800, jason-jh.lin wrote:
> > add MERGE additional properties description for mt8195:
> > 1. async clock
> > 2. fifo setting enable
> > 3. reset controller
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,merge.yaml      | 30
> > +++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > index 75beeb207ceb..0fe204d9ad2c 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > @@ -38,6 +38,19 @@ properties:
> >    clocks:
> >      items:
> >        - description: MERGE Clock
> > +      - description: MERGE Async Clock
> > +          Controlling the synchronous process between MERGE and
> > other display
> > +          function blocks cross clock domain.
> > +
> > +  mediatek,merge-fifo-en:
> > +    description:
> > +      The setting of merge fifo is mainly provided for the display
> > latency
> > +      buffer to ensure that the back-end panel display data will
> > not be
> > +      underrun, a little more data is needed in the fifo.
> > +      According to the merge fifo settings, when the water level
> > is detected
> > +      to be insufficient, it will trigger RDMA sending ultra and
> > preulra
> > +      command to SMI to speed up the data rate.
> > +    type: boolean
> >  
> >    mediatek,gce-client-reg:
> >      description:
> > @@ -50,6 +63,10 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      maxItems: 1
> >  
> > +  resets:
> > +    description: reset controller
> > +      See Documentation/devicetree/bindings/reset/reset.txt for
> > details.
> 
> From the example this looks like it could have a maxItems: 1.

OK, I think it could have a maxItems: 1 in mt8195 because
merge1~megre5 only have one async clock.

> 
> > +
> >  required:
> >    - compatible
> >    - reg
> 
> Should the resets property be required for "mediatek,mt8195-disp-
> merge"?

I think the resets property is not the required propoerty.
The reset controller is for async clock of MERGE module on vdosys1.
MERGE module on vdosys0 doesn't have async clock, so it doesn't need to
add the resets property.

Regards,
Jason-JH.Lin
> 
> > @@ -67,3 +84,16 @@ examples:
> >          power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> >          clocks = <&mmsys CLK_MM_DISP_MERGE>;
> >      };
> > +
> > +    merge5: disp_vpp_merge5@1c110000 {
> > +        compatible = "mediatek,mt8195-disp-merge";
> > +        reg = <0 0x1c110000 0 0x1000>;
> > +        interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
> > +                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
> > +        clock-names = "merge","merge_async";
> > +        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> > +        mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x0000
> > 0x1000>;
> > +        mediatek,merge-fifo-en = <1>;
> > +        resets = <&vdosys1
> > MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
> > +    };
> 
> regards
> Philipp
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
