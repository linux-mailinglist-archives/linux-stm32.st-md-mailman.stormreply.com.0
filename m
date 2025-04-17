Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C941A91148
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 03:40:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3161EC78F94;
	Thu, 17 Apr 2025 01:40:25 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA14DC78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 01:40:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8647FA4A7E3;
 Thu, 17 Apr 2025 01:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3C9C4CEE2;
 Thu, 17 Apr 2025 01:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744854022;
 bh=P5rLUzHGp1rWd+br0EokVbj8xB3CmQiC8msnksIdyVg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=E4G3zqxfAjnNdrLBWc19LVvI7Ur7CsdbRnWLwG15rFRKmZlSNOktv6uQ/Lc8AJHZ+
 tHM69NtMhZvaPvignyHIiUAu1iIO9yb+tcsvdw8jPJ5PBw8Hi3NDx3t3cSt0OlTvY+
 LkljGDw+OEjihecaQmipsMpsddSlRD6kaAo+WYWWSJYmPEip/kiept/uwAPqJLM0if
 sbbod1nqvXfF59hvjNwkyKTHJ7w2bwhENkjJ5srAYBh2fol8fqL0rk4hYxtZQ7760v
 4CBZK7U+x8sfihSrYPO0O8Tl7LIj0krJnN50dUxeLT3Tsvw67oZN9p4Or96BSEYixs
 bm/K8RYn57czg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAE2F3822D5A; Thu, 17 Apr 2025 01:41:01 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174485406039.3559972.1647358182636817567.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 01:41:00 +0000
References: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, edumazet@google.com, samuel@sholland.org,
 netdev@vger.kernel.org, jernej.skrabec@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch, wens@csie.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 linux-sunxi@lists.linux.dev, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: sun8i: use
	stmmac_pltfr_probe()
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

On Tue, 15 Apr 2025 11:15:53 +0100 you wrote:
> Using stmmac_pltfr_probe() simplifies the probe function. This will not
> only call plat_dat->init (sun8i_dwmac_init), but also plat_dat->exit
> (sun8i_dwmac_exit) appropriately if stmmac_dvr_probe() fails. This
> results in an overall simplification of the glue driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: sun8i: use stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/4cc8b57753ef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
