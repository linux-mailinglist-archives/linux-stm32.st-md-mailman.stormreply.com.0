Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65639B3AEBC
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Aug 2025 02:00:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12059C3F95F;
	Fri, 29 Aug 2025 00:00:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C96FC36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Aug 2025 00:00:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E46B6013F;
 Fri, 29 Aug 2025 00:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041F4C4CEEB;
 Fri, 29 Aug 2025 00:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756425616;
 bh=XHuj/eFq3JvZKdFMnx6z2EM258B7b2c8RFcbChBfhaE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=c9Fz911dMFkeBEClmnNO3pEJkP0L8NFES3iaVgARcOTrSwhdX2qbhxFRNpxT+2KPP
 bnP/UWwgO+tgh5lU9mbRdDDNy33gfaLFnItyT9TOZgHkNjIAOAw2t3k8FshOYVCbYp
 w7JqMGhnMZ8ZIru6obFoVqSjBpf2ZUn6YEKOFp2wsuj5+OKxb5fDrky75Mm4sTZR7O
 vlKWX74VVz61xtbflvp98GoUTcXoih6v9+4ikLgnlx+VAJoJNnFp3TwHkX2jkpeY2i
 uuNpgupoxRFbvMdot7sIOvj8FTKXh2l4oYJodFUt3oNnZK+klMak+GRLn+cuZazoR2
 2VSuAAUWjvFOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33BF8383BF75; Fri, 29 Aug 2025 00:00:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175642562274.1653564.10878658368837488044.git-patchwork-notify@kernel.org>
Date: Fri, 29 Aug 2025 00:00:22 +0000
References: <E1urBvf-000000002ii-37Ce@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1urBvf-000000002ii-37Ce@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: minor cleanups to
 stmmac_bus_clks_config()
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

On Wed, 27 Aug 2025 09:54:51 +0100 you wrote:
> stmmac_bus_clks_config() doesn't need to repeatedly on dereference
> priv->plat as this remains the same throughout this function. Not only
> does this detract from the function's readability, but it could cause
> the value to be reloaded each time. Use a local variable.
> 
> Also, the final return can simply return zero, and we can dispense
> with the initialiser for 'ret'.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: minor cleanups to stmmac_bus_clks_config()
    https://git.kernel.org/netdev/net-next/c/2584ed250a37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
