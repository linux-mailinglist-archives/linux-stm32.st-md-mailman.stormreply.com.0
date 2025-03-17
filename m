Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE793A65F91
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Mar 2025 21:50:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 641D8C78F62;
	Mon, 17 Mar 2025 20:50:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72322CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 20:50:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2109B5C5646;
 Mon, 17 Mar 2025 20:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B654C4CEE3;
 Mon, 17 Mar 2025 20:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742244606;
 bh=ZzO7p0E05LqQUhj5I6ptRTxYrMDxibfEvE+IQLvcR2I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WIqYclAprWpnECcYa5u9U47KpvZIh/uYc7FUI98D9SPU+XMWuYF0oHzqs98Kadm+0
 c5gWw5vft86A+ajmHFdQSSmnV3J1R1LRlnnEUZCFmiTMkzkSmJzLokDEePHn1LkaQH
 IqPUX7aAya8KdA1U5U6V9yTv20h1ldmReo8jxoutz3WK7IDJQvsOtHrwd5JTEFZS5k
 4S+B8m0B7xuXCW8YElOA3R30Qo/YzYRMo5goaA3b6AhIOjv6cH5CFaS1/ABkgvnSxj
 Z4GH0M3GPNE6WvQfVO+3cEp6xSIlDhO3eDU7Ao3RAVsZy3SSW7C3lhdvRcShLw4O6z
 UPHsb7FWky0Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33F98380DBE5; Mon, 17 Mar 2025 20:50:43 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174224464199.3909531.2901969920115907730.git-patchwork-notify@kernel.org>
Date: Mon, 17 Mar 2025 20:50:41 +0000
References: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
In-Reply-To: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: avoid
 unnecessary work in stmmac_release()/stmmac_dvr_remove()
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

On Mon, 10 Mar 2025 12:31:32 +0000 you wrote:
> Hi,
> 
> This small series is a subset of a RFC I sent earlier. These two
> patches remove code that is unnecessary and/or wrong in these paths.
> Details in each commit.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 -----
>  1 file changed, 5 deletions(-)

Here is the summary with links:
  - [net-next,1/2] net: stmmac: remove redundant racy tear-down in stmmac_dvr_remove()
    https://git.kernel.org/netdev/net-next/c/180fa8d0a2cb
  - [net-next,2/2] net: stmmac: remove unnecessary stmmac_mac_set() in stmmac_release()
    https://git.kernel.org/netdev/net-next/c/39b0a10d80d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
