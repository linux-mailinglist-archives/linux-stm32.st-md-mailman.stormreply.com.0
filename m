Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D89A0A244
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jan 2025 10:25:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 053B5C78F75;
	Sat, 11 Jan 2025 09:25:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FBE6C78F71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jan 2025 09:25:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA7B95C5361;
 Sat, 11 Jan 2025 09:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFF1C4CEDD;
 Sat, 11 Jan 2025 09:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736587548;
 bh=Z83WXJZoT28SBDIuoOe79g+ADfiCinqPsdEf+EaBKnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jsKT0sWer0S+oyjZTnsrYwJwGgp70I+ShlBu3pf7DVCCEaSKzGqLLZNz7ThLBitUv
 vLxgsh6E9TKKC+UeBCwL4y398nARXKbk7VHtD5SMUXdL8DKlZDlzsicjR9c87CMaGj
 1tKKgli2nbvcSskJveAG9eP3qqtt8kPYSBIL5UHH5N8kuQuXfzRn68/ujbT58klMxo
 ZPWjL/bfwtcWKu69sEa7I7ClWvg/tnvjsVPCwo5dCDuSJKdDdUpx87K1GF64uDG6ki
 sy1cLecLOOrG7zKU27CgYA3bvBbkl0H17wLc/awhiJCg2mPGX5X9R/VrGxVSwAEwk/
 HXBw/CP8a03CA==
Date: Sat, 11 Jan 2025 10:25:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <bfxyod5l2s6g3j47be7mjh6i7wgjapka2q5b6f2mleipiai6gm@hfvclvkzrtyd>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: clock: convert stm32
 rcc bindings to json-schema
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

On Thu, Jan 09, 2025 at 10:18:28PM +0100, Dario Binacchi wrote:
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +description: |
> +  The RCC IP is both a reset and a clock controller.
> +  The reset phandle argument is the bit number within the RCC registers bank,
> +  starting from RCC base address.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: st,stm32f42xx-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - enum:
> +              - st,stm32f469-rcc
> +          - const: st,stm32f42xx-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - const: st,stm32f746-rcc

Why this isn't just part of enum with first group/list? Different
groups/lists are for different fallbacks and I am pretty sure fallback
is the same.

> +          - const: st,stm32-rcc
> +      - items:
> +          - enum:
> +              - st,stm32f769-rcc
> +          - const: st,stm32f746-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - const: st,stm32h743-rcc

Same here.

Rest looks good, so with combining entries above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
