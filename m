Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B90FCBA8
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 18:18:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE4ECC36B0B;
	Thu, 14 Nov 2019 17:18:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDE36C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 17:18:46 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4540C20724
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573751925;
 bh=ocz46gTCP/NUGPTiVuVJqGTutFbDRHy1wr+ZIMUnIJY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FEltqMdfOa5s52eVq2HDJrCWY63pFr+eHadBHw1DVPLEAbhcAhRYFLbOR4NBVLJOA
 U6JM/AfIJ9xq46+VbVjsuRKMHAsC4jkyCbI2duqLtUcj+iTIWEqphmPj10YvKLY7qM
 j6fMRfMgAtoWRJIXpIcU0JimN8FIb592KhgMDKjw=
Received: by mail-qk1-f182.google.com with SMTP id q70so5626532qke.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 09:18:45 -0800 (PST)
X-Gm-Message-State: APjAAAWIqG9J6aKV6RVvzZZ2fAwsmj2GB5fyP9Jre9GsO11lFNJABLRp
 psxRPNfU+KM6oB68TjBCXO3/kEjP0pDBY9W+Hw==
X-Google-Smtp-Source: APXvYqydolbw7U1IFwsmCdguELeny4+5hB8lSGa1lqgOoHuaINM81p54+J/thh41N+0dOQJlAExq8K8modx+6jO6l6Y=
X-Received: by 2002:a37:30b:: with SMTP id 11mr8607360qkd.254.1573751924338;
 Thu, 14 Nov 2019 09:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20191114164104.22782-1-alexandre.torgue@st.com>
In-Reply-To: <20191114164104.22782-1-alexandre.torgue@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Nov 2019 11:18:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJZwJ0MyRp37Y-F0ujPdVEKARd8qcUCN1xmawpkiffLg@mail.gmail.com>
Message-ID: <CAL_JsqKJZwJ0MyRp37Y-F0ujPdVEKARd8qcUCN1xmawpkiffLg@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: interrupt-controller:
	Convert stm32-exti to json-schema
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

On Thu, Nov 14, 2019 at 10:41 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
> Convert the STM32 external interrupt controller (EXTI) binding to DT
> schema format using json-schema.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> ---
>
> Hi Rob,
>
> I planned to use "additionalProperties: false" for this schema but as I add a
> property under condition, I got an error (property added under contion seems
> to be detected as an "additional" property and then error is raised).
>
> Is there a way to fix that ?

See below.

>
> regards
> Alex
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
> deleted file mode 100644
> index cd01b2292ec6..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -STM32 External Interrupt Controller
> -
> -Required properties:
> -
> -- compatible: Should be:
> -    "st,stm32-exti"
> -    "st,stm32h7-exti"
> -    "st,stm32mp1-exti"
> -- reg: Specifies base physical address and size of the registers
> -- interrupt-controller: Indentifies the node as an interrupt controller
> -- #interrupt-cells: Specifies the number of cells to encode an interrupt
> -  specifier, shall be 2
> -- interrupts: interrupts references to primary interrupt controller
> -  (only needed for exti controller with multiple exti under
> -  same parent interrupt: st,stm32-exti and st,stm32h7-exti)
> -
> -Optional properties:
> -
> -- hwlocks: reference to a phandle of a hardware spinlock provider node.
> -
> -Example:
> -
> -exti: interrupt-controller@40013c00 {
> -       compatible = "st,stm32-exti";
> -       interrupt-controller;
> -       #interrupt-cells = <2>;
> -       reg = <0x40013C00 0x400>;
> -       interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
> -};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
> new file mode 100644
> index 000000000000..39be37e1e532
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0

If ST has copyright on the old binding, can you add BSD here.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/st,stm32-exti.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 External Interrupt Controller Device Tree Bindings
> +
> +maintainers:
> +  - Alexandre Torgue <alexandre.torgue@st.com>
> +  - Ludovic Barre <ludovic.barre@st.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +          - st,stm32-exti
> +          - st,stm32h7-exti
> +      - items:
> +        - enum:
> +          - st,stm32mp1-exti
> +        - const: syscon
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  hwlocks:
> +    maxItems: 1
> +    description:
> +      Reference to a phandle of a hardware spinlock provider node.
> +
> +required:
> +  - "#interrupt-cells"
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32-exti
> +              - st,stm32h7-exti
> +    then:
> +      properties:
> +        interrupts:
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/uint32-array

Standard property, doesn't need a type. You just need 'maxItems' or an
'items' list if the index is not meaningful. This appears to be the
former case.

> +          description:
> +            Interrupts references to primary interrupt controller
> +      required:
> +        - interrupts

You can move the definition to the main section as you only need
'required' here. That should fix your additionalProperties issue.

In hindsight, the mp1 case probably should have used interrupt-map.

> +
> +examples:
> +  - |
> +    //Example 1
> +    exti1: interrupt-controller@5000d000 {
> +        compatible = "st,stm32mp1-exti", "syscon";
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        reg = <0x5000d000 0x400>;
> +    };
> +
> +    //Example 2
> +    exti2: interrupt-controller@40013c00 {
> +        compatible = "st,stm32-exti";
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        reg = <0x40013C00 0x400>;
> +        interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
> +    };
> +
> +...
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
