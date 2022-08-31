Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DF25A88C6
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Sep 2022 00:06:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01169C03FD4;
	Wed, 31 Aug 2022 22:06:19 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCA3DC03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 22:06:17 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 h9-20020a9d5549000000b0063727299bb4so11209157oti.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 15:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=bUxxZUu9ewnTBb+tAEbdLRE9nNXH978M8nxstojv75g=;
 b=yPQbTJoEZBqY26dF44jLft0cy+4swzkGAXUkTN0jnXjckRVAtuXVMop/ryPPtSZNvQ
 BFAM2TLoN/ZP0aJpY06eNYlO1aECTYoUAbiR3wN18IVp00jArhT7fPm/xKMKamK+W/Bs
 5VPrBExu1qlIvn1QJqf1DO8uVlRWly5EXVKQA+TAnyx9tdUK7c/40PJaeqyrVcobeuxh
 B3fXUcBlp3libugyjHn+UeigCVkrj5Nu4nlyYjC+cYqTA4rSkJGlEqMAjqddJ0l5BkqU
 Evd4CnsBZrChQ2ibwgfvCVVezsK2G2QWAwedhL9wfiP7dRS5bU47mOlK2PAQcuU90C+Q
 RNNA==
X-Gm-Message-State: ACgBeo2ZjKi525jhii6gSe8UjmtjIPXqL2pspgS7whM0WwIu54HWJUC0
 tkKwyzP6kILvZnkrpcg/Ow==
X-Google-Smtp-Source: AA6agR4nunA3HWR7HrY12H0e3vD8ahCK+m8+lro/Es0d3OxAJO6N6GcSrqm2psCPJon0tF2tZhZ2Vg==
X-Received: by 2002:a05:6830:2498:b0:638:9325:3370 with SMTP id
 u24-20020a056830249800b0063893253370mr11369906ots.228.1661983576608; 
 Wed, 31 Aug 2022 15:06:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ab912000000b0044b24273f55sm7490440ooo.6.2022.08.31.15.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 15:06:16 -0700 (PDT)
Received: (nullmailer pid 334935 invoked by uid 1000);
 Wed, 31 Aug 2022 22:06:14 -0000
Date: Wed, 31 Aug 2022 17:06:14 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20220831220614.GA319827-robh@kernel.org>
References: <20220828133329.793324-1-dario.binacchi@amarulasolutions.com>
 <20220828133329.793324-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828133329.793324-2-dario.binacchi@amarulasolutions.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [Linux-stm32] [RFC PATCH v3 1/4] dt-bindings: net: can: add
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

On Sun, Aug 28, 2022 at 03:33:26PM +0200, Dario Binacchi wrote:
> Add documentation of device tree bindings for the STM32 basic extended
> CAN (bxcan) controller.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v3:
> - Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
> - Add description to the parent of the two child nodes.
> - Move "patterProperties:" after "properties: in top level before "required".
> - Add "clocks" to the "required:" list of the child nodes.
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
>  .../bindings/net/can/st,stm32-bxcan.yaml      | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> new file mode 100644
> index 000000000000..3278c724e6f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> @@ -0,0 +1,142 @@
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
> +    description:
> +      It manages the access to the 512-bytes SRAM memory shared by the
> +      two bxCAN cells (CAN1 master and CAN2 slave) in dual CAN peripheral
> +      configuration.
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
> +      - clocks
> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - clocks
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
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

Again, the addressing is not correct here if 0 and 0x400 are memory 
mapped register offsets.

Rob

> +
> +        can1: can@0 {
> +            compatible = "st,stm32f4-bxcan";
> +            reg = <0x0>;
> +            interrupts = <19>, <20>, <21>, <22>;
> +            interrupt-names = "tx", "rx0", "rx1", "sce";
> +            resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
> +            clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
> +            st,can-master;
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
