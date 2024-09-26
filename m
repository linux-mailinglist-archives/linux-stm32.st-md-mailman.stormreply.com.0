Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 305CC986F49
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2024 10:50:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D50AEC78006;
	Thu, 26 Sep 2024 08:50:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2FDCC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 08:50:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D7B095C5744;
 Thu, 26 Sep 2024 08:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B68C4CEC7;
 Thu, 26 Sep 2024 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727340628;
 bh=GcRYZc0aYdKjKzm8dqTZs423b3rVkDA/yBEu7aO4lvc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=T7zMMok6AL8MgOS0GZUb2ZO196/h+wGaqUznwue4pQ1u0n66dxxYn2zOfohwAYSlJ
 t5ZCa0rrb4FGKZVoJQN6mrYZkm2BvBijKW0EHSicYUTsAWYtwO4LdzNb/xeDaQz2hE
 WpgBxpT2JYnliPPbOQs2ACce8ulAlU3MSVDazNzXktBkwo2GmbAAx1nzPbDskXVPSx
 w41Q93K1IAsLRGDwziTcFHN1LV6mzw7dY23pmPA6wYylz7TJDQgLiEwGhiZtmKJj7m
 HJVV9387mm3EtlpOdJGtCjc6ZKRUlCMCGjhbHpxD7H6Xb8ZUBOwktmQftoLxqSH2op
 18/D98E1mvlpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D22380DBF5; Thu, 26 Sep 2024 08:50:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172734063104.1173335.1175532614664829516.git-patchwork-notify@kernel.org>
Date: Thu, 26 Sep 2024 08:50:31 +0000
References: <20240919121028.1348023-1-0x1207@gmail.com>
In-Reply-To: <20240919121028.1348023-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk, jpinto@synopsys.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 xfr@outlook.com, boon.leong.ong@intel.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: set
 PP_FLAG_DMA_SYNC_DEV only if XDP is enabled
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Sep 2024 20:10:28 +0800 you wrote:
> Commit 5fabb01207a2 ("net: stmmac: Add initial XDP support") sets
> PP_FLAG_DMA_SYNC_DEV flag for page_pool unconditionally,
> page_pool_recycle_direct() will call page_pool_dma_sync_for_device()
> on every page even the page is not going to be reused by XDP program.
> 
> When XDP is not enabled, the page which holds the received buffer
> will be recycled once the buffer is copied into new SKB by
> skb_copy_to_linear_data(), then the MAC core will never reuse this
> page any longer. Always setting PP_FLAG_DMA_SYNC_DEV wastes CPU cycles
> on unnecessary calling of page_pool_dma_sync_for_device().
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: set PP_FLAG_DMA_SYNC_DEV only if XDP is enabled
    https://git.kernel.org/netdev/net/c/b514c47ebf41

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
