Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF91E401B1B
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Sep 2021 14:24:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8288C59783;
	Mon,  6 Sep 2021 12:24:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 621ACC5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Sep 2021 12:24:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D23AA60F45;
 Mon,  6 Sep 2021 12:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630931045;
 bh=Zy6R3EZkqy/7oKKjFPZvaCgdsk/p/dmxINF1eormd2I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=mobPM3FuHmPvktTp1XetDVVecmIwCeUfsHDs8j5oSSKxvo2JqTryi/bn+1d6a1vIj
 uSMHzRYAvL+y36YcYNSjJYH8Z5IK3MEH8QVqtGIgmHpHPTe//3D70lYo/KnnGkKL/3
 AbdKVXL/TOc/aH9Y2B/Ua55wXVcH1g2pE+KuqUyGU2aVqpkqZ81ytcGEzcWX8NyBBy
 8lfvP41sJxZdxfFTOY3Q58B4TofqImwr8yLj+oH6cULSwzrLbNlqgx2Mp8A89/scDT
 ZA50tobH/qFBtF4eWP1e0JP3spgFNBMTNiPedyOF2yJHk1+ooNQlYSbL0JqbnL/Cie
 8uRYYsacyFA+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C544F60A37;
 Mon,  6 Sep 2021 12:24:05 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163093104580.13830.7607505980479153914.git-patchwork-notify@kernel.org>
Date: Mon, 06 Sep 2021 12:24:05 +0000
References: <20210906072107.10906-1-long870912@gmail.com>
In-Reply-To: <20210906072107.10906-1-long870912@gmail.com>
To: zhaoxiao <long870912@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: dwmac-loongson:Fix missing return
	value
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

This patch was applied to netdev/net.git (refs/heads/master):

On Mon,  6 Sep 2021 15:21:07 +0800 you wrote:
> Add the return value when phy_mode < 0.
> 
> Signed-off-by: zhaoxiao <long870912@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Here is the summary with links:
  - stmmac: dwmac-loongson:Fix missing return value
    https://git.kernel.org/netdev/net/c/5289de5929d1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
