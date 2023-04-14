Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B046E28A8
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Apr 2023 18:47:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D63DC6A5E6;
	Fri, 14 Apr 2023 16:47:25 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A00BAC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 16:47:24 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v27so8948397wra.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681490844; x=1684082844;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rJKYiVcyPTMIO212Xaa81Dv2egDEM+1isH5+sbiFNtw=;
 b=WVEOqQQgBVSmwOoYClrlw78Y2D0CKqfwYC58Vx03s6zqrMtjJ8vOnoRAkyShPd42vV
 J/RcSXBJ/JesbpFdG/nGaoGSQxJhWwkk5LrPXfuQvL3cK7jivHUNDv6/FLuQNVqObfrQ
 rdEuxZfROGJbRZ1u1COPBsPdxm00rC3odL8n1wJ4XkuVP0PbY5i+Yz3OHGL1BIbcUbPA
 lvxIZLBA+/HLuxvqJjn0t8Tp2HE3fXnuzPbsdXJIxYBMR7vSLFWTeYwd5OuKO5TXS2mX
 KmX/sovsOckWxQYlz0ue4PbiWpBGJaDZ3IHJF7Fp7Fg3akfsSq2WbDekVWW558hEYN+t
 I2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681490844; x=1684082844;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rJKYiVcyPTMIO212Xaa81Dv2egDEM+1isH5+sbiFNtw=;
 b=RCMHzpJepLwoyOSXPlWCthhCfimxikb8Q385DmegGgQfV0jVqZxRfG2DsS93KF21g9
 moicTJ4viLudBL8snM7bNrCg2mE20dplEOMRSCL3W0UJIC0vWOqpwx2N6HYizTTFlf1X
 UKjHc1rhHyWgrFIHBM/1dO71NeWF2lVL3hoocg3xn3yRwBjvwusYFFZ4WyIf/2V67VKW
 +sdtb9yUQbWJ+DElce7piCbg9MbulvH2Whg9HfQoQR2SMJYaTMSiiJAbCYVdMWpx4AgF
 UzgnU/1rLclbV6aW12norKnH6T5eOIXJVeUqv7EXtQecHAvIXsaEi2aFEISgM8IEiif5
 4X0A==
X-Gm-Message-State: AAQBX9c0om+2ZsCfhgOYBxx9W2auzaOBgxUxaSYg3L/fh3380W3dkh19
 +8b0qi23Y5WhV/4lIg2/UJA=
X-Google-Smtp-Source: AKy350ayARE0wsSfVwRFheCOXyRFXtIHmD5clP7slQBUE/kO+LVmaQ3YmrA9ke7sVqJ0Pn9mmIAfew==
X-Received: by 2002:a5d:4592:0:b0:2ce:aa73:4960 with SMTP id
 p18-20020a5d4592000000b002ceaa734960mr4596931wrq.5.1681490843935; 
 Fri, 14 Apr 2023 09:47:23 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adfe381000000b002efbb93c461sm3902302wrm.25.2023.04.14.09.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 09:47:22 -0700 (PDT)
Message-ID: <f8ab9e20-2590-9095-4f18-c332a43a33f2@gmail.com>
Date: Fri, 14 Apr 2023 18:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: display: mediatek: simplify
 compatibles syntax
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



