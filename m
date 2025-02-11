Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A61A30167
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 03:20:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D490C78F96;
	Tue, 11 Feb 2025 02:20:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0394C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 02:20:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BA1835C60C9;
 Tue, 11 Feb 2025 02:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20754C4CED1;
 Tue, 11 Feb 2025 02:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739240409;
 bh=/GN4N5nnO94WYMURaR0RvvgyUUFidE5XpUnXxRw733s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hvWg+K0vwEV6OgFY2ctLrbT7/PP0BbBN+qlXZiX4Cgy41YQDEKl5XuXNmqAxcUycj
 J//rAqWqvB/0jZfsw9CCLtZCoAIT0BBC6P66/QxCVlPqlg0bbXKuWnBAz89aDdHYtk
 cjYZSdz6Y4jb896OAawwfUPnSlI6lzPqmsDZmV4r0x46RsOHzFWFHOdV5J5B+J9+M9
 UZvwD9sMFveF8Y/xBRlwwT+ZXi/jrtmDULvG/H52fUwaC0puBuYFypNh6bZLgFPCEI
 2YZbkbpZpr0yw3QSeQzVrJqO4VdJMQ8KNrXlXnZU4rI9oufbkA3HL3KePxv+0Pwz7E
 Ft/wnWNrrbjmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB8ED380AA7A; Tue, 11 Feb 2025 02:20:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173924043750.3915440.1883546430698083121.git-patchwork-notify@kernel.org>
Date: Tue, 11 Feb 2025 02:20:37 +0000
References: <20250207085639.13580-1-0x1207@gmail.com>
In-Reply-To: <20250207085639.13580-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: jonathanh@nvidia.com, idosch@idosch.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bgriffis@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, xfr@outlook.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: Apply new page pool
 parameters when SPH is enabled
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

On Fri,  7 Feb 2025 16:56:39 +0800 you wrote:
> Commit df542f669307 ("net: stmmac: Switch to zero-copy in
> non-XDP RX path") makes DMA write received frame into buffer at offset
> of NET_SKB_PAD and sets page pool parameters to sync from offset of
> NET_SKB_PAD. But when Header Payload Split is enabled, the header is
> written at offset of NET_SKB_PAD, while the payload is written at
> offset of zero. Uncorrect offset parameter for the payload breaks dma
> coherence [1] since both CPU and DMA touch the page buffer from offset
> of zero which is not handled by the page pool sync parameter.
> 
> [...]

Here is the summary with links:
  - [net,v1] net: stmmac: Apply new page pool parameters when SPH is enabled
    https://git.kernel.org/netdev/net/c/cb6cc8ed7717

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
