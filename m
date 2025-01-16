Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04005A1395B
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 12:47:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89995C78F73;
	Thu, 16 Jan 2025 11:47:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3452FC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 11:47:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73CFD5C0FE6;
 Thu, 16 Jan 2025 11:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9B5C4CED6;
 Thu, 16 Jan 2025 11:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737027608;
 bh=9kDIJwhprd3J8UBVpElxMP0gxs4aR3treIZNaaamSzU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=O27Wtx4j5aKBT4gPT98zbqD37H0u/MtvIb0u4K2cxJF/XWEh3r+SV3yzpdPSC89iY
 UsNqsdXAE22ukwamWlQHDmrnFZ+9fofuKmr8rpEUi8Ca24WZdak5TN1nSgXIwqohWN
 9zF2sDjpVukOO5ud1IwX6D8bIQ8PIXyJiTNxWp2EplpDN4AuY3gj4My56scRuvtgSU
 sd0CnE0JnH2A7O1eznLqTO+pkSdHYqOQWGgornAiPhgr4+9kRjeoNEEH40+PZYhyiZ
 NB7ESjs3x0sg+wQFyMwXaACd+IQK8SL1FozmQe1iqd6Pjoe3r1u3qjx4cdX0yuLYtA
 SNpaTa2RuOd1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34555380AA62; Thu, 16 Jan 2025 11:40:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173702763200.1425732.12955141458016148201.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 11:40:32 +0000
References: <cover.1736910454.git.0x1207@gmail.com>
In-Reply-To: <cover.1736910454.git.0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: andrew+netdev@lunn.ch, netdev@vger.kernel.org, jdamato@fastly.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 aleksander.lobakin@intel.com, edumazet@google.com, mcoquelin.stm32@gmail.com,
 xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/4] net: stmmac: RX
	performance improvement
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

On Wed, 15 Jan 2025 11:27:01 +0800 you wrote:
> This series improves RX performance a lot, ~40% TCP RX throughput boost
> has been observed with DWXGMAC CORE 3.20a running on Cortex-A65 CPUs:
> from 2.18 Gbits/sec increased to 3.06 Gbits/sec.
> 
> ---
> Changes in v3:
>   1. Convert prefetch() to net_prefetch() to get better performance (Joe Damato)
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/4] net: stmmac: Switch to zero-copy in non-XDP RX path
    https://git.kernel.org/netdev/net-next/c/df542f669307
  - [net-next,v3,2/4] net: stmmac: Set page_pool_params.max_len to a precise size
    https://git.kernel.org/netdev/net-next/c/2324c78a75c5
  - [net-next,v3,3/4] net: stmmac: Optimize cache prefetch in RX path
    https://git.kernel.org/netdev/net-next/c/2a2931517c9a
  - [net-next,v3,4/4] net: stmmac: Convert prefetch() to net_prefetch() for received frames
    https://git.kernel.org/netdev/net-next/c/204182edb310

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
