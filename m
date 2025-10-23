Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E950BFF086
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 05:46:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08A30C5E2DD;
	Thu, 23 Oct 2025 03:46:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 677DCC5A4DC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 03:46:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 17BFF605CD;
 Thu, 23 Oct 2025 03:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B955CC4CEF7;
 Thu, 23 Oct 2025 03:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761191194;
 bh=l86IeJ3vP3EDYi7bu42IQQyF94BwHyCQ8KT6skv5odE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=mMicCGIf+QkaQtTnDkGmUECePcMi76oudIsDNdOWs9wSC89J1wqCNlt8QfDhr4o+v
 r/q1OPBk4qp+W553BOuwowDQoD5nADevx8RcJCnc58r8t72gF5XeZ5SDqLDo6H32XO
 98Pvy6eVXIfh+lDC3IcwO4F7/IgIdl/8mWHJJXiXtevGqnN6SD0FeLStfSPyqz3VFX
 jB2zS1ehXFLEgm8zzOLFhuvUsEx1gz+hzEBj3LcPTw193b0eqWP0MgoHo6EwPdfG66
 DhHCesjq6Mi4QQd16114mp3zEwozN2jReaaSXjKcP0eGEqFNkvbewL0X78J+41bltD
 cTbKVxgCwm4tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE3BF3809A04; Thu, 23 Oct 2025 03:46:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176119117525.2145463.932539356241719482.git-patchwork-notify@kernel.org>
Date: Thu, 23 Oct 2025 03:46:15 +0000
References: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, s32@nxp.com, edumazet@google.com, thierry.reding@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com, wens@csie.org, kuba@kernel.org,
 pabeni@redhat.com, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, jan.petrous@oss.nxp.com, vz@mleia.com,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: replace has_xxxx
	with core_type
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

On Tue, 21 Oct 2025 08:26:49 +0100 you wrote:
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.
> 
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: replace has_xxxx with core_type
    https://git.kernel.org/netdev/net-next/c/26ab9830beab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
