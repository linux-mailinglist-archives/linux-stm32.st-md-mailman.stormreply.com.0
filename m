Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558A812E34
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Dec 2023 12:10:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C585CC6B47D;
	Thu, 14 Dec 2023 11:10:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 767D6C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 11:10:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 03DB5B821F9;
 Thu, 14 Dec 2023 11:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C2AFC433C9;
 Thu, 14 Dec 2023 11:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702552225;
 bh=xwq0ikO0DH4IjRaxfWn3ELJXTbtrWoZcQar3Cp9coY4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=r7iKIUNYJL2tt8CpKsqUnySzPVGJvGxjxP68NsPV/cpO8VBRIdi8XmoWkjr7vQjI+
 itYWFGeyBhW+C8DetPiCsgp84810L/bev5rfLIxP/xpDn6CG+OK0v/mVvrIzie1Iw+
 6Kjr/tejTbTQvRPWj7Nnf9Zc5k11UuHdC0FEcXswEfjdA3GHQifqyBA2NuCT2A9+CX
 VGUv3N5aYiNDDOhR5cVtkqCKyGBLH4eNwJFkccc8OuUSh1AOYBmAhAUi5E98dXPP+q
 0uBkckcSO8gOIz1LmjA+xSJpkdMjBxqb4R0A+EEYNzXx4urQT6P5gBiBiPWsZfNG0k
 ilK/DgPLeLvXA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 30E03DD4EFD; Thu, 14 Dec 2023 11:10:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170255222519.10804.11119972355205402863.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 11:10:25 +0000
References: <20231212-b4-stmmac-handle-mdio-enodev-v2-1-600171acf79f@redhat.com>
In-Reply-To: <20231212-b4-stmmac-handle-mdio-enodev-v2-1-600171acf79f@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Handle disabled MDIO
 busses from devicetree
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

On Tue, 12 Dec 2023 16:18:33 -0600 you wrote:
> Many hardware configurations have the MDIO bus disabled, and are instead
> using some other MDIO bus to talk to the MAC's phy.
> 
> of_mdiobus_register() returns -ENODEV in this case. Let's handle it
> gracefully instead of failing to probe the MAC.
> 
> Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: Handle disabled MDIO busses from devicetree
    https://git.kernel.org/netdev/net/c/e23c0d21ce92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
