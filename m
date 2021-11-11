Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95244D1DD
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 07:16:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3761C5EC71;
	Thu, 11 Nov 2021 06:16:06 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E6E8CFAC4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 06:16:03 +0000 (UTC)
X-UUID: b19ff7f055f84f59846da09edcc5d20f-20211111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tHZR4ShgONrY1xlUrKSMoIV7qdy+WnxCRT5rQr7aNKg=; 
 b=AXypkWyzZ8T+5Xhbxi3j/hp1XjY94qr1XZyfZ6FI6buZRJY/nBAWGrytEpmzcR7H7w8Op8tWD2eRS37nUO8JtFNGQ5OQ51zcKR8IOKQ+m0hQNnEqR5phz2VHzEorka/4HK1ULoVzlb9AasCtv13+S6RVkeHXI3lLXcPPeNZk/B8=;
X-UUID: b19ff7f055f84f59846da09edcc5d20f-20211111
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 806377556; Thu, 11 Nov 2021 14:15:57 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 11 Nov 2021 14:15:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 11 Nov 2021 14:15:55 +0800
Message-ID: <426d15179d7d79c3f3bd4774e23d4f5e384c7956.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 11 Nov 2021 14:15:55 +0800
In-Reply-To: <1636573460.872424.1783735.nullmailer@robh.at.kernel.org>
References: <20211110083948.6082-1-biao.huang@mediatek.com>
 <20211110083948.6082-5-biao.huang@mediatek.com>
 <1636573460.872424.1783735.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] dt-bindings: net: dwmac: Convert
 mediatek-dwmac to DT schema
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
	I'll check again with updated dtschema, and send in next
version.
	
Best Regards!
Biao

On Wed, 2021-11-10 at 13:44 -0600, Rob Herring wrote:
> On Wed, 10 Nov 2021 16:39:47 +0800, Biao Huang wrote:
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.txt           |  91 ---------
> >  .../bindings/net/mediatek-dwmac.yaml          | 179
> > ++++++++++++++++++
> >  2 files changed, 179 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> >  create mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
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
> properties:mediatek,tx-delay-ps: '$ref' should not be valid under
> {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> properties:mediatek,rx-delay-ps: '$ref' should not be valid under
> {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> properties:clocks: {'minItems': 5, 'maxItems': 6, 'items':
> [{'description': 'AXI clock'}, {'description': 'APB clock'},
> {'description': 'MAC clock gate'}, {'description': 'MAC Main clock'},
> {'description': 'PTP clock'}, {'description': 'RMII reference clock
> provided by MAC'}]} should not be valid under {'required':
> ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> ignoring, error in schema: properties: mediatek,tx-delay-ps
> warning: no schema found in file:
> ./Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> Documentation/devicetree/bindings/net/mediatek-
> dwmac.example.dt.yaml:0:0: /example-0/ethernet@1101c000: failed to
> match any schema with compatible: ['mediatek,mt2712-gmac',
> 'snps,dwmac-4.20a']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1553304
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
