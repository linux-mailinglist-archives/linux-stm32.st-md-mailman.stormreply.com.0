Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E28FB8A6C49
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 15:30:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E384C6B45B;
	Tue, 16 Apr 2024 13:30:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24D13C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 13:30:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EAA446122F;
 Tue, 16 Apr 2024 13:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2DE4C4AF09;
 Tue, 16 Apr 2024 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713274227;
 bh=aA4uqCpBb9JBwERSpmyHDsEJPn5nBkFkNMN/fMAMKSc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Aq6lFaCsdoy09SvzO0BEVTli2RWUVJv9xnmMPMmwT1BhfXe5tXfFoitvOkBM+gEAP
 pwCjJdM/6gMWzQAxWLS6kGx2sprkXwaTV2KbaQvw6pQH0Opa6iSnbfHBYG2ZQP1Lmr
 ba8gKFRacuNJFejnZz06+yCDKRrz+hKV4AlTkKrsE0qxxPEw1Ui8kJyAZgc9nl6YP4
 JvsMAmPMNiNXgr4cnVXA1a8DE0tsLhNHdWYB0772xoBY/wTVlfwh5Fzs3DtbWCMHio
 K0YIm9lYbdLNFlEXMyt+9T3rfygZs5NFFe1yywftFSkLU60ozktour23MM8XVZBGEa
 ABeYiQLpkLVKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A18A8D4F15D; Tue, 16 Apr 2024 13:30:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171327422765.18122.15477722399634396283.git-patchwork-notify@kernel.org>
Date: Tue, 16 Apr 2024 13:30:27 +0000
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
In-Reply-To: <20240412180340.7965-1-fancer.lancer@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: siyanteng@loongson.cn, linux-kernel@vger.kernel.org, horms@kernel.org,
 samuel@sholland.org, netdev@vger.kernel.org, chenhuacai@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jernej.skrabec@gmail.com,
 linux@armlinux.org.uk, wens@csie.org, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, linux-sunxi@lists.linux.dev, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/4] net: stmmac: Fix MAC-capabilities
	procedure
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 12 Apr 2024 21:03:13 +0300 you wrote:
> The series got born as a result of the discussions around the recent
> Yanteng' series adding the Loongson LS7A1000, LS2K1000, LS7A2000, LS2K2000
> MACs support:
> Link: https://lore.kernel.org/netdev/fu3f6uoakylnb6eijllakeu5i4okcyqq7sfafhp5efaocbsrwe@w74xe7gb6x7p
> 
> In particular the Yanteng' patchset needed to implement the Loongson
> MAC-specific constraints applied to the link speed and link duplex mode.
> As a result of the discussion with Russel the next preliminary patch was
> born:
> Link: https://lore.kernel.org/netdev/df31e8bcf74b3b4ddb7ddf5a1c371390f16a2ad5.1712917541.git.siyanteng@loongson.cn
> 
> [...]

Here is the summary with links:
  - [net,1/4] net: stmmac: Apply half-duplex-less constraint for DW QoS Eth only
    https://git.kernel.org/netdev/net/c/0ebd96f5da44
  - [net,2/4] net: stmmac: Fix max-speed being ignored on queue re-init
    https://git.kernel.org/netdev/net/c/59c3d6ca6cbd
  - [net,3/4] net: stmmac: Fix IP-cores specific MAC capabilities
    https://git.kernel.org/netdev/net/c/9cb54af214a7
  - [net-next,4/4] net: stmmac: Move MAC caps init to phylink MAC caps getter
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
