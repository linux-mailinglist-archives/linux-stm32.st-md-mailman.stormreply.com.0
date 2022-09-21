Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C865BF299
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Sep 2022 03:14:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4BA5C640FB;
	Wed, 21 Sep 2022 01:14:55 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBD6CC640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 01:14:53 +0000 (UTC)
X-UUID: 00dbde89468e48c8980368407c5174c2-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ktfKjkuCSlQ6+XBcD3iNIlUZc9IseljbIXo3FqlLINs=; 
 b=ONomnynQNKYp/OtLRjDQSsdjunAulXc1ExepZW83eEyolFjTf/K2V4hU9q+NGLNwuri/TnbdNG4N7UITHO9xQ0jAi5EAWM4rEpM46EguIoWOcOXrFQDT0rfE8KMxckJJc0xDRl3ihTdZCjWQSkdl27exgzBUw3VjdEsdIrJ6j2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:a6447ef3-ae29-4966-8222-13df92a4bb1b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:ffe915f7-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 00dbde89468e48c8980368407c5174c2-20220921
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jianguo.zhang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 423726621; Wed, 21 Sep 2022 09:14:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 09:14:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 09:14:45 +0800
Message-ID: <63ca556b81bc2874d3f0a5b87ee0e2f7a4fdeb18.camel@mediatek.com>
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 21 Sep 2022 09:14:44 +0800
In-Reply-To: <3ed55b0d-6c14-79a1-b4c1-5764c667d195@collabora.com>
References: <20220920083617.4177-1-jianguo.zhang@mediatek.com>
 <20220920083617.4177-2-jianguo.zhang@mediatek.com>
 <3ed55b0d-6c14-79a1-b4c1-5764c667d195@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: net: mediatek-dwmac: add
 support for mt8188
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

Dear AngeloGioacchino

	Thanks for your comment.

On Tue, 2022-09-20 at 15:22 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/09/22 10:36, Jianguo Zhang ha scritto:
> > Add binding document for the ethernet on mt8188
> > 
> > Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> > ---
> >   .../devicetree/bindings/net/mediatek-dwmac.yaml        | 10
> > ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > index 61b2fb9e141b..eaf7e8d53432 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> > @@ -20,6 +20,7 @@ select:
> >           enum:
> >             - mediatek,mt2712-gmac
> 
> Please keep the list ordered by name. MT8188 goes before 8195.
> 
We will adjust the order in next version patches.

> >             - mediatek,mt8195-gmac
> > +          - mediatek,mt8188-gmac
> >     required:
> >       - compatible
> >   
> > @@ -37,6 +38,11 @@ properties:
> >             - enum:
> >                 - mediatek,mt8195-gmac
> >             - const: snps,dwmac-5.10a
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8188-gmac
> > +          - const: mediatek,mt8195-gmac
> > +          - const: snps,dwmac-5.10a
> >   
> >     clocks:
> >       minItems: 5
> > @@ -74,7 +80,7 @@ properties:
> >         or will round down. Range 0~31*170.
> >         For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> >         or will round down. Range 0~31*550.
> > -      For MT8195 RGMII/RMII/MII interface, Allowed value need to
> > be a multiple of 290,
> > +      For MT8195/MT8188 RGMII/RMII/MII interface, Allowed value
> > need to be a multiple of 290,
> 
> For MT8188/MT8195
> 
We will adjust the order in next version patches.

> >         or will round down. Range 0~31*290.
> >   
> >     mediatek,rx-delay-ps:
> > @@ -84,7 +90,7 @@ properties:
> >         or will round down. Range 0~31*170.
> >         For MT2712 RMII/MII interface, Allowed value need to be a
> > multiple of 550,
> >         or will round down. Range 0~31*550.
> > -      For MT8195 RGMII/RMII/MII interface, Allowed value need to
> > be a multiple
> > +      For MT8195/MT8188 RGMII/RMII/MII interface, Allowed value
> > need to be a multiple
> 
> For MT8188/MT8195
> 
We will adjust the order in next version patches.

> >         of 290, or will round down. Range 0~31*290.
> >   
> >     mediatek,rmii-rxc:
> 
> 
BRS
Jianguo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
