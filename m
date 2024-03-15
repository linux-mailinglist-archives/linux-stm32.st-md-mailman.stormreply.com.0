Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6287CD28
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Mar 2024 13:20:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32C09C6DD6E;
	Fri, 15 Mar 2024 12:20:34 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E18AAC6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 12:20:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7A0B2CE1931;
 Fri, 15 Mar 2024 12:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B45DBC43390;
 Fri, 15 Mar 2024 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710505228;
 bh=71GAZqdw0qD1crd2WpK4nj51QmylewCnjCcyToSY0Ow=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IAIN5NIf86XFDLNo295h/mV58FKRf+bzng+hR6J/7BV2gHu+nqFgIvGAVlgqSwXSf
 Nlakhs4eJCGXmWFX5DlZxJVtK7b+KPhLYNEIty0eEPaNQSxrwZrHlw8gDKyLwG4FQl
 Yds3zfdb3DRLDWZ2SBryMjfBUl4gw3emYbAJIz5x5mV8oCBkzjHHZg6pmIJGEd1uZs
 O8cp6PiyZtAPxmpyDfd2wIyu6qKEJBWi7pKcAQM76tetUtY9SQIkyOJsk44kmwajgy
 xeLNezYbkiuhnBV1eOhGOrCyftsT5ahcbSmF6jGpgoj7o3sNR449SmrQdqHMFArTpt
 0KB26vRbWJjAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A2FF6D84BA8; Fri, 15 Mar 2024 12:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171050522866.5558.8897544477408916350.git-patchwork-notify@kernel.org>
Date: Fri, 15 Mar 2024 12:20:28 +0000
References: <20240313140057.2088667-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240313140057.2088667-1-andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, sebastian.reichel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] net: stmmac: dwmac-rk: Remove
	unused of_gpio.h
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
by David S. Miller <davem@davemloft.net>:

On Wed, 13 Mar 2024 16:00:57 +0200 you wrote:
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 --
>  1 file changed, 2 deletions(-)

Here is the summary with links:
  - [v1,1/1] net: stmmac: dwmac-rk: Remove unused of_gpio.h
    https://git.kernel.org/netdev/net-next/c/19c5c04d3178

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
