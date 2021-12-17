Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C727E4782F9
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Dec 2021 03:06:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79417C5F1D9;
	Fri, 17 Dec 2021 02:06:10 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45D75C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Dec 2021 02:06:08 +0000 (UTC)
X-UUID: bfd9d48296cc4064aa069d17e1140ff2-20211217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oKLXoDnvb+4kT3LFl2tU05cJqVSai2RXcpGwEw0iC4E=; 
 b=ELpxMOegMLNzSaITGX1OAu2PibuUls4egKInPifVqYzhfRGPKCOWfdaCc4YLTdeeho8vykxt8KD12j7uaSWzDnXs2MQHRay5lh6MraoZdqazNYZv35/0/hAinInn5Q/f2Mtmm6ACUL4Ik8LdyQ2lKZkV94DrEF+b+5qVbNFS3Go=;
X-UUID: bfd9d48296cc4064aa069d17e1140ff2-20211217
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1188725979; Fri, 17 Dec 2021 10:06:02 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 17 Dec 2021 10:06:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Dec 2021 10:05:58 +0800
Message-ID: <be023f9d2fb2a8f947bd0075e8732ba07cfd7b89.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 17 Dec 2021 10:05:58 +0800
In-Reply-To: <1639662782.987227.4004875.nullmailer@robh.at.kernel.org>
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-7-biao.huang@mediatek.com>
 <1639662782.987227.4004875.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, davem@davemloft.net, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v10 6/6] net: dt-bindings: dwmac:
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

  For mt8195, the eth device node will look like:
  eth: ethernet@11021000 {
    compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
    ...
    clock-names = "axi",
                  "apb",
                  "mac_cg",
                  "mac_main",
                  "ptp_ref",
                  "rmii_internal";
    clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
             <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
             <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>,
             <&topckgen CLK_TOP_SNPS_ETH_250M>,
             <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
             <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
    ...
  }

1. "rmii_internal" is a special clock only required for
   RMII phy interface, dwmac-mediatek.c will enable clocks
   invoking clk_bulk_prepare_enable(xx, 6) for RMII,
   and clk_bulk_prepare_enable(xx, 5) for other phy interfaces.
   so, mt2712/mt8195 all put "rmii_internal" clock to the
   end of clock list to simplify clock handling.

   If I put mac_cg as described above, a if condition is required
for clocks description in dt-binding, just like what I do in v7 send:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - mediatek,mt2712-gmac

    then:
      properties:
        clocks:
          minItems: 5
          items:
            - description: AXI clock
            - description: APB clock
            - description: MAC Main clock
            - description: PTP clock
            - description: RMII reference clock provided by MAC

        clock-names:
          minItems: 5
          items:
            - const: axi
            - const: apb
            - const: mac_main
            - const: ptp_ref
            - const: rmii_internal

  - if:
      properties:
        compatible:
          contains:
            enum:
              - mediatek,mt8195-gmac

    then:
      properties:
        clocks:
          minItems: 6
          items:
            - description: AXI clock
            - description: APB clock
            - description: MAC clock gate
            - description: MAC Main clock
            - description: PTP clock
            - description: RMII reference clock provided by MAC

   This introduces some duplicated description.

2. If I put "mac_cg" to the end of clock list,
   the dt-binding file can be simple just like
   what we do in this v10 patch(need fix warnings reported by "make
DT_CHECKER_FLAGS=-m dt_binding_check").

   But for mt8195:
     the eth node in dts should be modified,
     and eth driver clock handling will be complex;

We prefer 1(duplicated description one).
Can we just descirbe clocks/clocks-names for mt2712/mt8195 seperately?
Please kindly comment about this issue.
Thanks in advance.

On Thu, 2021-12-16 at 07:53 -0600, Rob Herring wrote:
> On Thu, 16 Dec 2021 13:53:28 +0800, Biao Huang wrote:
> > Add binding document for the ethernet on mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.yaml          | 29
> > ++++++++++++++++---
> >  1 file changed, 25 insertions(+), 4 deletions(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> properties:clock-names: {'minItems': 5, 'maxItems': 6, 'items':
> [{'const': 'axi'}, {'const': 'apb'}, {'const': 'mac_main'}, {'const':
> 'ptp_ref'}, {'const': 'rmii_internal'}, {'const': 'mac_cg'}]} should
> not be valid under {'required': ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> ignoring, error in schema: properties: clock-names
> warning: no schema found in file:
> ./Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> Documentation/devicetree/bindings/net/mediatek-
> dwmac.example.dt.yaml:0:0: /example-0/ethernet@1101c000: failed to
> match any schema with compatible: ['mediatek,mt2712-gmac',
> 'snps,dwmac-4.20a']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1568902
> 
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
