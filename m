Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FDDB3EF63
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Sep 2025 22:20:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E4A8C3F94D;
	Mon,  1 Sep 2025 20:20:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D00BC3F94D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Sep 2025 20:20:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C0CD600AC;
 Mon,  1 Sep 2025 20:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B526DC4CEF0;
 Mon,  1 Sep 2025 20:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756758016;
 bh=b+CTfrXwA9iq3oHu9AuIj6WOquP0sdHtMd5L2jfSAxM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZTjx7sdHI81a8UjX9R+dyR6cLXTuRipnmdXqZLRnYgq5n/o6cZQRUp5kvQ5PDk5Aw
 vwbibTrTJRszJiAAAPJiRB9WW1Fb/6zInJGWg7QfVnhvHZX8nVJWpmKnAVopTGAzEs
 5i/OapC15ltlCkg/yFtueqAg5cZdZdGWmp43mfSXHpLSz2HjBXxSYgNyvUT3AecRdl
 TtBpreoRMIybgEFrtIhCSyhU4VoTaAjammkp1ZyzBe43zoxyzT+whiMaZPP+y2/caS
 MawuCsPYyjlGRDPB1g4n84SHxUrYzsS3KAsDQIZkGCxXK4No8Wfih6tfObJf6Bt0Bt
 Vi8dWHYLKBPhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADCB7383BF4E; Mon,  1 Sep 2025 20:20:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175675802230.3872744.15747918532068269574.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 20:20:22 +0000
References: <E1urv09-00000000gJ1-3SxO@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1urv09-00000000gJ1-3SxO@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: update
	runtime PM
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

On Fri, 29 Aug 2025 10:02:29 +0100 you wrote:
> Commit 3c7826d0b106 ("net: stmmac: Separate C22 and C45 transactions
> for xgmac") missed a change that happened in commit e2d0acd40c87
> ("net: stmmac: using pm_runtime_resume_and_get instead of
> pm_runtime_get_sync").
> 
> Update the two clause 45 functions that didn't get switched to
> pm_runtime_resume_and_get().
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: mdio: update runtime PM
    https://git.kernel.org/netdev/net-next/c/ec0b1eeece28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
