Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC08A577EF
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Mar 2025 04:40:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 479A4C78F95;
	Sat,  8 Mar 2025 03:40:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0A80C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Mar 2025 03:40:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE2AC5C66AE;
 Sat,  8 Mar 2025 03:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61973C4CED1;
 Sat,  8 Mar 2025 03:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741405214;
 bh=/1551EvwFLFRJgDZVyhrnnVaVXrnUUlMvSTMNOwJ2lU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fN9oY017Ls8+PnLtnXlkLqnk6xJ8SIsGVkNRV7njjgGQunqPJ1J3CZshucoLnX7fq
 34gDS4FJM05Udfnjt83J+sk/d+WcNTHZEa4eEUDcVLpHLRBMb06QIdNB4+ImB3zjDX
 DulC7OrPKKo7TYefkXHYNY1laYXghgaRJmjQBF5SDfvhL2AOBzXtvj2iwnAGeeSF0l
 2egyiTsIls2QcjHWcqtVyO5zu/rnP68+jCaioXLrQJmP9W8EibmxD0RVk2diDCOhAj
 mcHuzyjHAggi1DmnxNe4S4bN0eGw84zo7d5MPm5V7ZtvGhzAGgpbYO+xZDMJfKkb4v
 TFvhu6ilXUfnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D93380CFFB; Sat,  8 Mar 2025 03:40:49 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174140524774.2565853.6497124340077503983.git-patchwork-notify@kernel.org>
Date: Sat, 08 Mar 2025 03:40:47 +0000
References: <E1tqLJJ-005aQm-Mv@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tqLJJ-005aQm-Mv@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: remove write-only
	priv->speed
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

On Fri, 07 Mar 2025 00:11:29 +0000 you wrote:
> priv->speed is only ever written to in two locations, but never
> read. Therefore, it serves no useful purpose. Remove this unnecessary
> struct member.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
>  2 files changed, 4 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: remove write-only priv->speed
    https://git.kernel.org/netdev/net-next/c/64fdb808660d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
