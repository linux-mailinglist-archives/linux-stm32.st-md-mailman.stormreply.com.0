Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BEF5BCAC7
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Sep 2022 13:32:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FFECC0D2C1;
	Mon, 19 Sep 2022 11:32:31 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 810DAC03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 11:32:29 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id x27so13190976lfu.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 04:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=f3dXWg0oh8xL1M1dPWVh4Ebk/AkdK0Pb6P7zeBhDtd8=;
 b=WNQozphNVQEppxOaUs5pFh0cbqStGednEszBlcHE4tVBgW8Fitzf6RfFqiVg9uSafn
 NHQBhxyRtXdXJ5Nmy0jbE9fCtb7RLeo6HjmJmcotg2syt95F765PD17poSOqlJ/+3/Pj
 3gNKTsPca1DH4ARuIs2M34Lo+TP20QTTV5I/A/p3ubbkNdvVvteVnomRf3m9zwavVmtC
 e+zRTkNuQ5MZj8hC7keLp8imZRieAuL7xQRi2Bx9idof1dozsQ6r15WXR8N8UFlaSrB/
 vY5iPx+yJ5ytmyK0O05RDrZ0fjfaFUK+w2oAqPfmwnC8K/iVLk1fRFXVVeHAktxM1j56
 JMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=f3dXWg0oh8xL1M1dPWVh4Ebk/AkdK0Pb6P7zeBhDtd8=;
 b=TcZqtzYKJjWg0QZEnsYKDYmCc5pQhrK2rZ3xlK+IcFPVQ42iFLLXXeXBgKMjeYuko4
 StwfFX8FDqPX4mRikmvjCUvq7Zief9EQGfAIX0PF43G8q+vsPdLVW6aEXOUrAsQe39QX
 jPlWrlS23IzcWVm5EAUnLy/pHPhvv5WGB7CfRlU20J5yNIJMXjn7q4iTq/ihq0XmUN2y
 IN0zxTIm9J3u9o4U3VwPjwLMkqc0ZkSz1GV8yfXARVtHHIRXtWb/uGVVL58nRbhxzBOp
 igDI87tW/eMXlIChEloK9zODBhMLZKpY2vzZiWlypCeNLYAg8MpheCynNHtlfQT+RMlU
 ToEA==
X-Gm-Message-State: ACrzQf00aeZrzoXti3nsifePAZ3yNRytH1gCDlYRkEd7bQbOL3REfv75
 McckgBS4/MU9aitEFCql26jbAQ==
X-Google-Smtp-Source: AMsMyM72aSuNbNRXSHuMBnyfRIgi9Sq5tlL62YUtFv6VcV1eQojmbXG0YOwSyj5a45zfpYEjpES+Ag==
X-Received: by 2002:a05:6512:11c8:b0:497:c19e:c709 with SMTP id
 h8-20020a05651211c800b00497c19ec709mr6532651lfr.152.1663587148763; 
 Mon, 19 Sep 2022 04:32:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 bf16-20020a056512259000b00494792ea34esm5130747lfb.273.2022.09.19.04.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 04:32:28 -0700 (PDT)
Message-ID: <9b711a9e-9e63-b69e-fabf-e05c11f145a6@linaro.org>
Date: Mon, 19 Sep 2022 13:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20220913074639.31932-1-alexandre.torgue@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913074639.31932-1-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: stm32: add missing
 entries for gpio subnodes
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

On 13/09/2022 09:46, Alexandre Torgue wrote:
> Add "interrupt-controller" and gpio-line-names to gpio subnodes in order to
> fix dtb validation.

Rebase your patch on recent Linux kernel and use get_maintainers.pl.

> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index d35dcc4f0242..92582cccbb1b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -65,6 +65,10 @@ patternProperties:
>        '#gpio-cells':
>          const: 2
>  
> +      interrupt-controller: true
> +      '#interrupt-cells':
> +        const: 2
> +
>        reg:
>          maxItems: 1
>        clocks:
> @@ -80,6 +84,8 @@ patternProperties:
>          minimum: 1
>          maximum: 16
>  
> +      gpio-line-names: true

maxItems?


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
