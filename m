Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2BAE0F9A
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Jun 2025 00:29:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52081C32EA8;
	Thu, 19 Jun 2025 22:29:45 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FDC1C349C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 22:29:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 57A60A52637;
 Thu, 19 Jun 2025 22:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B6DC4CEEA;
 Thu, 19 Jun 2025 22:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750372183;
 bh=MwFEIjokl9M/QFuYv5v20kA6dUf/0XczzCLl9aA4Z1A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=eIBDh/ku7vb+pN8M07gOWUtgPTg1Y+zWF220QZTqdKeDkASWSurTjlIXfjg7lbLuB
 u1wjlrqjmmGI7HXwBhYoyJfVd3MowzLtDrRWw3AE7QOH6v4d0dO8hv4JkACONb2z9V
 LkZNZUBdvD/xPTA6NRBMmUeLflHsVadQqChcIfsBBLXrap/NYeIyMr1Y3QIB7e4Vgz
 JMUHiZQNW1+1HrAgue1chXee+IAshfL7iapH3o9A/q/2+4LCWA96SwT6mOiLXJl++b
 UJVSJCYo8zgLlGGc+LsjOPj8Nid9vTtObLxJujbZO8eKX7mrrw5qG5HCAH8iBsZxr/
 eVKgCMv7z1oOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C0338111DD; Thu, 19 Jun 2025 22:30:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175037221101.1006270.844600930827114048.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jun 2025 22:30:11 +0000
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
In-Reply-To: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, keguang.zhang@gmail.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: loongson1:
	cleanups
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

On Wed, 18 Jun 2025 11:41:18 +0100 you wrote:
> Hi,
> 
> A couple of patches to cleanup loongson1. First, introducing a match
> data struct to allow the per-match data to be extended beyond the init
> function pointer, and then adding a setup method to allow the resource
> base address to be translated to the MAC index at probe time rather
> than repeatedly in the setup function.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: loongson1: provide match data struct
    https://git.kernel.org/netdev/net-next/c/b1cffac4792b
  - [net-next,2/2] net: stmmac: loongson1: get ls1b resource only once
    https://git.kernel.org/netdev/net-next/c/e3527bf4dc33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
