Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 312289E8301
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Dec 2024 02:40:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1872C7801E;
	Sun,  8 Dec 2024 01:40:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C036C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Dec 2024 01:40:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E27745C4B60;
 Sun,  8 Dec 2024 01:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455B2C4CECD;
 Sun,  8 Dec 2024 01:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733622012;
 bh=VyiblBiYlxn7Uc7Og93Odk9bRuYvCt+pFQYcjLF4aak=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FsUEyrDIc2ScY6FxH2CjAQDZ4naGABhNjTw5cFRzwDX6PCnQREtJYZKyrNLnHQS8k
 wbFY7pli1+pGibZtL2W6TgPNrZbNCEtdfj3Pjt9rhKB9TDteEZ7vxK4wsPXFCpOjX/
 0C2v/QAmDU90Sk850SOcKn63o1MZyzuK1w/snlL3GTKH7R5Vx5ARDHVgi9P6+Qns5a
 f70ZQhrXO4PrDl2VEM858n6PF3TjNcMzKZror2MJyq4L0+M4KehUnsMIP4g3POK2FQ
 STQbj27fCQxX9IasnwAoWofeBs5pgSa4UyoJ+vmskbwIWWMo+1hfFrzCpeDnWFlTtH
 mVnjehQ56KCaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE941380A95D; Sun,  8 Dec 2024 01:40:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173362202750.3128634.12775021527593555165.git-patchwork-notify@kernel.org>
Date: Sun, 08 Dec 2024 01:40:27 +0000
References: <E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: jonathanh@nvidia.com, 0x1207@gmail.com, horms@kernel.org,
 davem@davemloft.net, netdev@vger.kernel.org, hkelam@marvell.com,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
 joabreu@synopsys.com, thierry.reding@gmail.com, mcoquelin.stm32@gmail.com,
 xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix TSO DMA API usage
	causing oops
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

On Fri, 06 Dec 2024 12:40:11 +0000 you wrote:
> Commit 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap
> for non-paged SKB data") moved the assignment of tx_skbuff_dma[]'s
> members to be later in stmmac_tso_xmit().
> 
> The buf (dma cookie) and len stored in this structure are passed to
> dma_unmap_single() by stmmac_tx_clean(). The DMA API requires that
> the dma cookie passed to dma_unmap_single() is the same as the value
> returned from dma_map_single(). However, by moving the assignment
> later, this is not the case when priv->dma_cap.addr64 > 32 as "des"
> is offset by proto_hdr_len.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix TSO DMA API usage causing oops
    https://git.kernel.org/netdev/net/c/4c49f38e20a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
