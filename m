Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13027A54129
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 04:20:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5A7FC78F6E;
	Thu,  6 Mar 2025 03:20:04 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6C55C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 03:20:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0B5B5A45BA2;
 Thu,  6 Mar 2025 03:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506A9C4CEE9;
 Thu,  6 Mar 2025 03:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741231202;
 bh=puW1fkF16Qim9hZZEw4ModRCF3+zrl3JO6/d11Mn3Uk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hN+i3tkhBsXNtUnRx9tV1K3ezT65JSWich6bKEtNqjEB16j4/AnXmyeLyJwFpcY+v
 mz0SizSVVZ2G0R7l7mTgBqYv4vN97mJhSRCB6D1WrF7HKK1f6fm+pxW2lFwwie+aCe
 aJEIFrY2Z58zuUpeiiLRTs6SOK6T0765uz+uy2YHy7BH7q0YYELaxZE7ugKGDOBS2/
 q73tcgEuYon/1TdOyEKwMCYht45VykkNl/LHXGmEDgazQn1Iw6S/xJWWP8xiJc2NL9
 90zXfea49B/wVQDkAYGenbtXLbc7XZl45eOwDsUxrtuWKNeKRaqaE7Q8ZA86eCVxs7
 EFzIxwEW+ZipQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE2B5380CFF3; Thu,  6 Mar 2025 03:20:36 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174123123550.1112346.5967919465567432247.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 03:20:35 +0000
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
In-Reply-To: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: dave.hansen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 david.e.box@intel.com, edumazet@google.com, david.e.box@linux.intel.com,
 hpa@zytor.com, linux-stm32@st-md-mailman.stormreply.com, x86@kernel.org,
 linux@armlinux.org.uk, joabreu@synopsys.com, kuba@kernel.org,
 mengyuanlou@net-swift.com, Jose.Abreu@synopsys.com, horms@kernel.org,
 richardcochran@gmail.com, hdegoede@redhat.com, jiawenwu@trustnetic.com,
 bp@alien8.de, ilpo.jarvinen@linux.intel.com, tglx@linutronix.de,
 mingo@redhat.com, linux-arm-kernel@lists.infradead.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, fancer.lancer@gmail.com,
 andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, irenic.rajneesh@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v9 0/6] Enable SGMII and
 2500BASEX interface mode switching for Intel platforms
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

On Thu, 27 Feb 2025 20:15:16 +0800 you wrote:
> During the interface mode change, the 'phylink_major_config' function will
> be triggered in phylink. The modification of the following functions will
> support the switching between SGMII and 2500BASE-X interface modes for
> the Intel platform:
> 
> - xpcs_switch_interface_mode: Re-initiates clause 37 auto-negotiation for
>   the SGMII interface mode to perform auto-negotiation.
> - mac_finish: Configures the SerDes according to the interface mode.
> 
> [...]

Here is the summary with links:
  - [net-next,v9,1/6] net: phylink: use pl->link_interface in phylink_expects_phy()
    https://git.kernel.org/netdev/net-next/c/b63263555eaa
  - [net-next,v9,2/6] net: pcs: xpcs: re-initiate clause 37 Auto-negotiation
    https://git.kernel.org/netdev/net-next/c/065d3cef99a1
  - [net-next,v9,3/6] arch: x86: add IPC mailbox accessor function and add SoC register access
    https://git.kernel.org/netdev/net-next/c/7e2f7e25f6ff
  - [net-next,v9,4/6] net: stmmac: configure SerDes on mac_finish
    https://git.kernel.org/netdev/net-next/c/e654cfc718d4
  - [net-next,v9,5/6] net: stmmac: configure SerDes according to the interface mode
    https://git.kernel.org/netdev/net-next/c/a42f6b3f1cc1
  - [net-next,v9,6/6] net: stmmac: interface switching support for ADL-N platform
    https://git.kernel.org/netdev/net-next/c/7598ef621a43

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
