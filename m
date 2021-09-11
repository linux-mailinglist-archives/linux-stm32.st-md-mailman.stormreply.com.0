Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 554EE407931
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Sep 2021 17:48:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3C4FC5A4D3;
	Sat, 11 Sep 2021 15:48:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E38EC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Sep 2021 15:48:27 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1698611B0;
 Sat, 11 Sep 2021 15:48:22 +0000 (UTC)
Date: Sat, 11 Sep 2021 16:51:54 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20210911165154.3afb17f7@jic23-huawei>
In-Reply-To: <20210908155452.25458-2-olivier.moysan@foss.st.com>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
 <20210908155452.25458-2-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: iio: adc: add generic
	channel binding
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

On Wed, 8 Sep 2021 17:54:46 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

dt-bindings: iio: adc: stm32-adc: ...

> Add ADC generic channel binding. This binding should
> be used as an alternate to legacy channel properties
> whenever possible.
> ADC generic channel binding allows to identify supported
> internal channels through the following reserved label names:
> "vddcore", "vrefint" and "vbat".
> This binding also allows to set a different sampling time
> for each channel.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
> Note: The schema here is too permissive as either legacy or generic
> channels properties are required. These properties are mutually
> exclusive, however all attempts to describe this constraint are
> failing. In particular the following schemas and their variants have
> shown unsucessful.
> 
Given yaml still drives me crazy I'll rely on Rob's expertise for suggestions
here.

The new binding text itself looks great to me.

> oneOf:
>   - anyOf:
> 	- required:
> 		- st,adc-channels
> 	- required:
> 		- st,adc-diff-channels
>   - anyOf:
> 	- required:
> 		- $nodename
> 
> - if:
>   patternProperties:
>     "^channel@([0-9]|1[0-9])$":
>       type: object
> then:
>   properties:
>     st,adc-channels: false
>     st,adc-diff-channels: false
> else:
>   - anyOf:
>       - required:
>           - st,adc-channels
>       - required:
>           - st,adc-diff-channels
> ---
>  .../bindings/iio/adc/st,stm32-adc.yaml        | 100 ++++++++++++++++--
>  1 file changed, 93 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index a58334c3bb76..a1f6cbe144ba 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -222,6 +222,12 @@ patternProperties:
>        '#io-channel-cells':
>          const: 1
>  
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
>        interrupts:
>          description: |
>            IRQ Line for the ADC instance. Valid values are:
> @@ -265,7 +271,9 @@ patternProperties:
>            <vinp vinn>, <vinp vinn>,... vinp and vinn are numbered from 0 to 19.
>  
>            Note: At least one of "st,adc-channels" or "st,adc-diff-channels" is
> -          required. Both properties can be used together. Some channels can be
> +          required if no adc generic channel is defined. These legacy channel
> +          properties are exclusive with adc generic channel bindings.
> +          Both properties can be used together. Some channels can be
>            used as single-ended and some other ones as differential (mixed). But
>            channels can't be configured both as single-ended and differential.
>          $ref: /schemas/types.yaml#/definitions/uint32-matrix
> @@ -290,6 +298,44 @@ patternProperties:
>            each channel.
>          $ref: /schemas/types.yaml#/definitions/uint32-array
>  
> +    patternProperties:
> +      "^channel@([0-9]|1[0-9])$":
> +        type: object
> +        $ref: "adc.yaml"
> +        description: |
> +          Represents the external channels which are connected to the ADC.
> +
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 19
> +
> +          label:
> +            description: |
> +              Unique name to identify which channel this is.
> +              Reserved label names "vddcore", "vrefint" and "vbat"
> +              are used to identify internal channels with matching names.
> +
> +          diff-channels:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            items:
> +              minimum: 0
> +              maximum: 19
> +
> +          st,min-sample-time-nsecs:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: |
> +              Minimum sampling time in nanoseconds. Depending on hardware (board)
> +              e.g. high/low analog input source impedance, fine tune of ADC
> +              sampling time may be recommended.
> +
> +        required:
> +          - reg
> +
> +    dependencies:
> +      $nodename: [ '#address-cells', '#size-cells' ]
> +
>      allOf:
>        - if:
>            properties:
> @@ -369,12 +415,6 @@ patternProperties:
>  
>      additionalProperties: false
>  
> -    anyOf:
> -      - required:
> -          - st,adc-channels
> -      - required:
> -          - st,adc-diff-channels
> -
>      required:
>        - compatible
>        - reg
> @@ -451,4 +491,50 @@ examples:
>          // other adc child node follow...
>        };
>  
> +  - |
> +    // Example 3: with stm32mp157c to setup ADC2 with:
> +    // - internal channels 13, 14, 15.
> +      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +      #include <dt-bindings/clock/stm32mp1-clks.h>
> +      adc122: adc@48003000 {
> +        compatible = "st,stm32mp1-adc-core";
> +        reg = <0x48003000 0x400>;
> +        interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&rcc ADC12>, <&rcc ADC12_K>;
> +        clock-names = "bus", "adc";
> +        booster-supply = <&booster>;
> +        vdd-supply = <&vdd>;
> +        vdda-supply = <&vdda>;
> +        vref-supply = <&vref>;
> +        st,syscfg = <&syscfg>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        adc@100 {
> +          compatible = "st,stm32mp1-adc";
> +          #io-channel-cells = <1>;
> +          reg = <0x100>;
> +          interrupts = <1>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          channel@13 {
> +            reg = <13>;
> +            label = "vrefint";
> +            st,min-sample-time-nsecs = <9000>;
> +          };
> +          channel@14 {
> +            reg = <14>;
> +            label = "vddcore";
> +            st,min-sample-time-nsecs = <9000>;
> +          };
> +          channel@15 {
> +            reg = <15>;
> +            label = "vbat";
> +            st,min-sample-time-nsecs = <9000>;
> +          };
> +        };
> +      };
> +
>  ...

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
