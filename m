Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAA39D9601
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 12:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E9A4C78002;
	Tue, 26 Nov 2024 11:10:24 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 394EDC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 11:10:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6353DA41BDF;
 Tue, 26 Nov 2024 11:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF89EC4CECF;
 Tue, 26 Nov 2024 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732619416;
 bh=YSELgeIz82RADEql14/t1EXb+6i2e+P7ABdlJAwN9VE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rQmhsDtGHgZCzvVzZBt7fn2ztuz20Lk+A/h46VRqrCaegCebr1Zbxo2NZ+Ob0zdOA
 UWzJpoSSu2iBALpetVFov1tDH/mgIgUgbGniciwikmzY+tueNM/DKk5WSAVk+1ACFU
 +tivys9qA0izpv1MFc2g/RydJfJIBBqmEiXPfLSuTFOwx75/QdQ61Qwtm/hLd1FG05
 tlaekR+3TJhzBcjRxfog2LP9GafXY1R68O+XECtmeLO/5DBPxFrf3FrXuiR6h3c49B
 2jUtq4QF/6SGbPAxM7hhHuEbEr8gWRfsaHL/V8zDY2EInxH6UxD1FqfWHNUI9xGfEi
 WXegTKljtYkAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB00A3809A00; Tue, 26 Nov 2024 11:10:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173261942880.352444.541353075631044825.git-patchwork-notify@kernel.org>
Date: Tue, 26 Nov 2024 11:10:28 +0000
References: <20241122141256.764578-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20241122141256.764578-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 alexis.lothore@bootlin.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-socfpga: Set RX
 watchdog interrupt as broken
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 22 Nov 2024 15:12:55 +0100 you wrote:
> On DWMAC3 and later, there's a RX Watchdog interrupt that's used for
> interrupt coalescing. It's known to be buggy on some platforms, and
> dwmac-socfpga appears to be one of them. Changing the interrupt
> coalescing from ethtool doesn't appear to have any effect here.
> 
> Without disabling RIWT (Received Interrupt Watchdog Timer, I
> believe...), we observe latencies while receiving traffic that amount to
> around ~0.4ms. This was discovered with NTP but can be easily reproduced
> with a simple ping. Without this patch :
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: dwmac-socfpga: Set RX watchdog interrupt as broken
    https://git.kernel.org/netdev/net/c/407618d66dba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
