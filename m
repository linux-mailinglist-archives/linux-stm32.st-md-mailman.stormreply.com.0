Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96671D1559E
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 22:01:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43C19C5EC44;
	Mon, 12 Jan 2026 21:01:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7B1FC01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 21:01:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 44D49442B0;
 Mon, 12 Jan 2026 21:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2174BC19422;
 Mon, 12 Jan 2026 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768251665;
 bh=k7U6XE4P8/KYbGOb2zFtfsApeLHHAiP3CuB5iFN4w6U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Svj3EGCPDfuNEYP0Cybqqnx6ZvkmXYU/JQFPzf6nZJ4DOZco7xBEus9la0f3rCnRO
 d4rJDvXi+sF8ShlnjiruBhGG74w/p91auQAuj5N8wqoxlOY1NncKOXfoqstP6KIK7f
 VH/t1IGxvxg/u0SYBFyQgg21BRqJY+e2b+uGRHQPfz7Dip6NsKU2/R6XGa0lcdDIeN
 pLA2dk3QXNHIqY7UYS4L+YcvgZMq5MlA0eEV4E57a6os6ARotNH3wu10dZ8zeiDF4P
 6zm4xmJUP6ZVS7KTbihNBuZ37A/nRD753erH9fbL64u+t/VLiyGTYt+P8FjIXKJ3eF
 7dBIOLmEKJOlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3BAF7380CFD5; Mon, 12 Jan 2026 20:57:40 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176825145877.1092878.14865875892594291102.git-patchwork-notify@kernel.org>
Date: Mon, 12 Jan 2026 20:57:38 +0000
References: <20260108-gxring_stmicro-v2-1-3dcadc8ed29b@debian.org>
In-Reply-To: <20260108-gxring_stmicro-v2-1-3dcadc8ed29b@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: convert to use
 .get_rx_ring_count
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
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 08 Jan 2026 03:43:00 -0800 you wrote:
> Convert the stmmac driver to use the new .get_rx_ring_count
> ethtool operation instead of implementing .get_rxnfc for handling
> ETHTOOL_GRXRINGS command.
> 
> Since stmmac_get_rxnfc() only handled ETHTOOL_GRXRINGS (returning
> -EOPNOTSUPP for all other commands), remove it entirely and replace
> it with the simpler stmmac_get_rx_ring_count() callback.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/959728f9931e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
