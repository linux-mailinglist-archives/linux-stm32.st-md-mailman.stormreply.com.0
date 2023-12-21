Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FF981C099
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 23:00:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADEB4C6B477;
	Thu, 21 Dec 2023 22:00:55 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBCE5C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 22:00:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 19D16B82028;
 Thu, 21 Dec 2023 22:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D74C433C7;
 Thu, 21 Dec 2023 22:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703196053;
 bh=BMceOrXlyCYOCEEShEWT7LKLuoQaU2WjKCUjRN8knws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OmqWHv6NHL5RK0Is2qEQ23JPVyjHnIwLpMnZVsM1GInSiGtW6Okr3vpqv1DO56haE
 GLrLRJaZje8Qnhy+c/mSS9glUUI43LQsmj7JEpP7qGUf9a2bTvRNa6qFOe4oQEPMbh
 nkzcuilXWobWBK1WD7QU4nYf9I4CC1eRtRmYZrcEwCEMEzaeSagbY+QV0pr5tiW6VZ
 Hp+hwJA+wUwHdLW1d6YoHWalrif1QMXjtr5LG4SmXhIL4qJsQNZrBeKuWpMNWNmEyT
 I6LGGm5RJXW1AYMP0zYlxaLnI5hW8+tnbSkAMW/cqeGm3JWND7/XQwVrjkyED8Z8Wq
 05WJuXnmDeb4Q==
Received: (nullmailer pid 165405 invoked by uid 1000);
 Thu, 21 Dec 2023 22:00:49 -0000
Date: Thu, 21 Dec 2023 16:00:49 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20231221220049.GA156363-robh@kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-5-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-5-gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 peng.fan@oss.nxp.com, lars@metafoo.de, herbert@gondor.apana.org.au,
 Frank Rowand <frowand.list@gmail.com>, hugues.fruchet@foss.st.com,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com, wg@grandegger.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 mkl@pengutronix.de, linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org, rcsekar@samsung.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 04/13] dt-bindings: bus: document ETZPC
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

On Tue, Dec 12, 2023 at 04:23:47PM +0100, Gatien Chevallier wrote:
> Document ETZPC (Extended TrustZone protection controller). ETZPC is a
> firewall controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
>     	- Renamed access-controller to access-controllers
>     	- Removal of access-control-provider property
>     	- Removal of access-controller and access-controller-names
>     	  declaration in the patternProperties field. Add
>     	  additionalProperties: true in this field.
> 
> Changes in V5:
> 	- Renamed feature-domain* to access-control*
> 
> Changes in V2:
> 	- Corrected errors highlighted by Rob's robot
> 	- No longer define the maxItems for the "feature-domains"
> 	  property
> 	- Fix example (node name, status)
> 	- Declare "feature-domain-names" as an optional
> 	  property for child nodes
> 	- Fix description of "feature-domains" property
> 	- Reordered the properties so it matches ETZPC
> 	- Add missing "feature-domain-controller" property
> 
>  .../bindings/bus/st,stm32-etzpc.yaml          | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> new file mode 100644
> index 000000000000..9ca0ad39bc19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32-etzpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Extended TrustZone protection controller
> +
> +description: |
> +  The ETZPC configures TrustZone security in a SoC having bus masters and
> +  devices with programmable-security attributes (securable resources).
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: st,stm32-etzpc

Same here, needs 'simple-bus'.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +  "#access-controller-cells":
> +    const: 1
> +    description:
> +      Contains the firewall ID associated to the peripheral.
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Peripherals
> +    type: object
> +
> +    additionalProperties: true
> +
> +    required:
> +      - access-controllers
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "#access-controller-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // In this example, the usart2 device refers to rifsc as its access
> +    // controller.

Looks like the comment is wrong.


> +    // Access rights are verified before creating devices.
> +
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp13-clks.h>
> +    #include <dt-bindings/reset/stm32mp13-resets.h>
> +
> +    etzpc: bus@5c007000 {
> +        compatible = "st,stm32-etzpc";
> +        reg = <0x5c007000 0x400>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        #access-controller-cells = <1>;
> +        ranges;
> +
> +        usart2: serial@4c001000 {
> +            compatible = "st,stm32h7-uart";
> +            reg = <0x4c001000 0x400>;
> +            interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&rcc USART2_K>;
> +            resets = <&rcc USART2_R>;
> +            wakeup-source;
> +            dmas = <&dmamux1 43 0x400 0x5>,
> +                    <&dmamux1 44 0x400 0x1>;
> +            dma-names = "rx", "tx";
> +            access-controllers = <&etzpc 17>;
> +        };
> +    };
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
