Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D558D583E
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 03:40:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B126C6DD66;
	Fri, 31 May 2024 01:40:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98E6AC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 01:40:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 553DB62AD2;
 Fri, 31 May 2024 01:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01A1EC32786;
 Fri, 31 May 2024 01:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717119633;
 bh=CYHulmigE52cT3mZ/+i7wAv/vNOBtBcebTbzxOSEvx0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oWEsa6Dk3JFB44WcgDCF7/M2VC8mYsqmNAUu5cYBGaVJcYpU3VWGUQ2of0DQI7s8A
 vs2MKNhsQnGyYfTLVr8ilji8juZCKfv/xEktuBp2qCTDXfOmDS3CA2hpePMoEnlB0D
 6CXKWKYYnBVjGiMaLztlCvWbkZGLeAPOsaO5WrrL44FHLQZXmEriBxqOaWPM/GmgXw
 CuwIFQYOG4honZXVcZ9h2gGdznWDMmNJvfbXKuq2YYUj8R30DNZ9W4b1/L5kkVC/bO
 T1qhpmHxgDVaQhz9wdkMVGEvhd68sbi3HeP+1mz+JhkNuUrfIf85GacH45d/uastHb
 L2gCOE8TptwcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E186BC3276C; Fri, 31 May 2024 01:40:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171711963292.18580.1918608353290496503.git-patchwork-notify@kernel.org>
Date: Fri, 31 May 2024 01:40:32 +0000
References: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
In-Reply-To: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: vkoul@kernel.org, netdev@vger.kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/6] net: stmmac: cleanups
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

On Wed, 29 May 2024 09:40:15 +0100 you wrote:
> Hi,
> 
> This series removes various redundant items in the stmmac driver:
> 
> - the unused TBI and RTBI PCS flags
> - the NULL pointer initialisations for PCS methods in dwxgmac2
> - the stmmac_pcs_rane() method which is never called, and it's
>   associated implementations
> - the redundant netif_carrier_off()s
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/6] net: stmmac: Drop TBI/RTBI PCS flags
    https://git.kernel.org/netdev/net-next/c/482b3c3ba757
  - [net-next,v2,2/6] net: stmmac: dwxgmac2: remove useless NULL pointer initialisations
    https://git.kernel.org/netdev/net-next/c/4af90c0f4844
  - [net-next,v2,3/6] net: stmmac: remove pcs_rane() method
    https://git.kernel.org/netdev/net-next/c/3277407e5e82
  - [net-next,v2,4/6] net: stmmac: remove unnecessary netif_carrier_off()
    https://git.kernel.org/netdev/net-next/c/aee04f4bb44d
  - [net-next,v2,5/6] net: stmmac: include linux/io.h rather than asm/io.h
    https://git.kernel.org/netdev/net-next/c/cd56ff75ccfc
  - [net-next,v2,6/6] net: stmmac: ethqos: clean up setting serdes speed
    https://git.kernel.org/netdev/net-next/c/7efc70657704

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
