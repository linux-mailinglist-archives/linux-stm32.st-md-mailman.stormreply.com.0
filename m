Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B61535ED
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2020 18:08:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B313EC36B0B;
	Wed,  5 Feb 2020 17:08:36 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B859C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2020 17:08:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so3674159wrh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Feb 2020 09:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wVyS98mSn4UeFr2rUO9PasOfBrlg4kFydqotmUAfD/w=;
 b=hMXobmxkunNR/7T6rkCRuPPBuTN8pLYW4VP6hlRqyPwhjC5W17u754qI0KchfblplB
 CrJZqnB8/aOrdTkmKULo9C97NHWmR1ydPU1Uj8klIu139JF/nuj+cq0n9ZUEV0wqhzxQ
 2fWgkX6tKypWuWYP0ZHXLl8c30Hq1u1NuA5gcXctXCjMILDrKb7VmskzVxqYAhzFD3mL
 MCISjaw/YoSEIZZ4VdP5ZlxHxEFjfWJhKHrgxr5l8BD2hi/kn+Zps73B0Q4gE0ytNuhZ
 2UjbJbWCSAovQolaXcl0+8HwHJRcPQOB1KSDa7shZSKdl+VSUL+rOY3gNEFM/BBVLvyD
 yKLQ==
X-Gm-Message-State: APjAAAXEjF7Gjug7bT0tKzmbhk31hmk8OsoPAPTLdc2qIYt9heFgE5Po
 RHKab4pR7rSJFL5W9ZM1eA==
X-Google-Smtp-Source: APXvYqwaQiQMAa8h+Izmp9nvuziS6m0uiZRyCGM1+IZ+qyjy4io1DJ/1o+lCJNm/dF9gYXsu8JczlA==
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr28949693wro.325.1580922514565; 
 Wed, 05 Feb 2020 09:08:34 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id q1sm561081wrw.5.2020.02.05.09.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 09:08:33 -0800 (PST)
Received: (nullmailer pid 27473 invoked by uid 1000);
 Wed, 05 Feb 2020 17:08:32 -0000
Date: Wed, 5 Feb 2020 17:08:32 +0000
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200205170832.GA19383@bogus>
References: <20200127125420.29827-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127125420.29827-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 perex@perex.cz, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: dt-bindings: stm32: convert i2s to
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

On Mon, Jan 27, 2020 at 01:54:20PM +0100, Olivier Moysan wrote:
> Convert the STM32 I2S bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> The items for dma-names and clock-names properties are all
> mandatory, but may be provided in any order.
> The syntax used for these properties allows to avoid order constraint.

Other than having .dts files with differing order, I don't see any 
reason we need to allow any order here. So decide which order is most 
prevalent and use that, and then fix the other dts files.

> ---
>  .../bindings/sound/st,stm32-i2s.txt           | 62 -------------
>  .../bindings/sound/st,stm32-i2s.yaml          | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt b/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
> deleted file mode 100644
> index cbf24bcd1b8d..000000000000
> --- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -STMicroelectronics STM32 SPI/I2S Controller
> -
> -The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
> -Only some SPI instances support I2S.
> -
> -Required properties:
> -  - compatible: Must be "st,stm32h7-i2s"
> -  - reg: Offset and length of the device's register set.
> -  - interrupts: Must contain the interrupt line id.
> -  - clocks: Must contain phandle and clock specifier pairs for each entry
> -	in clock-names.
> -  - clock-names: Must contain "i2sclk", "pclk", "x8k" and "x11k".
> -	"i2sclk": clock which feeds the internal clock generator
> -	"pclk": clock which feeds the peripheral bus interface
> -	"x8k": I2S parent clock for sampling rates multiple of 8kHz.
> -	"x11k": I2S parent clock for sampling rates multiple of 11.025kHz.
> -  - dmas: DMA specifiers for tx and rx dma.
> -    See Documentation/devicetree/bindings/dma/stm32-dma.txt.
> -  - dma-names: Identifier for each DMA request line. Must be "tx" and "rx".
> -  - pinctrl-names: should contain only value "default"
> -  - pinctrl-0: see Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> -
> -Optional properties:
> -  - resets: Reference to a reset controller asserting the reset controller
> -
> -The device node should contain one 'port' child node with one child 'endpoint'
> -node, according to the bindings defined in Documentation/devicetree/bindings/
> -graph.txt.
> -
> -Example:
> -sound_card {
> -	compatible = "audio-graph-card";
> -	dais = <&i2s2_port>;
> -};
> -
> -i2s2: audio-controller@40003800 {
> -	compatible = "st,stm32h7-i2s";
> -	reg = <0x40003800 0x400>;
> -	interrupts = <36>;
> -	clocks = <&rcc PCLK1>, <&rcc SPI2_CK>, <&rcc PLL1_Q>, <&rcc PLL2_P>;
> -	clock-names = "pclk", "i2sclk",  "x8k", "x11k";
> -	dmas = <&dmamux2 2 39 0x400 0x1>,
> -           <&dmamux2 3 40 0x400 0x1>;
> -	dma-names = "rx", "tx";
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_i2s2>;
> -
> -	i2s2_port: port@0 {
> -		cpu_endpoint: endpoint {
> -			remote-endpoint = <&codec_endpoint>;
> -			format = "i2s";
> -		};
> -	};
> -};
> -
> -audio-codec {
> -	codec_port: port@0 {
> -		codec_endpoint: endpoint {
> -			remote-endpoint = <&cpu_endpoint>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> new file mode 100644
> index 000000000000..cdfb375c7a14
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/st,stm32-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 SPI/I2S Controller
> +
> +maintainers:
> +  - Olivier Moysan <olivier.moysan@st.com>
> +
> +description:
> +  The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
> +  Only some SPI instances support I2S.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32h7-i2s
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock feeding the peripheral bus interface.
> +      - description: clock feeding the internal clock generator.
> +      - description: I2S parent clock for sampling rates multiple of 8kHz.
> +      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
> +
> +  clock-names:
> +    items:
> +      - enum: [ pclk, i2sclk, x8k, x11k ]
> +      - enum: [ pclk, i2sclk, x8k, x11k ]
> +      - enum: [ pclk, i2sclk, x8k, x11k ]
> +      - enum: [ pclk, i2sclk, x8k, x11k ]
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string-array

*-names already has a type, so this is not needed.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: audio capture DMA.
> +      - description: audio playback DMA.
> +
> +  dma-names:
> +    items:
> +      - enum: [ rx, tx ]
> +      - enum: [ rx, tx ]
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string-array
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - dmas
> +  - dma-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    i2s2: audio-controller@4000b000 {
> +        compatible = "st,stm32h7-i2s";
> +        #sound-dai-cells = <0>;
> +        reg = <0x4000b000 0x400>;
> +        clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
> +        clock-names = "pclk", "i2sclk", "x8k", "x11k";
> +        interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&dmamux1 39 0x400 0x01>,
> +               <&dmamux1 40 0x400 0x01>;
> +        dma-names = "rx", "tx";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&i2s2_pins_a>;
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
