Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AC09086E6
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:00:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 044A9C6C83A;
	Fri, 14 Jun 2024 09:00:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7A63C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:00:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9806C61ECD;
 Fri, 14 Jun 2024 09:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35B17C4AF1C;
 Fri, 14 Jun 2024 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718355638;
 bh=epfSrd8hbeGIbDDSU+mnrqQJEh9H0kdbYyucSYP1AJg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WOCG+U8duy/bkqurFvsSKh0My/oFop7YfeUJkN+aaf6/beCzhfsIsqrTwpS6pVbd3
 5nTzKeD8zeGmU/U5c696MGdf8WOJOAzrqYMWRnZ4KMS7D7kOHZ0uyM6Y0aOV1bmJ1z
 Iw5PDoHyu8y9nKXUhP9ixiw/TO9pDkwURGPcjUhTJAcnjifM1EAJojtP3eOl7f2YDx
 eqUC4A+telnroweMhhtdCsinFhj6jdeAUBExBM7pul7ahVd53sb5H9GtIqxgCmW2Ag
 qWTSAAAKedKLuL2qfhwwNkJJKWgbnczG8MaLP5gTbkRNZ99fh1S+atdtb+1jWxhbZd
 5Bxgw5L3ROP0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 240A4C43616; Fri, 14 Jun 2024 09:00:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171835563814.26751.8950769573761217764.git-patchwork-notify@kernel.org>
Date: Fri, 14 Jun 2024 09:00:38 +0000
References: <20240611083606.733453-1-christophe.roullier@foss.st.com>
In-Reply-To: <20240611083606.733453-1-christophe.roullier@foss.st.com>
To: Christophe ROULLIER <christophe.roullier@foss.st.com>
Cc: marex@denx.de, joabreu@synopsys.com, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, lgirdwood@gmail.com,
 edumazet@google.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
	PATCH v7 0/8] Series to deliver Ethernet for STM32MP13
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

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 11 Jun 2024 10:35:58 +0200 you wrote:
> STM32MP13 is STM32 SOC with 2 GMACs instances
>     GMAC IP version is SNPS 4.20.
>     GMAC IP configure with 1 RX and 1 TX queue.
>     DMA HW capability register supported
>     RX Checksum Offload Engine supported
>     TX Checksum insertion supported
>     Wake-Up On Lan supported
>     TSO supported
> Rework dwmac glue to simplify management for next stm32 (integrate RFC from Marek)
> 
> [...]

Here is the summary with links:
  - [net-next,v7,1/8] dt-bindings: net: add STM32MP13 compatible in documentation for stm32
    https://git.kernel.org/netdev/net-next/c/8a9044e5169b
  - [net-next,v7,2/8] net: stmmac: dwmac-stm32: Separate out external clock rate validation
    https://git.kernel.org/netdev/net-next/c/582ac134963e
  - [net-next,v7,3/8] net: stmmac: dwmac-stm32: Separate out external clock selector
    https://git.kernel.org/netdev/net-next/c/63b0aa8ea73f
  - [net-next,v7,4/8] net: stmmac: dwmac-stm32: Extract PMCR configuration
    https://git.kernel.org/netdev/net-next/c/92704f8c0e7a
  - [net-next,v7,5/8] net: stmmac: dwmac-stm32: Clean up the debug prints
    https://git.kernel.org/netdev/net-next/c/c60a54b52026
  - [net-next,v7,6/8] net: stmmac: dwmac-stm32: Fix Mhz to MHz
    https://git.kernel.org/netdev/net-next/c/cbfad55322ce
  - [net-next,v7,7/8] net: stmmac: dwmac-stm32: Mask support for PMCR configuration
    https://git.kernel.org/netdev/net-next/c/4f37dc467ffe
  - [net-next,v7,8/8] net: stmmac: dwmac-stm32: add management of stm32mp13 for stm32
    https://git.kernel.org/netdev/net-next/c/50bbc0393114

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
