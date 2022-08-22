Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4389559B8C2
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Aug 2022 07:36:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6D1DC64115;
	Mon, 22 Aug 2022 05:36:45 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A437AC64112
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Aug 2022 05:36:43 +0000 (UTC)
X-UUID: 72ce0efa30c048768c46bbda821a00b1-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QIQXRYetqv/4dOkqVhPTk9ulib+F+9TbIPC1RM+VTr4=; 
 b=UgJsbIt+/DWjfdUnFdF5OWuV/AG3YwYPRg3YM6RXv0qqbmJ5L1r5NHYY62w+b6hqwG5X62qNkLpSrUs0L42suXj2vX33n5PvH64wv8yiXlrPSC2Ucjae96sSoi/oIidwLCotgv0d2YVYrKBI9P9PSnT54/eFNJ94U68GVrJeofU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:6181efaa-ef7e-4ded-abee-fe6d40ce41ea, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:e4a260c9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 72ce0efa30c048768c46bbda821a00b1-20220822
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1448305818; Mon, 22 Aug 2022 13:36:36 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 13:36:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Aug 2022 13:36:35 +0800
Message-ID: <b0866ca8d749cd06f7b10b2f6eb44bf79d52dafb.camel@mediatek.com>
From: CK Hu <ck.hu@mediatek.com>
To: nathan.lu <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 22 Aug 2022 13:36:35 +0800
In-Reply-To: <20220822033213.15769-2-nathan.lu@mediatek.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
 <20220822033213.15769-2-nathan.lu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 srv_heupstream@mediatek.com, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, linux-mediatek@lists.infradead.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
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

Hi, Nathan:

On Mon, 2022-08-22 at 11:32 +0800, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml       | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml     | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml   | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml   | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3
> ++-
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml     | 1 +
>  .../bindings/display/mediatek/mediatek,postmask.yaml           | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml    | 2 

Separate the display part to another patch for the maintainer it belong
to.

> ++
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml       | 1 +
>  10 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..f26f61069181 100644
> ---
> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++
> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -30,6 +30,7 @@ properties:
>                - mediatek,mt8173-mmsys
>                - mediatek,mt8183-mmsys
>                - mediatek,mt8186-mmsys
> +              - mediatek,mt8188-mmsys
>                - mediatek,mt8192-mmsys
>                - mediatek,mt8195-mmsys
>                - mediatek,mt8365-mmsys
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> index d4d585485e7b..92741486c24d 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> @@ -31,6 +31,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-aal
> +              - mediatek,mt8188-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
>            - const: mediatek,mt8183-disp-aal
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> index 63fb02014a56..fe444beff558 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> @@ -27,6 +27,7 @@ properties:
>            - const: mediatek,mt8192-disp-ccorr
>        - items:
>            - enum:
> +              - mediatek,mt8188-disp-ccorr
>                - mediatek,mt8195-disp-ccorr
>            - const: mediatek,mt8192-disp-ccorr
>        - items:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> index d2f89ee7996f..62306c88f485 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> @@ -37,6 +37,7 @@ properties:
>            - enum:
>                - mediatek,mt8183-disp-color
>                - mediatek,mt8186-disp-color
> +              - mediatek,mt8188-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
>            - const: mediatek,mt8173-disp-color
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> index 8ad8187c02d1..5c7445c174e5 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-dither
> +              - mediatek,mt8188-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
>            - const: mediatek,mt8183-disp-dither
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> index a89ea0ea7542..3d6e20f6eb05 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> @@ -12,7 +12,7 @@ maintainers:
>  
>  description: |
>    Mediatek display gamma correction, namely GAMMA, provides a
> nonlinear
> -  operation used to adjust luminance in display system.
> +  operation used to adjust luminance in?display system.

It's not necessary to modify this.

Regards,
CK

>    GAMMA device node must be siblings to the central MMSYS_CONFIG
> node.
>    For a description of the MMSYS_CONFIG binding, see
>    Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -28,6 +28,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-gamma
> +              - mediatek,mt8188-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
>            - const: mediatek,mt8183-disp-gamma
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> index a2a27d0ca038..065e526f950e 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> @@ -36,6 +36,7 @@ properties:
>            - const: mediatek,mt2701-disp-ovl
>        - items:
>            - enum:
> +              - mediatek,mt8188-disp-ovl
>                - mediatek,mt8195-disp-ovl
>            - const: mediatek,mt8183-disp-ovl
>        - items:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> index 654080bfbdfb..27de64495401 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-postmask
> +              - mediatek,mt8188-disp-postmask
>            - const: mediatek,mt8192-disp-postmask
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> index 0882ae86e6c4..d0e6c0dd4dfb 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> @@ -30,6 +30,8 @@ properties:
>        - items:
>            - const: mediatek,mt8183-disp-rdma
>        - items:
> +          - enum:
> +              - mediatek,mt8188-disp-rdma
>            - const: mediatek,mt8195-disp-rdma
>        - items:
>            - enum:
> diff --git
> a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index 627dcc3e8b32..a5212a2a4dcc 100644
> ---
> a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++
> b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -30,6 +30,7 @@ properties:
>        - mediatek,mt8173-disp-mutex
>        - mediatek,mt8183-disp-mutex
>        - mediatek,mt8186-disp-mutex
> +      - mediatek,mt8188-disp-mutex
>        - mediatek,mt8192-disp-mutex
>        - mediatek,mt8195-disp-mutex
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
