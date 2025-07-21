Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B54B0CB57
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 22:09:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5528C32EBF;
	Mon, 21 Jul 2025 20:09:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24FE4C32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 20:09:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9980A5C6202;
 Mon, 21 Jul 2025 20:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3ACC4CEED;
 Mon, 21 Jul 2025 20:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753128567;
 bh=0tI7Ckz46vRExgHt7/KrtPSDrZcdVJNbVoF8HN/Bt+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DLNm4FZ5DqGkI0BU+e1MbrutQHnfbD5PddxRwA7qx8WwP7lB0AdvIUP/ThYm8iPFN
 SzXrVa8azY5hs/h1p1uGNUckSDkGI+j5pLuDgpF1xTD27zOPveIAn/U3TNhXOWxkLh
 iNa+jVUmuI78lSAg9urGHTuq+UnDFppKmiIM3TgHmxCbNwxN4OAcF8blVRSMn3Q9s2
 XdaY67ZvK907ChVjCXl2eRgw1fNC/xfInBrQmQYfBSlo30m6JyPTesbV1rgE9LbDoF
 a2gUXEOWrFnK/RNCSniPEmuDVSgcZIEkvoH+3R7565JMM81xzjMZ8u4JVPdN9I0rkv
 FLJoxRcsCc4sw==
Date: Mon, 21 Jul 2025 15:09:26 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250721200926.GA1179079-robh@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-5-cdece720348f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711-ddrperfm-upstream-v2-5-cdece720348f@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 05/16] dt-bindings: memory: add jedec,
 ddr[3-4]-channel binding
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

On Fri, Jul 11, 2025 at 04:48:57PM +0200, Cl=E9ment Le Goffic wrote:
> Introduce as per jedec,lpddrX-channel binding, jdec,ddr[3-4]-channel
> binding.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../memory-controllers/ddr/jedec,ddr-channel.yaml  | 53 ++++++++++++++++=
++++++
>  1 file changed, 53 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jed=
ec,ddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/=
ddr/jedec,ddr-channel.yaml
> new file mode 100644
> index 000000000000..31daa22bcd4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-=
channel.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr-chan=
nel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DDR channel with chip/rank topology description
> +
> +description:
> +  A DDR channel is a logical grouping of memory chips that are connected
> +  to a host system. The main purpose of this node is to describe the
> +  overall DDR topology of the system, including the amount of individual
> +  DDR chips.
> +
> +maintainers:
> +  - Cl=E9ment Le Goffic <legoffic.clement@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - jedec,ddr3-channel
> +      - jedec,ddr4-channel
> +
> +  io-width:
> +    description:
> +      The number of DQ pins in the channel. If this number is different
> +      from (a multiple of) the io-width of the DDR chip, that means that
> +      multiple instances of that type of chip are wired in parallel on t=
his
> +      channel (with the channel's DQ pins split up between the different
> +      chips, and the CA, CS, etc. pins of the different chips all shorted
> +      together).  This means that the total physical memory controlled b=
y a
> +      channel is equal to the sum of the densities of each rank on the
> +      connected DDR chip, times the io-width of the channel divided by
> +      the io-width of the DDR chip.
> +    enum:
> +      - 8
> +      - 16
> +      - 32
> +      - 64
> +      - 128

This is duplicating what's in jedec,lpddr-channel.yaml. Refactor or add =

to it rather than duplicating.

Is there some reason regular DDR3/4 doesn't have ranks? I'm pretty sure =

it can...

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
