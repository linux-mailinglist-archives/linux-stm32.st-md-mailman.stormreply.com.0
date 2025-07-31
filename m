Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C098B1728C
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Jul 2025 15:54:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B0C9C3F938;
	Thu, 31 Jul 2025 13:54:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D086BC3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 13:54:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EE6AB61126;
 Thu, 31 Jul 2025 13:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B785C4CEEF;
 Thu, 31 Jul 2025 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753970083;
 bh=eMaB/jC7BQOujSeVyd65hlSZ/jJUt5A5InXdWSnL42Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LfD/b5JDEM4tfHtFXQ7drTEt8aleNybYQzijLgWsq+p+xNnv2CcV45z6g8k5blx1h
 LJf5RQXMtCD81I18Q730/r1cE/tRooUKRse/MQ/98Qlo+4ZFt5C5W6s1FmE+UiT+fF
 fGCKKTUwxi15kn0RnwXrfshq0blX42oaFLSpFa3U91GiH3JSQOhvC16wow3IWEPPzg
 +pTr7wJssZyyxv0p2wNtIHbABvZknQz/dtOcZFP113btCZgTq6Cw9xoAYeYBAp1nma
 sfJnJs0Bctps/fzgTBSZSILD6YtS6wqLAFG+Uucid+jkpoas5T2SOHxJMNGtmE2Wsc
 MbABvN8U+VXfA==
Date: Thu, 31 Jul 2025 08:54:42 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250731135442.GA2139000-robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-12-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728-ddrperfm-upstream-v5-12-03f1be8ad396@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 12/20] dt-bindings: perf: stm32:
 introduce DDRPERFM dt-bindings
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Jul 28, 2025 at 05:29:43PM +0200, Cl=E9ment Le Goffic wrote:
> DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
> It allows to monitor DDR events that come from the DDR Controller
> such as read or write events.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml | 94 ++++++++++++++++=
++++++
>  1 file changed, 94 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml=
 b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
> new file mode 100644
> index 000000000000..1d97861e3d44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +maintainers:
> +  - Cl=E9ment Le Goffic <legoffic.clement@gmail.com>
> +
> +title: STMicroelectronics STM32 DDR Performance Monitor (DDRPERFM)
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: st,stm32mp131-ddr-pmu
> +      - items:
> +          - enum:
> +              - st,stm32mp151-ddr-pmu
> +          - const: st,stm32mp131-ddr-pmu
> +      - items:
> +          - const: st,stm32mp251-ddr-pmu

This and the 1st entry can be a single enum.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  access-controllers:
> +    minItems: 1
> +    maxItems: 2
> +
> +  memory-channel:
> +    description:
> +      The memory channel this DDRPERFM is attached to.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp131-ddr-pmu
> +    then:
> +      required:
> +        - clocks
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp251-ddr-pmu
> +    then:
> +      required:
> +        - access-controllers
> +        - memory-channel
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +
> +    perf@5a007000 {
> +        compatible =3D "st,stm32mp151-ddr-pmu", "st,stm32mp131-ddr-pmu";
> +        reg =3D <0x5a007000 0x400>;
> +        clocks =3D <&rcc DDRPERFM>;
> +        resets =3D <&rcc DDRPERFM_R>;
> +    };
> +
> +  - |
> +    ddr_channel: sdram-channel-0 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        compatible =3D "jedec,ddr4-channel";
> +        io-width =3D <16>;
> +    };
> +
> +    perf@48041000 {
> +      compatible =3D "st,stm32mp251-ddr-pmu";
> +      reg =3D <0x48041000 0x400>;
> +      access-controllers =3D <&rcc 104>;
> +      memory-channel =3D <&ddr_channel>;
> +    };
> =

> -- =

> 2.43.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
