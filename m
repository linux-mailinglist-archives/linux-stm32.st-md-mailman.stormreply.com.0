Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5B55EEF2F
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 09:37:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 499E1C64100;
	Thu, 29 Sep 2022 07:37:07 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 819F7C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 07:37:06 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id u18so973926lfo.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 00:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=C6HAcFRlUdRVNTmd1+LZDEckWRqIi/Jw90W8yfGFuaM=;
 b=qrePgKY/Y+Vm7/UZSq1RNCj98EF+ZGGgs4eAocWnvNy3OL+hbXXhm7/hlNBWZtmh+w
 HHpePbG503tmykGObV5MPrA42fKiouTwqXxUHeY6180cJ+hwMma60u7Mr31ZuIXyZjGk
 CB9Ko/qcwaZ/9bEzlE5LXclzRuAQ6M7MmVNiSzr1s1P7jPgaWG/x39v200VI0dx3K5Uh
 QgCNllL/mAQ2nJttbLYW4lxDr/Ce783BOmFE/L4c+jovVnoqxtcBGniMStFJUiG3+JhX
 b3+WuUBiZHWhsY0POKuA/irYlQuOJ0S2R9kBBDhWDQIDWbm887eHhwRtrapD53VfNVdN
 mzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=C6HAcFRlUdRVNTmd1+LZDEckWRqIi/Jw90W8yfGFuaM=;
 b=zoxN0N5MrzNZwfbKihJAA3SN+d/8ZozUCE1JTootNOkHmIIIGac/bfNwXdzJV1ejjO
 ivjLDwEq6EWsEeMO1YUMFRkFdQwLeaZo0Ols4z7icoD/n3DjyX3NXQc8g11fWc1T7CYX
 Rbj52PsCU2N4yaMtUo4iHynxwk5n7g86/6ZxZ9hJ+XBTE6RBLnDHcf7XC7gCWEuODWDR
 4wRNL4SQgjIEZIgmWfUDUfAbwTeCjbqB/S+yDtWoPmoChuVTVhnhy7v5ypo+Al6lbQdI
 OgmU49yDZiYg2tHfWJiqkFV+YIIQmOkE7X2Y6eresBdm7a577M1wa751g+V9fLPUGfVx
 LoaA==
X-Gm-Message-State: ACrzQf33PLrSx/OiY9CG78Ya1/0cmLDfgK+t47yuxtLFRLWcdwmLmLGm
 w3ImCo4GFo0isrV8Zg+8JC/gVQ==
X-Google-Smtp-Source: AMsMyM6auO7zd9V9y6sVWvoa5lOsJCgLzgjIBXw3FHxLXWyMNv86MEkFtRVwKPJbJmzPknh6BFI9cQ==
X-Received: by 2002:a05:6512:511:b0:4a1:d9f3:ea10 with SMTP id
 o17-20020a056512051100b004a1d9f3ea10mr863530lfb.555.1664437025680; 
 Thu, 29 Sep 2022 00:37:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 10-20020ac25f0a000000b004979e1ff641sm704286lfq.115.2022.09.29.00.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 00:37:05 -0700 (PDT)
Message-ID: <65ef5f40-f8bd-045c-a9d7-6a74ceacc8e2@linaro.org>
Date: Thu, 29 Sep 2022 09:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20220927184657.291714-1-marex@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927184657.291714-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: media: st,
 stmipid02: Convert the text bindings to YAML
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

On 27/09/2022 20:46, Marek Vasut wrote:
> Convert the text STMIPID02 DT bindings to YAML DT format to permit
> validation of DTs using this I2C CSI-2 to CPI bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Thank you for your patch. There is something to discuss/improve.

> +properties:
> +  compatible:
> +    const: st,st-mipid02
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Reference to the xclk input clock.

This usually goes to "clocks", but on the other hand it does not bring
any value (xclk is obvious from clock-names), so I propose to skip
entire description.

> +    items:
> +      - const: xclk
> +
> +  VDDE-supply:
> +    description:
> +      Sensor digital IO supply. Must be 1.8 volts.
> +
> +  VDDIN-supply:
> +    description:
> +      Sensor internal regulator supply. Must be 1.8 volts.
> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the xsdn pin, if any.
> +      This is an active low signal to the mipid02.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 first input port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description:
> +                  Single-lane operation shall be <1> or <2> .
> +                  Dual-lane operation shall be <1 2> or <2 1> .
> +                minItems: 1
> +                maxItems: 2

Blank line

> +              lane-polarity:

The property is "lane-polarities"

> +                description:
> +                  Any lane can be inverted or not.
> +                minItems: 1
> +                maxItems: 2
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 second input port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description:
> +                  Single-lane operation shall be <1> or <2> .
> +                maxItems: 1

Blank line

> +              lane-polarity:

lane-polarities

> +                description:
> +                  Any lane can be inverted or not.
> +                maxItems: 1
> +
> +            required:
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Output port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-width:
> +                enum: [6, 7, 8, 10, 12]

Blank line

> +              hsync-active: true
> +              vsync-active: true

You do not need these two - they come from video-interfaces.yaml


> +
> +            required:
> +              - bus-width
> +
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +
> +    required:
> +      - port@2
> +

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
