Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C642121C26
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 22:49:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFA4FC36B0B;
	Mon, 16 Dec 2019 21:49:55 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3672AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 21:49:54 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 66so10905311otd.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 13:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HptzT5nDCrwY5+Ndy5nDuVXNd62G0fSk6plJscs64+s=;
 b=OvXWxlSFsv7cOfrk0rFuPpsiuifLKcUylkPSsjU4rifdz3bSpwepMkarLhuYGY7v4t
 7qXCmosV1kn937QHRPncU8lFaq6PHDSeZfkcQLEk/xkRNcoPOZDk3jibQDTblFBTe5Pp
 yFs8xL/wbE+/i4oHozoBgwf7KHXUr4JavY2Wh34mRHx6wnPYzMiYmREwV7X+/7x4z4Aj
 4Ja+bxh7+IrvukGL2nP/uCjozUuDfOz+7m4J+MQj6YGp3/el/LtJ/as2s2Yym6XxTnKN
 E2KzX4xw5+WFgOX4Ec6fWh9Jmj6p/vC6lrjdtjgKmhGbYGVYWghKadf17WpiV6ju8Na4
 xrVw==
X-Gm-Message-State: APjAAAUsQvQlVxCiiamuquAgVyNlStp8A6LbK9eKA/9IsM4hvSz5VGHa
 aEHiGhJQZG5m3KfTFl/e/w==
X-Google-Smtp-Source: APXvYqxgkaB403WtaFAWNwC6m5B7AcOnZaowDtuEndM91PV4Kl26ED2Pp1qFpLftHvbaAM9KlR57Hw==
X-Received: by 2002:a05:6830:14d3:: with SMTP id
 t19mr35544056otq.278.1576532992820; 
 Mon, 16 Dec 2019 13:49:52 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q22sm7146652otm.2.2019.12.16.13.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 13:49:51 -0800 (PST)
Date: Mon, 16 Dec 2019 15:49:51 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191216214951.GA9328@bogus>
References: <20191204153233.791-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204153233.791-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: spi: Convert stm32 spi
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

