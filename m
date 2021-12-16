Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 573C3476822
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 03:34:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0658DC5E2C5;
	Thu, 16 Dec 2021 02:34:14 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC15DC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 02:34:11 +0000 (UTC)
X-UUID: 2645b85d949c4af4a8a6da26b151cd62-20211216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Llo3GNG3LefL9fq8uRh9hI0WF+b/t4xEI+BOfK4DeHc=; 
 b=HMgEGaV9Han0/KxGAR7ODIaZNrIu14oy5fs0Fui+RN0059hw6ekKTN5X+UxCAkTodbosAJZb6lPyTzOA5tpdhCBOUKdXAqi9DNyk4KjkE/Z6883SxcuQdLm5bRT6sN7C6036BJzlgMbVxSvBqaHH6rxT+EKWmwmics4D31ok7CU=;
X-UUID: 2645b85d949c4af4a8a6da26b151cd62-20211216
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 245205377; Thu, 16 Dec 2021 10:34:05 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Dec 2021 10:34:04 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Dec 2021 10:34:03 +0800
Message-ID: <151fc4556ba03703dffa30aeb8f24aee489c855c.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 16 Dec 2021 10:34:04 +0800
In-Reply-To: <YbpobIscSDPKuxxY@robh.at.kernel.org>
References: <20211215021652.7270-1-biao.huang@mediatek.com>
 <20211215021652.7270-7-biao.huang@mediatek.com>
 <YbpobIscSDPKuxxY@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v9 6/6] net: dt-bindings: dwmac:
 add support for mt8195
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

Dear Rob,
	Thanks for your comments~
On Wed, 2021-12-15 at 16:13 -0600, Rob Herring wrote:
> On Wed, Dec 15, 2021 at 10:16:52AM +0800, Biao Huang wrote:
> > Add binding document for the ethernet on mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.yaml          | 42 ++++++++++++++-
> > ----
> >  1 file changed, 32 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > index 8ad6e19661b8..44d55146def4 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -19,6 +19,7 @@ select:
> >        contains:
> >          enum:
> >            - mediatek,mt2712-gmac
> > +          - mediatek,mt8195-gmac
> >    required:
> >      - compatible
> >  
> > @@ -27,26 +28,37 @@ allOf:
> >  
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - mediatek,mt2712-gmac
> > -      - const: snps,dwmac-4.20a
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2712-gmac
> > +          - const: snps,dwmac-4.20a
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8195-gmac
> > +          - const: snps,dwmac-5.10a
> >  
> >    clocks:
> > +    minItems: 5
> 
> As before, you need 'minItems: 4' in the previous patch.
> 
> If you aren't clear what's needed, run 'make dtbs_checks' yourself 
> before submitting again.

But as modified in "[PATCH net-next v9 3/6] arm64: dts: mt2712: update
ethernet device node", we expect "minItems: 5".

run 'make dtbs_checks' with "[PATCH net-next v9 3/6] arm64: dts:
mt2712: update ethernet device node" applied, will not report logs such
as "ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main',
'ptp_ref'] is too short".

Should it be fine if I keep "minItems:5"?
> 
> >      items:
> >        - description: AXI clock
> >        - description: APB clock
> >        - description: MAC Main clock
> >        - description: PTP clock
> >        - description: RMII reference clock provided by MAC
> > +      - description: MAC clock gate
> >  
> >    clock-names:
> > -    items:
> > -      - const: axi
> > -      - const: apb
> > -      - const: mac_main
> > -      - const: ptp_ref
> > -      - const: rmii_internal
> > +    minItems: 5
> > +    maxItems: 6
> > +    contains:
> 
> No, you just threw out the order requirements. And this schema will
> be 
> true with just 1 of the strings below plus any other strings. For 
> example, this will pass:
> 
> clock-names = "foo", "bar", "axi", "baz", "rob";
I misunderstood this schema, 
and how about the following description:

clock-names:
  minItems: 5
  maxItems: 6
  items:
    - const: axi
    - const: apb
    - const: mac_main
    - const: ptp_ref
    - const: rmii_internal
    - const: mac_cg

Regards!
> 
> > +      enum:
> > +        - axi
> > +        - apb
> > +        - mac_main
> > +        - ptp_ref
> > +        - rmii_internal
> > +        - mac_cg
> >  
> >    mediatek,pericfg:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> > @@ -61,6 +73,8 @@ properties:
> >        or will round down. Range 0~31*170.
> >        For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> >        or will round down. Range 0~31*550.
> > +      For MT8195 RGMII/RMII/MII interface, Allowed value need to
> > be a multiple of 290,
> > +      or will round down. Range 0~31*290.
> >  
> >    mediatek,rx-delay-ps:
> >      description:
> > @@ -69,6 +83,8 @@ properties:
> >        or will round down. Range 0~31*170.
> >        For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> >        or will round down. Range 0~31*550.
> > +      For MT8195 RGMII/RMII/MII interface, Allowed value need to
> > be a multiple
> > +      of 290, or will round down. Range 0~31*290.
> >  
> >    mediatek,rmii-rxc:
> >      type: boolean
> > @@ -102,6 +118,12 @@ properties:
> >        3. the inside clock, which be sent to MAC, will be inversed
> > in RMII case when
> >           the reference clock is from MAC.
> >  
> > +  mediatek,mac-wol:
> > +    type: boolean
> > +    description:
> > +      If present, indicates that MAC supports WOL(Wake-On-LAN),
> > and MAC WOL will be enabled.
> > +      Otherwise, PHY WOL is perferred.
> > +
> >  required:
> >    - compatible
> >    - reg
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
