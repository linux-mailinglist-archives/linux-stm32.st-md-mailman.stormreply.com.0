Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F46C08893
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 04:11:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C80BC5F1F9;
	Sat, 25 Oct 2025 02:11:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83882C5F1F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 02:10:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D31360233;
 Sat, 25 Oct 2025 02:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218BDC4CEF1;
 Sat, 25 Oct 2025 02:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761358258;
 bh=T+Ll2yJOvJipZ1CY2YovdDE7zLS7U/JxGi1g5MOaDY0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GQyXSBVNQ2gsh3VbvCWUJkxOtGBi2PvK5Uw2J8I/7Q6gYDbzftF5Mmb8R2ZuiO2iP
 VmrhQUjxJ/GIuekc0+02OscV0BXaDpJPGZYM1OuYI/SDhVjIPRwB04P/hQ5rMpDLPi
 owxEMYdolKhPn/Rk9WQBnzcpVK1AaugLKzTgxeCNkTO5l47JMbYd1u0s1/YZ+QpoFg
 UTdtjIkbgebSFZqfzlK/jGhowr2zh3ICOPFavSd8aVnPU0gKRoK/A5R0adJyZhhDmF
 WSXDevQpnjo4FSklWCyeBR/Yife6fP1EzCiAT1/0LG30ABaaa54dOqfDYuajcVf4IF
 RYXIZDIbLPtTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAEA0380AA59; Sat, 25 Oct 2025 02:10:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176135823749.4124588.15892332311706478682.git-patchwork-notify@kernel.org>
Date: Sat, 25 Oct 2025 02:10:37 +0000
References: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
In-Reply-To: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, christophe.roullier@foss.st.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 florian.fainelli@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, horms@kernel.org,
 Tristram.Ha@microchip.com, krzk+dt@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/6] net: add phylink managed
 WoL and convert stmmac
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

On Thu, 23 Oct 2025 10:16:11 +0100 you wrote:
> Hi,
> 
> This series is implementing the thoughts of Andrew, Florian and myself
> to improve the quality of Wake-on-Lan (WoL) implementations.
> 
> This changes nothing for MAC drivers that do not wish to participate in
> this, but if they do, then they gain the benefit of phylink configuring
> WoL at the point closest to the media as possible.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/6] net: phy: add phy_can_wakeup()
    https://git.kernel.org/netdev/net-next/c/330ce8ffc184
  - [net-next,v2,2/6] net: phy: add phy_may_wakeup()
    https://git.kernel.org/netdev/net-next/c/b344bfacf1de
  - [net-next,v2,3/6] net: phylink: add phylink managed MAC Wake-on-Lan support
    https://git.kernel.org/netdev/net-next/c/b79fbd86c849
  - [net-next,v2,4/6] net: phylink: add phylink managed wake-on-lan PHY speed control
    https://git.kernel.org/netdev/net-next/c/dc1a2a9ce5b2
  - [net-next,v2,5/6] net: stmmac: convert to phylink-managed Wake-on-Lan
    https://git.kernel.org/netdev/net-next/c/6911308d7d11
  - [net-next,v2,6/6] net: stmmac: convert to phylink managed WoL PHY speed
    https://git.kernel.org/netdev/net-next/c/d65cb2e27e6e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
