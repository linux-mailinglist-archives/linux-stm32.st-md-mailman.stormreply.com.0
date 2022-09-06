Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4865B5ADD5B
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 04:32:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C1CDC640F0;
	Tue,  6 Sep 2022 02:32:27 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEBDAC0C920
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 02:32:24 +0000 (UTC)
X-UUID: 8e35192a87a243c2a988e77da9329084-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lLZfor8VBXyAk27TpjkWmLUUJBncHtHiCzkOPODLj50=; 
 b=kzfporl388g0UA+79REkS7ycBXjJtxz71afRFgOx4spUcNqlqyv7c6QxyA4TK+1gIZSnnOL1j/wHQa9xxvpTUKHcpsHyUVQYVcyG3ySayozyJGysXkcOCIK8PN2IVJQvbxvFW3J3bLYl6Rk/vNguEwzLsyOnL9kEW+MQ5l41uiE=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:0b54bcab-c882-4380-93c5-0f0add6bada9, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Releas
 e_Ham,ACTION:release,TS:49
X-CID-INFO: VERSION:1.1.10, REQID:0b54bcab-c882-4380-93c5-0f0add6bada9, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_
 HamU,ACTION:release,TS:49
X-CID-META: VersionHash:84eae18, CLOUDID:ede04921-1c20-48a5-82a0-25f9c331906d,
 C
 OID:71996c057d7b,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 8e35192a87a243c2a988e77da9329084-20220906
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1451122071; Tue, 06 Sep 2022 10:32:18 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 10:32:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 6 Sep 2022 10:32:16 +0800
Message-ID: <e1b486ec70f7e58c8f204bb9b7377716c8acfcdd.camel@mediatek.com>
From: Nathan Lu <nathan.lu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Tue, 6 Sep 2022 10:32:16 +0800
In-Reply-To: <05f99396-f6e9-a315-7264-c659e3ec507c@linaro.org>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
 <20220822033213.15769-2-nathan.lu@mediatek.com>
 <05f99396-f6e9-a315-7264-c659e3ec507c@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 wsd_upstream@mediatek.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v1 1/4] dt-bindings: mediatek: modify
 VDOSYS0 device tree Documentations for MT8188
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

Hi Krzysztof,

Thanks for your review, and appreciate for all comments and sugestions.
I misunderstanding enum and const usage.
I'll add another item for mt8188 at next version.

On Tue, 2022-08-23 at 15:51 +0300, Krzysztof Kozlowski wrote:
> On 22/08/2022 06:32, nathan.lu wrote:
> > From: Nathan Lu <nathan.lu@mediatek.com>
> > 
> > modify VDOSYS0 device tree Documentations for MT8188.
> 
> (...)
> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > index 0882ae86e6c4..d0e6c0dd4dfb 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.
> > yaml
> > @@ -30,6 +30,8 @@ properties:
> >        - items:
> >            - const: mediatek,mt8183-disp-rdma
> >        - items:
> > +          - enum:
> > +              - mediatek,mt8188-disp-rdma
> >            - const: mediatek,mt8195-disp-rdma
> 
> Why do you change existing bindings?
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
