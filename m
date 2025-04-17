Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B65A91146
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 03:40:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21BF3C78F94;
	Thu, 17 Apr 2025 01:40:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59C27C78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 01:40:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E82045C5573;
 Thu, 17 Apr 2025 01:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E85AC4CEE2;
 Thu, 17 Apr 2025 01:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744854017;
 bh=UoCuiaGvDBeZSmxO3zSagieMB01Bk1UlqzL8YeuKlqQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZGlMmei8xjtxQyO6x4K3hletTYTm9UxXges6gJQHhLUYnbdxutkvIw2eyEy76Reps
 iAe94TvZSef60IabGBW2/KCK7o07LQ2zeqGLrFO9ToPFvQQyARVjqVGiZ5jfMRwUic
 hNyd7id0u5XLeC9pp8IW+X/FccvQwQ6Rs7P0dXb1DE0BdsfOwFCQX9IsvDfC5Ojdjq
 q9r3DXaqzHSS6tY9LSjaJm8ycfsyqdnagIC+e4SaGROsleRRRrCgHa73O9pCNeKBNo
 wJFbA76HTCVUr13N9JLtlW5V8Lawhqo0Id57jkmQNU7xSwHADxO+q5Ly7idtT+y/YR
 8BcEYKP6h3GDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAD203822D5A; Thu, 17 Apr 2025 01:40:56 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174485405548.3559972.7306929702229052794.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 01:40:55 +0000
References: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
In-Reply-To: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: sti cleanups
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

On Tue, 15 Apr 2025 17:42:39 +0100 you wrote:
> Clean up the STI platform glue code.
> 
> - IS_PHY_IF_MODE_RGMII() is just a duplicate for
>   phy_interface_mode_is_rgmii(), so use the generic version that we
>   already have.
> 
> - add init/exit functions that call clk_prepare_enable(),
>   sti_dwmac_set_mode() and clk_disable_unprepare() as appropriate,
>   converting to devm_stmmac_pltfr_probe().
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: sti: use phy_interface_mode_is_rgmii()
    https://git.kernel.org/netdev/net-next/c/72d02a9f9410
  - [net-next,2/3] net: stmmac: sti: convert to devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/403068c6c9c2
  - [net-next,3/3] net: stmmac: sti: convert to stmmac_pltfr_pm_ops
    https://git.kernel.org/netdev/net-next/c/b3334f9f708c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
