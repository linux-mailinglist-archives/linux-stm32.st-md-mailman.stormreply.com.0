Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3555011EE6C
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Dec 2019 00:25:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD897C36B0B;
	Fri, 13 Dec 2019 23:25:25 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9D54C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 23:25:23 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a124so2040915oii.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 15:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dLfBlRiHKWoew0reabXfa/MbAeC9Mc4ikeTkPhntb9g=;
 b=LATEhJYt9nV6bZ8vEbJGvRZ/QjNYJSLaoy8WYKNrIZT3Kauk75aRoUMEhZJMvOuC37
 7uPaP9F577VtHuE0tAatyHM3xoGx1wVoLHSwH5GhUBE3qwwFIPlx0JXvfo065DLxwyJH
 PVxkmeHXTu16GfynBT2QeagR4tmogHuD2yICWy0BY4SmXpNqqlzCDWQEHwfx3Hd9G6hJ
 fz+fPTW63LwwwVNWgXwuHkPPOc2PimkXxsvI2vbsJmM+Che6bYwW2jOmF7lSOWkHgBAX
 dTNE08VyRs44/QVxS87xMHQbfoL56KFtPPMR/U8z4X6LqUgGnFfwCuLc/Z62MMwDSPnP
 zOYA==
X-Gm-Message-State: APjAAAW7nKi4alDXIlODeWdBksYJU5a+5x0YTaBCmHSfj9FBhWYWglO+
 EOfwejo7VcxzMKhe03Eqig==
X-Google-Smtp-Source: APXvYqwoHMOiga8bgQ2raABQGFJaX4uqduovQEJFvsdi+ExC6o+PYKI9rlCu3Kwb/ygG5liYl0HTJQ==
X-Received: by 2002:aca:4eca:: with SMTP id c193mr7743827oib.37.1576279522531; 
 Fri, 13 Dec 2019 15:25:22 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n15sm3855369otr.67.2019.12.13.15.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 15:25:21 -0800 (PST)
Date: Fri, 13 Dec 2019 17:25:21 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191213232521.GA20953@bogus>
References: <20191202145740.29123-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202145740.29123-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rtc: Convert stm32 rtc
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

On Mon, Dec 02, 2019 at 03:57:40PM +0100, Benjamin Gaignard wrote:
> Convert the STM32 RTC binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/rtc/st,stm32-rtc.txt       |  61 ---------
>  .../devicetree/bindings/rtc/st,stm32-rtc.yaml      | 152 +++++++++++++++++++++
>  2 files changed, 152 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml


> diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> new file mode 100644
> index 000000000000..80c445005bfb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/st,stm32-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Real Time Clock Bindings
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32-rtc
> +      - st,stm32h7-rtc
> +      - st,stm32mp1-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: rtc_ck
> +
> +  interrupts:
> +    maxItems: 1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32-rtc
> +              - st,stm32h7-rtc
> +    then:
> +      properties:
> +        st,syscfg:
> +          allOf:
> +            - $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +            - items:
> +                minItems: 3
> +                maxItems: 3
> +          description: |
> +            Phandle/offset/mask triplet. The phandle to pwrcfg used to
> +            access control register at offset, and change the dbp (Disable Backup
> +            Protection) bit represented by the mask, mandatory to disable/enable backup
> +            domain (RTC registers) write protection.
> +
> +        assigned-clocks:
> +          allOf:
> +            - $ref: "/schemas/types.yaml#/definitions/phandle-array"

Already has a type, so drop this.

> +          description: |
> +            override default rtc_ck parent clock reference to the rtc_ck clock entry
> +          maxItems: 1
> +
> +        assigned-clock-parents:
> +          allOf:
> +           - $ref: "/schemas/types.yaml#/definitions/phandle-array"

Same here.

Since you have the false schema below, I think these can go in base 
schema rather than under the if.

> +          description: |
> +            override default rtc_ck parent clock phandle of the new parent clock of rtc_ck
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32-rtc
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 1
> +
> +        clock-names: false
> +
> +      required:
> +        - st,syscfg
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32h7-rtc
> +
> +    then:
> +       properties:
> +         clocks:
> +           minItems: 2
> +           maxItems: 2
> +
> +       required:
> +         - clock-names
> +         - st,syscfg
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-rtc
> +
> +    then:
> +       properties:
> +         clocks:
> +           minItems: 2
> +           maxItems: 2
> +
> +         assigned-clocks: false
> +         assigned-clock-parents: false
> +
> +       required:
> +         - clock-names
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mfd/stm32f4-rcc.h>
> +    #include <dt-bindings/clock/stm32fx-clock.h>
> +    rtc@40002800 {
> +      compatible = "st,stm32-rtc";
> +      reg = <0x40002800 0x400>;
> +      clocks = <&rcc 1 CLK_RTC>;
> +      assigned-clocks = <&rcc 1 CLK_RTC>;
> +      assigned-clock-parents = <&rcc 1 CLK_LSE>;
> +      interrupt-parent = <&exti>;
> +      interrupts = <17 1>;
> +      st,syscfg = <&pwrcfg 0x00 0x100>;
> +    };
> +
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    rtc@5c004000 {
> +      compatible = "st,stm32mp1-rtc";
> +      reg = <0x5c004000 0x400>;
> +      clocks = <&rcc RTCAPB>, <&rcc RTC>;
> +      clock-names = "pclk", "rtc_ck";
> +      interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
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
