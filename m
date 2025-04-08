Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7DA7F527
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 08:45:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 436F8C7A826;
	Tue,  8 Apr 2025 06:45:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8FCFC7A824
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 06:45:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A4AEE42B6C;
 Tue,  8 Apr 2025 06:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA3AC4CEE5;
 Tue,  8 Apr 2025 06:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744094712;
 bh=mOv+HvzRrxAHJGRbI+qsfBmoBE1QErM9V08wm89ZPdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=knKVOs6tQaE1iv88Hyq4JBbX/wpDy/tGlgs+QemkXkB+9bADFBEpf8YN+O+rQqOp0
 x/E114SgTJiJ+Qlve/r7TS7jBBRBayeexEQ6H/i0SNUVssM2gjbKDVJPC8G5CodVUe
 T3yrGPfVvJt+kQ+bjwpPH5RqHZW86KfiSAHjtGBl2VFA1HFNIfeFSS5+/21zULDYh5
 WMn9w58KUj5fb0tEm1fq4x3ETD6UJL0yxkD2EbnbeLqiiPGL0i7sn6kukOR0paBtIQ
 /M5bpqJnPyJX/bZkSMTz+OQxuKfdYaeXD2UiZkMdn0SKNc295OPZ0zItxyX/+2ZjRy
 7uqyprPyh3o8Q==
Date: Tue, 8 Apr 2025 08:45:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20250408-magic-arrogant-hound-0f2de5@shite>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250407-upstream_ospi_v6-v8-2-7b7716c1c1f6@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-upstream_ospi_v6-v8-2-7b7716c1c1f6@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 2/7] dt-bindings: memory-controllers:
 Add STM32 Octo Memory Manager controller
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

On Mon, Apr 07, 2025 at 03:27:33PM GMT, Patrice Chotard wrote:
> +  st,syscfg-amcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The Address Mapping Control Register (AMCR) is used to split the 256MB
> +      memory map area shared between the 2 OSPI instance. The Octo Memory
> +      Manager sets the AMCR depending of the memory-region configuration.
> +      The memory split bitmask description is:
> +        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
> +        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
> +        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
> +        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
> +        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
> +    items:
> +      items:

That's not what Rob asked. Are we goign to repeat the story of Benjamin
and VD55G1? You got the exact code to use, which only need corrections
in indentation probably. Why not using it?

You miss here '-'.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
