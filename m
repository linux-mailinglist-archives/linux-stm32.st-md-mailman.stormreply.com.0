Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B3454AF6
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Nov 2021 17:30:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFD01C5E2CC;
	Wed, 17 Nov 2021 16:30:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7D7FC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Nov 2021 16:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2669160F90;
 Wed, 17 Nov 2021 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637166609;
 bh=pQXDu9LLYqVGI9NVMBVUnJKg0c2PxYxLHJoQh6fUaM0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BbiXDApr/FO6tbxiZ3CDC1y3D81oZ3E0dcXIL0yjT1eJZ1kEyWAfNmcSNS/cTm8G3
 L1pBlcelOmHws/NEL6enLI8IID5lRGPkYPX0l9cBlgc/GtGw61tl8PWScB0Ocy2j0l
 beXzsE61oqKmS/9OvKnPkgrPrVam5zRBdOazuzHMcRcvFyDEgLCt9sezuymz34SVRU
 5ZfY9v8xGZoqkSOtVcX2d6hIU//SQp7Jfd00YpU1fLZMLQF0oRKim6aOKAKBsXFJr/
 QEFwlJ+/2Zrl5Ukxc6FMpQ55neqzTRbIMCF6Fh4mIDA6fWa2poCOM0SVymu/9xki8g
 xVv0r8SnfOzdA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1489460A3A;
 Wed, 17 Nov 2021 16:30:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163716660907.26682.6507508277145411232.git-patchwork-notify@kernel.org>
Date: Wed, 17 Nov 2021 16:30:09 +0000
References: <20211117152917.3739-1-alexandr.lobakin@intel.com>
In-Reply-To: <20211117152917.3739-1-alexandr.lobakin@intel.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] stmmac: fix build due to brainos
 in trans_start changes
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 17 Nov 2021 16:29:17 +0100 you wrote:
> txq_trans_cond_update() takes netdev_tx_queue *nq,
> not nq->trans_start.
> 
> Fixes: 5337824f4dc4 ("net: annotate accesses to queue->trans_start")
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] stmmac: fix build due to brainos in trans_start changes
    https://git.kernel.org/netdev/net-next/c/e92af33e472c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
