Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF006C62F1
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 10:11:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 990CCC6A5F6;
	Thu, 23 Mar 2023 09:11:57 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C1D0C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 09:11:57 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id m2so19649898wrh.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 02:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679562716;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FFw6On5GWKP9Yx/iOzJZ3hP79avgSWRYu5AU8eAnFgg=;
 b=XrOk5J0nOb+4Bwzoxv40TzazsK0MVkdhumyNdd2X20npfWaqd9fXxZXrjxFw3nvnYD
 6f8UHlhCTaQm3r2aCP4bdOGtexK5xje6t2s6ihYfpwcwme/6JpaaEm4Cwm8G5Wo1UfJg
 TwGGIA3TWc8BMxl2GHIrWdD5FOlffGfFVC7BBd4dzNvqXNLDq2uHUqARvfgo/TLztf2W
 8gKgxl02UlNLZXMppw7giKePav+cv99pOPjJG8sTsXHz3BY2Vs7yR+YrY65CWc3Xbri/
 ji5itVRKb9o7uC3I5bjPND6l9lLWaio5lcR4tgCG/DjYtF5ipjFwX7mYrRB397D36I7U
 F2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679562716;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FFw6On5GWKP9Yx/iOzJZ3hP79avgSWRYu5AU8eAnFgg=;
 b=Rlpsfor6ORp1qdDPtiaaE/EZ63CoIrotFCETaMAcHgzx9U+0BXBxKn/oWEWPabC8u1
 hhMkCktkpCSWoRKsz+Dtk+gx7bzGHhl4w6hKt7o55b7NI8NGqmSlDiCeadj3Ks+jhZvp
 PRFr9baTNYzC/kR2UBAsZUW/cLrRHGrog4Q+8zubitv5kfcWcWlggrpfgosfWNl10oU6
 dQHDAhQzI13GHNec5BmWNl6IVSiUfWR0hlqNXEA6vhFUwUOiCwNuEjnE/dYxs5SrIyaG
 TXmp3wRuhcQ3utuC7o36959rTaDuDUd+N1BX7yTRtR0RJfRwVB7sC2ncBxisWUiWfUQw
 v33A==
X-Gm-Message-State: AAQBX9cfGUdmxs+nUQJO/7nctfgOh72nJECcRnS7jUxgl2E0kpduLCIV
 AR7EQQMltj/+B5frFUxKNipRJQ==
X-Google-Smtp-Source: AKy350b92zCNadItJJq5B+JKgVLvHKVmzqOd2qkeIzALoHhVFAZA099EcknZzO4P7ASa8073zZYoaQ==
X-Received: by 2002:a5d:5003:0:b0:2d7:a918:a2b7 with SMTP id
 e3-20020a5d5003000000b002d7a918a2b7mr2334209wrt.48.1679562716566; 
 Thu, 23 Mar 2023 02:11:56 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6082000000b002c6d0462163sm15607659wrt.100.2023.03.23.02.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 02:11:56 -0700 (PDT)
Message-ID: <6c0c9b5a-3499-b0b2-ae58-7d5b17039c6f@linaro.org>
Date: Thu, 23 Mar 2023 10:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Peter Rosin <peda@axentia.se>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230322173530.3971676-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: Drop unneeded quotes
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 4 ++--

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   Documentation/devicetree/bindings/i2c/apple,i2c.yaml          | 4 ++--
>   Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-
>   Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 4 ++--
>   Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml       | 4 ++--
>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++--
>   Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-
>   .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
>   8 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> index 199a354ccb97..26bed558c6b8 100644
> --- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic Meson I2C Controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> index 4ac61fec90e2..243da7003cec 100644
> --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/apple,i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Apple/PASemi I2C controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index ea2303c0e143..6adedd3ec399 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -75,7 +75,7 @@ required:
>     - clocks
>   
>   allOf:
> -  - $ref: "i2c-controller.yaml"
> +  - $ref: i2c-controller.yaml
>     - if:
>         properties:
>           compatible:
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index 2e95cda7262a..7a675aa08c44 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Cadence I2C controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> index 6e0a5686af04..f34cc7ad5a00 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> @@ -45,7 +45,7 @@ properties:
>   
>     i2c-parent:
>       description: phandle of the I2C bus that this multiplexer's master-side port is connected to
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>   
>     mux-gpios:
>       description: list of GPIOs used to control the muxer
> @@ -55,7 +55,7 @@ properties:
>     idle-state:
>       description: Value to set the muxer to when idle. When no value is given, it defaults to the
>         last value used.
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>   
>   allOf:
>     - $ref: i2c-mux.yaml
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 0e88c85985b5..9f66a3bb1f80 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm Geni based QUP I2C Controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index bf396e9466aa..94b75d9f66cd 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -90,7 +90,7 @@ properties:
>     st,syscfg-fmp:
>       description: Use to set Fast Mode Plus bit within SYSCFG when Fast Mode
>         Plus speed is selected by slave.
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>       items:
>         - items:
>             - description: phandle to syscfg
> diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> index 1b598638d457..658ae92fa86d 100644
> --- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> +++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Xilinx IIC controller
>   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
