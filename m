Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB89BA997
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 00:40:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23F6DC6DD94;
	Sun,  3 Nov 2024 23:40:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5A6AC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Nov 2024 23:40:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 45CB95C4CB7;
 Sun,  3 Nov 2024 23:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4216C4CECD;
 Sun,  3 Nov 2024 23:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730677220;
 bh=Fpk5/6wEk3/C7/XnnbdYZqJeyR/d7QRxg8mqahUQje0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=o5y1Se85YGaNi46PIpCG3IAkB/9cfCO/zEuGXlPlNZl44IP6NkIteQYvLzdTIAxRu
 6j124vRpxxT0uN7ViTo3CPUOUJ3/xksJhw+Zvf6w6Tcak/WGnDAKFloGWQheOy1JyP
 +wGBZMCZnoiULs2q3l6i44ZmJtXrRYmlHOw0FHVBs9sRHzCc1ahZ4fCCo9Ydr7eH3U
 qIQbXAH8hPHHBy5pjYvMjtjX/lQhEqDlzSuj8crVR+5Spb9HIf6TzC0w653QcdBlO2
 sA5pqauaU3x89iv2hAz6B4rWkmZz1vOuXfBwHIYnQkJ/0UMBkaMrPZUtRznqnsjAC/
 AuEanAEtsqQ3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 710B738363C3; Sun,  3 Nov 2024 23:40:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173067722927.3278663.4571680407072079402.git-patchwork-notify@kernel.org>
Date: Sun, 03 Nov 2024 23:40:29 +0000
References: <cover.1730449003.git.0x1207@gmail.com>
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: andrew@lunn.ch, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 horms@kernel.org, xfr@outlook.com, kuba@kernel.org, olteanv@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v8 0/8] net: stmmac: Refactor FPE
 as a separate module
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  1 Nov 2024 21:31:27 +0800 you wrote:
> Refactor FPE implementation by moving common code for DWMAC4 and
> DWXGMAC into a separate FPE module.
> 
> FPE implementation for DWMAC4 and DWXGMAC differs only for:
> 1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
> 2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
> 3) Bit offset of Frame Preemption Interrupt Enable
> 
> [...]

Here is the summary with links:
  - [net-next,v8,1/8] net: stmmac: Introduce separate files for FPE implementation
    https://git.kernel.org/netdev/net-next/c/2c6ad81de163
  - [net-next,v8,2/8] net: stmmac: Rework macro definitions for gmac4 and xgmac
    https://git.kernel.org/netdev/net-next/c/61e6051f4bbb
  - [net-next,v8,3/8] net: stmmac: Introduce stmmac_fpe_supported()
    https://git.kernel.org/netdev/net-next/c/af478ca82204
  - [net-next,v8,4/8] net: stmmac: Refactor FPE functions to generic version
    https://git.kernel.org/netdev/net-next/c/c9cd9a5a834c
  - [net-next,v8,5/8] net: stmmac: Get the TC number of net_device by netdev_get_num_tc()
    https://git.kernel.org/netdev/net-next/c/2558fe30ae8b
  - [net-next,v8,6/8] net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
    https://git.kernel.org/netdev/net-next/c/df9e7b0250ad
  - [net-next,v8,7/8] net: stmmac: xgmac: Complete FPE support
    https://git.kernel.org/netdev/net-next/c/b440d677e15f
  - [net-next,v8,8/8] net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio
    https://git.kernel.org/netdev/net-next/c/77be7d737305

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
