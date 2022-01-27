Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D82B49E3F6
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jan 2022 15:00:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1778C0614D;
	Thu, 27 Jan 2022 14:00:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5518FC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jan 2022 14:00:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44A0E61CC0;
 Thu, 27 Jan 2022 14:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECE5FC36AE3;
 Thu, 27 Jan 2022 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643292011;
 bh=CYunBMddd9vXfgSmHRNWWiWCi6UBp8t/F0L+BGJTblw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GDqCgLj/oQJw5bzxosAu+/6SPgVHY/PzrLOsoqJEaQ27fLnjjm/Zt5r8HDw0NAve5
 blCbLhqGyU46Kk2AtJnw1oJcH7jzz+bSrawwRvDBxtFcuHoYdsEJpbBE9wnvc+50N+
 Ku3j7xMWpbWoPXnK470dKEqOECp4/8XrVeMojq120wWUTHp1y/GidaI/1gzsRhdA8R
 1A7wTcYW5jnu0AuWO7jijjfePhauzP2ogYJ4gKEe0CUv0MnmAw/dbf7hU/eQHvdHu3
 xPWePYCr7iU2M1PKz3/MDtuStZr34Lpj9kIV9gyC0XXWt/HwryHfy1qX4BAYiKT+Lh
 Moax/0wzh0R/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D2AB1E5D084; Thu, 27 Jan 2022 14:00:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164329201085.13469.12025143259464894463.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jan 2022 14:00:10 +0000
References: <20220126165215.1921-1-jszhang@kernel.org>
In-Reply-To: <20220126165215.1921-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, mripard@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, wens@csie.org, joabreu@synopsys.com,
 jernej.skrabec@gmail.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, linux-sunxi@lists.linux.dev, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sun8i: use return val
 of readl_poll_timeout()
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

On Thu, 27 Jan 2022 00:52:15 +0800 you wrote:
> When readl_poll_timeout() timeout, we'd better directly use its return
> value.
> 
> Before this patch:
> [    2.145528] dwmac-sun8i: probe of 4500000.ethernet failed with error -14
> 
> After this patch:
> [    2.138520] dwmac-sun8i: probe of 4500000.ethernet failed with error -110
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-sun8i: use return val of readl_poll_timeout()
    https://git.kernel.org/netdev/net/c/9e0db41e7a0b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
