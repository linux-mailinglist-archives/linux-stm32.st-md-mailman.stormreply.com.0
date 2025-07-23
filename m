Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBA2B0F445
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 15:41:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C97F3C36B3D;
	Wed, 23 Jul 2025 13:41:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 668FBC36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 13:41:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D3925C62A8;
 Wed, 23 Jul 2025 13:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DD9C4CEE7;
 Wed, 23 Jul 2025 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753278109;
 bh=zxxC/wQlJmLxLa47Q7NNudHjnXvG/vCvKPONP/39QCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmuG7qTl4sg7/QMBKgyBmArSjY7MW6zMzETCIkWyLdi81B49I4VHdhuWfDtD85keA
 s1bLp3unFlREP9Un4fUUX5JziSZMKwf4Hw/KgMn4VmYohw3DYwp/XXVUfyBh5wkyD3
 R09TNEfWqkjGMY/LeDVi0f9DYMrxS2enzACUqqbvhnTzVcHNryjALifb57fyVeXAHb
 L1ILoKBkyV+Sg2NQ8JbJ+iBlFG6RrkLTutCNyS6FMTUcZyOmERe66AVfkM7t7YxQvS
 J5Dx9ktAMD/94OEX5E4E6anz65xzMbxXPuCU2irBMH4pS5JuXICjJt5QYIrsV2r6ZK
 GQzPzDIu1LfKg==
Date: Wed, 23 Jul 2025 08:41:48 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250723134148.GA2136293-robh@kernel.org>
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
 <20250723-ddrperfm-upstream-v4-2-1aa53ca319f4@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250723-ddrperfm-upstream-v4-2-1aa53ca319f4@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v4 02/20] dt-bindings: stm32: stm32mp25:
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

On Wed, Jul 23, 2025 at 03:05:46PM +0200, Cl=E9ment Le Goffic wrote:
> RCC is able to check the availability of a clock.
> Allow to query the RCC with a firewall ID.

The subject is wrong. There is no such "access-controller-cell" =

property.
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
