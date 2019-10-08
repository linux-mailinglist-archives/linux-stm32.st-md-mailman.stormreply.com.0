Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B453CCFA55
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2019 14:49:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77B03C36B0C;
	Tue,  8 Oct 2019 12:49:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F5A2C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2019 12:49:12 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2B0321871
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2019 12:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570538951;
 bh=l4QjoOoC1FPsBF/H8+vyqEeZBRWcMj5euRW3XBxAE98=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OEdAywYO6BHIh3JUKUWueff1vUkd8txFYMvRvT1WS5dhPMIw1bgC7i+gyvfKi8bk7
 NiNHdWJdyhegNol3yg8TiMAsc3UIYhZF8C3n13Z7YZAFUroIzk1NWttcAjTQrrFhj8
 mqKNKguQx+/phncGm9QOOr4PJ3Pd6arxycSm4mRw=
Received: by mail-qt1-f169.google.com with SMTP id o12so25092879qtf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Oct 2019 05:49:10 -0700 (PDT)
X-Gm-Message-State: APjAAAULn36S/2KowvItoFYWAlVXsk3+N6QPItTOGybVtd2qJYEFXFa7
 c7KfiixKUxQRsMpQUMVMF7MqNP6rHagTlEzMdg==
X-Google-Smtp-Source: APXvYqxSaRgUqqni7RWikQ+zN1xMpYCgoo0IuuKMMlW4a/sVKwGL8eRTo+RXkXFsUSbAZ9vRNEtMOquOyCQzYMzABM4=
X-Received: by 2002:ac8:444f:: with SMTP id m15mr35881979qtn.110.1570538949942; 
 Tue, 08 Oct 2019 05:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191002151714.15813-1-benjamin.gaignard@st.com>
In-Reply-To: <20191002151714.15813-1-benjamin.gaignard@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Oct 2019 07:48:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJtHgAZvFbWOEwu7WsG2OHHugfB1RKSrxsaP3Exa5odGg@mail.gmail.com>
Message-ID: <CAL_JsqJtHgAZvFbWOEwu7WsG2OHHugfB1RKSrxsaP3Exa5odGg@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick Fertre <yannick.fertre@st.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: display: Convert stm32
	display bindings to json-schema
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

On Wed, Oct 2, 2019 at 10:17 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 display binding to DT schema format using json-schema.
> Split the original bindings in two yaml files:
> - one for display controller (ltdc)
> - one for DSI controller
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-dsi.yaml  | 130 +++++++++++++++++++
>  .../devicetree/bindings/display/st,stm32-ltdc.txt  | 144 ---------------------
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml |  82 ++++++++++++
>  3 files changed, 212 insertions(+), 144 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> new file mode 100644
> index 000000000000..8143cf6f0ce7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: GPL-2.0

If all the authors are ST, can you relicense to (GPL-2.0-only OR BSD-2-Clause).

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/st,stm32-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 DSI host controller
> +
> +maintainers:
> +  - Philippe Cornu <philippe.cornu@st.com>
> +  - Yannick Fertre <yannick.fertre@st.com>
> +
> +properties:
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +  compatible:
> +    const: st,stm32-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module Clock
> +      - description: DSI bus clock
> +      - description: Pixel clock
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: ref
> +      - const: px_clk
> +    minItems: 2
> +    maxItems: 3
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: apb
> +
> +  phy-dsi-supply:
> +    maxItems: 1
> +    description:
> +        Phandle of the regulator that provides the supply voltage.
> +
> +  ports:
> +    type: object
> +    description:
> +        A node containing DSI input & output port nodes with endpoint
> +        definitions as documented in
> +        Documentation/devicetree/bindings/media/video-interfaces.txt
> +        Documentation/devicetree/bindings/graph.txt
> +
> +  port:

This needs to be under 'properties' under 'ports'. And you need to
have 'port@0' and 'port@1' instead.

> +    type: object
> +    description:
> +      "A port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +      port@0: DSI input port node, connected to the ltdc rgb output port.
> +      port@1: DSI output port node, connected to a panel or a bridge input port"
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - ports

Add an 'additionalProperties: false' here.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    dsi: dsi@5a000000 {
> +        compatible = "st,stm32-dsi";
> +        reg = <0x5a000000 0x800>;
> +        clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
> +        clock-names = "pclk", "ref", "px_clk";
> +        resets = <&rcc DSI_R>;
> +        reset-names = "apb";
> +        phy-dsi-supply = <&reg18>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              port@0 {
> +                    reg = <0>;
> +                    dsi_in: endpoint {
> +                        remote-endpoint = <&ltdc_ep1_out>;
> +                    };
> +              };
> +
> +              port@1 {
> +                    reg = <1>;
> +                    dsi_out: endpoint {
> +                        remote-endpoint = <&panel_in>;
> +                    };
> +              };
> +        };
> +
> +        panel {

Not documented.

> +              compatible = "orisetech,otm8009a";
> +              reg = <0>;
> +              reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
> +              power-supply = <&v3v3>;
> +
> +              port {
> +                    panel_in: endpoint {
> +                        remote-endpoint = <&dsi_out>;
> +                    };
> +              };
> +        };
> +    };
> +
> +...
> +
> +

[...]

> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> new file mode 100644
> index 000000000000..5d01c83234a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/st,stm32-ltdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 lcd-tft display controller
> +
> +maintainers:
> +  - Philippe Cornu <philippe.cornu@st.com>
> +  - Yannick Fertre <yannick.fertre@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32-ltdc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 2
> +    maxItems: 2
> +
> +  clocks:
> +    items:
> +      - description: Module Clock

Just 'maxItems: 1' is sufficient with a single entry.

> +
> +  clock-names:
> +    items:
> +      - const: lcd
> +
> +  pinctrl-names: true
> +
> +  resets:
> +        maxItems: 1

Inconsistent indenting.

> +
> +  port:
> +    type: object
> +    description:
> +      "Video port for DPI RGB output.
> +      ltdc has one video port with up to 2 endpoints:
> +      - for external dpi rgb panel or bridge, using gpios.
> +      - for internal dpi input of the MIPI DSI host controller.
> +      Note: These 2 endpoints cannot be activated simultaneously.
> +      Please refer to the bindings defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt."
> +
> +patternProperties:
> +  "^pinctrl-[0-9]+$": true

No need for this, it gets added automatically.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - port

Add an 'additionalProperties: false' here.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    ltdc: display-controller@40016800 {
> +        compatible = "st,stm32-ltdc";
> +        reg = <0x5a001000 0x400>;
> +        interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&rcc LTDC_PX>;
> +        clock-names = "lcd";
> +        resets = <&rcc LTDC_R>;
> +
> +        port {
> +             ltdc_out_dsi: endpoint {
> +                     remote-endpoint = <&dsi_in>;
> +             };
> +        };
> +    };
> +
> +...
> +
> --
> 2.15.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
