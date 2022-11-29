Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8779763C55D
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 17:42:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C128C65E5D;
	Tue, 29 Nov 2022 16:42:04 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEA90C65073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 16:42:01 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id u27so11912739lfc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 08:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XWZiFupZmDV7/chy9twlz/bKtxk28a/BQ1OZ+FIK00Q=;
 b=j3EsDtkRr80dfR/xeJF6gwYP1e2sFcIhQ0oQxLHTXGRJMj/Bmz6c7p2NFqU7z7QWo1
 biaxP/5qvxiT1oMtwIETJvlry+NdYKhI1LiZsQlnXQlVpDfGYzKbfFbjXGbJ2vmfUOxm
 YhOJGMmSCtbXYaw5JSVRR2qWhbjifompBrqmVbMvW6H8L9SrVWDZagp5r2/LzDK7B5EG
 xUOAPKWgj3Zunrr3jWYwAzeV9cF4+rJqeRWkkh+4nwTHSgJQjUkOtHs2oI21xd0xZsJK
 YLW6LWbjiecVovrgfTN1M+dkkMEeztmHmxD3b1t5rp3+wvMwamvASvUsASBPUvcReqLI
 njNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XWZiFupZmDV7/chy9twlz/bKtxk28a/BQ1OZ+FIK00Q=;
 b=l/MgPZ3fb3xgdYYsYn/vMV2IY7bLiuq0X2NWDQpGwEv8xsv9JGRwg5NTIufXIuhE31
 4IEPEfYOWRAACOLRF06U6nhHq/zzKkrQq55JUbd6aFSGOsC13wQi9JehiIfjlW3fQR/e
 th/EzvckcVUF4n9+O12iuGgYUs6eE2WZEDQu64EybjZ2txaHe+C/P9QlxijW4P3bsrDo
 ilXMlHvFq+glRyPOeSgw/7qKHcePv6jBbkLYyM9bj6TEZ9o2dqo+jeaLAk597uC9uI5u
 yt5fTBtenf1w30JsGxlrT8QldvYU9o3wLQB20mA/Spl0arQdoty658PtzZbbLZ/1ByO+
 Hkjw==
X-Gm-Message-State: ANoB5plEi+S1UeGw/f1e6jbZWxTTUVIdmBppD05G2OmpOrfqkSY5hgSL
 pj7Cubk8w83+oAtTzrHevhSwIg==
X-Google-Smtp-Source: AA0mqf6bs+MHPq8y/pL1cJ9bImpeUwmQ9PU7zQoTQbWZQI9Y71CuCT3zsDhIG8N1gXr1WdkMo53Jlw==
X-Received: by 2002:ac2:4e82:0:b0:4ac:9f25:21c2 with SMTP id
 o2-20020ac24e82000000b004ac9f2521c2mr16017549lfr.519.1669740120942; 
 Tue, 29 Nov 2022 08:42:00 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 d13-20020ac244cd000000b004b48e0f619asm2271574lfm.48.2022.11.29.08.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 08:42:00 -0800 (PST)
Message-ID: <4299d2eb-7724-ced4-dd68-0f0734725e6b@linaro.org>
Date: Tue, 29 Nov 2022 17:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
 <20221129143503.16638-3-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129143503.16638-3-nathan.lu@mediatek.com>
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v3 2/6] dt-bindings: mediatek: modify
 VDOSYS0 mmsys device tree Documentations for MT8188
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

On 29/11/2022 15:34, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 0711f1834fbd..3e7fb33201c5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -47,6 +47,10 @@ properties:
>            - const: mediatek,mt2701-mmsys
>            - const: syscon
>  
> +      - items:
> +          - const: mediatek,mt8188-vdosys0

Why this is not part of previous enum?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
