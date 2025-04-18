Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A0BA92FBE
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 04:10:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CBF7C78F72;
	Fri, 18 Apr 2025 02:10:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F51CC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 02:10:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE7315C54AC;
 Fri, 18 Apr 2025 02:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6481FC4CEE4;
 Fri, 18 Apr 2025 02:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744942200;
 bh=DojIOl1pVFu1mQqpy1zqyKE8kukp8trKGpMnSq9nMOI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cdY7ayAd0nLdploAuNKyMPQR1mPvfrv2vaw+zphf9w5KDt4cM8xoDrhYr6N7Ch6QI
 ltqKkEr0FJCfjomWwQyRp629dAyrEq81h2JWM/xiRdTEohZmF9fnB8AYDJr5CUB8mZ
 OdkGLTrgkQW500tyK7uJDdKebeERTpHjRBuRA759cfC5DmNQgelrn66b6oUe9OfG+s
 A1TDjMScB6bQY6Hao9jPN5QTf/bo8KzkZxy6QWwSJdaG/eqq65wSWEVe614NWWcFou
 4h9Dpg0wLom6ddUUyfLXFLyEixtA0kOE7MLjcXtx7aj+zeeEdMZRhwulA2KRapQ0j+
 pn2PfFIKNJIDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADEF0380AAEB; Fri, 18 Apr 2025 02:10:39 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174494223824.79616.1586155052116698470.git-patchwork-notify@kernel.org>
Date: Fri, 18 Apr 2025 02:10:38 +0000
References: <E1u4zi1-000xHh-57@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u4zi1-000xHh-57@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, treding@nvidia.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jonathanh@nvidia.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwc-qos: use PHY
	clock-stop capability
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

On Wed, 16 Apr 2025 11:09:33 +0100 you wrote:
> Use the PHY clock-stop capability when programming the MAC LPI mode,
> which allows the transmit clock to the PHY to be gated. Tested on the
> Jetson Xavier NX platform.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] net: stmmac: dwc-qos: use PHY clock-stop capability
    https://git.kernel.org/netdev/net-next/c/7c6cd70ffd0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
