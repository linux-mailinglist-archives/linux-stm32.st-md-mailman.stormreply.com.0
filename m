Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD6750BE05
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 19:09:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22DC0C6049A;
	Fri, 22 Apr 2022 17:09:24 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEDF9C60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 17:09:22 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id ks6so17665056ejb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 10:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=poB9ks1liIRkNngIEosjFHVtuthCvp7bjTuPa7y3tD4=;
 b=ar9FVBqErpZGuzA8BkqsOWd+REzkut2Q45zH1nrUysn4agClJWjSbojgs0BjIkwYVk
 WysqyM1wSO/xcTFUx+VSHFZyd3w0XurgxFtMiSraKahI6oK4BMy2xCZTIzhExrWSg/d7
 JXAGNCrEv183BmDa48/eN3WMkSkZzZgMi0APGI9ICfG3u/HIx33Q/AIWmBvTBQ5Ztu+6
 EaUvlXJcnoDKQDgsbV2NTii0gre7MJDBvM9V8iLrP7egX7MbzDvgDF2Cs5oQZzDxjPTs
 RcGDpp6J63mniLFo8yzmYSBptbm26o89bOOYoqn+o1NgR4aYLVHB2tQg45+30DdJLWVt
 WylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=poB9ks1liIRkNngIEosjFHVtuthCvp7bjTuPa7y3tD4=;
 b=6emu2Tu3tEX46hYLNTZIVMhQRGzXvfmzHvY5NHe+E15y10sA8VzSO/yieh4pcmiv6p
 ka4GLk/GOSOrPTcEnD4fA50McQvJ5gi1gSumoaMFNPUHMInqFwrwDLDAWGjQGv8KbIYg
 Sa3qvzvB8954EmeJPX4qwnbJ4VwsW5xY2/mnuyTFRMAt1HY6VjfzqH1izCrm98u9BNb9
 3QIG8t0HHEIZAuKgIMuEKMt4Qt+cmXxIA5xHIIUcEpccyWd3HLVdzW37DEE6C1FLFA6D
 qyrxqiLHw62UmRaxlVGqAyTal75hdltYTXvFH6K+S+g+QAzNZDiQyx2/r/FdLWSbXtCZ
 TPRw==
X-Gm-Message-State: AOAM5334J332s6G2ie8movVRInaBfJkfRKWdPy/E7x6xNqiJL0Ek3TiT
 kirI/RXd928ld3ICeYzXKijxhg==
X-Google-Smtp-Source: ABdhPJySiVqeO8iQsRx/KiMnpyPGn60n4tndx+nA3COi8jm0ZCtBj53MhuRBv87YONHlvUgNO+xy3Q==
X-Received: by 2002:a17:906:a147:b0:6e8:46a4:25a9 with SMTP id
 bu7-20020a170906a14700b006e846a425a9mr4918442ejb.213.1650647360845; 
 Fri, 22 Apr 2022 10:09:20 -0700 (PDT)
Received: from [192.168.0.233] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ah13-20020a1709069acd00b006e8a0b3e071sm926279ejc.110.2022.04.22.10.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 10:09:20 -0700 (PDT)
Message-ID: <5927a77f-a876-eddc-09a1-b3a336e7d35c@linaro.org>
Date: Fri, 22 Apr 2022 19:09:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20220422071034.2882199-1-o.rempel@pengutronix.de>
 <20220422071034.2882199-2-o.rempel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422071034.2882199-2-o.rempel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: arm: stm32: Add
 compatible strings for Protonic T1L boards
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

On 22/04/2022 09:10, Oleksij Rempel wrote:
> This boards are based on STM32MP151AAD3 and use 10BaseT1L for
> communication.
> 
> - PRTT1C - 10BaseT1L switch
> - PRTT1S - 10BaseT1L CO2 sensor board
> - PRTT1A - 10BaseT1L multi functional controller
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index fa0a1b84122e..9628383a4779 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -78,6 +78,12 @@ properties:
>            - const: st,stm32mp157c-ev1
>            - const: st,stm32mp157c-ed1
>            - const: st,stm32mp157
> +      - items:
> +          - enum:
> +              - prt,prtt1a   # Protonic PRTT1A
> +              - prt,prtt1c   # Protonic PRTT1C
> +              - prt,prtt1s   # Protonic PRTT1S
> +          - const: st,stm32mp151

The entries look a bit unordered, maybe you could put it somewhere
ordered by st compatible?


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