On 14/04/2023 10:33, Krzysztof Kozlowski wrote:
> Lists (items) with one item should be just enum because it is shorter,
> simpler and does not confuse, if one wants to add new entry with a
> fallback.  Convert all of them to enums.  OTOH, leave unused "oneOf"
> entries in anticipation of further growth of the entire binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> 
> ---
> 
> Cc: angelogioacchino.delregno@collabora.com
> ---
>   .../bindings/display/mediatek/mediatek,ccorr.yaml   |  7 +++----
>   .../bindings/display/mediatek/mediatek,color.yaml   | 10 ++++------
>   .../bindings/display/mediatek/mediatek,dither.yaml  |  4 ++--
>   .../bindings/display/mediatek/mediatek,dsc.yaml     |  4 ++--
>   .../bindings/display/mediatek/mediatek,gamma.yaml   |  7 +++----
>   .../bindings/display/mediatek/mediatek,merge.yaml   |  7 +++----
>   .../bindings/display/mediatek/mediatek,od.yaml      |  7 +++----
>   .../bindings/display/mediatek/mediatek,ovl-2l.yaml  |  7 +++----
>   .../bindings/display/mediatek/mediatek,ovl.yaml     | 13 +++++--------
>   .../display/mediatek/mediatek,postmask.yaml         |  4 ++--
>   .../bindings/display/mediatek/mediatek,rdma.yaml    | 13 +++++--------
>   .../bindings/display/mediatek/mediatek,split.yaml   |  4 ++--
>   .../bindings/display/mediatek/mediatek,ufoe.yaml    |  4 ++--
>   .../bindings/display/mediatek/mediatek,wdma.yaml    |  4 ++--
>   14 files changed, 41 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index b04820c95b22..dc22bd522523 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-ccorr
> -      - items:
> -          - const: mediatek,mt8192-disp-ccorr
> +      - enum:
> +          - mediatek,mt8183-disp-ccorr
> +          - mediatek,mt8192-disp-ccorr
>         - items:
>             - enum:
>                 - mediatek,mt8188-disp-ccorr
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index 62306c88f485..d0ea77fc4b06 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -22,12 +22,10 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-color
> -      - items:
> -          - const: mediatek,mt8167-disp-color
> -      - items:
> -          - const: mediatek,mt8173-disp-color
> +      - enum:
> +          - mediatek,mt2701-disp-color
> +          - mediatek,mt8167-disp-color
> +          - mediatek,mt8173-disp-color
>         - items:
>             - enum:
>                 - mediatek,mt7623-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 5c7445c174e5..1588b3f7cec7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -22,8 +22,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-dither
> +      - enum:
> +          - mediatek,mt8183-disp-dither
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-dither
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
> index 49248864514b..2cbdd9ee449d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
> @@ -20,8 +20,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8195-disp-dsc
> +      - enum:
> +          - mediatek,mt8195-disp-dsc
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index a5c6a91fac71..6c2be9d6840b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-gamma
> -      - items:
> -          - const: mediatek,mt8183-disp-gamma
> +      - enum:
> +          - mediatek,mt8173-disp-gamma
> +          - mediatek,mt8183-disp-gamma
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-gamma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> index 69ba75777dac..2f8e2f4dc3b8 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-merge
> -      - items:
> -          - const: mediatek,mt8195-disp-merge
> +      - enum:
> +          - mediatek,mt8173-disp-merge
> +          - mediatek,mt8195-disp-merge
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> index 853fcb9db2be..29f9fa8f8219 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2712-disp-od
> -      - items:
> -          - const: mediatek,mt8173-disp-od
> +      - enum:
> +          - mediatek,mt2712-disp-od
> +          - mediatek,mt8173-disp-od
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> index 4e94f4e947ad..c7dd0ef02dcf 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-ovl-2l
> -      - items:
> -          - const: mediatek,mt8192-disp-ovl-2l
> +      - enum:
> +          - mediatek,mt8183-disp-ovl-2l
> +          - mediatek,mt8192-disp-ovl-2l
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-ovl-2l
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index 065e526f950e..92e320d54ba2 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -21,14 +21,11 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-ovl
> -      - items:
> -          - const: mediatek,mt8173-disp-ovl
> -      - items:
> -          - const: mediatek,mt8183-disp-ovl
> -      - items:
> -          - const: mediatek,mt8192-disp-ovl
> +      - enum:
> +          - mediatek,mt2701-disp-ovl
> +          - mediatek,mt8173-disp-ovl
> +          - mediatek,mt8183-disp-ovl
> +          - mediatek,mt8192-disp-ovl
>         - items:
>             - enum:
>                 - mediatek,mt7623-disp-ovl
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> index 27de64495401..11fe32e50a59 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> @@ -21,8 +21,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8192-disp-postmask
> +      - enum:
> +          - mediatek,mt8192-disp-postmask
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-postmask
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 3ade2ece3fed..42059efad45d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -23,14 +23,11 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-rdma
> -      - items:
> -          - const: mediatek,mt8173-disp-rdma
> -      - items:
> -          - const: mediatek,mt8183-disp-rdma
> -      - items:
> -          - const: mediatek,mt8195-disp-rdma
> +      - enum:
> +          - mediatek,mt2701-disp-rdma
> +          - mediatek,mt8173-disp-rdma
> +          - mediatek,mt8183-disp-rdma
> +          - mediatek,mt8195-disp-rdma
>         - items:
>             - enum:
>                 - mediatek,mt8188-disp-rdma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index 35ace1f322e8..21a4e96ecd93 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -21,8 +21,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-split
> +      - enum:
> +          - mediatek,mt8173-disp-split
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> index b8bb135fe96b..62fad23a26f5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> @@ -22,8 +22,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-ufoe
> +      - enum:
> +          - mediatek,mt8173-disp-ufoe
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> index 7d7cc1ab526b..991183165d29 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> @@ -21,8 +21,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-wdma
> +      - enum:
> +          - mediatek,mt8173-disp-wdma
>   
>     reg:
>       maxItems: 1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
