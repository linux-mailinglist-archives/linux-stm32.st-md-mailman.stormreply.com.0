Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9389C81A1
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 05:00:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F193C78F9A;
	Thu, 14 Nov 2024 04:00:26 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E99CBC78F97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 04:00:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A947AA41305;
 Thu, 14 Nov 2024 03:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893A6C4CED6;
 Thu, 14 Nov 2024 04:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731556818;
 bh=PnNfyH7oj2zLbHLnS0rQSp9amgAB2vTxjz+mg5/8YQ4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gDfaDJzAMh+THnR6WKVi24HDZx6aSgpYS9mtgYKufIKyrOA4B3kxpfeAhZ320BBmU
 3meMYIw2AQy73alGMq1QN5PLrzzf9yzOr+DisUwlHqbY3spq4m+iyfEpnqcQQ1Z/Y6
 kvxmPCULxZpTRi+86oYG0wtHAFEZaySUtS5cz+iVA13jv0TAARVx2h7DLmwsqe+7/n
 9+IdKnHlaqVsOKrbqzrV5w+nrA5ZEsjT/AIGmZFW9FuDI/E1AYe8pu8H6M0CfmXoI0
 n55gzKLKwhI5F9IqNqlStr7f68bjy8iyYerXA1DOc6eI8OFYM9CTVJQfH0mjtNqgoz
 cVePidPqpyyvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 346383809A80; Thu, 14 Nov 2024 04:00:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173155682899.1476954.2028843277597147808.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 04:00:28 +0000
References: <20241108173334.2973603-1-mordan@ispras.ru>
In-Reply-To: <20241108173334.2973603-1-mordan@ispras.ru>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 netdev@vger.kernel.org, pchelkin@ispras.ru,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mutilin@ispras.ru, khoroshilov@ispras.ru,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2]: stmmac: dwmac-intel-plat: fix
 call balance of tx_clk handling routines
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  8 Nov 2024 20:33:34 +0300 you wrote:
> If the clock dwmac->tx_clk was not enabled in intel_eth_plat_probe,
> it should not be disabled in any path.
> 
> Conversely, if it was enabled in intel_eth_plat_probe, it must be disabled
> in all error paths to ensure proper cleanup.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> [...]

Here is the summary with links:
  - [net,v2] : stmmac: dwmac-intel-plat: fix call balance of tx_clk handling routines
    https://git.kernel.org/netdev/net/c/5b366eae7193

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
