Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A334512114E
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 18:10:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56F65C36B0B;
	Mon, 16 Dec 2019 17:10:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8D0DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 17:10:29 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01A0A2082E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576516228;
 bh=aUrdrOF8RVSAn+yHDF3btdZ2PsHXQPB4WZvqmB6jT8E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y6tSxMVL/XSZEra+SXXcuvQBkOLqI4FXRDeN0DGcByWAadeDp+10N8YFhQu4ZPTeZ
 rw2St3qYQi9bCiosAMR5zNZSwwLbLbhwsxMmqLBbYHIqeo9e3NmgmkvHyrKSLNRN6M
 ECjETUebqrgZeJS7NSgEUFNBMjWYLM6cCY7xRsY4=
Received: by mail-qv1-f48.google.com with SMTP id d17so3020300qvs.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 09:10:27 -0800 (PST)
X-Gm-Message-State: APjAAAUj3cv5cUkwvDxZHur1TJNRxyM/FbqusNfbON6D8WduO5C3n2ry
 pDk60xzZ6q+RgZXfSzb9QWpun5wgy35mY7rztg==
X-Google-Smtp-Source: APXvYqz1/8z5BbGYKxOHLX+RjTlBOF3diYL38YPIekXqt/2ChkEPgLihEvHxXbgXzbHA5XMi6Krc1r0YFDIZHXejRwc=
X-Received: by 2002:a05:6214:11ac:: with SMTP id
 u12mr244552qvv.85.1576516226960; 
 Mon, 16 Dec 2019 09:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20191128154603.6911-1-arnaud.pouliquen@st.com>
 <20191213213916.GA1292@bogus> <7ac83aa6-0ec6-db4f-556d-a17c28d2bcab@st.com>
In-Reply-To: <7ac83aa6-0ec6-db4f-556d-a17c28d2bcab@st.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Dec 2019 11:10:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKnbkO2rXKz376GZLdM4C9zA2zcM1ETGLFaABaxpBu7vA@mail.gmail.com>
Message-ID: <CAL_JsqKnbkO2rXKz376GZLdM4C9zA2zcM1ETGLFaABaxpBu7vA@mail.gmail.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: stm32: convert mlahb to
	json-schema
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

