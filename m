Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E143B909592
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Jun 2024 04:10:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86E08C69067;
	Sat, 15 Jun 2024 02:10:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6338AC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jun 2024 02:10:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FFF9620FA;
 Sat, 15 Jun 2024 02:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80EF8C4AF1D;
 Sat, 15 Jun 2024 02:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718417434;
 bh=ABXjdcbS3NQ2+UpYbp/Hs7qp5NUgC7y0vU0VzCOGkUY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CcTPhopFoogpANsQX5ImGKtl/YBnsBn4KzDWplUdB7l/K+z2XjYS3LI1VblF83pYH
 /WZEoqa+LvMZ7GNJur8ZWEftJPitsu5aAL6eaaWLuxv36WAibN/0Qq9qIYEEQW2SHH
 +AIMsBsKAC/xjy50XgFhIqI8hfDxH5E6NkFUUScN61G5XIakDy+6VZcxqwbpLGXdT6
 zjtnAVa8gNENsD//CN5EYZkMLi5NO/NioWeRf4UMQx7NaXA7DwEJrrk8igLfEDxvS2
 Ba8re8odbnmr32SlLTgJosZbpcnSPDmSqB37TgoYJxvtAlLtvhXNDCmxYNOesnpWFR
 L/TP1KJx04xPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 64F29C43619; Sat, 15 Jun 2024 02:10:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171841743440.11975.7851912921042282735.git-patchwork-notify@kernel.org>
Date: Sat, 15 Jun 2024 02:10:34 +0000
References: <ZmrLbdwv6ALoy+gs@shell.armlinux.org.uk>
In-Reply-To: <ZmrLbdwv6ALoy+gs@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: romain.gantois@bootlin.com, netdev@vger.kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/5] net: stmmac: provide
 platform select_pcs method
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

On Thu, 13 Jun 2024 11:35:25 +0100 you wrote:
> Hi,
> 
> This series adds a select_pcs() method to the stmmac platform data to
> allow platforms that need to provide their own PCSes to do so, moving
> the decision making into platform code.
> 
> This avoids questions such as "what should the priority of XPCS vs
> some other platform PCS be?" and when we provide a PCS for the
> internal PCS, how that interacts with both the XPCS and platform
> provided PCS.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] net: stmmac: add select_pcs() platform method
    https://git.kernel.org/netdev/net-next/c/6c3282a6b296
  - [net-next,v2,2/5] net: stmmac: dwmac-intel: provide a select_pcs() implementation
    https://git.kernel.org/netdev/net-next/c/135553da844c
  - [net-next,v2,3/5] net: stmmac: dwmac-rzn1: provide select_pcs() implementation
    https://git.kernel.org/netdev/net-next/c/804c9866e078
  - [net-next,v2,4/5] net: stmmac: dwmac-socfpga: provide select_pcs() implementation
    https://git.kernel.org/netdev/net-next/c/98a6d9f192d3
  - [net-next,v2,5/5] net: stmmac: clean up stmmac_mac_select_pcs()
    https://git.kernel.org/netdev/net-next/c/93f84152e4ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
