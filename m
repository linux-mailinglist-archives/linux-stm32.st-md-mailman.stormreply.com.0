Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A1A0341B
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 01:40:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0350C78011;
	Tue,  7 Jan 2025 00:40:23 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7037DC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 00:40:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CE3FEA41EAF;
 Tue,  7 Jan 2025 00:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502A9C4CED2;
 Tue,  7 Jan 2025 00:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736210415;
 bh=gA77aVxWP4yB6mTAj9/XUFdKsilOeWCCebwMj3rx0Fk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gmGoR9vuoiw6sebJ+fwBnazOUfuvK8S0tuKXsD71kr1wWFy2Dp9ImCGbR4O7Ekwmi
 vJDu/QuooT68RZpGDQijJK/PhuOaUBCvp0NY3uceqzI8znnLMtaVAGkaO3QIDuTacX
 pGPUwfV/YGOxe14GwE39N4ZG6RRM9MtgGKiSgxqARlH0kBlVnzRTKcUROVZz960qR0
 aOCtHqErjH372qkU0lhjMdNgAxSer0LAxDyugxCb0pLqYxeGuI670f/2mhLiu6ixDw
 341VmaUBeam6E2o9BoGGU1So3AMHvqqMv9/aXHEv9Q1OU46RzpypKl4nPgOjDwcefO
 onDzioS5VA/4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE127380A97E; Tue,  7 Jan 2025 00:40:37 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173621043648.3661002.8813298484787541928.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jan 2025 00:40:36 +0000
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
In-Reply-To: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch,
 linux-stm32@st-md-mailman.stormreply.com, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, andrew+netdev@lunn.ch, edumazet@google.com,
 joabreu@synopsys.com, lynxis@fe80.eu, mcoquelin.stm32@gmail.com,
 ioana.ciornei@nxp.com, matthias.bgg@gmail.com, kuba@kernel.org,
 hkallweit1@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: pcs: add
 supported_interfaces bitmap for PCS
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

On Fri, 3 Jan 2025 11:16:06 +0000 you wrote:
> Hi,
> 
> This series adds supported_interfaces for PCS, which gives MAC code a
> way to determine the interface modes that the PCS supports without
> having to implement functions such as xpcs_get_interfaces(), or
> workarounds such as in
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: phylink: add support for PCS supported_interfaces bitmap
    https://git.kernel.org/netdev/net-next/c/fbb9a9d263a6
  - [net-next,2/6] net: pcs: xpcs: fill in PCS supported_interfaces
    https://git.kernel.org/netdev/net-next/c/906909fabb81
  - [net-next,3/6] net: pcs: mtk-lynxi: fill in PCS supported_interfaces
    https://git.kernel.org/netdev/net-next/c/b87d4ee16bb4
  - [net-next,4/6] net: pcs: lynx: fill in PCS supported_interfaces
    https://git.kernel.org/netdev/net-next/c/b0f88c1b9a53
  - [net-next,5/6] net: stmmac: use PCS supported_interfaces
    https://git.kernel.org/netdev/net-next/c/d13cefbb108e
  - [net-next,6/6] net: pcs: xpcs: make xpcs_get_interfaces() static
    https://git.kernel.org/netdev/net-next/c/2410719cdd49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
