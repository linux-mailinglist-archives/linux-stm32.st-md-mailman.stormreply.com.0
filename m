Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18226104502
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2019 21:26:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8149C36B0B;
	Wed, 20 Nov 2019 20:26:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FE99C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 20:26:37 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1EFE2088F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574281595;
 bh=AEVIorR6/VAlI4BJXRw6tPbken7vkQ0aTtyblIbcMdo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YsO2Djb3qDyV5DUI+gOfSBEoyXrLr4bGjbyQsw4ZyMIjgrbsGPYPzv+oYJneg+R/Q
 lBr2gXtZLDWn8l/hjcPNRxT8TShMH2IIMvdXNP3uImH3y+gg4xiIQvklZTexnD3O2v
 ZO3RzynVtL7N12dcNqyMglcvuVYYyjb/NP0T1OEA=
Received: by mail-qt1-f170.google.com with SMTP id j5so959358qtn.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 12:26:35 -0800 (PST)
X-Gm-Message-State: APjAAAW9YY1+vciPM0PVdXPCzNEqwZiRKpkt2YKWHT0GmAbG3ucgoDDZ
 59yZiz+34q8oAOWkkuxFByhHq/GVGhXzy22vxg==
X-Google-Smtp-Source: APXvYqx7fnGdtnkeuRvwWhsOVISMRdUYUIw3lX6FCbHTqaZSFv6tvBQHF5T6swA1/jBii4Jde8nmZdXen76KVGu+rkc=
X-Received: by 2002:ac8:73ce:: with SMTP id v14mr4714242qtp.136.1574281594774; 
 Wed, 20 Nov 2019 12:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20191118101420.23610-1-arnaud.pouliquen@st.com>
In-Reply-To: <20191118101420.23610-1-arnaud.pouliquen@st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Nov 2019 14:26:23 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+42wx1AJO=jXXBhmaKMkBq-RtoF+kxVjS2z9fSwhcaEQ@mail.gmail.com>
Message-ID: <CAL_Jsq+42wx1AJO=jXXBhmaKMkBq-RtoF+kxVjS2z9fSwhcaEQ@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mailbox: convert
	stm32-ipcc to json-schema
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

On Mon, Nov 18, 2019 at 4:15 AM Arnaud Pouliquen
<arnaud.pouliquen@st.com> wrote:
>
> Convert the STM32 IPCC bindings to DT schema format using
> json-schema
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  .../bindings/mailbox/st,stm32-ipcc.yaml       | 91 +++++++++++++++++++
>  .../bindings/mailbox/stm32-ipcc.txt           | 47 ----------
>  2 files changed, 91 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt

Thanks for helping me find 2 meta-schema errors. :) Please update
dt-schema and re-run 'make dt_binding_check'.

> diff --git a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
> new file mode 100644
> index 000000000000..90157d4deac1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mailbox/st,stm32-ipcc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: STMicroelectronics STM32 IPC controller bindings
> +
> +description:
> +  The IPCC block provides a non blocking signaling mechanism to post and
> +  retrieve messages in an atomic way between two processors.
> +  It provides the signaling for N bidirectionnal channels. The number of
> +  channels (N) can be read from a dedicated register.
> +
> +maintainers:
> +  - Fabien Dessenne <fabien.dessenne@st.com>
> +  - Arnaud Pouliquen <arnaud.pouliquen@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp1-ipcc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +     maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: rx channel occupied
> +      - description: tx channel free
> +      - description: wakeup source
> +    minItems: 2
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      enums: [ rx, tx, wakeup ]

'enums' is not a valid keyword. 'enum' is valid, but his should be in
a defined order (so a list of items).

> +    minItems: 2
> +    maxItems: 3
> +
> +  wakeup-source:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Enables wake up of host system on wakeup IRQ assertion.

Just 'true' is enough here. Assume we have a common definition.

> +
> +  "#mbox-cells":
> +    const: 1
> +
> +  st,proc-id:
> +    description: Processor id using the mailbox (0 or 1)
> +    allOf:
> +      - minimum: 0
> +      - maximum: 1

'enum: [ 0, 1 ]' is more concise.

Also, needs a $ref to the type.

> +      - default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - st,proc-id
> +  - clocks
> +  - interrupt-names
> +  - "#mbox-cells"
> +
> +oneOf:
> +  - required:
> +      - interrupts
> +  - required:
> +      - interrupts-extended

The tooling takes care of this for you. Just list 'interrupts' as required.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    ipcc: mailbox@4c001000 {
> +      compatible = "st,stm32mp1-ipcc";
> +      #mbox-cells = <1>;
> +      reg = <0x4c001000 0x400>;
> +      st,proc-id = <0>;
> +      interrupts-extended = <&intc GIC_SPI 100 IRQ_TYPE_NONE>,
> +                     <&intc GIC_SPI 101 IRQ_TYPE_NONE>,
> +                     <&aiec 62 1>;
> +      interrupt-names = "rx", "tx", "wakeup";
> +      clocks = <&rcc_clk IPCC>;
> +      wakeup-source;
> +    };
> +
> +...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
