Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD7013C8C6
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 17:07:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA9E6C36B0F;
	Wed, 15 Jan 2020 16:07:46 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E896C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 16:07:45 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 18so15859299oin.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 08:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GgrG+HKS7SJS1YSumldfNDhrIEBU95RMvZklBq/bHds=;
 b=prmjYmu/KbqJKQUEuPxGhjgiRRskuoBz629LLZHOrOPAdpOH4qkpcAhHIa7EbT+nT1
 jwfS2iL5n8W4N5rqc1UCbCAoY4xQtXcrmCabGlYJYd65f7y2LM2t9BwdMRvHWv8MRdxy
 3lFSuFjHSVSmABnuZy+UZ9r1/INllqHB5G0tjXF0eZtjdx3AOZJmMWGNrTCGG79IO3OP
 cd93NRz13jykBn2Dd73SCbn3HA1ZaLxfIvQgcLZzPu5fU/1cxZB6llL6pc6ByXtqMMqs
 BwvtOUgLLWltRnzOtgLAiFoknVkuuB72K8ty5N0ItMLGvSgAKHZKrv8+zkwVDDdlQqz2
 zHOQ==
X-Gm-Message-State: APjAAAXO6OTr6j0ivA/j3j/L4j2fbfvvxpQRLcFxXNKOCr45xcmzNDHt
 Lr7Ka2c383xRnRmj8YVu0iwlkk0=
X-Google-Smtp-Source: APXvYqyty68PAMWORBFS4SOumBSi0SGW6OqOq41JF4XLCXyhk6e25NllWvvx+DACJd0Zs0zlczSJKg==
X-Received: by 2002:a05:6808:3c2:: with SMTP id
 o2mr363663oie.145.1579104463552; 
 Wed, 15 Jan 2020 08:07:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j8sm2444704oii.32.2020.01.15.08.07.42
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 08:07:42 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 220379
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 15 Jan 2020 10:07:41 -0600
Date: Wed, 15 Jan 2020 10:07:41 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200115160741.GA20174@bogus>
References: <20200113161954.29779-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113161954.29779-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 perex@perex.cz, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: dt-bindings: stm32: convert spdfirx
	to json-schema
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

On Mon, Jan 13, 2020 at 05:19:54PM +0100, Olivier Moysan wrote:
> Convert the STM32 SPDIFRX bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../bindings/sound/st,stm32-spdifrx.txt       | 56 -------------
>  .../bindings/sound/st,stm32-spdifrx.yaml      | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
> deleted file mode 100644
> index 33826f2459fa..000000000000
> --- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -STMicroelectronics STM32 S/PDIF receiver (SPDIFRX).
> -
> -The SPDIFRX peripheral, is designed to receive an S/PDIF flow compliant with
> -IEC-60958 and IEC-61937.
> -
> -Required properties:
> -  - compatible: should be "st,stm32h7-spdifrx"
> -  - reg: cpu DAI IP base address and size
> -  - clocks: must contain an entry for kclk (used as S/PDIF signal reference)
> -  - clock-names: must contain "kclk"
> -  - interrupts: cpu DAI interrupt line
> -  - dmas: DMA specifiers for audio data DMA and iec control flow DMA
> -    See STM32 DMA bindings, Documentation/devicetree/bindings/dma/stm32-dma.txt
> -  - dma-names: two dmas have to be defined, "rx" and "rx-ctrl"
> -
> -Optional properties:
> -  - resets: Reference to a reset controller asserting the SPDIFRX
> -
> -The device node should contain one 'port' child node with one child 'endpoint'
> -node, according to the bindings defined in Documentation/devicetree/bindings/
> -graph.txt.
> -
> -Example:
> -spdifrx: spdifrx@40004000 {
> -	compatible = "st,stm32h7-spdifrx";
> -	reg = <0x40004000 0x400>;
> -	clocks = <&rcc SPDIFRX_CK>;
> -	clock-names = "kclk";
> -	interrupts = <97>;
> -	dmas = <&dmamux1 2 93 0x400 0x0>,
> -	       <&dmamux1 3 94 0x400 0x0>;
> -	dma-names = "rx", "rx-ctrl";
> -	pinctrl-0 = <&spdifrx_pins>;
> -	pinctrl-names = "default";
> -
> -	spdifrx_port: port {
> -		cpu_endpoint: endpoint {
> -			remote-endpoint = <&codec_endpoint>;
> -		};
> -	};
> -};
> -
> -spdif_in: spdif-in {
> -	compatible = "linux,spdif-dir";
> -
> -	codec_port: port {
> -		codec_endpoint: endpoint {
> -			remote-endpoint = <&cpu_endpoint>;
> -		};
> -	};
> -};
> -
> -soundcard {
> -	compatible = "audio-graph-card";
> -	dais = <&spdifrx_port>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> new file mode 100644
> index 000000000000..ab8e9d74ac3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/st,stm32-spdifrx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 S/PDIF receiver (SPDIFRX)
> +
> +maintainers:
> +  - Olivier Moysan <olivier.moysan@st.com>
> +
> +description: |
> +  The SPDIFRX peripheral, is designed to receive an S/PDIF flow compliant with
> +  IEC-60958 and IEC-61937.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32h7-spdifrx
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: kclk
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: audio data capture DMA
> +      - description: IEC status bits capture DMA
> +    minItems: 1
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: rx-ctrl
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

Needs a:

additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    spdifrx: spdifrx@40004000 {
> +        compatible = "st,stm32h7-spdifrx";
> +        #sound-dai-cells = <0>;
> +        reg = <0x40004000 0x400>;
> +        clocks = <&rcc SPDIF_K>;
> +        clock-names = "kclk";
> +        interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&dmamux1 2 93 0x400 0x0>,
> +               <&dmamux1 3 94 0x400 0x0>;
> +        dma-names = "rx", "rx-ctrl";
> +        pinctrl-0 = <&spdifrx_pins>;
> +        pinctrl-names = "default";
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
