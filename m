Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B8CB3AEBA
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Aug 2025 02:00:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7996C3F931;
	Fri, 29 Aug 2025 00:00:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CDD5C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Aug 2025 00:00:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D7B1451F5;
 Fri, 29 Aug 2025 00:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078CCC4CEEB;
 Fri, 29 Aug 2025 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756425613;
 bh=bETuWeDYSHxG5nww5B4o0pHKicBEs80t5TggZjI5wc0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=buPHN44NThUo0X1Bw3TUxD3TwQw23tPgjO2aYHD+cGOcZX6PqYaQ7DVjqjPphd7Hq
 pt2SV3Z+42HCCe3iU7GyKx37D5bzK6PBHTLRrrrZU3l2quxFfSc1HsMZJbachSQfN7
 HjBnhHvAw3sFzDY7PGiyjs1XvFlirbwzJxAsQPa82Tuaqf6a7RMFMT1Dqx8xg+5A6h
 y67sBAJjvysryFYr0I8g6s1SCjqHtnjRcsF7mf7QwN+sotOk9jFM9OwP0kI9eDVeV6
 X/uy3WHFICENpZCIT18v0iamnmEbNrC5JJLC7+o6f3PgvzrJxnAIDEsjBedM6TM4i0
 CdmX4CITD0S4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33FED383BF75; Fri, 29 Aug 2025 00:00:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175642561974.1653564.13238220645332323952.git-patchwork-notify@kernel.org>
Date: Fri, 29 Aug 2025 00:00:19 +0000
References: <E1urGBn-00000000DCH-3swS@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1urGBn-00000000DCH-3swS@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: clean up
 c22/c45 accessor split
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

On Wed, 27 Aug 2025 14:27:47 +0100 you wrote:
> The C45 accessors were setting the GR (register number) field twice,
> once with the 16-bit register address truncated to five bits, and
> then overwritten with the C45 devad. This is harmless since the field
> was being cleared prior to being updated with the C45 devad, except
> for the extra work.
> 
> Remove the redundant code.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: mdio: clean up c22/c45 accessor split
    https://git.kernel.org/netdev/net-next/c/24eb86a8170f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
