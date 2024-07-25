Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1010993C1E8
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2024 14:23:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2E50C71292;
	Thu, 25 Jul 2024 12:23:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A192C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2024 12:23:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 311266131B;
 Thu, 25 Jul 2024 12:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9C4C32782;
 Thu, 25 Jul 2024 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721910221;
 bh=FxpBSkox+kGUdr5ySqjw7luWtMsnywJWHOmsE0BGYZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qX2sZWHc94S27MpTxVZc+U5E2xVhnkLF6TjChRWXH9/tHggOMZTVqaHqw94yTUWg+
 f63ezr45jUwxp349qcODGFFU4sTAZG0FS44par0jn7zxECLO5pv9aUjkHDza7iNhUh
 /KA9iJirdvlw7ME4A3m28V8mnZK59dgDv+o5HQ4WnAZMC812oq/9GckbzvH1kSqHQG
 iFF6N9o/2RIpJdgEygI8e15Nh2eZpjoWcVUWdAtPrW6IJYW5CdCe4s5LkrlXtrLMtj
 7DmZptFZWMWZv4iMsbNZXVV/04FirzQxqEw9pNxllmAcDvtUEC629dFOHzxRh75Qv+
 Xz1L0P/Kjp75g==
Date: Thu, 25 Jul 2024 07:23:40 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20240725122340.GA1360128-robh@kernel.org>
References: <20240724153639.803263-1-olivier.moysan@foss.st.com>
 <20240724153639.803263-5-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240724153639.803263-5-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 4/9] dt-bindings: iio: dfsdm: move to
	backend framework
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

On Wed, Jul 24, 2024 at 05:36:32PM +0200, Olivier Moysan wrote:
> Change the DFSDM binding to use the new IIO backend framework,
> along with the adoption of IIO generic channels.
> This binding change allows to add scaling support to the DFSDM.
> 
> Keep the legacy binding as deprecated for backward compatibility.
> 
> The io-backends property is supported only in generic IIO channel
> binding.
> 
> - Channel description with the generic binding (Audio and Analog):
> 
>   Properties superseded by generic properties:
>     st,adc-channels: becomes "reg" property in channel node
>     st,adc-channel-names: becomes "label" property in channel node
>   Properties moved to channel child node:
>     st,adc-channel-types: becomes st,adc-channel-type
>     st,adc-channel-clk-src, st,adc-alt-channel
> 
> - Analog binding:
> 
>   DFSDM filter channel is configured as an IIO backend consumer.
>   Add io-backends property in channel child nodes.
> 
>   DFSDM is no more configured as a channel consumer from SD modulator.
>   Use of io-channels in DFSDM node is deprecated.
> 
> - Audio binding:
> 
>   DFSDM audio DAI is configured as a channel consumer from DFSDM filter.
>   No change compare to legacy.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 124 +++++++++++++++---
>  1 file changed, 108 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index 2722edab1d9a..ceadd73504a4 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -102,9 +102,11 @@ patternProperties:
>          items:
>            minimum: 0
>            maximum: 7
> +        deprecated: true
>  
>        st,adc-channel-names:
>          description: List of single-ended channel names.
> +        deprecated: true
>  
>        st,filter-order:
>          description: |
> @@ -118,6 +120,12 @@ patternProperties:
>        "#io-channel-cells":
>          const: 1
>  
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
>        st,adc-channel-types:
>          description: |
>            Single-ended channel input type.
> @@ -128,6 +136,7 @@ patternProperties:
>          items:
>            enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
>          $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +        deprecated: true
>  
>        st,adc-channel-clk-src:
>          description: |
> @@ -139,6 +148,7 @@ patternProperties:
>          items:
>            enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
>          $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +        deprecated: true
>  
>        st,adc-alt-channel:
>          description:
> @@ -147,6 +157,7 @@ patternProperties:
>            If not set, channel n is connected to SPI input n.
>            If set, channel n is connected to SPI input n + 1.
>          type: boolean
> +        deprecated: true
>  
>        st,filter0-sync:
>          description:
> @@ -165,11 +176,60 @@ patternProperties:
>        - compatible
>        - reg
>        - interrupts
> -      - st,adc-channels
> -      - st,adc-channel-names
>        - st,filter-order
>        - "#io-channel-cells"
>  
> +    patternProperties:
> +      "^channel@([0-7])$":

Don't need ().

> +        type: object
> +        $ref: adc.yaml
> +        unevaluatedProperties: false
> +        description: Represents the external channels which are connected to the DFSDM.
> +
> +        properties:
> +          reg:
> +            maximum: 7
> +
> +          label:
> +            description:
> +              Unique name to identify which channel this is.
> +
> +          st,adc-channel-type:
> +            description: |
> +              Single-ended channel input type.
> +              - "SPI_R": SPI with data on rising edge (default)
> +              - "SPI_F": SPI with data on falling edge
> +              - "MANCH_R": manchester codec, rising edge = logic 0, falling edge = logic 1
> +              - "MANCH_F": manchester codec, rising edge = logic 1, falling edge = logic 0
> +            $ref: /schemas/types.yaml#/definitions/string
> +            enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
> +
> +          st,adc-channel-clk-src:
> +            description: |
> +              Conversion clock source.
> +              - "CLKIN": external SPI clock (CLKIN x)
> +              - "CLKOUT": internal SPI clock (CLKOUT) (default)
> +              - "CLKOUT_F": internal SPI clock divided by 2 (falling edge).
> +              - "CLKOUT_R": internal SPI clock divided by 2 (rising edge).
> +            $ref: /schemas/types.yaml#/definitions/string
> +            enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
> +
> +          st,adc-alt-channel:
> +            description:
> +              Must be defined if two sigma delta modulators are
> +              connected on same SPI input.
> +              If not set, channel n is connected to SPI input n.
> +              If set, channel n is connected to SPI input n + 1.
> +            type: boolean
> +
> +          io-backends:
> +            description:
> +              Used to pipe external sigma delta modulator or internal ADC backend to DFSDM channel.
> +            maxItems: 1
> +
> +        required:
> +          - reg
> +
>      allOf:
>        - if:
>            properties:
> @@ -199,9 +259,19 @@ patternProperties:
>                description:
>                  From common IIO binding. Used to pipe external sigma delta
>                  modulator or internal ADC output to DFSDM channel.
> +              deprecated: true
>  
> -          required:
> -            - io-channels
> +          if:
> +            required:
> +              - st,adc-channels
> +          then:
> +            required:
> +              - io-channels
> +
> +          patternProperties:
> +            "^channel@([0-7])$":

And here.

With that and the newline fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
