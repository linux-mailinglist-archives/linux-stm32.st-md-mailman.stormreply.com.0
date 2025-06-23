Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 407A9AE4DD0
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 21:59:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF031C36B13;
	Mon, 23 Jun 2025 19:59:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A149AC36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 19:59:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5375043A9B;
 Mon, 23 Jun 2025 19:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29058C4CEEA;
 Mon, 23 Jun 2025 19:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750708779;
 bh=VZ3m66PTUnHfamACT4jCJE5I9AkGJuqWAgQW73lk4PU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DMfBvUyZ1gJ59ihAbsJRkaCldcfa4DgHj1AKsy7+7ecI9YWabflDOktQ7N8EtaPH6
 RFzjP6xo6Hda+ltWdQT7NmjK4n5H7zmqcncQk/Xbe2tJ2EpfSBnsPL3V+1JL8AbEm5
 Xlhz4sjTR6jewDNCHL2Sf1GhWY1vGzMJTaFVdQSsCqSJbrTboh4erdZTZahlJZ2Fzk
 SGBRQL/3BGyRwuI+YZyS9RcaL4lFVcaoNNSDdwnIFvVN7G6+UYgm0qzRz7YAXX67+o
 LATSXASzIQp4kzOki2zTE+OuE9oCIKttZpT0wEG6sQAa5hiv9f6jar3DDQ70HMOfpu
 44g381Kw0BK1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7336C38111DD; Mon, 23 Jun 2025 20:00:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175070880626.3280891.5905917830342989849.git-patchwork-notify@kernel.org>
Date: Mon, 23 Jun 2025 20:00:06 +0000
References: <E1uSBri-004fL5-FI@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uSBri-004fL5-FI@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, vz@mleia.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: lpc18xx: use
 plat_dat->phy_interface
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

On Thu, 19 Jun 2025 10:47:26 +0100 you wrote:
> lpc18xx uses plat_dat->mac_interface, despite wanting to validate the
> PHY interface. Checking the DT files (arch/arm/boot/dts/nxp/lpc/), none
> of them specify mac-mode which means mac_interface and phy_interface
> will be identical.
> 
> mac_interface is only used when there is some kind of MII converter
> between the DesignWare MAC and PHY, and describes the interface mode
> that the DW MAC needs to use, whereas phy_interface describes the
> interface mode that the PHY uses.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: lpc18xx: use plat_dat->phy_interface
    https://git.kernel.org/netdev/net-next/c/9f22c3ddb8cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
