Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DC4A33A8E
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 10:02:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BCB3C78F6D;
	Thu, 13 Feb 2025 09:02:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C347CC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 09:02:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 410F55C4DB7;
 Thu, 13 Feb 2025 09:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E39C4CED1;
 Thu, 13 Feb 2025 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739437375;
 bh=qJUGS5aMNlI3ACxeGXL55sT5mPp48KgzgEP7Ar9ldlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T3iWvDypjZL41SnTlfB9/DhnZgwBi8RYF8WEjUJ5LBFgxYRxWYhblp0osEcb8Gdv9
 nB/Lpa7WN788G5cy8ooLGj+rxipdcx3BUftPR2DUx/73mV1v12FOKUUSXer4eGJt7d
 kv0qYZSpVKvdqD0lmfGZHsakRBEspK7XZ8qRK8THDYKTwW0g+up2uhMuwN06UXNs16
 4XpykJJ5yb4LpWMgBLSJR4n5hO5A3T1dnB7qTu3jwG0YjoaV9STafcatIFkbXnNu9g
 6h/KfB1GHjjArGzXGeYPWIruSJ7LlgLRXsjsYFVmV6Wg6XJLdkKoSux1AuFM0q1/cE
 +eXTpQNw0+pWA==
Date: Thu, 13 Feb 2025 10:02:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20250213-polite-spiked-dingo-ce0f3a@krzk-bin>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-7-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-7-e8ef1e666c5e@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/10] arm64: Kconfig: expand STM32 Armv8
 SoC with STM32MP21 SoCs family
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

On Mon, Feb 10, 2025 at 04:21:01PM +0100, Amelie Delaunay wrote:
> Expand config ARCH_STM32 with the new STM32MP21 SoCs family which is
> composed of STM32MP211, STM32MP213 and STM32MP215 SoCs.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  arch/arm64/Kconfig.platforms | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 844a39620cfea8bfc031a545d85e33894ef20994..f788dbc09c9eb6f5801758ccf6b0ffe50a96090e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -325,6 +325,8 @@ config ARCH_STM32
>  			- STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
>  		- STM32MP23:
>  			- STM32MP231, STM32MP233, STM32MP235.
> +		- STM32MP21:

Squash it with previous patch and keep some sort of order.

> +			- STM32MP211, STM32MP213, STM32MP215.
>  
>  config ARCH_SYNQUACER
>  	bool "Socionext SynQuacer SoC Family"
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
