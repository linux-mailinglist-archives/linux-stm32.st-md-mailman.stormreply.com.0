Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B124923F7C
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2024 15:50:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D836CC6DD9E;
	Tue,  2 Jul 2024 13:50:38 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 943D6C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2024 13:50:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CDF5DCE1E8A;
 Tue,  2 Jul 2024 13:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F8BDC2BD10;
 Tue,  2 Jul 2024 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719928229;
 bh=fbUnMj+W+KQMyuUsKadHUYxc1aaxyEkdq8ydp6tjVnk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oPM95ljNuijlOVg8nG40F5xP4JJsGa6p43c02Lbe93XEu1UtYWu2xPA9kzSiT6HM7
 pyW6BwM1lzAyd3yiG7uqc1mEmme6sUbWPpawi7oWcmY9SCdyhXyQraLxbnvYIkEdPA
 GBw9pJXYNhmcXppAQXWmWaMOsReUrZgE7OEKC3AdSRLItvAI+DL7kksV/RbYh0UTUn
 omV62BoS2jb7cE6saoaXrgB5OGCSIevNAFedTDfXB4Y5zktrGufmjwMQQB1R0pB408
 +B8drJYG4wjpxd9XDD9npRld5iAneVn2GXXefI9tPbtZz7WxGDOr6imDj3NWla3iGL
 /5XkES7RhzwiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F1809C43331; Tue,  2 Jul 2024 13:50:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171992822898.3744.15499171958760914768.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jul 2024 13:50:28 +0000
References: <20240701064838.425521-1-christophe.roullier@foss.st.com>
In-Reply-To: <20240701064838.425521-1-christophe.roullier@foss.st.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: marex@denx.de, joabreu@synopsys.com, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, lgirdwood@gmail.com,
 edumazet@google.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
	PATCH v2 0/2] Fixes for stm32-dwmac driver fails to probe
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 1 Jul 2024 08:48:36 +0200 you wrote:
> Mark Brown found issue during stm32-dwmac probe:
> 
> For the past few days networking has been broken on the Avenger 96, a
> stm32mp157a based platform.  The stm32-dwmac driver fails to probe:
> 
> <6>[    1.894271] stm32-dwmac 5800a000.ethernet: IRQ eth_wake_irq not found
> <6>[    1.899694] stm32-dwmac 5800a000.ethernet: IRQ eth_lpi not found
> <6>[    1.905849] stm32-dwmac 5800a000.ethernet: IRQ sfty not found
> <3>[    1.912304] stm32-dwmac 5800a000.ethernet: Unable to parse OF data
> <3>[    1.918393] stm32-dwmac 5800a000.ethernet: probe with driver stm32-dwmac failed with error -75
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: dwmac-stm32: Add test to verify if ETHCK is used before checking clk rate
    https://git.kernel.org/netdev/net-next/c/3cd1d4651ceb
  - [net-next,v2,2/2] net: stmmac: dwmac-stm32: update err status in case different of stm32mp13
    https://git.kernel.org/netdev/net-next/c/f8dbe58e2f1a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
