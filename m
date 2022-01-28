Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9751F49FCB0
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jan 2022 16:20:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4658FC6046B;
	Fri, 28 Jan 2022 15:20:13 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE52CC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jan 2022 15:20:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26060B80D2A;
 Fri, 28 Jan 2022 15:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6F92C340E6;
 Fri, 28 Jan 2022 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643383210;
 bh=ceVVnou4kfql6ZPDjslsQVwx9NKAS8aICoGNXGiUpKM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oiAKyW4pJmQnyfiJJk4AiypkW3W0Ty5Lv1AWoDKZ5ORs4ta4er27AKysOiNCRu6wG
 0e9UUdzI/RSnKNUcNyh2ZngcJjFi0jEOVcTcXuuAta9ablLmwsIT53k8QvwfVWmqc/
 Z7RECqEoPrA6yZfldofzRxv5v4I833ftoKLpnJ8lZ2/KPlPhEPp0gSm5NmdkEvfKQA
 3aDvaxr8i4SysxK7QTTDSsrNHizhO+9nQTYQwvacs8JaENbFFK7Cm7ha7/Dfcvith2
 Bx7eRZ64At5gIGC3vFw2FraCFkk6GOG9pD4JW6EJueg3vCjPoYSrqxMb0Z+wDf/Yi6
 jTffkOtF2R2bQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B55A2E5D087; Fri, 28 Jan 2022 15:20:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164338321073.8810.2377370074085228481.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jan 2022 15:20:10 +0000
References: <20220128141550.2350-1-jszhang@kernel.org>
In-Reply-To: <20220128141550.2350-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 qiangqing.zhang@nxp.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: properly handle with runtime
 pm in stmmac_dvr_remove()
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 28 Jan 2022 22:15:50 +0800 you wrote:
> There are two issues with runtime pm handling in stmmac_dvr_remove():
> 
> 1. the mac is runtime suspended before stopping dma and rx/tx. We
> need to ensure the device is properly resumed back.
> 
> 2. the stmmaceth clk enable/disable isn't balanced in both exit and
> error handling code path. Take the exit code path for example, when we
> unbind the driver or rmmod the driver module, the mac is runtime
> suspended as said above, so the stmmaceth clk is disabled, but
> 	stmmac_dvr_remove()
> 	  stmmac_remove_config_dt()
> 	    clk_disable_unprepare()
> CCF will complain this time. The error handling code path suffers
> from the similar situtaion.
> 
> [...]

Here is the summary with links:
  - net: stmmac: properly handle with runtime pm in stmmac_dvr_remove()
    https://git.kernel.org/netdev/net/c/6449520391df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
