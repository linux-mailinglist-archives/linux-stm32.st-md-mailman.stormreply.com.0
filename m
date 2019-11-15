Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A37BFE43A
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2019 18:41:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C7DAC36B0B;
	Fri, 15 Nov 2019 17:41:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECA27C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 17:41:19 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B8C020740
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573839677;
 bh=Ah9mSdZJn6L9OIVN76ESOloTb5qPCovaFeYqf7nVJhU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UcKu93OaflKRQhXGUB2GfOrdH4JFoylzqiwTyOnSUF/gMOgTQFSNXAtZU0oReGX+r
 q0WKbb82DPWD7+bYz5IsQif7lcD1++Xhx3eVBSGcyEy7ROBtX/oeUxwksPD9UtB1hB
 QltqE3KZTXokHbeQ6gwvn7zpWJoqvW+IMDHSZKFM=
Received: by mail-qt1-f171.google.com with SMTP id t20so11617683qtn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 09:41:17 -0800 (PST)
X-Gm-Message-State: APjAAAU4s50u316Zf1H/XV1IA4M/BalNZCpVB31PiOD6oGd77eL8jKoG
 bCLpC+RmXGrdFfSmV9wf1R1b11SPs3N1vHQhgg==
X-Google-Smtp-Source: APXvYqwZ3ZKJUDJ7zyLYNVXFpqsOYgc645y7/qNhrzgKVwoOls4kxl0y7cNlpOHrK7y5GQk+2+zrl8oqYNme/Lmj6Sw=
X-Received: by 2002:ac8:73ce:: with SMTP id v14mr15034569qtp.136.1573839676618; 
 Fri, 15 Nov 2019 09:41:16 -0800 (PST)
MIME-Version: 1.0
References: <20191114164104.22782-1-alexandre.torgue@st.com>
 <CAL_JsqKJZwJ0MyRp37Y-F0ujPdVEKARd8qcUCN1xmawpkiffLg@mail.gmail.com>
 <7415fff5-030c-a65b-a405-a1197e166432@st.com>
In-Reply-To: <7415fff5-030c-a65b-a405-a1197e166432@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 15 Nov 2019 11:41:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKkbrF935JoVELqVpqj3fEwzpTn_xNuOS74uUragJZpHA@mail.gmail.com>
Message-ID: <CAL_JsqKkbrF935JoVELqVpqj3fEwzpTn_xNuOS74uUragJZpHA@mail.gmail.com>
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

On Fri, Nov 15, 2019 at 11:28 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
>
>
> On 11/14/19 6:18 PM, Rob Herring wrote:
> > On Thu, Nov 14, 2019 at 10:41 AM Alexandre Torgue
> > <alexandre.torgue@st.com> wrote:
> >>
> >> Convert the STM32 external interrupt controller (EXTI) binding to DT
> >> schema format using json-schema.
> >>
> >> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> >> ---
> >>
> >> Hi Rob,
> >>
> >> I planned to use "additionalProperties: false" for this schema but as I add a
> >> property under condition, I got an error (property added under contion seems
> >> to be detected as an "additional" property and then error is raised).
> >>
> >> Is there a way to fix that ?
> >
> > See below.
> >
> >>
> >> regards
> >> Alex
> >>
> >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
> >> deleted file mode 100644
> >> index cd01b2292ec6..000000000000
> >> --- a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
> >> +++ /dev/null
> >> @@ -1,29 +0,0 @@
> >> -STM32 External Interrupt Controller
> >> -
> >> -Required properties:
> >> -
> >> -- compatible: Should be:
> >> -    "st,stm32-exti"
> >> -    "st,stm32h7-exti"
> >> -    "st,stm32mp1-exti"
> >> -- reg: Specifies base physical address and size of the registers
> >> -- interrupt-controller: Indentifies the node as an interrupt controller
> >> -- #interrupt-cells: Specifies the number of cells to encode an interrupt
> >> -  specifier, shall be 2
> >> -- interrupts: interrupts references to primary interrupt controller
> >> -  (only needed for exti controller with multiple exti under
> >> -  same parent interrupt: st,stm32-exti and st,stm32h7-exti)
> >> -
> >> -Optional properties:
> >> -
> >> -- hwlocks: reference to a phandle of a hardware spinlock provider node.
> >> -
> >> -Example:
> >> -
> >> -exti: interrupt-controller@40013c00 {
> >> -       compatible = "st,stm32-exti";
> >> -       interrupt-controller;
> >> -       #interrupt-cells = <2>;
> >> -       reg = <0x40013C00 0x400>;
> >> -       interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
> >> -};
> >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
> >> new file mode 100644
> >> index 000000000000..39be37e1e532
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.yaml
> >> @@ -0,0 +1,82 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >
> > If ST has copyright on the old binding, can you add BSD here.
> >
>
> I will.
>
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/interrupt-controller/st,stm32-exti.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: STM32 External Interrupt Controller Device Tree Bindings
> >> +
> >> +maintainers:
> >> +  - Alexandre Torgue <alexandre.torgue@st.com>
> >> +  - Ludovic Barre <ludovic.barre@st.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +        - enum:
> >> +          - st,stm32-exti
> >> +          - st,stm32h7-exti
> >> +      - items:
> >> +        - enum:
> >> +          - st,stm32mp1-exti
> >> +        - const: syscon
> >> +
> >> +  "#interrupt-cells":
> >> +    const: 2
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupt-controller: true
> >> +
> >> +  hwlocks:
> >> +    maxItems: 1
> >> +    description:
> >> +      Reference to a phandle of a hardware spinlock provider node.
> >> +
> >> +required:
> >> +  - "#interrupt-cells"
> >> +  - compatible
> >> +  - reg
> >> +  - interrupt-controller
> >> +
> >> +allOf:
> >> +  - $ref: /schemas/interrupt-controller.yaml#
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - st,stm32-exti
> >> +              - st,stm32h7-exti
> >> +    then:
> >> +      properties:
> >> +        interrupts:
> >> +          allOf:
> >> +            - $ref: /schemas/types.yaml#/definitions/uint32-array
> >
> > Standard property, doesn't need a type. You just need 'maxItems' or an
> > 'items' list if the index is not meaningful. This appears to be the
> > former case.
>
> ok
>
> >
> >> +          description:
> >> +            Interrupts references to primary interrupt controller
> >> +      required:
> >> +        - interrupts
> >
> > You can move the definition to the main section as you only need
> > 'required' here. That should fix your additionalProperties issue.
> >
> Doing that it fails as I don't have interrupts define for mp1
> compatible. Maybe I missed something ?

Like this:

properties:
  ...
  interrupts:
    maxItems: ??
    minItems: ??

allOf:
  - $ref: /schemas/interrupt-controller.yaml#
  - if:
      properties:
        compatible:
          contains:
            enum:
              - st,stm32-exti
              - st,stm32h7-exti
    then:
      required:
        - interrupts
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
