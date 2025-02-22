Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1929A4044C
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Feb 2025 01:40:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A57CC7A83C;
	Sat, 22 Feb 2025 00:40:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A359C7803D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Feb 2025 00:40:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 88306613DE;
 Sat, 22 Feb 2025 00:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B6EC4CED6;
 Sat, 22 Feb 2025 00:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740184806;
 bh=H48JW7AW173NYuh0XY8Bexb5wuYfEmHh77BrSrgAcTw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IP5DaEZAGMCYAd7SYzf3poZOQnKpJUjp2s7WUISj87KW05YphO3WIX5+BCtPOifmp
 5OqZCesEWqKAWvtfvysDZ8DFGoB6ZaXCq779oNeJzpH65QoX/Pr1Tn7ahvG/PL+tcZ
 5GSDt+ih3RWfLL4ST7jozwiWLrkwejK/hy/0iQzDr0F20lxHSLJr6DI4WcbWEzuIUH
 uNbKuCCd6G0iqwyIVeWMHKpH3oO9rPemjpv4wsZI40GhTIwbCDjKOEx++zSLSviNvb
 OSicv/HEvr6pS0U0+PpfoJsjGzin9npFsiCNquWg8n5rjBxvsWaPF6y1OU0wPwkoJS
 xwYqVbVL7wCcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34031380CEF6; Sat, 22 Feb 2025 00:40:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174018483699.2253519.16103743510022533749.git-patchwork-notify@kernel.org>
Date: Sat, 22 Feb 2025 00:40:36 +0000
References: <E1tl5y1-004UgG-8X@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tl5y1-004UgG-8X@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: print
 stmmac_init_dma_engine() errors using netdev_err()
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

On Thu, 20 Feb 2025 12:47:49 +0000 you wrote:
> stmmac_init_dma_engine() uses dev_err() which leads to errors being
> reported as e.g:
> 
> dwc-eth-dwmac 2490000.ethernet: Failed to reset the dma
> dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
> 
> stmmac_init_dma_engine() is only called from stmmac_hw_setup() which
> itself uses netdev_err(), and we will have a net_device setup. So,
> change the dev_err() to netdev_err() to give consistent error
> messages.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: print stmmac_init_dma_engine() errors using netdev_err()
    https://git.kernel.org/netdev/net-next/c/3e401818c81b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
