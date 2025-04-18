Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B32A92FC1
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 04:10:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16C41C78F72;
	Fri, 18 Apr 2025 02:10:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 475B1C78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 02:10:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 25FE65C5876;
 Fri, 18 Apr 2025 02:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48ABC4CEEA;
 Fri, 18 Apr 2025 02:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744942201;
 bh=GrNXNsg8thhryFhRIZCHfkYBELHVyUHwQRQ/n00IPGk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rDLXCb100h//SVUpdcl4UQ585zMo4am7V5N+BpZ74niCtsqXgpOIRdxVwKJ6I7vq0
 ID1qTakmi412HtyqO4khIdD2v+RDbYJd1HHLHNM4e2P8eTrpyQxtjRmmFQobgclXua
 Vd3xzZGOURAN2wwZ74EfPc1YfDvROY1EG+VehMMrH/vgKBI0bQnbYVOAbcwujaUn5x
 XMFw0JNwHZojNHzr1sBN8FGQgnvhH3+mX7GkM1cKUBSEVNAPxqSrcs1KvoZ8gX8qEW
 pU2WLW0d3ZDSLWX2XPhQkerStPNLe27skPsbEjFzuCwa3KI931dhX3ykfcqsWbhTlz
 Oc4vnJcWlKMJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3483A380AAEB; Fri, 18 Apr 2025 02:10:41 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174494223974.79616.7693576407987445072.git-patchwork-notify@kernel.org>
Date: Fri, 18 Apr 2025 02:10:39 +0000
References: <E1u4zyh-000xVE-PG@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u4zyh-000xVE-PG@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, kuba@kernel.org,
 hkallweit1@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: mediatek: stop
 initialising plat->mac_interface
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

On Wed, 16 Apr 2025 11:26:47 +0100 you wrote:
> Mediatek doesn't make use of mac_interface, and none of the in-tree
> DT files use the mac-mode property. Therefore, mac_interface already
> follows phy_interface. Remove this unnecessary assignment.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [net-next] net: stmmac: mediatek: stop initialising plat->mac_interface
    https://git.kernel.org/netdev/net-next/c/01be295b485a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
