Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF385D647F
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 15:57:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FF79C36B0B;
	Mon, 14 Oct 2019 13:57:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 149F9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 13:57:26 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C0EE21835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 13:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571061444;
 bh=LLH2uQ5gYg+SBXTksDYlU+T3+fs82qQa6ba8XCr/GLI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WhWA0Z26YBfhBAV8RCEZEMYp1v+sqt+colar2WnzuXDlL8iW6T6nbdwUUz7lR8xRD
 k0e4PvOQpMwHU+2BFSDNQzxl86uVe5XU5vttQ3NcDIoX47dI8JTqJVYmbE02q9jLiH
 nUhPVzxIyECh8oC7bBNWteH980agEaehLbva3a1w=
Received: by mail-qt1-f169.google.com with SMTP id n17so6167205qtr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 06:57:24 -0700 (PDT)
X-Gm-Message-State: APjAAAUieYBm8109cLWV0ZTsps1j5rMIPNCZGH/rklIdPfYiGLMaiWq+
 UlUbRdR8uYLCmJxDgLUQqY7K0XeWlUtfqM/IfA==
X-Google-Smtp-Source: APXvYqwX1KUTrKD9PfICXLuavHN6lAAtm6esRog7N3VFNyl9RY+ZCu7FqNsYVhKlnuWqdkfPcoK1JtogLpjhrB86EEs=
X-Received: by 2002:ac8:6782:: with SMTP id b2mr32574382qtp.143.1571061443573; 
 Mon, 14 Oct 2019 06:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191014091622.23562-1-benjamin.gaignard@st.com>
In-Reply-To: <20191014091622.23562-1-benjamin.gaignard@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 14 Oct 2019 08:57:11 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Z7G31vBhHn_csntOsBLnZoLFU0qZHk67kdC1kahd4kQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Z7G31vBhHn_csntOsBLnZoLFU0qZHk67kdC1kahd4kQ@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick Fertre <yannick.fertre@st.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: display: Convert stm32
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

On Mon, Oct 14, 2019 at 4:16 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 display binding to DT schema format using json-schema.
> Split the original bindings in two yaml files:
> - one for display controller (ltdc)
> - one for DSI controller
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> - use (GPL-2.0-only OR BSD-2-Clause) license
>
> changes in v2:
> - use BSD-2-Clause license
> - add panel property
> - fix identation
> - remove pinctrl-names: true
> - remove pinctrl-[0-9]+: true
> - rework ports block to include port@0 and port@1
> - use const for #adress-cells and #size-cells
> - add additionalProperties: false
>
>  .../devicetree/bindings/display/st,stm32-dsi.yaml  | 151 +++++++++++++++++++++
>  .../devicetree/bindings/display/st,stm32-ltdc.txt  | 144 --------------------
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml |  81 +++++++++++
>  3 files changed, 232 insertions(+), 144 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> new file mode 100644
> index 000000000000..8dd727c7533e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
> +description:
> +  The STMicroelectronics STM32 DSI controller uses the Synopsys DesignWare MIPI-DSI host controller.
> +
> +properties:
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
> +      A node containing DSI input & output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +    properties:
> +      port@0:
> +        type: object
> +        description:
> +          DSI input port node, connected to the ltdc rgb output port.
> +
> +      port@1:
> +        type: object
> +        description:
> +          DSI output port node, connected to a panel or a bridge input port"
> +
> +patternProperties:
> +  "^(panel|panel-dsi)@[0-9]$":
> +    type: object
> +    description:
> +      A node containing the panel or bridge description as documented in
> +      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> +    properties:
> +      port@0:

You can drop this. The unit address for the panel port is decided by
the panel binding, not this one.

> +        type: object
> +        description:
> +          Panel or bridge port node, connected to the DSI output port (port@1)

[...]

> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> new file mode 100644
> index 000000000000..94a4137f7236
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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

Need to describe what each interrupt is.

items:
  - description: ...
  - description: ...

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: lcd
> +
> +  resets:
> +    maxItems: 1
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
> +  dma-ranges:
> +    maxItems: 1

dma-ranges goes in bus nodes, not device nodes.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - port
> +
> +additionalProperties: false
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
