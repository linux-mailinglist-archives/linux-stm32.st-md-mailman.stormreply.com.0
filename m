Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4ABC7C2C0
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Nov 2025 03:20:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19A56C56600;
	Sat, 22 Nov 2025 02:20:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F9BEC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Nov 2025 02:20:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 272BE600B0;
 Sat, 22 Nov 2025 02:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2420C4CEF1;
 Sat, 22 Nov 2025 02:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763778051;
 bh=N/GqJc5kp4W33XuSJpLT2jBZ4MHlInurgmhHBSKSiAc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=vDn0ls5eNfi3PLIKOS56zjr42iSAO/TrxI3WymCFuEAFPjhcCZ3eA0VS8kcZpg64c
 Cs7v3QTZLXc73kfsOBaVBjuvB/MU/SMYC/X6FIJtWaYN4A2EMnxwj9c5UmmuEfGBW6
 nx4jfhsQwsC6+c7FUSn5nupGkj4Y1Bf+pE2E8+Q9446/SfGM2cHGwt3eiwPeFzA4cZ
 MIz6LTQ5gQLHZgJ+I7I5rNvKjsOXSWnDz8GVu+9IIDXcH4gRhhyM4moZ2YjdokbH+W
 4DIW9rDvbmpbmUlbAgkfiyvOaMftePQ/eRq8wyzaM7Jw+yUiESHieKRACIlNf86e8Y
 +EW5qOFPd+GmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7112F3A78B25; Sat, 22 Nov 2025 02:20:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176377801599.2657243.16800744775068465298.git-patchwork-notify@kernel.org>
Date: Sat, 22 Nov 2025 02:20:15 +0000
References: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
In-Reply-To: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: qcon-ethqos:
 "rgmii" accessor cleanups
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

On Thu, 20 Nov 2025 11:24:59 +0000 you wrote:
> This series cleans up the "rgmii" accessors in qcom-ethqos.
> 
> readl() and writel() return and take a u32 for the value. Rather than
> implicitly casting this to an int, keep it as a u32.
> 
> Add set/clear functions to reduce the code and make it easier to read.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: stmmac: qcom-ethqos: use u32 for rgmii read/write/update
    https://git.kernel.org/netdev/net-next/c/f54bbd390f5f
  - [net-next,v2,2/3] net: stmmac: qcom-ethqos: add rgmii set/clear functions
    https://git.kernel.org/netdev/net-next/c/819212185ae5
  - [net-next,v2,3/3] net: stmmac: qcom-ethqos: use read_poll_timeout_atomic()
    https://git.kernel.org/netdev/net-next/c/9b60ba512c7f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
