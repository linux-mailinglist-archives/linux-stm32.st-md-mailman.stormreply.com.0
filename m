Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4177B9746B9
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2024 01:50:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC51EC78014;
	Tue, 10 Sep 2024 23:50:46 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 970EBC78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 23:50:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1056CA4086E;
 Tue, 10 Sep 2024 23:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B63C4CEC3;
 Tue, 10 Sep 2024 23:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726012238;
 bh=sxK+hW8ojfmnkF9vdsCtdaf+hF/tv03gZ0GyRssxpwA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dqDW12PpIjo3dStRSFgJwdiS3RKjmOdqEXdFv6GfLMKlCA31hvHmohX41ybmMwizF
 1r8qLzUregf1qwQSKcwB9tLVeFG9zjchAqZldDx/oIP2b/3PYfkIGjtjejsMuQsHpi
 TutLU8maG58A3HVTo7cg8jFQ1AdUDnL13kUmiah/H0OesFWLeXSZRm9jNTb13JZ9gQ
 w186BjzbuUOo7Rfkn83XcK7Ld4CPn8nVe55rL/VXmiWGrIj7xRoQ3GJKG1xQLWspFJ
 Sm3oLM8KHlfIyFgbjaujRHqc/If1279M9sfEBof+BT9Qqx2DYk9s8rQBnke3RmF0q3
 iYn3gD1UZgXyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 710813822FA4; Tue, 10 Sep 2024 23:50:40 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172601223908.432718.2243350410657037055.git-patchwork-notify@kernel.org>
Date: Tue, 10 Sep 2024 23:50:39 +0000
References: <cover.1725631883.git.0x1207@gmail.com>
In-Reply-To: <cover.1725631883.git.0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: pabeni@redhat.com, linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 jpinto@synopsys.com, netdev@vger.kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, xfr@outlook.com,
 kuba@kernel.org, olteanv@gmail.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v10 0/7] net: stmmac: FPE via
	ethtool + tc
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  6 Sep 2024 22:30:05 +0800 you wrote:
> Move the Frame Preemption(FPE) over to the new standard API which uses
> ethtool-mm/tc-mqprio/tc-taprio.
> 
> Changes in v10:
>   1. fixed a stacktrace caused by timer_shutdown_sync()
>   on an uninitialized timer
>   2. ignore FPE_EVENT_RRSP events if we are not in the
>   ETHTOOL_MM_VERIFY_STATUS_VERIFYING state
> 
> [...]

Here is the summary with links:
  - [net-next,v10,1/7] net: stmmac: move stmmac_fpe_cfg to stmmac_priv data
    https://git.kernel.org/netdev/net-next/c/070a5e6295e8
  - [net-next,v10,2/7] net: stmmac: drop stmmac_fpe_handshake
    https://git.kernel.org/netdev/net-next/c/59dd7fc932e5
  - [net-next,v10,3/7] net: stmmac: refactor FPE verification process
    https://git.kernel.org/netdev/net-next/c/8d43e99a5a03
  - [net-next,v10,4/7] net: stmmac: configure FPE via ethtool-mm
    https://git.kernel.org/netdev/net-next/c/0f156aceeef7
  - [net-next,v10,5/7] net: stmmac: support fp parameter of tc-mqprio
    https://git.kernel.org/netdev/net-next/c/195e4f409a40
  - [net-next,v10,6/7] net: stmmac: support fp parameter of tc-taprio
    https://git.kernel.org/netdev/net-next/c/15d8a407a547
  - [net-next,v10,7/7] net: stmmac: silence FPE kernel logs
    https://git.kernel.org/netdev/net-next/c/22a805d880c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
