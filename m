Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FFA84C6F0
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 10:10:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE92CC6DD60;
	Wed,  7 Feb 2024 09:10:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3082FC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 09:10:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1510616B5;
 Wed,  7 Feb 2024 09:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E773C433C7;
 Wed,  7 Feb 2024 09:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707297025;
 bh=3Skvn/dUoFSwXi54r9T2MMdejeTQaB6k0PKGKLgLFW8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JpVjA9hi1PaqsZIiPpiX1hoyJ6QubNOqHgQGqadY/ZlSwQpDZevC20ottlioalOio
 cpuxfbsbNgLGI7P5fvOp5m95VdLNvCcaroiZP/ZpHtbH8a1V/KPfNlIwVqoqOv/cDR
 zJvWYTi2j9O/6pGfnyxQiT8XE1IT+lTKY0sa2MTJ3fOERzHmL89eJUJ3YI5FFPYFZp
 Me2RVjPMY2VPi2RLjKXlUJ0bIsHwzUJ8c6GT8pJhR/jdYfzM5P25t5ovoA3MERwWuW
 fxur5Ed2er7vR/xyJnLUkeMcdXnZCm2u7/U0nPfNwEmJS73jdbjBuOJbkXNJXNbSBr
 rqnTjW1bObaEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6549FD8C96E; Wed,  7 Feb 2024 09:10:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170729702541.31522.8754905006786635767.git-patchwork-notify@kernel.org>
Date: Wed, 07 Feb 2024 09:10:25 +0000
References: <20240203190927.19669-1-petr@tesarici.cz>
In-Reply-To: <20240203190927.19669-1-petr@tesarici.cz>
To: Petr Tesarik <petr@tesarici.cz>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, samuel@sholland.org, mh+netdev@zugschlus.de,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 jernej.skrabec@gmail.com, wens@csie.org, edumazet@google.com,
 joabreu@synopsys.com, stable@vger.kernel.org, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, linux-sunxi@lists.linux.dev,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: protect updates of
 64-bit statistics counters
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
by David S. Miller <davem@davemloft.net>:

On Sat,  3 Feb 2024 20:09:27 +0100 you wrote:
> As explained by a comment in <linux/u64_stats_sync.h>, write side of struct
> u64_stats_sync must ensure mutual exclusion, or one seqcount update could
> be lost on 32-bit platforms, thus blocking readers forever. Such lockups
> have been observed in real world after stmmac_xmit() on one CPU raced with
> stmmac_napi_poll_tx() on another CPU.
> 
> To fix the issue without introducing a new lock, split the statics into
> three parts:
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: protect updates of 64-bit statistics counters
    https://git.kernel.org/netdev/net/c/38cc3c6dcc09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
