Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC795BC42C
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Sep 2022 10:20:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED424C0D2C1;
	Mon, 19 Sep 2022 08:20:27 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DE40C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 08:20:26 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id w8so45692677lft.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 01:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=SGgxv53dHIjXJ3+5OtXDvsxDbiwWOA/yeZMOpVwR9sE=;
 b=jqS5qrHT/lRc6Hd8Kbl/qm5idbOkccwmou4G3VZ3mR4iMvxTumgDH8KiaZsKZJlE88
 q51YgHccPdTyAs/+I/bA9U5CVUtRRohAdW/yXUyhAM9z4iwUWqtT7JYJTMzOLLdNokti
 KasoRZzYn00duGVXg+mjiMrf4GbL44XCpolWNVRtKzcSmgGt9P4XOnkWwcsRIXxATC9/
 PU53AZt1Nx4wTaXiVsWA1PGqGPcstEQQIKmgC3Ew1I/Q/3XVuZN+QNt1Wi56auoWpRkb
 S/5Ddn5C1q/1zp8r4mEgZaAmNUtt2co86VF+mk1aayC9X5SUcyQaHU60Uqkjl4HYcITQ
 vbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SGgxv53dHIjXJ3+5OtXDvsxDbiwWOA/yeZMOpVwR9sE=;
 b=cgmHRY9hozshaP6WB9zX7pbuRAtdfJ3njFkqGBfOebW+ONEdvMUAzcd7yPQkoNAXtE
 5AFDgfHtU0D3yNfHiv+Mz+S7+GwRZwBbGT6YfVVbuRPrR8ftA0PR2yciDrog4dei9FeM
 biZlbJ9gu/fbRNtbOc0rVn6WB4TjXuMOJbXgisAxvc/SHhwhiMOyPSO10KrkPb+C+a5F
 z00YT/KQQAwl/Qml/V0o9eX7wVhhxNBTInib//ci+cR+f9vPnLelTWgIX3LiIs/+r0mI
 IhD1nsDJB97XXnrpFd3pJoutxvQc415OduyNLZNoFt9FCPJRQzFDWv+FDGzA4CIV+SA9
 pjBA==
X-Gm-Message-State: ACrzQf2UIT+c70P2hZU4UOuOkn19cQmUI/UmnsvJdutwHDnAfwlYWTwI
 bEqhZAMDiuih/4o3pSJkruXUmA==
X-Google-Smtp-Source: AMsMyM6bRBZ8G+CT95Fr4CW65i9CBuQ4s3d0bl7vfeGsSGeNKYX/SQ6P9xpSr5c0nP9T6YIDzbL4bg==
X-Received: by 2002:a05:6512:c1:b0:497:a63d:563a with SMTP id
 c1-20020a05651200c100b00497a63d563amr5680113lfp.366.1663575625819; 
 Mon, 19 Sep 2022 01:20:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 t2-20020ac243a2000000b00497a8f04905sm5088615lfl.251.2022.09.19.01.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 01:20:25 -0700 (PDT)
Message-ID: <49d6adae-7c44-b349-419c-dcd099374354@linaro.org>
Date: Mon, 19 Sep 2022 10:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
 <20220919080410.11270-3-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919080410.11270-3-jianguo.zhang@mediatek.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: dt-bindings: dwmac: add support
	for mt8188
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

On 19/09/2022 10:04, Jianguo Zhang wrote:
> Add binding document for the ethernet on mt8188
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/net/mediatek-dwmac.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 61b2fb9e141b..b7d4f956f92e 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -20,6 +20,7 @@ select:
>          enum:
>            - mediatek,mt2712-gmac
>            - mediatek,mt8195-gmac
> +          - mediatek,mt8188-gmac

Won't be needed after comment below.

>    required:
>      - compatible
>  
> @@ -36,6 +37,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8195-gmac
> +              - mediatek,mt8188-gmac

That's not what your driver change is saying. They are the same or
compatible according to your patch #1.


>            - const: snps,dwmac-5.10a

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
