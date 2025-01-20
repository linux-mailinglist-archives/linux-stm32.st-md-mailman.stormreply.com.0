Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A2A17376
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2025 21:10:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AD7CC7801E;
	Mon, 20 Jan 2025 20:10:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73273C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 20:10:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BA64D5C5A97;
 Mon, 20 Jan 2025 20:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AA3C4CEE0;
 Mon, 20 Jan 2025 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737403811;
 bh=xcgzJ8GUf9rqfS8dk9jTNGkkqhrZ7aqAeGSP8qPm5UE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nXSFI/kwDkGArDabWY40dcJWvdgFVxBAO7myQEdpbsj39T5deX/y5CZwEgi5/nB6R
 oVf4vGAxmPe7I8XAGTx/6SAfNrw01qDlaY/06pmboQ0RTRVoIzIKddhpboSzy31gWf
 okExTF6OsgKniCUUZGpkkzDivBYLNRym5r6v9qXpJxPnXoKWlxB8VgjOKfOFo1tlLw
 2DedVe7ryuRx+MQ6HsV8fdNb79nE3+bLb8tQS7eA5oeNCRxlfgE9K8OqUvTHGYCn69
 bRxrfoQNE2cHRwpOniH3WgS/kVUZcoxCm0OGEXn+22IsCUqyBTGq/mw+53h97CAnPt
 bBr3Du7iEOpuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33BA9380AA62; Mon, 20 Jan 2025 20:10:36 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173740383476.3638218.15431747804261791679.git-patchwork-notify@kernel.org>
Date: Mon, 20 Jan 2025 20:10:34 +0000
References: <20250117062805.192393-1-0x1207@gmail.com>
In-Reply-To: <20250117062805.192393-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, xfr@outlook.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Drop redundant
 skb_mark_for_recycle() for SKB frags
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

On Fri, 17 Jan 2025 14:28:05 +0800 you wrote:
> After commit df542f669307 ("net: stmmac: Switch to zero-copy in
> non-XDP RX path"), SKBs are always marked for recycle, it is redundant
> to mark SKBs more than once when new frags are appended.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ------
>  1 file changed, 6 deletions(-)

Here is the summary with links:
  - [net-next,v1] net: stmmac: Drop redundant skb_mark_for_recycle() for SKB frags
    https://git.kernel.org/netdev/net-next/c/ba5f78505fb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
