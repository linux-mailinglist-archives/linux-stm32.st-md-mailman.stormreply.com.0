Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 962196BC6A8
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 08:13:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53235C6904C;
	Thu, 16 Mar 2023 07:13:29 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A283BC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 07:13:27 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z21so3772910edb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 00:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678950807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eQqBxhsFpqht9TV3ODi4eqp1h6oGT5RNGJVf78eU7ys=;
 b=mXgg3KF+U8HsBWs12EmYyC6aiUPvUi7w/0p0EKveStEcm9drVh0Cf6U0LfVL7OqLob
 kt2FJzKBcNkqUeqU0dHEOF+3i+XSk2uHNpV6wDStGtdCQErJXcR5szdPH6XXhCHH5yRP
 po2rbgpMC2XZQfDs3eH5ZgBvgNHaeLc1LyRirGHNP0JnNyDRXPhhZMtveGK48JDDGsZi
 HX6/nHEpiEDYk39mYh57xydK+y/k/rsK+aMCbECpuLTPzJ3NAWbHxnEA0NlkbPA0GRJI
 Jc9PEGtJTxme5EFHzumoWle8qBBTaPc+kOSroopXECWK0bubelFQK1eDdLNAhM1Kj4GR
 3F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678950807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eQqBxhsFpqht9TV3ODi4eqp1h6oGT5RNGJVf78eU7ys=;
 b=bmR8sqVFQdjlzRpKBPW4H2maWDRqn/TwgVG4ZO2llDmJzQcGuDaj5+E/yVJeXGADEa
 O0EtMmKfNtmLQ9apXtY/O67WX2d3nIclOQYCgGiYitGO98vsnE/CqC3zXtDtClK2IPyH
 v0XWFZRVXCDS6d3vUlmfffe32Wa5b19JuUz/R2Um7MJhsL5o3C2rEFalqaWQJp5NgaLi
 tDsGZ+qImp8IosMRvsahJqAagp4cCzWTIsD/Tu6kxdQ8UMgRE4lduqBhQwoTd5aSJCJD
 W4LFAUR/5ybTx4IFY/BS1etVR+zBeBZN1fSkrZDMfLjzr3SIrd9/rPL4Bpxf76sX69zs
 AAmQ==
X-Gm-Message-State: AO0yUKVx0RZQcZirftaWHXcICGLq3N5QqRqUri2W9I+/TIJU0Cv6LdbD
 ZaF3wXy/qMZdC//CBWP7qwHaXQ==
X-Google-Smtp-Source: AK7set+9y57Tbht/OlWaMi3QKo2qNZTFOC475LQrmWPsM5KyA5oghAoT+UaS5gVbwxz/UHpbpizsLg==
X-Received: by 2002:a17:907:20c1:b0:930:604d:5891 with SMTP id
 qq1-20020a17090720c100b00930604d5891mr1177542ejb.37.1678950807103; 
 Thu, 16 Mar 2023 00:13:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 md21-20020a170906ae9500b0092b546b57casm3417008ejb.195.2023.03.16.00.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:13:26 -0700 (PDT)
Message-ID: <d4831176-c6f1-5a9b-3086-23d82f1f05a6@linaro.org>
Date: Thu, 16 Mar 2023 08:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-2-ahalaney@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313165620.128463-2-ahalaney@redhat.com>
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 01/11] dt-bindings: net: snps,
 dwmac: Update interrupt-names
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

On 13/03/2023 17:56, Andrew Halaney wrote:
> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> 
> As commit fc191af1bb0d ("net: stmmac: platform: Fix misleading
> interrupt error msg") noted, not every stmmac based platform
> makes use of the 'eth_wake_irq' or 'eth_lpi' interrupts.
> 
> So, update the 'interrupt-names' inside 'snps,dwmac' YAML
> bindings to reflect the same.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> 
> I picked this up from:
> 	https://lore.kernel.org/netdev/20220929060405.2445745-2-bhupesh.sharma@linaro.org/
> No changes other than collecting the Acked-by.
> 
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 16b7d2904696..52ce14a4bea7 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -105,8 +105,8 @@ properties:
>      minItems: 1
>      items:
>        - const: macirq
> -      - const: eth_wake_irq
> -      - const: eth_lpi
> +      - enum: [eth_wake_irq, eth_lpi]
> +      - enum: [eth_wake_irq, eth_lpi]

I acked it before but this is not correct. This should be:
+      - enum: [eth_wake_irq, eth_lpi]
+      - enum: eth_lpi


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
