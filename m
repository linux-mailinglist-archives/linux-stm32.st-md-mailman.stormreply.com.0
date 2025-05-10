Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB93CAB208D
	for <lists+linux-stm32@lfdr.de>; Sat, 10 May 2025 02:39:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FA1EC7A82A;
	Sat, 10 May 2025 00:39:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3C1BC7A827
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 May 2025 00:39:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7E380629F6;
 Sat, 10 May 2025 00:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEDBC4CEE4;
 Sat, 10 May 2025 00:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746837593;
 bh=hU5x5nV621PCXb98dd7QNAbrE73+PaQ5xx0FQ9+8knM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=A7+jNr0HNwuo15U+Nm15rn6xSLrb4t7GyjtyBFUwopRjXp4IlcaNbkKMFtZvPG6nZ
 NulpbIMpXB5V1uGCx1zvlZoHGIP/e9UQN+kKWQBLNNlZrypakkjxhLoR6hT8PTmudr
 1rE/xK6DCE/gFicMObwo6gZp0L9fu+L3eI8JBgJbrXdYdk/IytKRFZOVgcm7oVN+ns
 0jNCP0VrtQwAH1JngkV+jh4TJIWinoppC9jA0a6q7MilxMZHAYiGzIoJAZeCXTKTuc
 rgAUzEk+kAOOsuvpvVo8RRfZVEfdkJKWQBGTzxbapLMe67LpwUUXhnJ9/KWaVwvnU2
 5ipkrFFWiCnlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADCB4381091A; Sat, 10 May 2025 00:40:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174683763150.3852829.17036982288908409763.git-patchwork-notify@kernel.org>
Date: Sat, 10 May 2025 00:40:31 +0000
References: <20250507063812.34000-1-boon.khai.ng@altera.com>
In-Reply-To: <20250507063812.34000-1-boon.khai.ng@altera.com>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Cc: ast@kernel.org, linux@armlinux.org.uk, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, 0x1207@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 hawk@kernel.org, rohan.g.thomas@altera.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mun.yew.tham@altera.com, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, tien.sung.ang@altera.com,
 matthew.gerlach@altera.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v5 0/3] Refactoring designware
	VLAN code.
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

On Wed,  7 May 2025 14:38:09 +0800 you wrote:
> Refactoring designware VLAN code and introducing support for
> hardware-accelerated VLAN stripping for dwxgmac2 IP,
> the current patch set consists of two key changes:
> 
> 1) Refactoring VLAN Functions:
> The first change involves moving common VLAN-related functions
> of the DesignWare Ethernet MAC into a dedicated file, stmmac_vlan.c.
> This refactoring aims to improve code organization and maintainability
> by centralizing VLAN handling logic.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/3] net: stmmac: Refactor VLAN implementation
    https://git.kernel.org/netdev/net-next/c/1d2c7a5fee31
  - [net-next,v5,2/3] net: stmmac: stmmac_vlan: rename VLAN functions and symbol to generic symbol.
    https://git.kernel.org/netdev/net-next/c/f3acaf7364a6
  - [net-next,v5,3/3] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN stripping
    https://git.kernel.org/netdev/net-next/c/534df0c1724b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
