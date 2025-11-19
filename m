Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEB6C70256
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 17:40:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 720AAC36B30;
	Wed, 19 Nov 2025 16:40:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02B59C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 16:40:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 91F5B44031;
 Wed, 19 Nov 2025 16:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC62C4CEF5;
 Wed, 19 Nov 2025 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763570445;
 bh=fdxXRZqA2QPN/W/iwYUC/9zToFGBrYm7yidpHfVZkhQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gKpEtYw8KOkIvyuu0VFrr8xOb4ZPSc2WhNnq1CuLIiBfYmHq5Y1gbjFZwO+5n3r3X
 g57XiBKwLzYdNVA+U8+1eiEfnl6ETyJz/JZ6SqLIl6MvlcHWu8gBd68YEZA8FV/fiL
 CHgDHWyB9V1NCSCee90Lxb2zXD8Ttoj21KFZRpRFhs/cB9D81nbfxw/ZTKGsUoCh3P
 xELKAE38HteAneQhsTqaCusJomZTgYK1JyoKLMCEVg/2STnjdoHd2zaP8vIeExMr79
 D8gvAPZNtoi+RDrghNa590rhFIF2CdVfOTyRuXCGyd3NXUupfS8cpLw2a+h3oQmRSI
 ZHYcBt9Y0NRdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 710B839D0C22; Wed, 19 Nov 2025 16:40:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176357041126.873046.11074623716236864582.git-patchwork-notify@kernel.org>
Date: Wed, 19 Nov 2025 16:40:11 +0000
References: <E1vLIDN-0000000Evur-2NLU@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vLIDN-0000000Evur-2NLU@rmk-PC.armlinux.org.uk>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 john.fastabend@gmail.com, ast@kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, sdf@fomichev.me, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: convert priv->sph*
 to boolean and rename
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

On Tue, 18 Nov 2025 09:41:33 +0000 you wrote:
> priv->sph* only have 'true' and 'false' used with them, yet they are an
> int. Change their type to a bool, and rename to make their usage more
> clear.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  4 +--
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
>  .../stmicro/stmmac/stmmac_selftests.c         |  2 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  2 +-
>  4 files changed, 17 insertions(+), 17 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: convert priv->sph* to boolean and rename
    https://git.kernel.org/netdev/net-next/c/7ac60a14d3fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
