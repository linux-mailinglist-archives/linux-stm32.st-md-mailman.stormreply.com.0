Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E15460C4C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 02:35:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 066D8C57B6F;
	Mon, 29 Nov 2021 01:35:33 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70597C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 01:35:31 +0000 (UTC)
X-UUID: 5298a3b35ca940f89135246985ea8080-20211129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yoJLhePLzBo3wM2e/RjTt9dvCDe07O0xX3v3BLWirxQ=; 
 b=g7DLTaIr1MBqoiAi1Y9CaATeLuSu+ACuXzzLa8ZbW9w1HkEz1ts5AASQYyVlg3N7z0oHyqy2ZX7DYilB+vUx7VGiB50RDwUQG27DDKyQ0Cgs3LYD/PAthGk8mmmFqvSmToHxzmYmVbVvgO2oXk2sQvUT2rxpgM+vqmTXt5SzZMQ=;
X-UUID: 5298a3b35ca940f89135246985ea8080-20211129
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 208505581; Mon, 29 Nov 2021 09:35:24 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Nov 2021 09:35:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Nov 2021 09:35:22 +0800
Message-ID: <a7e33e13b24ee98c37a822105ae9d78c44f437ab.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 29 Nov 2021 09:35:22 +0800
In-Reply-To: <YaQZOS54BawtWkGO@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-8-biao.huang@mediatek.com>
 <YaQZOS54BawtWkGO@robh.at.kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH v3 7/7] net-next: dt-bindings: dwmac: add
 support for mt8195
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

On Sun, 2021-11-28 at 18:05 -0600, Rob Herring wrote:
> On Fri, Nov 12, 2021 at 05:39:18PM +0800, Biao Huang wrote:
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
> > index 2eb4781536f7..b27566ed01c6 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -19,12 +19,68 @@ select:
> >        contains:
> >          enum:
> >            - mediatek,mt2712-gmac
> > +          - mediatek,mt8195-gmac
> >    required:
> >      - compatible
> >  
> >  allOf:
> >    - $ref: "snps,dwmac.yaml#"
> >    - $ref: "ethernet-controller.yaml#"
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
> > +            - description: MAC Main clock
> > +            - description: PTP clock
> > +            - description: RMII reference clock provided by MAC
> 
> Put mac_cg at the end and then the difference is just 5 or 6 clocks
> and 
> you don't have to duplicate everything.
> 
There is a special clock -- rmii_internal at the end now, and we'll
enable/disable it in our driver, according to whether phy interface is
RMII, which means invoking clk_bulk_xxx() with parament:
sizeof(clock_list) or (sizeof(clock_list) - 1).

And the Ethernet related clock list may be different due to some
limitation or rule in different IC, we think current arrangement will
make it clear.(If some ICs share the same clock list, put them in the
same if condition)

Thanks~
> 
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
> > @@ -33,22 +89,10 @@ properties:
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
> > @@ -63,6 +107,8 @@ properties:
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
> > @@ -71,6 +117,8 @@ properties:
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
> > @@ -104,6 +152,12 @@ properties:
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
