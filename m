Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA21AA6DD45
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 15:44:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72C05C7801E;
	Mon, 24 Mar 2025 14:44:48 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89515C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 14:44:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52427A4A133;
 Mon, 24 Mar 2025 14:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B6FC4CEDD;
 Mon, 24 Mar 2025 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742827485;
 bh=aFlNGtyRy9oVmVjrSqn43hcqtvgmECgCXHyXQI+/7CA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q8sKAZ2+lhd8maxG/iv8jyZ89kySEjKbcQAe99pgprGn+u9AfKdb7808l67lJeaGF
 Gjjc18B1BmUBZTHiuk1t8mbG/La2dNDlIzNDsaaXCRUOYgZ/Kv5lpd2Z9ISGAq7pm1
 eii8h3re+b8WUU/h0EVRY9Z7E+LhMANHqIEed6c68mAzKQawRweqa/o90LEEs1gMc4
 uVafHwBKMoVbzhNRRAGQHyLaoacx+cRydC9JjSPffc/csDUSjd548JJaInj2YBmKs8
 5xPRVxfL3EoAKNzeTFtRW4LltVmhp9kHiExZPz1zw//DzYWz3JZq3yKYDVzzCJMOYU
 dUryZbbH63Dsg==
Date: Mon, 24 Mar 2025 09:44:43 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <20250324144443.GA17721-robh@kernel.org>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324100008.346009-1-daniel.lezcano@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Fossati <thomas.fossati@linaro.org>, tglx@linutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: NXP System Timer Module
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

On Mon, Mar 24, 2025 at 11:00:05AM +0100, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/timer/nxp,stm-timer.yaml         | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> new file mode 100644
> index 000000000000..41093892c617
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP System Timer Module (STM)
> +
> +maintainers:
> +  - Daniel Lezcano <daniel.lezcano@kernel.org>
> +
> +description: |

Don't need '|' and wrap at 80 char.

> +  The System Timer Module supports commonly required system and
> +  application software timing functions. STM includes a 32-bit
> +  count-up timer and four 32-bit compare channels with a separate
> +  interrupt source for each channel. The timer is driven by the STM
> +  module clock divided by an 8-bit prescale value.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nxp,s32g2-stm
> +      - items:
> +          - const: nxp,s32g2-stm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System Timer Module clock

Just 'maxItems: 1'. The description is rather obvious.

> +
> +  clock-names:
> +    items:
> +      - const: stm

No need for *-names when there is only 1 entry.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    stm@4011c000 {

timer@...

> +        compatible = "nxp,s32g2-stm";
> +        reg = <0x4011c000 0x3000>;
> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks 0x3b>;
> +        clock-names = "stm";
> +    };
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
