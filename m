Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A14AC7ABC
	for <lists+linux-stm32@lfdr.de>; Thu, 29 May 2025 11:10:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93A4BC349C6;
	Thu, 29 May 2025 09:10:06 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EDC2C349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 May 2025 09:10:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 89FA6A4F500;
 Thu, 29 May 2025 09:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F9AC4CEEF;
 Thu, 29 May 2025 09:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748509804;
 bh=Yb2uSf81m/g9NlDY7wmvxatJgdvhAEkJ2SZriq2WmG8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cpuc0gljbw7Wel8lndc9mBJ6wKLR2x1eW0jJMO9g8nZ6QrREy5jr9bWDS2rnNd3Kt
 3828I2yiiEBHzYBGtEjCUyeVP8fzrFgNXi16tghzh2vxXuK/bMWwX5Idrh+rtK5Z1n
 5nlbEHz3Hj7+Shfs/mHCQefQK+L1buCyoz30c3Rk0n8B5sgpUV819bID9G8gY3B8T7
 bQQ34g5U9bfVDRUeYFlM3VC9HmFyYP9TSVof/Ij53VfJzkAci/d5G92IV0Igodh+b3
 Od5wZ/LIOitZJInY3nhFQK/WajIY83+/LsVv7rPR9HpBZeCetNdNa6dZGnnsTrHQdV
 MysXznv41IAfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33F2939F1DEE; Thu, 29 May 2025 09:10:39 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174850983774.3198213.12132601744057177877.git-patchwork-notify@kernel.org>
Date: Thu, 29 May 2025 09:10:37 +0000
References: <20250527-stmmac-mdio-bus_id-v2-1-a5ca78454e3c@cherry.de>
In-Reply-To: <20250527-stmmac-mdio-bus_id-v2-1-a5ca78454e3c@cherry.de>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: linux-kernel@vger.kernel.org, heiko@sntech.de,
 jakob.unterwurzacher@cherry.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, quentin.schulz@cherry.de,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: platform: guarantee
 uniqueness of bus_id
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 27 May 2025 13:56:23 +0200 you wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> bus_id is currently derived from the ethernetX alias. If one is missing
> for the device, 0 is used. If ethernet0 points to another stmmac device
> or if there are 2+ stmmac devices without an ethernet alias, then bus_id
> will be 0 for all of those.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: platform: guarantee uniqueness of bus_id
    https://git.kernel.org/netdev/net/c/eb7fd7aa35bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
