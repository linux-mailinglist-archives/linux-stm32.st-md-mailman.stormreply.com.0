Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E89678B8E3
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 22:00:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18575C6A61D;
	Mon, 28 Aug 2023 20:00:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09341C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 20:00:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8B40650E2;
 Mon, 28 Aug 2023 20:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6BE7C433CB;
 Mon, 28 Aug 2023 20:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693252823;
 bh=t/0EA6ZpRKGsKfKE0cId3rR1RxU96iAzwfiOXjNwhKY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=sLu6b+wOEiJXRq5H7w1dng1+8KdD3nFqEGycifPNB3t5OWlQvzEC8Hyodp0xr8fD9
 aJ7wi1Wkqk5w7aErb0P4eFLMC8GT8PVfQOSWv1h2O5Tgm6PrhRjxJGqlnI++FLiGfy
 vxOeAKZGcWszjHf4ZE+y9fF8EWI0ShJoZ5z0VwLWvh49UAbrInvy3FZfGR626iaREq
 BpIKfy45Ez4ySH6KprHBpG1GY7n7sJJ6UcB0qTz8BA/LAEQ9ESJ+AunoumJ9km7rSR
 o4xAOji2ioDx6bsuTNOQTzqHLsxXS20+tmsExwLIpO3fCf8hp+LKwzbI+gLQAP7PTI
 o4xAnc3Jpn+Hw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8C2D4E21EDF; Mon, 28 Aug 2023 20:00:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169325282356.23387.6771304913662801847.git-patchwork-notify@kernel.org>
Date: Mon, 28 Aug 2023 20:00:23 +0000
References: <E1qZq83-005tts-6K@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1qZq83-005tts-6K@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, kernel@esmil.dk, edumazet@google.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 samin.guo@starfivetech.com, linux-imx@nxp.com, kuba@kernel.org,
 pabeni@redhat.com, linux-sunxi@lists.linux.dev, mcoquelin.stm32@gmail.com,
 s.hauer@pengutronix.de, vz@mleia.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, chenfeiyang@loongson.cn,
 netdev@vger.kernel.org, kernel@pengutronix.de, shawnguo@kernel.org,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: clarify difference
 between "interface" and "phy_interface"
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

On Sat, 26 Aug 2023 11:02:51 +0100 you wrote:
> Clarify the difference between "interface" and "phy_interface" in
> struct plat_stmmacenet_data, both by adding a comment, and also
> renaming "interface" to be "mac_interface". The difference between
> these are:
> 
>  MAC ----- optional PCS ----- SerDes ----- optional PHY ----- Media
>        ^                               ^
>  mac_interface                   phy_interface
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: clarify difference between "interface" and "phy_interface"
    https://git.kernel.org/netdev/net-next/c/a014c35556b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
