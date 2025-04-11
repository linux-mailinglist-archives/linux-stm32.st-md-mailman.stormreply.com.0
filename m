Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9EAA8577E
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Apr 2025 11:09:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A892C78F89;
	Fri, 11 Apr 2025 09:09:57 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79277C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 09:09:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E2869A4A928;
 Fri, 11 Apr 2025 09:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211D4C4CEE2;
 Fri, 11 Apr 2025 09:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744362595;
 bh=6VnD0MPm4z7HbKIrJbYr9StRxLA9SvujgHNIYJ4TYBc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=HJSTH6oG6BDrxeCL7BF0NekHosHOpetxnUp8beRbC/F3+drW98xQW5LKVkAxCY71c
 P/jGHOYiFxGVhetwoBg2Ti3FqJOgEPUxcgzU2rbWX4q69XXrS/ad7Hf28L7kjizdzn
 fXoxfwnsMS0IeiSJB+l/iZN7GtxxV7OVhtWNCyCXRLg2g9Bc8rZIE+lk5K2yRMBh+v
 rBY4ytt6/lV12/BZVSmNkwqDeGT+yl0BXsKRTyYxtYNjwYzDcQWBN3gBfYYwr3dpdk
 ao92avTf4P1IneuaRoPmAFwy9RS39eYPjTKDf4djeY39im+0SFn/XPOCr+H8tEUG/6
 5NK4p7C/Y+HdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EADFE38111DF; Fri, 11 Apr 2025 09:10:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174436263279.184109.16205129107386423128.git-patchwork-notify@kernel.org>
Date: Fri, 11 Apr 2025 09:10:32 +0000
References: <E1u1rwV-0013jc-Ez@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u1rwV-0013jc-Ez@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: stm32: simplify
	clock handling
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

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 07 Apr 2025 20:15:35 +0100 you wrote:
> Some stm32 implementations need the receive clock running in suspend,
> as indicated by dwmac->ops->clk_rx_enable_in_suspend. The existing
> code achieved this in a rather complex way, by passing a flag around.
> 
> However, the clk API prepare/enables are counted - which means that a
> clock won't be stopped as long as there are more prepare and enables
> than disables and unprepares, just like a reference count.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: stm32: simplify clock handling
    https://git.kernel.org/netdev/net-next/c/61499764e5cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
