Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F274A1042D1
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2019 19:04:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA23EC36B0B;
	Wed, 20 Nov 2019 18:04:07 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04BD7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 18:04:05 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id m193so643858oig.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 10:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wn4WhuGPefkkdG2RHoEX8ty8q6GNTGVjdrwviU5xCaA=;
 b=ac4+8VG9Jes5uy5s0n0M4UfSzxbloTuhQVyn7y9QIhveLDhu0KIdw1WE+tJUEIqcdw
 u0T7VWFRLrKriNJuKFWXBBtlc2C2GcO17z/faeudMziyF3dXneANy6D6kIFYTqoXPcRL
 s8nrE3RZizWJt1hM/DpKnZqvRGwg5pOuBpD8KTEEnWuG/RzREALe2+PzDanfBQ1fV4TZ
 cDXQd/qotHq7cF89o26rfwfJBMbCV+xb0iHrw0t90E4HlKbL3RBgQwwjwelnUKzc4GUN
 HT5W54E/k62TYdAjk2fup81yDjpLbS26zdBpYNJ6h1+90ubhoP4T1GJmoY9w2BpbYUIP
 jx6A==
X-Gm-Message-State: APjAAAV89aZEqXLt50hVZ1PNJaWF01TIwKAsyCns25doFpigskVadCwX
 6lcIiHL27Ywr91z/nhMkXGI39xU=
X-Google-Smtp-Source: APXvYqw6wtYV4YE9M25DCBt2w6sGKd1fC52lp5UjSjGEUK/AJNWBT/0Aw17mdvBlm+2sqn+sfEMYqQ==
X-Received: by 2002:aca:b602:: with SMTP id g2mr3811454oif.7.1574273044608;
 Wed, 20 Nov 2019 10:04:04 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z66sm8838593ota.54.2019.11.20.10.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 10:04:04 -0800 (PST)
Date: Wed, 20 Nov 2019 12:04:03 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191120180403.GA11687@bogus>
References: <20191115142318.2909-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115142318.2909-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: crypto: Convert stm32 QSPI
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

On Fri, Nov 15, 2019 at 03:23:18PM +0100, Benjamin Gaignard wrote:
> Convert the STM32 QSPI binding to DT schema format using json-schema

Leftover 'crypto' in the subject.

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/spi/spi-stm32-qspi.txt     | 47 -----------
>  .../devicetree/bindings/spi/st,stm32-qspi.yaml     | 91 ++++++++++++++++++++++
>  2 files changed, 91 insertions(+), 47 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-stm32-qspi.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> new file mode 100644
> index 000000000000..955405d39966
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/st,stm32-qspi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Quad Serial Peripheral Interface (QSPI) bindings
> +
> +maintainers:
> +  - Christophe Kerello <christophe.kerello@st.com>
> +  - Patrice Chotard <patrice.chotard@st.com>
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    const: st,stm32f469-qspi
> +
> +  reg:
> +    items:
> +      - description: registers
> +      - description: memory mapping
> +    minItems: 2
> +    maxItems: 2

Implied by the 'items' length.

> +
> +  reg-names:
> +    items:
> +     - const: qspi
> +     - const: qspi_mm
> +    minItems: 2
> +    maxItems: 2

Implied by the 'items' length.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: tx DMA channel
> +      - description: rx DMA channel
> +    minItems: 2
> +    maxItems: 2

Implied by the 'items' length.

> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +    minItems: 2
> +    maxItems: 2

Implied by the 'items' length.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    spi@58003000 {
> +      compatible = "st,stm32f469-qspi";
> +      reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
> +      reg-names = "qspi", "qspi_mm";
> +      interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +      dmas = <&mdma1 22 0x10 0x100002 0x0 0x0>,
> +             <&mdma1 22 0x10 0x100008 0x0 0x0>;
> +      dma-names = "tx", "rx";
> +      clocks = <&rcc QSPI_K>;
> +      resets = <&rcc QSPI_R>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      flash@0 {
> +        compatible = "jedec,spi-nor";
> +        reg = <0>;
> +        spi-rx-bus-width = <4>;
> +        spi-max-frequency = <108000000>;
> +      };
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
