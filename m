Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329DA8517F
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Apr 2025 04:20:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2139C78F87;
	Fri, 11 Apr 2025 02:20:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0F35C78F80
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 02:20:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3B1D64A4A3;
 Fri, 11 Apr 2025 02:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53F0C4CEDD;
 Fri, 11 Apr 2025 02:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744338000;
 bh=mfLaG2nxVxcGauw+VJq2eXijJjVtz88YySLM2xjfeZA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Lp3cQLCv/cwNpt+DlYJTnDEjVyvk4bMg5uFILjjk2vsVKT+uwzQ/D/+ebmWEa5eW1
 gOCvZidtslgc2XOF6WNUWoY7XXmUxUMu3WFXZlbvhDFl2Kffa2Gac5+AZBk6j5E+xp
 UpR75r0UT5V/JZOyNY+m9ai163z1a7wZy2AEnxeidyFeo82s/qtU0PqnR/8wOfZV6S
 kiLROQ+CgpB5e87hh6+6ewzA9BpOFpMqXSMvpsZ0GP34GLp+JtcIBYJ96fzCFRk5uo
 D/r2BCuYFLUHZmXX79yD2XiyP1Skz8Eyyj3UKBUrvfoT4ARuENVjkaDwmSxb7KTbf5
 J8ApWMWWKjYkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE2A6380CEF4; Fri, 11 Apr 2025 02:20:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174433803749.3928161.6701102977698674868.git-patchwork-notify@kernel.org>
Date: Fri, 11 Apr 2025 02:20:37 +0000
References: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
In-Reply-To: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, treding@nvidia.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jonathanh@nvidia.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, prabhakar.csengg@gmail.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac:
	stmmac_pltfr_find_clk()
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

On Wed, 9 Apr 2025 08:55:09 +0100 you wrote:
> Hi,
> 
> The GBETH glue driver that is being proposed duplicates the clock
> finding from the bulk clock data in the stmmac platform data structure.
> iLet's provide a generic implementation that glue drivers can use, and
> convert dwc-qos-eth to use it.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: provide stmmac_pltfr_find_clk()
    https://git.kernel.org/netdev/net-next/c/de6487201949
  - [net-next,v2,2/2] net: stmmac: dwc-qos: use stmmac_pltfr_find_clk()
    https://git.kernel.org/netdev/net-next/c/34e816acdb0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
