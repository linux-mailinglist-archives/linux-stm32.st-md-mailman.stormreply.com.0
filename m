Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D61C5FEAC
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Nov 2025 03:40:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0647C58D7A;
	Sat, 15 Nov 2025 02:40:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9725C58D79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Nov 2025 02:40:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E525860007;
 Sat, 15 Nov 2025 02:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95060C4CEF1;
 Sat, 15 Nov 2025 02:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763174443;
 bh=FsDd8OSRS1boKHVWER5PG2YUTZRXls0/bADOA6JY/pU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JcMTQWxzJFH3zV8FtzNtiE+MXJ1ME/2xY9p13ILTSIxmpCrtP/mTB2/EoQ8rQTNyO
 8HAEEFb/3lRkkLfo69tKXVBt2fPVtQf3FUdQKOQoHshkYVPfLwPyrTiYH9pIqzOoZw
 2GoNgSSXuuR6cZKqTsa4XqRr0OfQF8Q9me1LuoTeobgFnK5NG9lHUje8qZMyZqhkwv
 TzEwmaaXqYeMcWyG3SUSwePS3UbWDZFPwBszJuHCUJr55TWW4ky9MeM1nnz1tUeai8
 afSiU0jeB0pm0spKensp0YkzN2mFjqbJvanuyoPC04HREhGSrByF6IOKpVUZ/BiLPF
 FNw8jEVewMYzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33E203A78A62; Sat, 15 Nov 2025 02:40:13 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176317441200.1916016.12907239609584301623.git-patchwork-notify@kernel.org>
Date: Sat, 15 Nov 2025 02:40:12 +0000
References: <aRYZaKTIvfYoV3wE@shell.armlinux.org.uk>
In-Reply-To: <aRYZaKTIvfYoV3wE@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/4] net: stmmac: rk: use
	PHY_INTF_SEL_x
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

On Thu, 13 Nov 2025 17:46:16 +0000 you wrote:
> This series is a minimal conversion of the dwmac-rk huge driver to use
> PHY_INTF_SEL_x constants.
> 
> Patch 2 appears to reorder the output functions making diffing the
> generated code impossible.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 245 +++++++++++--------------
>  1 file changed, 109 insertions(+), 136 deletions(-)

Here is the summary with links:
  - [net-next,1/4] net: stmmac: rk: replace HIWORD_UPDATE() with GRF_FIELD()
    https://git.kernel.org/netdev/net-next/c/ebb07edf9738
  - [net-next,2/4] net: stmmac: rk: convert all bitfields to GRF_FIELD*()
    https://git.kernel.org/netdev/net-next/c/764ebe423ef9
  - [net-next,3/4] net: stmmac: rk: use PHY_INTF_SEL_x constants
    https://git.kernel.org/netdev/net-next/c/5e37047f745b
  - [net-next,4/4] net: stmmac: rk: use PHY_INTF_SEL_x in functions
    https://git.kernel.org/netdev/net-next/c/1188741cb5a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
