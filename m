Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC56471F1E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Dec 2021 02:27:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AD49C5AB61;
	Mon, 13 Dec 2021 01:27:56 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FE10C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Dec 2021 01:27:53 +0000 (UTC)
X-UUID: 3ce7ed3cdc4d494ba5463edf988ea11c-20211213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+BSlGe5nShYWaOrfcwxn1EcTMN8sIOIVC8J0cDgjA+Q=; 
 b=og15oVrA1++7iFNNaUc6yzzFJVka+gHTg6Aup5jq3z463LnSYiC7EWU7hqQWEh4NVQJ/+6lhi1rP8gBwWXEfJNmOVMj25XuzlDMA6rCLQnqPxIwd0Inkf5eV1R+ibunFl0WhSOj/evsbZjdMPQpy5zyP2rWSE4bO7lfAaalKmK4=;
X-UUID: 3ce7ed3cdc4d494ba5463edf988ea11c-20211213
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1930732897; Mon, 13 Dec 2021 09:27:48 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 13 Dec 2021 09:27:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Dec 2021 09:27:46 +0800
Message-ID: <5cf063709dad8ff57bdfb3fa742f5f784217f353.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 13 Dec 2021 09:27:47 +0800
In-Reply-To: <YbOh4hZfc+QKA/hO@robh.at.kernel.org>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-7-biao.huang@mediatek.com>
 <YbOh4hZfc+QKA/hO@robh.at.kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH net-next v8 6/6] net: dt-bindings: dwmac:
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
	Thanks for your comment~
On Fri, 2021-12-10 at 12:52 -0600, Rob Herring wrote:
> On Fri, Dec 10, 2021 at 09:31:29AM +0800, Biao Huang wrote:
> > Add binding document for the ethernet on mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.yaml          | 86
> > +++++++++++++++----
> >  1 file changed, 70 insertions(+), 16 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > index 9207266a6e69..fb04166404d8 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -19,11 +19,67 @@ select:
> >        contains:
> >          enum:
> >            - mediatek,mt2712-gmac
> > +          - mediatek,mt8195-gmac
> >    required:
> >      - compatible
> >  
> >  allOf:
> >    - $ref: "snps,dwmac.yaml#"
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt2712-gmac
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 5
> > +          items:
> > +            - description: AXI clock
> > +            - description: APB clock
> > +            - description: MAC Main clock
> > +            - description: PTP clock
> > +            - description: RMII reference clock provided by MAC
> > +
> > +        clock-names:
> > +          minItems: 5
> > +          items:
> > +            - const: axi
> > +            - const: apb
> > +            - const: mac_main
> > +            - const: ptp_ref
> > +            - const: rmii_internal
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8195-gmac
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 6
> > +          items:
> > +            - description: AXI clock
> > +            - description: APB clock
> > +            - description: MAC clock gate
> 
> Add new clocks on to the end of existing clocks. That will simplify
> the 
> binding as here you will just need 'minItems: 6'.
The "rmii_internal" clock is a special one we put it to the end on
purpose, and will turn it on/off in driver according to whether
phy_mode is rmii or not.

So the "mac_cg" clock, which is new for mt8195, and not used in mt2712,
can't put it to the end for simplicity.

Can we just keep it this way? or other suggestions?

[v3 reply]

http://lists.infradead.org/pipermail/linux-mediatek/2021-November/031951.html
> > +            - description: MAC Main clock
> > +            - description: PTP clock
> > +            - description: RMII reference clock provided by MAC
> > +
> > +        clock-names:
> > +          minItems: 6
> > +          items:
> > +            - const: axi
> > +            - const: apb
> > +            - const: mac_cg
> > +            - const: mac_main
> > +            - const: ptp_ref
> > +            - const: rmii_internal
> >  
> >  properties:
> >    compatible:
> > @@ -32,22 +88,10 @@ properties:
> >            - enum:
> >                - mediatek,mt2712-gmac
> >            - const: snps,dwmac-4.20a
> > -
> > -  clocks:
> > -    items:
> > -      - description: AXI clock
> > -      - description: APB clock
> > -      - description: MAC Main clock
> > -      - description: PTP clock
> > -      - description: RMII reference clock provided by MAC
> > -
> > -  clock-names:
> > -    items:
> > -      - const: axi
> > -      - const: apb
> > -      - const: mac_main
> > -      - const: ptp_ref
> > -      - const: rmii_internal
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8195-gmac
> > +          - const: snps,dwmac-5.10a
> >  
> >    mediatek,pericfg:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> > @@ -62,6 +106,8 @@ properties:
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
> > @@ -70,6 +116,8 @@ properties:
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
> > @@ -103,6 +151,12 @@ properties:
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
