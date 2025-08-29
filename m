Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4132EB3AEBB
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Aug 2025 02:00:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE036C3F92D;
	Fri, 29 Aug 2025 00:00:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8908C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Aug 2025 00:00:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C55966013D;
 Fri, 29 Aug 2025 00:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1BDC4CEEB;
 Fri, 29 Aug 2025 00:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756425614;
 bh=EZzCIKy2lXRxIz8FZaNB0OLBRJoxff+kx2U+S4qIdmA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aIW41zWEoKT/siuAPM8ufcYo6WlT/agjyfb8P83/trEt+RZwPidbMkL91TG0Veu3p
 MdtCxCoR+f+6iasNAqxbgllbK+Twhn+jrFri/f5g5jEVT1Kaw6sbRK5fcO9WkmAF9y
 txY4YAyo7ND8NFCxFhoLe6zzsn53taqmOJvFKwzNGbjGXpRdz0p/ghFJK5XaVWQasL
 ItH0U3zl6N1FKe9lrym3jPEsCJzQQI1NACSxzuqAanND0sANqBJnowNGliALwn3ZGw
 bGE9NRrm6nT0KyZ55hH271Ld7PIsM8gJBcMzqn3VHgQTMgjbaK7As7REXL7uKmsySL
 q7ZCCLvjLNmbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADC4F383BF75; Fri, 29 Aug 2025 00:00:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175642562124.1653564.9988378849956987814.git-patchwork-notify@kernel.org>
Date: Fri, 29 Aug 2025 00:00:21 +0000
References: <E1urBj2-000000002as-0pod@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1urBj2-000000002as-0pod@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: use
	netdev_priv() directly
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

On Wed, 27 Aug 2025 09:41:48 +0100 you wrote:
> netdev_priv() is an inline function, taking a struct net_device
> pointer. When passing in the MII bus->priv, which is a void pointer,
> there is no need to go via a local ndev variable to type it first.
> 
> Thus, instead of:
> 
> 	struct net_device *ndev = bus->priv;
> 	struct stmmac_priv *priv;
> ...
> 	priv = netdev_priv(ndev);
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: mdio: use netdev_priv() directly
    https://git.kernel.org/netdev/net-next/c/bafdd920a060

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
