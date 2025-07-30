Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DECB16813
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 23:11:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56F7DC3089D;
	Wed, 30 Jul 2025 21:11:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4ADCC30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 21:11:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 705BF43CE9;
 Wed, 30 Jul 2025 21:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2041AC4CEE3;
 Wed, 30 Jul 2025 21:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753909912;
 bh=sFIpHKRKR7Q2Kj3ofVG6atyA9wvqpFYGRwPhKFIISFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n3xABHcPFOX3yvig7wmxjCuJPhi6RshxouhCDUYXPm3K6kFZz8yT/qMOan4XHRzh8
 gnHZ/FwNJiZkBmERRghPasQypZc8mRk7jASMb8Gi+qRcJQp06eIDLHe62Hc0ftkqQV
 usOByMpMJJ/qTgGgcOA0oMF7S94yAncpaSzEaDUhIrIP0LfctdsGFUw7yj9sC8q6n2
 aJiZjJ7+r/H1d51rWcYuVBBWfS5TP0CUPO6qIKHP+dElSAlSsO+EtUJzmL0kN/lUib
 hglSWftmmXtsFcN1/9fWViL13nc9pcqqKxAxv+Ko7NPxEilIU/v88wQ6ffVblg7KrU
 TETD/8/Y/SwOQ==
Date: Wed, 30 Jul 2025 16:11:51 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250730211151.GA1749004-robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 06/20] dt-bindings: memory: introduce
	DDR4
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

On Mon, Jul 28, 2025 at 05:29:37PM +0200, Cl=E9ment Le Goffic wrote:
> Introduce JEDEC compliant DDR bindings, that use new memory-props binding.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jed=
ec,ddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jed=
ec,ddr4.yaml
> new file mode 100644
> index 000000000000..f457066a2f8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4=
.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr4.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DDR3 SDRAM compliant to JEDEC JESD79-4D
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +allOf:
> +  - $ref: jedec,sdram-props.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - pattern: "^ddr4-[0-9a-f]{2},[0-9a-f]{1}$"

Shouldn't this be 'jedec,ddr4-...'

> +      - const: jedec,ddr4
> +
> +required:
> +  - compatible
> +  - density
> +  - io-width
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ddr {
> +        compatible =3D "ddr4-ff,f", "jedec,ddr4";
> +        density =3D <8192>;
> +        io-width =3D <8>;
> +    };
> =

> -- =

> 2.43.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
