Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC83450F6
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 21:40:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F863C57B5E;
	Mon, 22 Mar 2021 20:40:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44D1FC5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 20:40:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D516961878;
 Mon, 22 Mar 2021 20:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616445607;
 bh=uOeMl8pGHKXuKl95ml116zP4b3bwod87xUannPmtFbo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IhZarDGyPWKpokrFvuaSTUpEp8CMJ7ny8mTVePUmFj2cylNnz/44P2ZcRrAd3jJ96
 IoD56R6OYTpp7vmp3FUag8PlnS3I2Ilxs0srKEY1RKBO7GcGwrGOmAH+qrlREVclK/
 Izs/7crq0CQ5w9YHi4qo0OnE7wVLouEU/HSeB7g4XsOgLzPt8jJoSSO9G9AgUwp/2+
 RLw6eyzlPK2Ce5mL7GcTqpppqJ3a8bSGR7tFx3t8NTSNMc4lQrQh2I3WK+I10JUGvI
 KciO8GcQhlqNY+VNQGUT6KP6X/CzOp76jWkmpLha1uZhHHMdW2WRq/m12yqypt34uN
 w1EfHLf07BgEA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C1E3960A6A;
 Mon, 22 Mar 2021 20:40:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161644560778.2928.15414100425036462948.git-patchwork-notify@kernel.org>
Date: Mon, 22 Mar 2021 20:40:07 +0000
References: <20210322122359.2980197-1-weiyongjun1@huawei.com>
In-Reply-To: <20210322122359.2980197-1-weiyongjun1@huawei.com>
To: 'w00385741 <weiyongjun1@huawei.com>
Cc: qiangqing.zhang@nxp.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, hulkci@huawei.com, joabreu@synopsys.com,
 p.zabel@pengutronix.de, kuba@kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: platform: fix build
 error with !CONFIG_PM_SLEEP
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Mon, 22 Mar 2021 12:23:59 +0000 you wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Get rid of the CONFIG_PM_SLEEP ifdefery to fix the build error
> and use __maybe_unused for the suspend()/resume() hooks to avoid
> build warning:
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:769:21:
>  error: 'stmmac_runtime_suspend' undeclared here (not in a function); did you mean 'stmmac_suspend'?
>   769 |  SET_RUNTIME_PM_OPS(stmmac_runtime_suspend, stmmac_runtime_resume, NULL)
>       |                     ^~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pm.h:342:21: note: in definition of macro 'SET_RUNTIME_PM_OPS'
>   342 |  .runtime_suspend = suspend_fn, \
>       |                     ^~~~~~~~~~
> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:769:45:
>  error: 'stmmac_runtime_resume' undeclared here (not in a function)
>   769 |  SET_RUNTIME_PM_OPS(stmmac_runtime_suspend, stmmac_runtime_resume, NULL)
>       |                                             ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pm.h:343:20: note: in definition of macro 'SET_RUNTIME_PM_OPS'
>   343 |  .runtime_resume = resume_fn, \
>       |                    ^~~~~~~~~
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: platform: fix build error with !CONFIG_PM_SLEEP
    https://git.kernel.org/netdev/net-next/c/7ec05a603548

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
