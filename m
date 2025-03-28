Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D20DDA74691
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Mar 2025 10:45:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8016DC78F75;
	Fri, 28 Mar 2025 09:45:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C55C9C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 09:45:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7306D614BC;
 Fri, 28 Mar 2025 09:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246D5C4CEE4;
 Fri, 28 Mar 2025 09:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743155112;
 bh=9h0GJzU6Aief9ThMESTGvq/UEVqXhEwYJGASD6M/NUc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GBHlJRpSIZQn96cJHjJLy3wu05TPyg5mO09E2xVwucYpNQ2bRpIUHBpzp/KLou7S6
 x93Lb4VopnCFGlKajP/00wL7cweb1eX+tgaAnKYp5D55b+9Hh4Awo3w4l4CHs1XP7v
 Xzd+0p2Hl89qgLRU7jCvUGjQfYgIqTuofWqjSS3dV56jvFbIX4FRAxnFBDvQnQ+LD8
 398Oipf/KwTJp9fwuyZK3hGwVpxu8FUU9TT3J55/AFdzuBq891qXJxdJ3Rf2bI4z9A
 3JOzmGIzsSV5tmFaknlYT9Isj1CG9YOl/OAI6zMqxb4QyPvYUu7w18FQp5sJ1sJq6P
 koxTGFAHOc9wg==
Date: Fri, 28 Mar 2025 09:44:54 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20250328094454.3ec9dd7d@jic23-huawei>
In-Reply-To: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
References: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Robert Budai <robert.budai@analog.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kim Seer Paller <kimseer.paller@analog.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: iio: Correct indentation
 and style in DTS example
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

On Mon, 24 Mar 2025 13:53:12 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Applied both patches to my testing branch. I'll rebase on rc1 once
that is available and push out as togreg.

Thanks,

Jonathan
> ---
>  .../bindings/iio/adc/st,stm32-adc.yaml        | 102 +++++++++---------
>  1 file changed, 51 insertions(+), 51 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index ef9dcc365eab..17bb60e18a1c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -498,7 +498,7 @@ patternProperties:
>  examples:
>    - |
>      // Example 1: with stm32f429, ADC1, single-ended channel 8
> -      adc123: adc@40012000 {
> +    adc123: adc@40012000 {
>          compatible = "st,stm32f4-adc-core";
>          reg = <0x40012000 0x400>;
>          interrupts = <18>;
> @@ -512,28 +512,28 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>          adc@0 {
> -          compatible = "st,stm32f4-adc";
> -          #io-channel-cells = <1>;
> -          reg = <0x0>;
> -          clocks = <&rcc 0 168>;
> -          interrupt-parent = <&adc123>;
> -          interrupts = <0>;
> -          st,adc-channels = <8>;
> -          dmas = <&dma2 0 0 0x400 0x0>;
> -          dma-names = "rx";
> -          assigned-resolution-bits = <8>;
> +            compatible = "st,stm32f4-adc";
> +            #io-channel-cells = <1>;
> +            reg = <0x0>;
> +            clocks = <&rcc 0 168>;
> +            interrupt-parent = <&adc123>;
> +            interrupts = <0>;
> +            st,adc-channels = <8>;
> +            dmas = <&dma2 0 0 0x400 0x0>;
> +            dma-names = "rx";
> +            assigned-resolution-bits = <8>;
>          };
>          // ...
>          // other adc child nodes follow...
> -      };
> +    };
>  
>    - |
>      // Example 2: with stm32mp157c to setup ADC1 with:
>      // - channels 0 & 1 as single-ended
>      // - channels 2 & 3 as differential (with resp. 6 & 7 negative inputs)
> -      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -      #include <dt-bindings/clock/stm32mp1-clks.h>
> -      adc12: adc@48003000 {
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    adc12: adc@48003000 {
>          compatible = "st,stm32mp1-adc-core";
>          reg = <0x48003000 0x400>;
>          interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> @@ -550,27 +550,27 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>          adc@0 {
> -          compatible = "st,stm32mp1-adc";
> -          #io-channel-cells = <1>;
> -          reg = <0x0>;
> -          interrupt-parent = <&adc12>;
> -          interrupts = <0>;
> -          st,adc-channels = <0 1>;
> -          st,adc-diff-channels = <2 6>, <3 7>;
> -          st,min-sample-time-nsecs = <5000>;
> -          dmas = <&dmamux1 9 0x400 0x05>;
> -          dma-names = "rx";
> +            compatible = "st,stm32mp1-adc";
> +            #io-channel-cells = <1>;
> +            reg = <0x0>;
> +            interrupt-parent = <&adc12>;
> +            interrupts = <0>;
> +            st,adc-channels = <0 1>;
> +            st,adc-diff-channels = <2 6>, <3 7>;
> +            st,min-sample-time-nsecs = <5000>;
> +            dmas = <&dmamux1 9 0x400 0x05>;
> +            dma-names = "rx";
>          };
>          // ...
>          // other adc child node follow...
> -      };
> +    };
>  
>    - |
>      // Example 3: with stm32mp157c to setup ADC2 with:
>      // - internal channels 13, 14, 15.
> -      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -      #include <dt-bindings/clock/stm32mp1-clks.h>
> -      adc122: adc@48003000 {
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    adc122: adc@48003000 {
>          compatible = "st,stm32mp1-adc-core";
>          reg = <0x48003000 0x400>;
>          interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> @@ -587,28 +587,28 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>          adc@100 {
> -          compatible = "st,stm32mp1-adc";
> -          #io-channel-cells = <1>;
> -          reg = <0x100>;
> -          interrupts = <1>;
> -          #address-cells = <1>;
> -          #size-cells = <0>;
> -          channel@13 {
> -            reg = <13>;
> -            label = "vrefint";
> -            st,min-sample-time-ns = <9000>;
> -          };
> -          channel@14 {
> -            reg = <14>;
> -            label = "vddcore";
> -            st,min-sample-time-ns = <9000>;
> -          };
> -          channel@15 {
> -            reg = <15>;
> -            label = "vbat";
> -            st,min-sample-time-ns = <9000>;
> -          };
> +            compatible = "st,stm32mp1-adc";
> +            #io-channel-cells = <1>;
> +            reg = <0x100>;
> +            interrupts = <1>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            channel@13 {
> +                reg = <13>;
> +                label = "vrefint";
> +                st,min-sample-time-ns = <9000>;
> +            };
> +            channel@14 {
> +                reg = <14>;
> +                label = "vddcore";
> +                st,min-sample-time-ns = <9000>;
> +            };
> +            channel@15 {
> +                reg = <15>;
> +                label = "vbat";
> +                st,min-sample-time-ns = <9000>;
> +            };
>          };
> -      };
> +    };
>  
>  ...

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
