Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 260FEA7902E
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Apr 2025 15:47:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2B2AC78012;
	Wed,  2 Apr 2025 13:47:31 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A34FC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Apr 2025 13:47:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5C1EFA44535;
 Wed,  2 Apr 2025 13:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714F0C4CEDD;
 Wed,  2 Apr 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743601648;
 bh=mqlsTKVrn+AgGvdUDfL4V1yyT+cMX8N7L5XXQmEr3Yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/o5JVCQG+s/zpSNBsc2udu6u3eF1njWqXvag/0VmwJLHFrNy9dtkIAELz8/OXM3t
 8EoMZk22fAUMhMiwnmZ5UVKvOYFAoSKAbcLkHDf3PA2zQNlwQkQcRrJO+lETPEzTkp
 ipGfjXqV1nLY/xqXrvpDZeJ1KEZrcG2P9Dkg6HDj+Ty7Jl+C1xjrqbVNUNl91JZrud
 KpRC+Fi+0xUXFl2+wgyc2KJkPpdspeGYbUAeciYUZrE4GkyuooaZsDk8oSqzbEIycw
 yhf/iY9lSk5iST5iWWdKaapkJ1XUp+dmSyosSxt693xE7kXNaycLxsxvr1g77h/THd
 LY9628QXysVCw==
Date: Wed, 2 Apr 2025 08:47:25 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20250402134725.GA145044-robh@kernel.org>
References: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
 <20250401-upstream_ospi_v6-v7-2-0ef28513ed81@foss.st.com>
 <20250401222015.GA4071342-robh@kernel.org>
 <71c301ea-0be7-4349-92d6-93b3ffc9c593@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71c301ea-0be7-4349-92d6-93b3ffc9c593@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 2/7] dt-bindings: memory-controllers:
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

On Wed, Apr 02, 2025 at 10:45:08AM +0200, Krzysztof Kozlowski wrote:
> On 02/04/2025 00:20, Rob Herring wrote:
> >> +      clocks = <&rcc CK_BUS_OSPIIOM>,
> >> +               <&scmi_clk CK_SCMI_OSPI1>,
> >> +               <&scmi_clk CK_SCMI_OSPI2>;
> >> +      clock-names = "omm", "ospi1", "ospi2";
> >> +      resets = <&rcc OSPIIOM_R>,
> >> +               <&scmi_reset RST_SCMI_OSPI1>,
> >> +               <&scmi_reset RST_SCMI_OSPI2>;
> >> +      reset-names = "omm", "ospi1", "ospi2";
> >> +      access-controllers = <&rifsc 111>;
> >> +      power-domains = <&CLUSTER_PD>;
> >> +      #address-cells = <2>;
> >> +      #size-cells = <1>;
> >> +      st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
> >> +      st,omm-req2ack-ns = <0>;
> >> +      st,omm-mux = <0>;
> >> +      st,omm-cssel-ovr = <0>;
> >> +
> >> +      spi@0 {
> >> +        compatible = "st,stm32mp25-ospi";
> >> +        reg = <0 0 0x400>;
> >> +        memory-region = <&mm_ospi1>;
> >> +        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> >> +        dmas = <&hpdma 2 0x62 0x00003121 0x0>,
> >> +               <&hpdma 2 0x42 0x00003112 0x0>;
> >> +        dma-names = "tx", "rx";
> >> +        clocks = <&scmi_clk CK_SCMI_OSPI1>;
> >> +        resets = <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSPI1DLL>;
> > 
> > Looks like you are duplicating properties in the parent and child nodes. 
> > Maybe that accurately models the h/w, but if it is just so the drivers 
> > can get the resources from "the driver's node", you can always just look 
> > in the child nodes for the resources (as probably you want to drop the 
> > per instance resources from the parent).
> 
> 
> The current solution was actually my suggestion because if a parent
> device has to toggle child's reset, it means it actually is the consumer
> of that reset one way or another. IOW, it is one of its resources.
> 
> This also might matter for some of the implementations because we might
> need to setup device links or do some probe-ordering (in the future)
> between parent and the reset provider.
> 
> Without reset resource in the parent, I could imagine probe order:
> 1. parent (pokes into the child for reset)
> 2. reset and clock providers
> 3. child
> which would defer between 1 and 2.
> 
> With parent having the resource it would be re-ordered into:
> 1. reset and clock providers
> 2. parent
> 3. child

Okay, fair enough.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
