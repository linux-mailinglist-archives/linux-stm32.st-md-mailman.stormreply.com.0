Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57627A55C32
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 01:50:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22956C78F86;
	Fri,  7 Mar 2025 00:50:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FA1FC78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 00:50:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29C5A5C5AFC;
 Fri,  7 Mar 2025 00:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1166C4CEE5;
 Fri,  7 Mar 2025 00:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741308605;
 bh=k+QGs8UJazLvwtaSasdsV2fYOGm2zy64SGuQoDxyQqg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=a3q+bQgc7pQM+7XfeDpWgiRv8eL0ZlvII6KhdWJZDaachKhuGfMOpnaC2+TmfxH7I
 MtiTttWHCGD73I0njm4+BvEljdRtd/2+xsOzrbMYpSBubI2sfBNUpBNt166bjxHaPQ
 k5TAXd2okviQiArRXAhy3jVvI6dOUdqS6SJ73LpEFxngQTE3bI5ao+UULZTL/NLHok
 ulgYjuQEh/0hgyESuom8GJmX9Ejo7VjY43kMyoG2gu+7HmWGFhah8n3V4Qiu7jBC2P
 fuT7P8TjYkR+Pawm3F6hDi36CM/iS0ImItJWrPqGJ5stx82Uq12gBZkgcXXegxBfv9
 MU9kAjBhZmBlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C61380CFF6; Fri,  7 Mar 2025 00:50:40 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174130863899.1835493.10259048343165526348.git-patchwork-notify@kernel.org>
Date: Fri, 07 Mar 2025 00:50:38 +0000
References: <E1tpQL1-005St4-Hn@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tpQL1-005St4-Hn@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: simplify
 phylink_suspend() and phylink_resume() calls
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

On Tue, 04 Mar 2025 11:21:27 +0000 you wrote:
> Currently, the calls to phylink's suspend and resume functions are
> inside overly complex tests, and boil down to:
> 
> 	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
> 		call phylink
> 	} else {
> 		call phylink and
> 		if (device_may_wakeup(priv->device))
> 			do something else
> 	}
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: simplify phylink_suspend() and phylink_resume() calls
    https://git.kernel.org/netdev/net-next/c/f732549eb303

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
