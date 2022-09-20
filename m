Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7845BE6EE
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Sep 2022 15:22:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06B62C640F2;
	Tue, 20 Sep 2022 13:22:36 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5582CC03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 13:22:34 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 92FD46601F3B;
 Tue, 20 Sep 2022 14:22:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663680153;
 bh=Pk+W1ozfQ0SCVra3zDNF6XprepX+dt5BIPhJgQVPHCg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ayMX/uXRw+VaEpEORAOiID4m6Ob3nBFdEr7OcT5IUKvutOwyjmbSgw5wqzarIS1Zk
 uefqwVJj5VPpRw4LoMbOyJHVaXP0Xcvj3TV4gFa4p0xT8HY3CcNfA4QqH0hyGkaqBa
 mKIM3cvd5LMdmud7IInQHvQWlMLygzt3k9neWpryFJvPVsxR7vi307VoSJqwFMR1my
 kfeGepaL13w0b4MZ3Gx2z7UWenntrhL1tQ1ZwBnqbiRxu0OnUadkXtVMtFMuncQo/k
 t75voKZHwb6/C6xlekPQcdisGpzyiCj8HsKsLWCU05eElOGKTTPoz+zI9DTSlaU6Ju
 2FTDiFwlttdiw==
Message-ID: <3ed55b0d-6c14-79a1-b4c1-5764c667d195@collabora.com>
Date: Tue, 20 Sep 2022 15:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220920083617.4177-1-jianguo.zhang@mediatek.com>
 <20220920083617.4177-2-jianguo.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920083617.4177-2-jianguo.zhang@mediatek.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Il 20/09/22 10:36, Jianguo Zhang ha scritto:
> Add binding document for the ethernet on mt8188
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>   .../devicetree/bindings/net/mediatek-dwmac.yaml        | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 61b2fb9e141b..eaf7e8d53432 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -20,6 +20,7 @@ select:
>           enum:
>             - mediatek,mt2712-gmac

Please keep the list ordered by name. MT8188 goes before 8195.

>             - mediatek,mt8195-gmac
> +          - mediatek,mt8188-gmac
>     required:
>       - compatible
>   
> @@ -37,6 +38,11 @@ properties:
>             - enum:
>                 - mediatek,mt8195-gmac
>             - const: snps,dwmac-5.10a
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-gmac
> +          - const: mediatek,mt8195-gmac
> +          - const: snps,dwmac-5.10a
>   
>     clocks:
>       minItems: 5
> @@ -74,7 +80,7 @@ properties:
>         or will round down. Range 0~31*170.
>         For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>         or will round down. Range 0~31*550.
> -      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
> +      For MT8195/MT8188 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,

For MT8188/MT8195

>         or will round down. Range 0~31*290.
>   
>     mediatek,rx-delay-ps:
> @@ -84,7 +90,7 @@ properties:
>         or will round down. Range 0~31*170.
>         For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>         or will round down. Range 0~31*550.
> -      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
> +      For MT8195/MT8188 RGMII/RMII/MII interface, Allowed value need to be a multiple

For MT8188/MT8195

>         of 290, or will round down. Range 0~31*290.
>   
>     mediatek,rmii-rxc:


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
