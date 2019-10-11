Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2FBD3F94
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 14:35:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D79B8C36B0C;
	Fri, 11 Oct 2019 12:35:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FCFCC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 12:35:50 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B771206CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570797348;
 bh=VNgydY1ynFilVs3+OYEfBMfTmvBOmjLQ3dKDPAsRGJk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ebAStlb6ubOzdbNbYRAVygtpjFLr4okk4rxF/Lpg17JMqyoumehNIPoLFtLGLLo2n
 s5UKLrYfdkyy0+L0988pgbQ8OY722qLzYrkCj5wSnQss5JSQOPMyMIsc4k0hQrA/sY
 9ZVZaBJysaaLkUyIzlKv/NzHGQFUt3EGc73zZMvU=
Received: by mail-qt1-f179.google.com with SMTP id o12so13631575qtf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 05:35:48 -0700 (PDT)
X-Gm-Message-State: APjAAAXOxhgGgm3k/wSEVZ4O0m/OcsMiKEY/0kL/jj8C/CDs4+IVPDhF
 KSk9tWiAo/Jh1iYr9OAYgD1gZiJwef7YKmGXQg==
X-Google-Smtp-Source: APXvYqxPjHzWRhCEa77RLK5XieEQ5KWLu1XccZ9gxrD6cMKqUVp2wpc3H9eDAX5iDitxTvNlqnuBjyFuEMYz2Q5ML9o=
X-Received: by 2002:a0c:ed4f:: with SMTP id v15mr765035qvq.136.1570797347661; 
 Fri, 11 Oct 2019 05:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191002151442.15428-1-benjamin.gaignard@st.com>
In-Reply-To: <20191002151442.15428-1-benjamin.gaignard@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Oct 2019 07:35:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKW91A96NXy8kwPp2mdgiifaqJyCQ0n5Mc=zZzoU4VzDg@mail.gmail.com>
Message-ID: <CAL_JsqKW91A96NXy8kwPp2mdgiifaqJyCQ0n5Mc=zZzoU4VzDg@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: media: Convert stm32 dcmi
	bindings to json-schema
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

On Wed, Oct 2, 2019 at 10:14 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 dcmi binding to DT schema format using json-schema
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-dcmi.txt    | 45 ----------
>  .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 97 ++++++++++++++++++++++
>  2 files changed, 97 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt b/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
> deleted file mode 100644
> index 3122ded82eb4..000000000000
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -STMicroelectronics STM32 Digital Camera Memory Interface (DCMI)
> -
> -Required properties:
> -- compatible: "st,stm32-dcmi"
> -- reg: physical base address and length of the registers set for the device
> -- interrupts: should contain IRQ line for the DCMI
> -- resets: reference to a reset controller,
> -          see Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
> -- clocks: list of clock specifiers, corresponding to entries in
> -          the clock-names property
> -- clock-names: must contain "mclk", which is the DCMI peripherial clock
> -- pinctrl: the pincontrol settings to configure muxing properly
> -           for pins that connect to DCMI device.
> -           See Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml.
> -- dmas: phandle to DMA controller node,
> -        see Documentation/devicetree/bindings/dma/stm32-dma.txt
> -- dma-names: must contain "tx", which is the transmit channel from DCMI to DMA
> -
> -DCMI supports a single port node with parallel bus. It should contain one
> -'port' child node with child 'endpoint' node. Please refer to the bindings
> -defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -
> -       dcmi: dcmi@50050000 {
> -               compatible = "st,stm32-dcmi";
> -               reg = <0x50050000 0x400>;
> -               interrupts = <78>;
> -               resets = <&rcc STM32F4_AHB2_RESET(DCMI)>;
> -               clocks = <&rcc 0 STM32F4_AHB2_CLOCK(DCMI)>;
> -               clock-names = "mclk";
> -               pinctrl-names = "default";
> -               pinctrl-0 = <&dcmi_pins>;
> -               dmas = <&dma2 1 1 0x414 0x3>;
> -               dma-names = "tx";
> -               port {
> -                       dcmi_0: endpoint {
> -                               remote-endpoint = <...>;
> -                               bus-width = <8>;
> -                               hsync-active = <0>;
> -                               vsync-active = <0>;
> -                               pclk-sample = <1>;
> -                       };
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> new file mode 100644
> index 000000000000..50e8cfed06f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/st,stm32-dcmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Digital Camera Memory Interface (DCMI) binding
> +
> +maintainers:
> +  - Hugues Fruchet <hugues.fruchet@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32-dcmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module Clock

'maxItems: 1' is sufficient here as the description doesn't add anything.

> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  pinctrl-names: true

This gets added automatically.

> +
> +  dmas:
> +    description:
> +      One DMA channel specifier following the convention outlined
> +      in bindings/dma/dma.txt

Drop this.

> +    maxItems: 1
> +
> +  dma-names:
> +    description:
> +      There must be one channel named "tx" for transmit

The schema says all this already.

> +    maxItems: 1

This is implied.

> +    additionalItems: true

This is wrong. You can't have more items because you set the max to 1.

> +    items:
> +      - const: tx
> +
> +  resets:
> +        maxItems: 1

Inconsistent indentation.

> +
> +  port:
> +    type: object
> +    description:
> +      DCMI supports a single port node with parallel bus. It should contain
> +      one 'port' child node with child 'endpoint' node. Please refer to the
> +      bindings defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +patternProperties:
> +  "^pinctrl-[0-9]+$": true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - port
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    dcmi: dcmi@4c006000 {
> +        compatible = "st,stm32-dcmi";
> +        reg = <0x4c006000 0x400>;
> +        interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +        resets = <&rcc CAMITF_R>;
> +        clocks = <&rcc DCMI>;
> +        clock-names = "mclk";
> +        dmas = <&dmamux1 75 0x400 0x0d>;
> +        dma-names = "tx";
> +
> +        port {
> +             dcmi_0: endpoint {
> +                   remote-endpoint = <&ov5640_0>;
> +                   bus-width = <8>;
> +                   hsync-active = <0>;
> +                   vsync-active = <0>;
> +                   pclk-sample = <1>;
> +             };
> +        };
> +    };
> +
> +...
> --
> 2.15.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
