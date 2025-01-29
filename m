Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A24A2184A
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 08:40:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10768C78026;
	Wed, 29 Jan 2025 07:40:45 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFD91C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 07:40:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ECA61A41608;
 Wed, 29 Jan 2025 07:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F6AC4CEE0;
 Wed, 29 Jan 2025 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738136436;
 bh=PyibikrF+TCXgDznh/KR1T5STcTdoGrq2A8bnRmM4IE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q7608BvFKrGTZLp8LKqrqqhNxpzR95qM2PeidXfImjDePFz3SiI3bZIe3NMP+LEKA
 fDnw3rdGkQqYv1/9BTHaJ6Th1qgMOXE/j+MyaW443cz1sX3U4Y5mXTKHCK6KuRWb86
 WIi6w5nVBUkoBAVmTYgi7QeGlrK7y3j9UDpUhAyRXnQIKsUK9i1tmLEL1HNm20K1Ho
 bBCzH2bRmAb3lnu4pF4qkU5/4kY6qci8qNiScqHJb/hrxjQ8tzDMGKh56B2rujJRzk
 a06LrxYoVM/+f8QqPmqKriedkJ76lItcLzyTLpb6fKfgEGwyz2RooWr1v6Ft+93TSR
 4vj6Z0DapzDkQ==
Date: Wed, 29 Jan 2025 08:40:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Message-ID: <20250129-annoying-flawless-porpoise-47daed@krzk-bin>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
 <20250128-panama-manly-a753d91c297c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128-panama-manly-a753d91c297c@spud>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI
	controller
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

On Tue, Jan 28, 2025 at 06:02:27PM +0000, Conor Dooley wrote:
> > +  st,syscfg-dlyb:
> > +    description: phandle to syscon block
> > +      Use to set the OSPI delay block within syscon to
> > +      tune the phase of the RX sampling clock (or DQS) in order
> > +      to sample the data in their valid window and to
> > +      tune the phase of the TX launch clock in order to meet setup
> > +      and hold constraints of TX signals versus the memory clock.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Why do you need a phandle here? I assume looking up by compatible ain't
> possible because you have multiple controllers on the SoC? Also, I don't
> think your copy-paste "phandle to" stuff here is accurate:
>       st,syscfg-dlyb = <&syscfg 0x1000>;
> There's an offset here that you don't mention in your description.

This needs double items: and listing them with description, instead of
free form text.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
