Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C800551A459
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 17:42:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80DDFC6047D;
	Wed,  4 May 2022 15:42:47 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCEFCC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 15:42:45 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-deb9295679so1556365fac.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 May 2022 08:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tnMRJsbiS8QiP9lDD2I4JzMT/wd9etKoP6P9ura1i48=;
 b=xWJGBjcjOgfvCjUtHawJ/UHU4FhPNIwK8flV6bwN9eX5u0vTN+DnUpFhMBUXzv0Gji
 jFu8fVGuxPkGQO3cm7ag6f5DgSFPItwkDdpmUUOnSDDu1g49hbvBMUM5ijYZG9XoeZcD
 P3IqB8l3JCh6uW8IG4NhSzP/JtuIyrB/R82Guo5mPFgCKYkXThOSgd0LW0+c8NKqHZPN
 8LQX1rn9B5MT9Le6/Nc2UU7fD8gkLJr2OzxXF2EGtpd+ppZnuTl2RGuGWjSnTWQEO5Sx
 uNQRWm7PrAfXurY//UwhmBD8F5msX2fEgZh8s+pH2ug3q2QL0Fn2LZPDL7eN9qxnXybo
 nlFQ==
X-Gm-Message-State: AOAM533vMcwo7YiCrVYp+ddUPbpL7moTfGWmgRi9FWqXhj3HG1jJCvkN
 1cGPGqUbymQrJoV8mj28uw==
X-Google-Smtp-Source: ABdhPJzNz108HgppQ2njmjK7spVH8oSX47FuDf8S/DyT2/BrJzu23fF4n28T9OGduSEoDRg/Cc5k1w==
X-Received: by 2002:a05:6870:e412:b0:ed:a30a:2248 with SMTP id
 n18-20020a056870e41200b000eda30a2248mr39162oag.138.1651678964563; 
 Wed, 04 May 2022 08:42:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v4-20020a9d4e84000000b006060322124bsm5279580otk.27.2022.05.04.08.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 08:42:44 -0700 (PDT)
Received: (nullmailer pid 1762666 invoked by uid 1000);
 Wed, 04 May 2022 15:42:40 -0000
Date: Wed, 4 May 2022 10:42:40 -0500
From: Rob Herring <robh@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <YnKe8K3FjoaUO2ml@robh.at.kernel.org>
References: <20220504130233.330983-1-valentin.caron@foss.st.com>
 <20220504130617.331290-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220504130617.331290-1-valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: rtc: stm32: add alarm A
 out property to select output
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

On Wed, May 04, 2022 at 03:06:13PM +0200, Valentin Caron wrote:
> STM32 RTC can pulse some SOC pins when an alarm of RTC expires.
> 
> This patch adds property to activate alarm A output. The pulse can
> output on three pins RTC_OUT1, RTC_OUT2, RTC_OUT2_RMP
> (PC13, PB2, PI8 on stm32mp15) (PC13, PB2, PI1 on stm32mp13).
> 
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>  .../devicetree/bindings/rtc/st,stm32-rtc.yaml | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> index 56d46ea35c5d..71e02604e8de 100644
> --- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> @@ -59,6 +59,13 @@ properties:
>        Refer to <include/dt-bindings/rtc/rtc-stm32.h> for the supported values.
>        Pinctrl state named "default" may be defined to reserve pin for RTC output.
>  
> +  st,alarm:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    description: |
> +      To select and enable RTC Alarm A output.
> +      Refer to <include/dt-bindings/rtc/rtc-stm32.h> for the supported values.

No, sorry, you need to define the allowed values as a schema here.

> +      Pinctrl state named "default" may be defined to reserve pin for RTC output.
> +
>  allOf:
>    - if:
>        properties:
> @@ -75,6 +82,9 @@ allOf:
>          st,lsco:
>            maxItems: 0
>  
> +        st,alarm:
> +          maxItems: 0

st,alarm: false

or:

not:
  required: [ st,alarm ]

is how you disallow a property.

This should cause a warning, but this patch didn't apply for me.

> +
>          clock-names: false
>  
>        required:
> @@ -95,6 +105,9 @@ allOf:
>          st,lsco:
>            maxItems: 0
>  
> +        st,alarm:
> +          maxItems: 0
> +
>        required:
>          - clock-names
>          - st,syscfg
> @@ -117,6 +130,9 @@ allOf:
>          st,lsco:
>            maxItems: 1
>  
> +        st,alarm:
> +          maxItems: 1

maxItems applies to arrays, but this is a scalar value. I don't think 
you need this hunk.

> +
>        required:
>          - clock-names
>  
> @@ -153,8 +169,9 @@ examples:
>        clocks = <&rcc RTCAPB>, <&rcc RTC>;
>        clock-names = "pclk", "rtc_ck";
>        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +      st,alarm = <RTC_OUT1>;
>        st,lsco = <RTC_OUT2_RMP>;
> -      pinctrl-0 = <&rtc_out2_rmp_pins_a>;
> +      pinctrl-0 = <&rtc_out1_pins_a &rtc_out2_rmp_pins_a>;
>        pinctrl-names = "default";
>      };
>  
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
