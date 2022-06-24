Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C6C559E65
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jun 2022 18:16:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50FF4C03FC5;
	Fri, 24 Jun 2022 16:16:31 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00BD6C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 16:16:29 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id e2so4195063edv.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YocsH/SCIFBtqFkbbqYZ9NPO0UIAT3/bIxNj7wG+byE=;
 b=yhdKSJLG78moAYzJ88cQkhH/Hj5st2xbcRGlEiwd0dUxqsNyyB7j3EJGWPeIUgohrw
 vx7twc6VO4e5ryjWo8HD3Wu3vpxXVbeoTYKzYFhl08J0gKex+mXu/mgeNrrsAY3ZM6sW
 ZfE/T+ddDwm97PYBRken2rgWFIfj9dppAXIhbg8rnqOqVtaG3CiBSc9R0JsymSKxPnik
 LhyNphKCPMTtVlZR9LkrqwWVANaJlRr7W9oROdhI4bb/zRzCrRYifa76XKZKrZLMsWVq
 fkJdb2ukyNt6MCxrdbgQjjU1n8bUBYQx7ortZngOVow2D1b81R6+zdK6bIUpkR2JpewG
 W5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YocsH/SCIFBtqFkbbqYZ9NPO0UIAT3/bIxNj7wG+byE=;
 b=4Ajy5XcMxCwr1FFKbBWOHRtjQ4IJMrlKRBgOTocRGf79yrUSCpWTpOat6dw8obTKLI
 pVbN+jJ5bj/QnwyNTFAL48m/Kzd4t6Bz1SARyLYaSuNYbeEPq1/tz8XvpRbcHuGaXY9A
 7BTNdeA5G+KHQVueEo2ycdiwcuRbQoVU0PI8lTTRJXQBygdvtozrJi0ahmQgXPBXW5ZX
 kFvznx+igfSTaQbL7KKerQVT9qwqs2AVax2SygX/AsU3pGajOSzBPL5vLFJ8/defY6L1
 kGSG/B0s3EmpE3CJTpqYlcl6INGerbaPPZbOQuTgkqshESPKStKxxCBRF8gje6EythNU
 FXuA==
X-Gm-Message-State: AJIora8mDxOwBIJ7siLpI6/cndTlLvFyvyExglNmpx4PMP3FPrGxXrYT
 LaSnHH81XIgC0tU3exwoFRHZkA==
X-Google-Smtp-Source: AGRyM1sRGlX6n9a00k4nlkcTq8GcVHrv/VdC8qA06SSsZy9JjDIaeQFaarDYrDBySHNlCTH2NeO2uA==
X-Received: by 2002:a05:6402:4248:b0:435:9150:ccfb with SMTP id
 g8-20020a056402424800b004359150ccfbmr18736992edb.374.1656087389569; 
 Fri, 24 Jun 2022 09:16:29 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 k12-20020a17090666cc00b007041e969a8asm1350125ejp.97.2022.06.24.09.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 09:16:29 -0700 (PDT)
Message-ID: <ddb0e946-c955-1404-c1cd-c2548f34ec35@linaro.org>
Date: Fri, 24 Jun 2022 18:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, robh+dt@kernel.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
References: <20220624155413.399190-1-fabrice.gasnier@foss.st.com>
 <20220624155413.399190-2-fabrice.gasnier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624155413.399190-2-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: usb: typec: add bindings
 for stm32g0 controller
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

On 24/06/2022 17:54, Fabrice Gasnier wrote:
> This patch adds DT schema documentation for the STM32G0 Type-C controller.

No "This patch"

https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> STM32G0 provides an integrated USB Type-C and power delivery interface.
> It can be programmed with a firmware to handle UCSI protocol over I2C
> interface. A GPIO is used as an interrupt line.
> It may be used as a wakeup source, so use optional "wakeup-source" and
> "power-domains" properties to support wakeup.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  .../bindings/usb/st,typec-stm32g0.yaml        | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml b/Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml
> new file mode 100644
> index 0000000000000..b2729bd015a1a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/st,typec-stm32g0.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

No quotes.

> +
> +title: STMicroelectronics STM32G0 Type-C controller bindings

s/bindings//

> +
> +description: |
> +  The STM32G0 MCU can be programmed to control Type-C connector(s) through I2C
> +  typically using the UCSI protocol over I2C, with a dedicated alert
> +  (interrupt) pin.
> +
> +maintainers:
> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32g0-typec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  connector:
> +    type: object> +    allOf:
> +      - $ref: ../connector/usb-connector.yaml#

Full path, so /schemas/connector/...

unevaluatedProperties: false

> +
> +  firmware-name:
> +    description: |
> +      Should contain the name of the default firmware image
> +      file located on the firmware search path
> +
> +  wakeup-source: true
> +  power-domains: true

maxItems

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c5 {

Just "i2c"

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      stm32g0@53 {

Generic node name describing class of the device.

> +        compatible = "st,stm32g0-typec";
> +        reg = <0x53>;
> +        /* Alert pin on GPIO PE12 */
> +        interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +        interrupt-parent = <&gpioe>;
> +
> +        /* Example with one type-C connector */
> +        connector {
> +          compatible = "usb-c-connector";
> +          label = "USB-C";
> +
> +          port {

This does not look like proper schema of connector.yaml.

> +            con_usb_c_ep: endpoint {
> +              remote-endpoint = <&usbotg_hs_ep>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +    usbotg_hs {

Generic node names, no underscores in node names.

> +      usb-role-switch;
> +      port {
> +        usbotg_hs_ep: endpoint {
> +          remote-endpoint = <&con_usb_c_ep>;
> +        };
> +      };
> +    };
> +...


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
