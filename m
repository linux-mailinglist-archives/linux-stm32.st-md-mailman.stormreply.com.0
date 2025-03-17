Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E6A65EF2
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Mar 2025 21:20:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 904FEC78F62;
	Mon, 17 Mar 2025 20:20:16 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BA62C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 20:20:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2DA22A48D3A;
 Mon, 17 Mar 2025 20:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A5BC4CEE3;
 Mon, 17 Mar 2025 20:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742242813;
 bh=PGe2zkk9t3wpiVapprqxZNUBlwXJz6fSOXIRXWg3MrM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=c00kyITzeyheVyBmzCx8pY6PlwOek/naieESbTbm4FbJlZFWWiKhfeewS2jh2a+Cb
 7umPiM/7p5nPceIxqBHWZ6Dj5qyA0aa+zZ4eaE5nqOVq1GNcdMIfrr9v8c7/B1DOQA
 LT2vMbaF5MPsmToJQn6Eh/XyO1GINQMZnwVhXKJuSznQ/Ynsf7EULHwA0w/zzQI7JZ
 /3DyllNlwwxI4J2qiOeHJkqRWqERyqNYEK+6iprqubwQM5ptz+0nQ7OaTuIrlp72wx
 3BPTFaLKb0+OwSBRX7b+oliJb8nVAZhX7yHPmIny3GKw6PBelk5rmc/sk45zqG9rSH
 +B/M3DEIqZCKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAEE0380DBE3; Mon, 17 Mar 2025 20:20:49 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174224284849.3901460.9366636522852386074.git-patchwork-notify@kernel.org>
Date: Mon, 17 Mar 2025 20:20:48 +0000
References: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
In-Reply-To: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, dan.carpenter@linaro.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/1] stmmac: intel: Fix
 warning message for return value in intel_tsn_lane_is_available()
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 10 Mar 2025 13:08:35 +0800 you wrote:
> Fix the warning "warn: missing error code? 'ret'" in the
> intel_tsn_lane_is_available() function.
> 
> The function now returns 0 to indicate that a TSN lane was found and
> returns -EINVAL when it is not found.
> 
> Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the interface mode")
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v1,1/1] stmmac: intel: Fix warning message for return value in intel_tsn_lane_is_available()
    https://git.kernel.org/netdev/net-next/c/38f13bf80130

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
