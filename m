Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D11EEB04E91
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 05:17:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67360C3F931;
	Tue, 15 Jul 2025 03:17:21 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AE64C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 03:17:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E992BA48577;
 Tue, 15 Jul 2025 03:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72792C4CEED;
 Tue, 15 Jul 2025 03:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752549438;
 bh=HTtawzgAqQ5YOwB+NQpNjeTVyd8WRqp+ZD4g6gH58Fg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SiSEOjDNHhYoDZQ4MKAicWSMZ0G8HtCCla9dnikgDs90hfnGgyOloW6Q+SywPrIe9
 HfYw/7VWPZi3LUUycotG/9lXaKXVUFjlM0Qu3eklGU0NqGGrEXhyuG3xeqmZLdLUoo
 TT/QAA5YfMmtFMAzzUJRAlNP84SwaGbH/nmNdtmown9T/X/BaJ4rNBmOKjvDxEmc69
 xcJjTMPHvQP1Z8s9XFiL5lwbxd6yLzO7vfCqtkSW13124agCEXl86ALj2l0pNxqJ5E
 ux0Nmi+b0kc/b/e3wChw3gjl2iW3LcMiR0FAiaVxyjzrbAu0vkKGPjZotQaX7Kf7HS
 WXBm/i/hn2a4Q==
Date: Mon, 14 Jul 2025 22:17:17 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250715031717.GA4144523-robh@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, Le Goffic <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/16] dt-bindings: stm32: stm32mp25:
 add `access-controller-cell` property
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

On Fri, Jul 11, 2025 at 04:48:54PM +0200, Cl=E9ment Le Goffic wrote:
> RCC is able to check the availability of a clock.
> Allow to query the RCC with a firewall ID.

If it is tied to a clock, do we need another provider? We have the =

"protected clocks" thing, but that might be a bit different.

> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yam=
l b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
> index 88e52f10d1ec..4d471e3d89bc 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
> @@ -31,6 +31,11 @@ properties:
>    '#reset-cells':
>      const: 1
>  =

> +  '#access-controller-cells':
> +    const: 1
> +    description:
> +      Contains the firewall ID associated to the peripheral.
> +
>    clocks:
>      items:
>        - description: CK_SCMI_HSE High Speed External oscillator (8 to 48=
 MHz)
> @@ -123,6 +128,7 @@ required:
>    - reg
>    - '#clock-cells'
>    - '#reset-cells'
> +  - '#access-controller-cells'
>    - clocks
>  =

>  additionalProperties: false
> @@ -136,6 +142,7 @@ examples:
>          reg =3D <0x44200000 0x10000>;
>          #clock-cells =3D <1>;
>          #reset-cells =3D <1>;
> +        #access-controller-cells =3D <1>;
>          clocks =3D  <&scmi_clk CK_SCMI_HSE>,
>                    <&scmi_clk CK_SCMI_HSI>,
>                    <&scmi_clk CK_SCMI_MSI>,
> =

> -- =

> 2.43.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
