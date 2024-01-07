Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBC98264C8
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Jan 2024 16:40:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F394C6B476;
	Sun,  7 Jan 2024 15:40:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AF16C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jan 2024 15:40:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA4F160BE9;
 Sun,  7 Jan 2024 15:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A8DCC433C9;
 Sun,  7 Jan 2024 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704642023;
 bh=tGn/7dhPk5c9YtVIKGXoYB26prxXPiY1VNsjLYaBRE8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BQjCu3/DEsf8YjwDknLvudJ66vUpzVr7VH/qMZriGPIoURm6HCcKV/n6TrA6vghYr
 IengT6F3Lb6nLCrUQ1bWTJ1NAuT3iqrE2H2Ezliv07D3VnNgra5nSkyIcz/rP1asY5
 pa01kNICfzYfnxb7alV6rl/Y756faSYaZvG1upByepu1wyAMqr+FqRmimhNpDAUR0S
 +ElQxZTJzdvF9JdWi30oMZIT8ZT+4NSKcGI4hrX/v6o/nKkLhx3ygDc0agfLqjYzDY
 J00pkyAZQBe/k2rG5CV/uHl7tY1HwLCfFwGVsmM0AB6xyUjQAyptgSmz8EEOOKjEWj
 3umdidZ0ddjBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 31777C4167F; Sun,  7 Jan 2024 15:40:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170464202319.22284.15974320807514546693.git-patchwork-notify@kernel.org>
Date: Sun, 07 Jan 2024 15:40:23 +0000
References: <20240105201642.30904-1-petr@tesarici.cz>
In-Reply-To: <20240105201642.30904-1-petr@tesarici.cz>
To: Petr Tesarik <petr@tesarici.cz>
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, jszhang@kernel.org,
 netdev@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix ethtool per-queue
	statistics
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

On Fri,  5 Jan 2024 21:16:42 +0100 you wrote:
> Fix per-queue statistics for devices with more than one queue.
> 
> The output data pointer is currently reset in each loop iteration,
> effectively summing all queue statistics in the first four u64 values.
> 
> The summary values are not even labeled correctly. For example, if eth0 has
> 2 queues, ethtool -S eth0 shows:
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix ethtool per-queue statistics
    https://git.kernel.org/netdev/net/c/61921bdaa132

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
