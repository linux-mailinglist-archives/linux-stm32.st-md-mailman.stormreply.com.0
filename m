Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD87B38FB7
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 02:20:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 225B6C3F958;
	Thu, 28 Aug 2025 00:20:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE6FAC3F957
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 00:20:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C488560236;
 Thu, 28 Aug 2025 00:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75385C4CEEB;
 Thu, 28 Aug 2025 00:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756340406;
 bh=aHeD1aY+qybOF2MyfLbGundw1HAEI2tqJvxtmi3Qw/U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LKmwfu7EHjfehihErSqcf5xhSZpGelriAcJqReGjZEWRHMG0ukUwzBfpAiGFjK5X/
 woBVjMzQfva3EJQlyJAhKs+I3r4lDVdFeI0LP8ET2UXapzFdn8C0Y9yMS/5cUxQEsE
 Zq/bqUdNiZyDXczcSxbSOlOCYXP+NfeZTX9pcLqkQOrPaX91xvo49vfSLNa6kSQfi3
 5tREyjUtNSWv5mNH36Kbh7CcSSQ+8qzpAQXF2LSR2Xew55M07wlwiFqk8FrhNQPITM
 DnLjDkPF5H/mbRi/WRq0nMgJGbtCzxnwMbC6oNItJpnuYKduwI84k/naMrj8n4dfDk
 6D+oPjXxtuOfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAFC9383BF76; Thu, 28 Aug 2025 00:20:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175634041376.884225.299755705945387138.git-patchwork-notify@kernel.org>
Date: Thu, 28 Aug 2025 00:20:13 +0000
References: <20250826102219.49656-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250826102219.49656-1-alok.a.tiwari@oracle.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: horms@kernel.org, jonas@kwiboo.se, netdev@vger.kernel.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, rmk+kernel@armlinux.org.uk, mcoquelin.stm32@gmail.com,
 david.wu@rock-chips.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: rk: remove
 incorrect _DLY_DISABLE bit definition
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

On Tue, 26 Aug 2025 03:22:15 -0700 you wrote:
> The RK3328 GMAC clock delay macros define enable/disable controls for
> TX and RX clock delay. While the TX definitions are correct, the
> RXCLK_DLY_DISABLE macro incorrectly clears bit 0.
> 
> The macros RK3328_GMAC_TXCLK_DLY_DISABLE and
> RK3328_GMAC_RXCLK_DLY_DISABLE are not referenced anywhere
> in the driver code. Remove them to clean up unused definitions.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: rk: remove incorrect _DLY_DISABLE bit definition
    https://git.kernel.org/netdev/net-next/c/705609dedea1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
