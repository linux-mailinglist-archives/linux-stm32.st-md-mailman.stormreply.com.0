Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A82C15A1AD6
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 23:12:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D01EC640FC;
	Thu, 25 Aug 2022 21:12:45 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FA39C03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 21:12:44 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-11c5ee9bf43so26538833fac.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 14:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=7cYyxg+Rjs2OKuzQlOjAlSHEpxBggE7h7LYSTjnsFQY=;
 b=Xf7t5S1yKFHdrs3WMXlc100WZZ41HIRd83rOLdYkoPh8VvXylxccwhYQ/0oEYP6Ug/
 936ZtE75PYBwWlDK0PoUjoZMwCwj0KcI2HUno2+YgQkJAFUuO6J5cY+5uCO7gJuzRt0O
 pu9KI3zvfYOHNMNJkVEjOZ/MfUf2BinR0SHXh/IyQhc1quqWrR4BgIRrH1LlQKP+ToE3
 EguAGgu8EXbQXc2LId2nZclCo9PZO3Kv/hyvPHnM7UNNXvMf+gHNeJ14ILCy5Uo8/Lxb
 LCoDe+QpRQtmt2AvtiyHtprLiXf+lylnWVOcsov1WzmZI4JIZ05w3TER4B4HTzKFxnEL
 SVbQ==
X-Gm-Message-State: ACgBeo3XnTObcXu1ttNl7SDVOL/49gKLXLCVk9Tqa7aXirLyBptTFdCd
 cjtnsc1kcq42UXa4DjGhyQ==
X-Google-Smtp-Source: AA6agR7L4kQd6z1UzBVG2YOwp2flBq48abWOo4dTD4AKZRma54US5SS++O70oOI3XePD8j7/qDEheA==
X-Received: by 2002:a05:6870:438b:b0:11c:ecf2:e4ca with SMTP id
 r11-20020a056870438b00b0011cecf2e4camr449518oah.122.1661461963080; 
 Thu, 25 Aug 2022 14:12:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o12-20020a9d5c0c000000b0061d31170573sm92760otk.20.2022.08.25.14.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 14:12:42 -0700 (PDT)
Received: (nullmailer pid 1696440 invoked by uid 1000);
 Thu, 25 Aug 2022 21:12:41 -0000
Date: Thu, 25 Aug 2022 16:12:41 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20220825211241.GA1688421-robh@kernel.org>
References: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
 <20220820082936.686924-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220820082936.686924-2-dario.binacchi@amarulasolutions.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>, Dario Binacchi <dariobin@libero.it>
Subject: Re: [Linux-stm32] [RFC PATCH v2 1/4] dt-bindings: net: can: add
 STM32 bxcan DT bindings
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

On Sat, Aug 20, 2022 at 10:29:33AM +0200, Dario Binacchi wrote:
> Add documentation of device tree bindings for the STM32 basic extended
> CAN (bxcan) controller.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v2:
> - Change the file name into 'st,stm32-bxcan-core.yaml'.
> - Rename compatibles:
>   - st,stm32-bxcan-core -> st,stm32f4-bxcan-core
>   - st,stm32-bxcan -> st,stm32f4-bxcan
> - Rename master property to st,can-master.
> - Remove the status property from the example.
> - Put the node child properties as required.
> 
>  .../bindings/net/can/st,stm32-bxcan.yaml      | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> new file mode 100644
> index 000000000000..288631b5556d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/can/st,stm32-bxcan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics bxCAN controller
> +
> +description: STMicroelectronics BxCAN controller for CAN bus
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +allOf:
> +  - $ref: can-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32f4-bxcan-core
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Input clock for registers access
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - clocks
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +patternProperties:
> +  "^can@[0-9]+$":
> +    type: object
> +    description:
> +      A CAN block node contains two subnodes, representing each one a CAN
> +      instance available on the machine.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - st,stm32f4-bxcan
> +
> +      st,can-master:
> +        description:
> +          Master and slave mode of the bxCAN peripheral is only relevant
> +          if the chip has two CAN peripherals. In that case they share
> +          some of the required logic, and that means you cannot use the
> +          slave CAN without the master CAN.
> +        type: boolean
> +
> +      reg:
> +        description: |
> +          Offset of CAN instance in CAN block. Valid values are:
> +            - 0x0:   CAN1
> +            - 0x400: CAN2
> +        maxItems: 1
> +
> +      interrupts:
> +        items:
> +          - description: transmit interrupt
> +          - description: FIFO 0 receive interrupt
> +          - description: FIFO 1 receive interrupt
> +          - description: status change error interrupt
> +
> +      interrupt-names:
> +        items:
> +          - const: tx
> +          - const: rx0
> +          - const: rx1
> +          - const: sce
> +
> +      resets:
> +        maxItems: 1
> +
> +      clocks:
> +        description:
> +          Input clock for registers access
> +        maxItems: 1
> +
> +    additionalProperties: false
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +      - resets
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32fx-clock.h>
> +    #include <dt-bindings/mfd/stm32f4-rcc.h>
> +
> +    can: can@40006400 {
> +        compatible = "st,stm32f4-bxcan-core";
> +        reg = <0x40006400 0x800>;
> +        resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
> +        clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +

Missing 'ranges'.

> +        can1: can@0 {
> +            compatible = "st,stm32f4-bxcan";
> +            reg = <0x0>;
> +            interrupts = <19>, <20>, <21>, <22>;
> +            interrupt-names = "tx", "rx0", "rx1", "sce";
> +            resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
> +            st,can-master;

No clocks?

> +        };
> +
> +        can2: can@400 {
> +            compatible = "st,stm32f4-bxcan";
> +            reg = <0x400>;
> +            interrupts = <63>, <64>, <65>, <66>;
> +            interrupt-names = "tx", "rx0", "rx1", "sce";
> +            resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
> +            clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
> +        };
> +    };
> -- 
> 2.32.0
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
