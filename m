Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D464EB77
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Dec 2022 13:37:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B57C6C65E46;
	Fri, 16 Dec 2022 12:37:58 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EC96C64109
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 12:37:57 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id o15so1754779wmr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 04:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vTzKBQ744xGAmgAzWVUaSvP9DheiSegLLVxyUIODlVA=;
 b=qf/08coKmkgaRJN4AqFrGGIbGeH5HOEITp8/o3H4LIcOzwbLIrZnCNexbYFejspxPS
 cmKKyK2aqtiLV4zBfR+NPuK2PKdjPNu/eKPpNTasV+CriEqBI3C7X5EQuH+EnAn0ZOoH
 ai2EGja3RCF8Y0FSm9kB0EQNYj1cEmnwV9OI7SDPTbibnwGpAdApApPEaKnK5so2Ys8K
 2oGVDSoKyu2LvmoNd64cMqBWsBlhtaDdlZeSjz9uSBjN6Zr7OhsJwqrKKwqE+zC0hp8P
 KE/uOzv9Ox9J4qg9zvCXNL71LdAvzl6S1l7QHjm+7JbY3ESLX4/wWyGQtC38rTED5RNf
 svqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vTzKBQ744xGAmgAzWVUaSvP9DheiSegLLVxyUIODlVA=;
 b=C5dqZ8nEMNVO+8Kj4UZZ1AZaVbMU1NIxGJxMPqvJ9WGPDfL1lhyVtYfKE4ozhyHL3W
 SFkLcP8zJ/w4yQjPbs1MGt1dsRIMgMy6y3wVKpGyke8eXtvYz5gxJi6jKYuI5MFOfqxN
 +gMa+YkHZZyFe4NKMtAr+x2OW+86iWNsl7BhWICXc8qHZSDb483ztAkQUJt7+OkNH6o3
 +5AXk8tpq7+yC9x9iGHgcZDxDT3PKJY51JtLCeFGAjypEVfgj1Yzn4zzdmQMbkguTwLB
 r3Gm6QBEOfoNXmcvAeHQovSx1ZLa+C78umDuVpKC3Dp4yLQbEysdsdXN/aW2OFy1la/W
 Sszg==
X-Gm-Message-State: ANoB5pnvUEMP9qm7Zf/yXQD74zhRX2Ujlfb7YGhtKL+UTzgETBepVCS8
 uehGn0E1pmjieVbmCfD0YSQ=
X-Google-Smtp-Source: AA0mqf6F4g4Or5t0Ejs682ICDK27vMb5jniW+WpRxIsXlEFrSNsfluoacS4xbTysO5o9JflSsObJ4A==
X-Received: by 2002:a05:600c:4fc3:b0:3d2:2fa9:cffa with SMTP id
 o3-20020a05600c4fc300b003d22fa9cffamr11746506wmq.25.1671194277553; 
 Fri, 16 Dec 2022 04:37:57 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a05600c43d600b003cf6e1df4a8sm2371411wmn.15.2022.12.16.04.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 04:37:56 -0800 (PST)
Message-ID: <3eabd753-684f-5222-e7f4-a8b688e6623e@gmail.com>
Date: Fri, 16 Dec 2022 13:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
 <20221206020046.11333-2-nathan.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221206020046.11333-2-nathan.lu@mediatek.com>
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v4 1/6] dt-bindings: mediatek: modify
 VDOSYS0 display device tree Documentations for MT8188
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



On 06/12/2022 03:00, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 display device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 1 +
>   .../bindings/display/mediatek/mediatek,postmask.yaml          | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++++
>   8 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index d4d585485e7b..92741486c24d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -31,6 +31,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-aal
> +              - mediatek,mt8188-disp-aal
>                 - mediatek,mt8192-disp-aal
>                 - mediatek,mt8195-disp-aal
>             - const: mediatek,mt8183-disp-aal
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 63fb02014a56..fe444beff558 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -27,6 +27,7 @@ properties:
>             - const: mediatek,mt8192-disp-ccorr
>         - items:
>             - enum:
> +              - mediatek,mt8188-disp-ccorr
>                 - mediatek,mt8195-disp-ccorr
>             - const: mediatek,mt8192-disp-ccorr
>         - items:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index d2f89ee7996f..62306c88f485 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -37,6 +37,7 @@ properties:
>             - enum:
>                 - mediatek,mt8183-disp-color
>                 - mediatek,mt8186-disp-color
> +              - mediatek,mt8188-disp-color
>                 - mediatek,mt8192-disp-color
>                 - mediatek,mt8195-disp-color
>             - const: mediatek,mt8173-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 8ad8187c02d1..5c7445c174e5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -27,6 +27,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-dither
> +              - mediatek,mt8188-disp-dither
>                 - mediatek,mt8192-disp-dither
>                 - mediatek,mt8195-disp-dither
>             - const: mediatek,mt8183-disp-dither
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index a89ea0ea7542..a5c6a91fac71 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -28,6 +28,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-gamma
> +              - mediatek,mt8188-disp-gamma
>                 - mediatek,mt8192-disp-gamma
>                 - mediatek,mt8195-disp-gamma
>             - const: mediatek,mt8183-disp-gamma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index a2a27d0ca038..065e526f950e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -36,6 +36,7 @@ properties:
>             - const: mediatek,mt2701-disp-ovl
>         - items:
>             - enum:
> +              - mediatek,mt8188-disp-ovl
>                 - mediatek,mt8195-disp-ovl
>             - const: mediatek,mt8183-disp-ovl
>         - items:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> index 654080bfbdfb..27de64495401 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> @@ -26,6 +26,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-postmask
> +              - mediatek,mt8188-disp-postmask
>             - const: mediatek,mt8192-disp-postmask
>   
>     reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 0882ae86e6c4..3ade2ece3fed 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -31,6 +31,10 @@ properties:
>             - const: mediatek,mt8183-disp-rdma
>         - items:
>             - const: mediatek,mt8195-disp-rdma
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-disp-rdma
> +          - const: mediatek,mt8195-disp-rdma
>         - items:
>             - enum:
>                 - mediatek,mt7623-disp-rdma
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
