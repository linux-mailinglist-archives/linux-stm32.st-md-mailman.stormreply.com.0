Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4668D583F
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 03:40:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5C2AC71288;
	Fri, 31 May 2024 01:40:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96FFDC030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 01:40:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DDA77CE1BD6;
 Fri, 31 May 2024 01:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06EF9C4AF07;
 Fri, 31 May 2024 01:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717119633;
 bh=4MX+4QyA9aY/3tLLMNgCFcl/V8UrJJEv3wyQpCxZSU0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tiQFP/7AtYOHf/cmqm3vzihtMQcTIPTfwMDEgiwMVwrzWqJWlNKA2EVwvxpRDRQ/d
 D8lYvBABhsjsiVLB1N8lw8rGKLDFbU1Wn8qEXic2Xd0y9eSVrRHcKpWwRzBmpRKQ4j
 dHKr7gEuAL3pBtky6ftDw4CUhxE4N5EdU3btjRLq8J8pvCj8Pb1lqXQZ+eCQyjrUsX
 a2XH+33UKSwuTyAHHMnOcp1VSDZ3HdZB54yLT+hglhtuXo4fuLpOw/IM68J9sLMoQe
 YwO+OP1brYj3BO9b62UPOlZSRwNC2GxSdz2BrtrGnATPBKm2b9WJO1TBheDqBPbT3/
 98d0ORFyrdQlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EB8B2D84BCD; Fri, 31 May 2024 01:40:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171711963296.18580.14971727622513760852.git-patchwork-notify@kernel.org>
Date: Fri, 31 May 2024 01:40:32 +0000
References: <ZlctinnTT8Xhemsm@shell.armlinux.org.uk>
In-Reply-To: <ZlctinnTT8Xhemsm@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, madalin.bucur@nxp.com, sean.anderson@seco.com,
 netdev@vger.kernel.org, ahalaney@redhat.com, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: phylink: rearrange
	ovr_an_inband support
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

On Wed, 29 May 2024 14:28:42 +0100 you wrote:
> Hi,
> 
> This series addresses the use of the ovr_an_inband flag, which is used
> by two drivers to indicate to phylink that they wish to use inband mode
> without firmware specifying inband mode.
> 
> The issue with ovr_an_inband is that it overrides not only PHY mode,
> but also fixed-link mode. Both of the drivers that set this flag
> contain code to detect when fixed-link mode will be used, and then
> either avoid setting it or explicitly clear the flag. This is
> wasteful when phylink already knows this.
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: phylink: rearrange phylink_parse_mode()
    https://git.kernel.org/netdev/net-next/c/75518b0dc9d6
  - [net-next,2/6] net: phylink: move test for ovr_an_inband
    https://git.kernel.org/netdev/net-next/c/fea49f065c1c
  - [net-next,3/6] net: phylink: rename ovr_an_inband to default_an_inband
    https://git.kernel.org/netdev/net-next/c/02d00dc73d8d
  - [net-next,4/6] net: fman_memac: remove the now unnecessary checking for fixed-link
    https://git.kernel.org/netdev/net-next/c/5e332954e760
  - [net-next,5/6] net: stmmac: rename xpcs_an_inband to default_an_inband
    https://git.kernel.org/netdev/net-next/c/83f55b01dd90
  - [net-next,6/6] net: stmmac: dwmac-intel: remove checking for fixed link
    https://git.kernel.org/netdev/net-next/c/ab77c7aa9388

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
