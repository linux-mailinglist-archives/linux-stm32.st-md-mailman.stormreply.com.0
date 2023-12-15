Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF38144BE
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 10:40:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F31EC6B45B;
	Fri, 15 Dec 2023 09:40:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35201C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 09:40:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E94D162510;
 Fri, 15 Dec 2023 09:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 916ACC433C8;
 Fri, 15 Dec 2023 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702633224;
 bh=4WLPzR0ImxTYD0Q0FMSX4ET9eASvLOs7mKeotYiEWMs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rxKiSKZ9Xsrq8fs6VVI827bmCS4bJU9EH9VujlT8U99F6OS9Ps06rZGVCLfVEYfAJ
 7eKt4dUbcYanYZDLa9x38maqJ4t2DlOULtYObj99b7G4YEioN/UoKgKcWHDUAJ0Z0U
 1M54qNioUGzM/ZhFEIz6S7BO1CtxjaNWsVcO4E8L06pRp+S/8cuxGHRlmvnvXjHyGy
 JXAxuiXN+bwxRDSIripmR1yGR5qeDGgBnb5dcDxUCALOFbJ8cgg3e9nbNmiYO/NuGM
 Gz8xECij3oAYLpHXFPsDBsvFHw3PUWKBN27StNebhZ7/zXUPt62vgu/J4D4dKOUezI
 b+ARurfUxO4lQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 779C0DD4EF5; Fri, 15 Dec 2023 09:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170263322448.1975.8565502940787597440.git-patchwork-notify@kernel.org>
Date: Fri, 15 Dec 2023 09:40:24 +0000
References: <20231212-stmmac-no-mdio-node-v4-1-c121068ccd17@redhat.com>
In-Reply-To: <20231212-stmmac-no-mdio-node-v4-1-c121068ccd17@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org,
 bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 fancer.lancer@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4] net: stmmac: don't create a
 MDIO bus if unnecessary
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

On Tue, 12 Dec 2023 16:07:36 -0600 you wrote:
> Currently a MDIO bus is created if the devicetree description is either:
> 
>     1. Not fixed-link
>     2. fixed-link but contains a MDIO bus as well
> 
> The "1" case above isn't always accurate. If there's a phy-handle,
> it could be referencing a phy on another MDIO controller's bus[1]. In
> this case, where the MDIO bus is not described at all, currently
> stmmac will make a MDIO bus and scan its address space to discover
> phys (of which there are none). This process takes time scanning a bus
> that is known to be empty, delaying time to complete probe.
> 
> [...]

Here is the summary with links:
  - [net-next,v4] net: stmmac: don't create a MDIO bus if unnecessary
    https://git.kernel.org/netdev/net-next/c/f3c2caacee82

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
