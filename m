Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B7810E9F
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Dec 2023 11:40:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC3A9C6C856;
	Wed, 13 Dec 2023 10:40:32 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3DF4C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Dec 2023 10:40:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2C95AB81C5B;
 Wed, 13 Dec 2023 10:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4146BC433C9;
 Wed, 13 Dec 2023 10:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702464030;
 bh=gBGwDl1h9LJYFn7XjCQfrAYckTOg4O2XoBJu+aLw4kw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=buS71OSkhJhu14QoAMDVI6faG6jGOmaIg903IiEFe40jKr53Kboqu1lp7w+h2EEVw
 oq0bi8/3kXsVandcB4LSIRP7HWzl2rUtp8qcpFnI6WxtCkHyNgl+jylEBpDBLFBCjO
 YTnZgaMSoY3rn4Pznkg0GcB6DlFQhb247m8n6ZjYCtXVshnJc8bufWpQV6XRxWU4+f
 m/R/f7Ee2N+77LBQqe8CnZfUhCN3hHKdvhk4Vl6KN2THYvbV6CbqJeT+MMc4gKuVyQ
 Utk7KmhiIXyz4yjk7B2n8BEXdUhc57TG3EhGThmJWJOkmKFOB7JaqTCfHj3M53XX7T
 mNsVeHPkXOlJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2BB3CDD4EF0; Wed, 13 Dec 2023 10:40:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170246403017.27343.5850945742501390562.git-patchwork-notify@kernel.org>
Date: Wed, 13 Dec 2023 10:40:30 +0000
References: <20231211060828.1629247-1-0x1207@gmail.com>
In-Reply-To: <20231211060828.1629247-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, rock.xu@nio.com, jpinto@synopsys.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: mmc: Support
 more counters for XGMAC Core
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

On Mon, 11 Dec 2023 14:08:28 +0800 you wrote:
> Complete all counters on XGMAC Core.
> These can be useful for debugging.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/mmc.h     |  14 +++
>  .../net/ethernet/stmicro/stmmac/mmc_core.c    | 117 +++++++++++++++++-
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  10 ++
>  3 files changed, 140 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [net-next,v1] net: stmmac: mmc: Support more counters for XGMAC Core
    https://git.kernel.org/netdev/net-next/c/e5bc1f4c6554

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
