Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC13CA704A2
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 16:10:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB9AC78F7F;
	Tue, 25 Mar 2025 15:10:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFCF2C78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 15:10:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1874243CE3;
 Tue, 25 Mar 2025 15:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5FDC4CEE4;
 Tue, 25 Mar 2025 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742915403;
 bh=LeTQS4831V5MzsLiMC9LAw9t50lIBowdpyY0TiML4j8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OSv+owgNR70SmVzshxqqtEMPZkBl/rNogjzzKsghyVHlQ28cLSkSU9S/GVwbqpgsq
 hUMhkGTKbJ4QDckbTjwRefRsG3C+58481bAz4v/iuCcIHMWR6LXkqfwdV2bMHUywZM
 5DLt3iDXsoGjGGu6GRI6rzgDeRTKkjRiC4ERjnzDbUyP5s7NTWOmL61d847gDli+aI
 r86gRcsJ0VfBhzqFu4Wmg0kAuLtov8i/nSGY52Odk9mDRowrmnZmS8WfIkJwGDCFY/
 sngqbstTr1Xy/huJRbp/lTdykx9mm7/aeG7I7zf37Rm5vsjWlXBPNTPtP1KESIqN1y
 BinaN4QGIvxaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B0FBF380CFE7; Tue, 25 Mar 2025 15:10:40 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174291543949.609648.15797575724114490670.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 15:10:39 +0000
References: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
In-Reply-To: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/5] net: improve stmmac resume
	rx clocking
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

On Thu, 20 Mar 2025 22:11:06 +0000 you wrote:
> Hi,
> 
> stmmac has had a long history of problems with resuming, illustrated by
> reset failure due to the receive clock not running.
> 
> Several attempts have been attempted over the years to address this
> issue, such as moving phylink_start() (now phylink_resume()) super
> early in stmmac_resume() in commit 90702dcd19c0 ("net: stmmac: fix MAC
> not working when system resume back with WoL a ctive.") However, this
> has the downside that stmmac_mac_link_up() can (and demonstrably is)
> called before or during the driver initialisation in another thread.
> This can cause issues as packets could begin to be queued, and the
> transmit/receive enable bits will be set before any initialisation has
> been done.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: phylink: add phylink_prepare_resume()
    https://git.kernel.org/netdev/net-next/c/367f1854d442
  - [net-next,2/5] net: stmmac: address non-LPI resume failures properly
    https://git.kernel.org/netdev/net-next/c/ef43e5132895
  - [net-next,3/5] net: stmmac: socfpga: remove phy_resume() call
    https://git.kernel.org/netdev/net-next/c/366aeeba7908
  - [net-next,4/5] net: phylink: add functions to block/unblock rx clock stop
    https://git.kernel.org/netdev/net-next/c/ddf4bd3f7384
  - [net-next,5/5] net: stmmac: block PHY RXC clock-stop
    https://git.kernel.org/netdev/net-next/c/dd557266cf5f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
