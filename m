Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C094CF942
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Mar 2022 11:04:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEA55C5F1EF;
	Mon,  7 Mar 2022 10:04:24 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CB64C5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Mar 2022 10:04:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 672A61F438C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646647463;
 bh=vkE1dGmQ2i4mat5nimDDteTG2DySI3ffFGm0QSlU+rA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rd8+GreErGoiKBLD+XzcSgcSayXG1eGW1o0pnS9WbP1Mwj5cbL36JkEWxWMyOY1p2
 tdKbXphTVjPxk5PUZv+ku4rKBfMhWsKB8sF3cGjL+rSurUATaqQcPtnQoQ5Wimxd6v
 a91PZz96kkxZIwJsG9UuKeToMGjIKb82pmLDTYgsBnDfBYA1yeYoGDHPKtxqan3Cet
 yQItBSLS6K59hN7fVPMXTWw8osrHw4P0/wjVH/z6XVQpxTLoghAQ5J8FhamAOWbA4v
 6cQ0j9IRrnS/fm2GZczNMtChTiWD/T7L7M5sagQV3tXlYHN0/1USSBZSplM1fFk8d6
 I7JdYrEP+lrZQ==
Message-ID: <cfab8fcc-3cb6-dc20-2c88-63884a2f7a6d@collabora.com>
Date: Mon, 7 Mar 2022 11:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220307032859.3275-4-jason-jh.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, CK Hu <ck.hu@mediatek.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v16 3/8] dt-bindings: arm: mediatek:
 mmsys: add mt8195 SoC binding
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Il 07/03/22 04:28, jason-jh.lin ha scritto:
> There are 2 mmsys, namely vdosys0 and vdosys1 in mt8195.
> Each of them is bound to a display pipeline, so add their
> definition in mtk-mmsys documentation with 2 compatibles.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6c2c3edcd443..c5ba515cb0d7 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -32,6 +32,8 @@ properties:
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
>                 - mediatek,mt8365-mmsys
> +              - mediatek,mt8195-vdosys0
> +              - mediatek,mt8195-vdosys1
>             - const: syscon
>         - items:
>             - const: mediatek,mt7623-mmsys


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
