Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A472F789336
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Aug 2023 04:00:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54A13C6B44E;
	Sat, 26 Aug 2023 02:00:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D21F1C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 02:00:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9804260A70;
 Sat, 26 Aug 2023 02:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9FECC433CD;
 Sat, 26 Aug 2023 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693015228;
 bh=mBlqZKRX75iObqBjHmpEw+uziOh4bWzEZufO9Teq5zM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=u+N6197q4ce8zTDxWx+tZn7XBioEtnTbVw5Fughq7Lj76iY/SgzK0AOF8K0eakbqk
 XYU6jRAMdM15GNv4UmBa5jdHPBPDWhzPf/A/LQk2hp9RHBGegQXi7JmBwiC8RRgTXA
 TGkIu/XPijP4kXZADOCpZI5wufr5sahRQ9b+pXIeyAUyAq5cTs/cuVKpR2+egW8aQ4
 fQWbhCBj/wmkmBmmHkrH8zzZg4AqjvhIg4RZ3TgftE/4zT/wwkuKkFJOa1h4iKiMXZ
 b0AlFxILnbELbgDDqOpswxlWIT/Vufw6XnOe22Pis8eadojsoR+JbJgjA3YTLbkkBf
 nvAhosFgrtf4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CB4DBE33083; Sat, 26 Aug 2023 02:00:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169301522782.10076.5815529392176754957.git-patchwork-notify@kernel.org>
Date: Sat, 26 Aug 2023 02:00:27 +0000
References: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
In-Reply-To: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, chenfeiyang@loongson.cn, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/10] stmmac cleanups
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

On Thu, 24 Aug 2023 14:37:24 +0100 you wrote:
> Hi,
> 
> One of the comments I had on Feiyang Chen's series was concerning the
> initialisation of phylink... and so I've decided to do something about
> it, cleaning it up a bit.
> 
> This series:
> 
> [...]

Here is the summary with links:
  - [net-next,01/10] net: phylink: add phylink_limit_mac_speed()
    https://git.kernel.org/netdev/net-next/c/70934c7c99ad
  - [net-next,02/10] net: stmmac: convert plat->phylink_node to fwnode
    https://git.kernel.org/netdev/net-next/c/e80af2acdef7
  - [net-next,03/10] net: stmmac: clean up passing fwnode to phylink
    https://git.kernel.org/netdev/net-next/c/1a37c1c19832
  - [net-next,04/10] net: stmmac: use "mdio_bus_data" local variable
    https://git.kernel.org/netdev/net-next/c/2b070cdd3afd
  - [net-next,05/10] net: stmmac: use phylink_limit_mac_speed()
    https://git.kernel.org/netdev/net-next/c/a4ac612bd345
  - [net-next,06/10] net: stmmac: provide stmmac_mac_phylink_get_caps()
    https://git.kernel.org/netdev/net-next/c/d42ca04e0448
  - [net-next,07/10] net: stmmac: move gmac4 specific phylink capabilities to gmac4
    https://git.kernel.org/netdev/net-next/c/f1dae3d222c6
  - [net-next,08/10] net: stmmac: move xgmac specific phylink caps to dwxgmac2 core
    https://git.kernel.org/netdev/net-next/c/bedf9b81233d
  - [net-next,09/10] net: stmmac: move priv->phylink_config.mac_managed_pm
    https://git.kernel.org/netdev/net-next/c/64961f1b8ca1
  - [net-next,10/10] net: stmmac: convert half-duplex support to positive logic
    https://git.kernel.org/netdev/net-next/c/76649fc93f09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
