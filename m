Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FDB9F8A93
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 04:30:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FD0CC78027;
	Fri, 20 Dec 2024 03:30:27 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D30BC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 03:30:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8B556A42AB1;
 Fri, 20 Dec 2024 03:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF1DC4CECE;
 Fri, 20 Dec 2024 03:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734665417;
 bh=YM6IcQzvMh0nBVLALsAQctJoSxEV75NUYhaBmFHz60s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Q4dNOESBlhZ+2RJ/IQZ38XF9PvrHb4IidwHQR6RZyr1gnbyWj6mGf0AvB/FYv8Uq8
 IfnSileWj1bYPN5X4mWBiocbLggz4X0IJ3c+pGexAl12E7XsbxvmM58dRpWv4VE0Wp
 KOZtXG3qWIu46FRK+2rTj2YqLg2kor+7EdU3jebgWxjqdjVg04BJLK1A1h2JOODBLR
 w+3NiloaUsLwly8dRbENkPp5gc+sv7JJQbK7ZZfyd8HUB2H5yceMm+taXiSmbj/VdW
 exmcQj6xlGedPElRr1VuVlKA3h/xxVGEoV2Iwms0SC34kp0Ax3hSdM74iuhfPJsHPW
 r5u8ED7b7fzlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADE053806656; Fri, 20 Dec 2024 03:30:36 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173466543521.2462446.17820764757552771854.git-patchwork-notify@kernel.org>
Date: Fri, 20 Dec 2024 03:30:35 +0000
References: <20241218083407.390509-1-0x1207@gmail.com>
In-Reply-To: <20241218083407.390509-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: mcoquelin.stm32@gmail.com, davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
 joabreu@synopsys.com, horms@kernel.org, xfr@outlook.com, kuba@kernel.org,
 pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Drop useless
 code related to ethtool rx-copybreak
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

On Wed, 18 Dec 2024 16:34:07 +0800 you wrote:
> After commit 2af6106ae949 ("net: stmmac: Introducing support for Page
> Pool"), the driver always copies frames to get a better performance,
> zero-copy for RX frames is no more, then these code turned to be
> useless and users of ethtool may get confused about the unhandled
> rx-copybreak parameter.
> 
> This patch mostly reverts
> commit 22ad38381547 ("stmmac: do not perform zero-copy for rx frames")
> 
> [...]

Here is the summary with links:
  - [net-next,v1] net: stmmac: Drop useless code related to ethtool rx-copybreak
    https://git.kernel.org/netdev/net-next/c/5c98e89d96ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