On Mon, Dec 16, 2019 at 2:44 AM Arnaud POULIQUEN
<arnaud.pouliquen@st.com> wrote:
>
> Hello Rob,
>
> On 12/13/19 10:39 PM, Rob Herring wrote:
> > On Thu, Nov 28, 2019 at 04:46:03PM +0100, Arnaud Pouliquen wrote:
> >> Convert the ML-AHB bus bindings to DT schema format using json-schema
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >> ---
> >> Notice that this patch requests an update of the simple-bus schema to add
> >> the support of the "dma-ranges" property.
> >> A Pull request has been sent in parallel to the dt-schema github repo:
> >> https://github.com/devicetree-org/dt-schema/pull/30
> >>
> >> To remind the topic around the use of "dma-ranges" please
> >> refer to following discussion: https://lkml.org/lkml/2019/4/3/1261
> >> ---
> >>  .../devicetree/bindings/arm/stm32/mlahb.txt   | 37 ----------
> >>  .../bindings/arm/stm32/st,mlahb.yaml          | 69 +++++++++++++++++++
> >>  2 files changed, 69 insertions(+), 37 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> >>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> >> deleted file mode 100644
> >> index 25307aa1eb9b..000000000000
> >> --- a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> >> +++ /dev/null
> >> @@ -1,37 +0,0 @@
> >> -ML-AHB interconnect bindings
> >> -
> >> -These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
> >> -a Cortex-M subsystem with dedicated memories.
> >> -The MCU SRAM and RETRAM memory parts can be accessed through different addresses
> >> -(see "RAM aliases" in [1]) using different buses (see [2]) : balancing the
> >> -Cortex-M firmware accesses among those ports allows to tune the system
> >> -performance.
> >> -
> >> -[1]: https://www.st.com/resource/en/reference_manual/dm00327659.pdf
> >> -[2]: https://wiki.st.com/stm32mpu/wiki/STM32MP15_RAM_mapping
> >> -
> >> -Required properties:
> >> -- compatible: should be "simple-bus"
> >> -- dma-ranges: describes memory addresses translation between the local CPU and
> >> -       the remote Cortex-M processor. Each memory region, is declared with
> >> -       3 parameters:
> >> -             - param 1: device base address (Cortex-M processor address)
> >> -             - param 2: physical base address (local CPU address)
> >> -             - param 3: size of the memory region.
> >> -
> >> -The Cortex-M remote processor accessed via the mlahb interconnect is described
> >> -by a child node.
> >> -
> >> -Example:
> >> -mlahb {
> >> -    compatible = "simple-bus";
> >> -    #address-cells = <1>;
> >> -    #size-cells = <1>;
> >> -    dma-ranges = <0x00000000 0x38000000 0x10000>,
> >> -                 <0x10000000 0x10000000 0x60000>,
> >> -                 <0x30000000 0x30000000 0x60000>;
> >> -
> >> -    m4_rproc: m4@10000000 {
> >> -            ...
> >> -    };
> >> -};
> >> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
> >> new file mode 100644
> >> index 000000000000..8ad3f7c7f9ab
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
> >> @@ -0,0 +1,69 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: "http://devicetree.org/schemas/arm/stm32/st,mlahb.yaml#"
> >> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >> +
> >> +title: STMicroelectronics STM32 ML-AHB interconnect bindings
> >> +
> >> +maintainers:
> >> +  - Fabien Dessenne <fabien.dessenne@st.com>
> >> +  - Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >> +
> >> +description: |
> >> +  These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
> >> +  a Cortex-M subsystem with dedicated memories. The MCU SRAM and RETRAM memory
> >> +  parts can be accessed through different addresses (see "RAM aliases" in [1])
> >> +  using different buses (see [2]): balancing the Cortex-M firmware accesses
> >> +  among those ports allows to tune the system performance.
> >> +  [1]: https://www.st.com/resource/en/reference_manual/dm00327659.pdf
> >> +  [2]: https://wiki.st.com/stm32mpu/wiki/STM32MP15_RAM_mapping
> >> +
> >> +allOf:
> >> + - $ref: /schemas/simple-bus.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    contains:
> >> +      enum:
> >> +        - st,mlahb
> >> +
> >> +  dma-ranges:
> >> +    description: |
> >> +      Describe memory addresses translation between the local CPU and the
> >> +      remote Cortex-M processor. Each memory region, is declared with
> >> +      3 parameters:
> >> +      - param 1: device base address (Cortex-M processor address)
> >> +      - param 2: physical base address (local CPU address)
> >> +      - param 3: size of the memory region.
> >> +    maxItems: 3
> >> +
> >> +  '#address-cells':
> >> +    const: 1
> >> +
> >> +  '#size-cells':
> >> +    const: 1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - '#address-cells'
> >> +  - '#size-cells'
> >> +  - dma-ranges
> >> +
> >> +examples:
> >> +  - |
> >> +    mlahb: ahb {
> >> +      compatible = "st,mlahb", "simple-bus";
> >> +      #address-cells = <1>;
> >> +      #size-cells = <1>;
> >> +      reg = <0x10000000 0x40000>;
> >> +      dma-ranges = <0x00000000 0x38000000 0x10000>,
> >> +                   <0x10000000 0x10000000 0x60000>,
> >> +                   <0x30000000 0x30000000 0x60000>;
> >> +
> >
> > Fails to build:
> >
> > builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/stm32/st,mlahb.example.dt.yaml:
> > ahb: 'ranges' is a required property
> >
> > Run 'make dt_binding_check'
>
> Yes, that why i posted in parallel the PR on the tool:
> https://github.com/devicetree-org/dt-schema/pull/30.
>
> I don't know if you saw my answer on this post so i copy/paste  it here:
>
> How to describe the stm32mp1 coprocessor mapping and translations based on this "ranges" requirement?

Minimally, you just need to add an empty ranges. Otherwise, the
0x10000000 in reg in the child node is not considered a MMIO address.

> On stm32mp1 we have 2 RAM memories accessible by the Cortex-A7 running Linux and used by the Cortex-M4 coprocessor to run its code. Each Cortex has a specific mapping of the memories. Some memory translations are needed by:
>
> - rproc driver to load the Cortex-M4 firmware in RAMs
> - rpmsg & virtio frameworks for shared memory
>
> Here is the memory mapping:
>
> - RETRAM (64 kB);
>   - Cortex-A7 @ : 0x38000000
>   - Cortex-M4 @: 0x00000000
> - MCUSRAM (up to 384 kB)
>   - Cortex-A7 @ : 0x30000000 or 0x10000000 ( 2 addresses for the same memory)
>   - Cortex-M4 @: 0x30000000 or 0x10000000 ( 2 addresses for the same memory)
>   =>addresses used on both side depend on the MCURAM access optimization
>
> Today our upstreamed solution is based on dma-range only (https://lkml.org/lkml/2019/4/3/1261)
>
> What about adding an "unused" ranges property in DT to match the requirement?
>
>         mlahb {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges = <0 0x38000000 0x10000>,
>                                <1 0x10000000 0x60000>,
>                                <2 0x30000000 0x60000>;

This is not valid with child addresses of 0, 1, and 2. 'ranges' is
purely about the view from the A7 to the M4. If you want to point 2
parent addresses to the same child region, you could do:

                ranges = <0x38000000 0x38000000 0x10000>,
                         <0x10000000 0x10000000 0x60000>,
                         <0x10000000 0x30000000 0x60000>;

Though I'm not sure what the OS address translation code will do in
this case. Probably just ignore the last entry.

>                 dma-ranges = <0x00000000 0x38000000 0x10000>,
>                              <0x10000000 0x10000000 0x60000>,
>                              <0x30000000 0x30000000 0x60000>;
>
>                 m4_rproc: m4@10000000 {
>                         ---
>                 };
>         };
>
> Thanks in advance for your feedback.
> Regards,
> Arnaud
>
> >
> >> +      m4_rproc: m4@10000000 {
> >> +       reg = <0x10000000 0x40000>;
> >> +      };
> >> +    };
> >> +
> >> +...
> >> --
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