On Wed, Dec 04, 2019 at 04:32:33PM +0100, Benjamin Gaignard wrote:
> Convert the STM32 spi binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> CC: Erwan Leray <erwan.leray@st.com>
> CC: Fabrice Gasnier <fabrice.gasnier@st.com>
> CC: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  .../devicetree/bindings/spi/spi-stm32.txt          |  62 ------------
>  .../devicetree/bindings/spi/st,stm32-spi.yaml      | 105 +++++++++++++++++++++
>  2 files changed, 105 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-stm32.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-stm32.txt b/Documentation/devicetree/bindings/spi/spi-stm32.txt
> deleted file mode 100644
> index d82755c63eaf..000000000000
> --- a/Documentation/devicetree/bindings/spi/spi-stm32.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -STMicroelectronics STM32 SPI Controller
> -
> -The STM32 SPI controller is used to communicate with external devices using
> -the Serial Peripheral Interface. It supports full-duplex, half-duplex and
> -simplex synchronous serial communication with external devices. It supports
> -from 4 to 32-bit data size. Although it can be configured as master or slave,
> -only master is supported by the driver.
> -
> -Required properties:
> -- compatible: Should be one of:
> -  "st,stm32h7-spi"
> -  "st,stm32f4-spi"
> -- reg: Offset and length of the device's register set.
> -- interrupts: Must contain the interrupt id.
> -- clocks: Must contain an entry for spiclk (which feeds the internal clock
> -	  generator).
> -- #address-cells:  Number of cells required to define a chip select address.
> -- #size-cells: Should be zero.
> -
> -Optional properties:
> -- resets: Must contain the phandle to the reset controller.
> -- A pinctrl state named "default" may be defined to set pins in mode of
> -  operation for SPI transfer.
> -- dmas: DMA specifiers for tx and rx dma. DMA fifo mode must be used. See the
> -  STM32 DMA bindings, Documentation/devicetree/bindings/dma/stm32-dma.txt.
> -- dma-names: DMA request names should include "tx" and "rx" if present.
> -- cs-gpios: list of GPIO chip selects. See the SPI bus bindings,
> -  Documentation/devicetree/bindings/spi/spi-bus.txt
> -
> -
> -Child nodes represent devices on the SPI bus
> -  See ../spi/spi-bus.txt
> -
> -Optional properties:
> -- st,spi-midi-ns: Only for STM32H7, (Master Inter-Data Idleness) minimum time
> -		  delay in nanoseconds inserted between two consecutive data
> -		  frames.
> -
> -
> -Example:
> -	spi2: spi@40003800 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "st,stm32h7-spi";
> -		reg = <0x40003800 0x400>;
> -		interrupts = <36>;
> -		clocks = <&rcc SPI2_CK>;
> -		resets = <&rcc 1166>;
> -		dmas = <&dmamux1 0 39 0x400 0x01>,
> -		       <&dmamux1 1 40 0x400 0x01>;
> -		dma-names = "rx", "tx";
> -		pinctrl-0 = <&spi2_pins_b>;
> -		pinctrl-names = "default";
> -		cs-gpios = <&gpioa 11 0>;
> -
> -		aardvark@0 {
> -			compatible = "totalphase,aardvark";
> -			reg = <0>;
> -			spi-max-frequency = <4000000>;
> -			st,spi-midi-ns = <4000>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> new file mode 100644
> index 000000000000..57ef3a0f57e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/st,stm32-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 SPI Controller bindings
> +
> +description: |
> +  The STM32 SPI controller is used to communicate with external devices using
> +  the Serial Peripheral Interface. It supports full-duplex, half-duplex and
> +  simplex synchronous serial communication with external devices. It supports
> +  from 4 to 32-bit data size.
> +
> +maintainers:
> +  - Erwan Leray <erwan.leray@st.com>
> +  - Fabrice Gasnier <fabrice.gasnier@st.com>
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +  - if:
> +      properties:
> +        comptatible:
> +          constains:

One of the features of json-schema is ignoring unknown keywords like 
'constains'. I've tried to mitigate this with the meta-schema, but seems 
this one didn't get caught. But checkpatch.pl caught it.


> +            st,stm32f4-spi
> +    then:
> +      properties:
> +        st,spi-midi-ns: false
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32f4-spi
> +      - st,stm32h7-spi
> +
> +  reg:
> +    maxItems: 1
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
> +    description: |
> +      DMA specifiers for tx and rx dma. DMA fifo mode must be used. See
> +      the STM32 DMA bindings Documentation/devicetree/bindings/dma/stm32-dma.txt.
> +    items:
> +      - description: rx DMA channel
> +      - description: tx DMA channel
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +patternProperties:
> +  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-f]+$":
> +    type: object
> +    # SPI slave nodes must be children of the SPI master node and can
> +    # contain the following properties.
> +    properties:
> +      st,spi-midi-ns:
> +        $ref: /schemas/types.yaml#/definitions/uint32

Don't need a type since it has a standard unit. I'd assume there's 
at least some max less than 2^32 you could define.

> +        description: |
> +          Only for STM32H7, (Master Inter-Data Idleness) minimum time
> +          delay in nanoseconds inserted between two consecutive data frames.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    spi@4000b000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      compatible = "st,stm32h7-spi";
> +      reg = <0x4000b000 0x400>;
> +      interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&rcc SPI2_K>;
> +      resets = <&rcc SPI2_R>;
> +      dmas = <&dmamux1 0 39 0x400 0x05>,
> +             <&dmamux1 1 40 0x400 0x05>;
> +      dma-names = "rx", "tx";
> +      cs-gpios = <&gpioa 11 0>;
> +
> +      aardvark@0 {
> +        compatible = "totalphase,aardvark";
> +        reg = <0>;
> +        spi-max-frequency = <4000000>;
> +        st,spi-midi-ns = <4000>;
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
