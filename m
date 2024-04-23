Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D25608AE235
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 12:30:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 822BCC7128A;
	Tue, 23 Apr 2024 10:30:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D76A2C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 10:30:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9E355612EE;
 Tue, 23 Apr 2024 10:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38AB2C2BD11;
 Tue, 23 Apr 2024 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713868231;
 bh=ZpvsKpOC8n9lQ6MW2xPW24HPfDqjR7WKOozGXE0/mVo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=AoVuOjsNcliEIpxWNQj6IHjFI37/OUpM+eoLolH5cxgGPRtcnNQqibE52JJ8IPdx9
 K0cehgY2l/osstWOyTI6ZAtVk/Q9AUbTqyFcqKV76v/UhZt3asNBNm3HlstChknUPh
 yf7E9A2tt0r5W5RyJs4prIwUjKbQZqd5z1MUzLX63wWuFcy/JpOFA4wepJpBsKlA2x
 h7cZ/xAEQ80etxPybKFaWEmK9ILe4SHOvjy1JvQ8liosRrdzrULhcXg7BDScTaBiaY
 j434owkYIJK2aH8HRI/DdMruFQwcdE4KHdgbY4HVHMgA2uFnxpQ5zlvFWuf67GGWNx
 Ks3T9IuVC5TJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 222FBC00448; Tue, 23 Apr 2024 10:30:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171386823113.5282.15525637149577989440.git-patchwork-notify@kernel.org>
Date: Tue, 23 Apr 2024 10:30:31 +0000
References: <20240419090357.5547-1-fancer.lancer@gmail.com>
In-Reply-To: <20240419090357.5547-1-fancer.lancer@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: samuel@sholland.org, siyanteng@loongson.cn, linux-kernel@vger.kernel.org,
 horms@kernel.org, romain.gantois@bootlin.com, netdev@vger.kernel.org,
 chenhuacai@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 jernej.skrabec@gmail.com, linux@armlinux.org.uk, wens@csie.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, linux-sunxi@lists.linux.dev,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v3 0/2] net: stmmac: Fix
 MAC-capabilities procedure
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 19 Apr 2024 12:03:04 +0300 you wrote:
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
  - [RESEND,net-next,v3,1/2] net: stmmac: Rename phylink_get_caps() callback to update_caps()
    https://git.kernel.org/netdev/net-next/c/dc144baeb4fb
  - [RESEND,net-next,v3,2/2] net: stmmac: Move MAC caps init to phylink MAC caps getter
    https://git.kernel.org/netdev/net-next/c/f951a64922a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
