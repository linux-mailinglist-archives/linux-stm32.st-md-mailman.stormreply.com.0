Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C58653E35
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 11:25:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5D92C6904C;
	Thu, 22 Dec 2022 10:25:06 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62A38C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 10:25:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8051B81CFA;
 Thu, 22 Dec 2022 10:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84004C433D2;
 Thu, 22 Dec 2022 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671704703;
 bh=HjWsEui9j49BqsSquLS1N64hkFZnyG+wvor5Mw3io4g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EVwCaOLSGrczB2AB53z9KEZJGsQGAIMS367LMi+ZJrwt4o7mwRmZZrs+CWzeN78xr
 XU9zTTrX/hiZyCXJjOx9aUMfEn5G7mi7xQ/IG05UXQq/2c3jyal8W1cBtn6g+zjbLS
 NDi9ENra7WjrcnSQsEw6dZLRJJGnaxwFJDKKMEk90UG4TVB2mm34Bm7PUsxv8luurI
 WN/ATociYxOM3L9OAVuR16WzbVgR5PBkV8v5fBNDCkUU+DG5nArGGaF+6B7/hpNL+9
 pu/TgZzwVfKAOfc+7S2VUdkdYmvVUkYWYwcUoo2fT1/CAW9rMFXUZ/xHeINezqPS22
 Q/ZU+m4hDl3iA==
Message-ID: <d55cae92-0c4f-f957-4c7b-bdf7b9b6006a@kernel.org>
Date: Thu, 22 Dec 2022 11:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org,
 Oleksii_Moisieiev@epam.com, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-3-gatien.chevallier@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221221173055.11719-3-gatien.chevallier@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 2/7] dt-bindings: bus: add STM32
	System Bus
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

On 21/12/2022 18:30, Gatien Chevallier wrote:
> Document STM32 System Bus. This bus is intended to control firewall
> access for the peripherals connected to it.
> 
> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> ---
>  .../devicetree/bindings/bus/st,sys-bus.yaml   | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,sys-bus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,sys-bus.yaml b/Documentation/devicetree/bindings/bus/st,sys-bus.yaml
> new file mode 100644
> index 000000000000..9c0e86612695
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,sys-bus.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/stm32,sys-bus.yaml
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title:  STM32 System Bus

Only one space.

> +
> +description: |
> +  The STM32 System Bus is an internal bus to which some internal peripherals
> +  are connected. STM32 System Bus integrates a firewall controlling access to each
> +  device. This bus prevents non-accessible devices to be probed.
> +
> +  To see which peripherals are securable, please check the SoC reference manual.
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +allOf:
> +  - $ref: /schemas/feature-controllers/feature-domain-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp13-sys-bus
> +      - st,stm32mp15-sys-bus
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
> +  '#feature-domain-cells':

Use consistent quotes, either ' or "

> +    minItems: 1

No. Cells must be const. This does not match cells at all...

> +
> +  ranges: true
> +
> +  feature-domain-controller: true
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Devices attached to system bus
> +    type: object
> +    properties:
> +      feature-domains:
> +        $ref: /schemas/feature-controllers/feature-domain-controller.yaml#/properties/feature-domains

maxItems

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - feature-domain-controller
> +  - '#feature-domain-cells'
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // In this example,
> +    // - the foo1 device refers to etzpc as his domain controller.
> +    // - same goes for foo2.
> +    // Access rights are verified before creating devices.
> +
> +    etzpc: etzpc@5c007000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "st,stm32mp15-sys-bus";
> +        reg = <0x5c007000 0x400>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        feature-domain-controller;
> +        #feature-domain-cells = <1>;
> +
> +        foo1: foo@1000000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +          reg = <0x0 0x1000000>;

Missing compatible, missing proper device name. Don't use fake names,
but describe real case.

> +          feature-domains = <&etzpc 0>;
> +        };
> +
> +        foo2: foo@2000000 {
> +          reg = <0x0 0x2000000>;
> +          feature-domains = <&etzpc 0>;
> +        };
> +    };

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
