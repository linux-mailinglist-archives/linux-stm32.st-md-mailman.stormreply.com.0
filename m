Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 597EBC53A2F
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 18:20:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09879C628D0;
	Wed, 12 Nov 2025 17:20:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33C7CC60468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 17:20:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F081D601E6;
 Wed, 12 Nov 2025 17:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94686C19422;
 Wed, 12 Nov 2025 17:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762968039;
 bh=4SXvqIUmralZtLxvLSfsaFD6hCMsoBtvKsE9dz+t0iQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=f5fDthr4D93MJprus9XGBNxhwvWbMF5ZmbrLKRtBIz7PjbdRnsnHHKVQvwUS6P2gh
 CgAW3obRWsyB8px1i0FbxMnUPtXolt4dULoquCEIRiCstZ9a1Ldzsx8bzfG/OLHk6l
 CnjEUZxrGr43u5pa2RWJ9ZImxI6hShIX8FXyJptCcnrn/DP104e4lIj9VKMCR7wKkn
 orJ5NB67+m+RBtZooZmZXwCewNCXcjk1+Brep4FeWshlfdNTXP39G9QRU4iQa6fHDA
 GEpnMPwEjz3m1K18WIaBAPU0syw/F9jvFrSJS1X3Ejsy4ZpsBZqNoXmtGhlxb7GNT7
 6A9S9Nmr1evHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D3139EFA62; Wed, 12 Nov 2025 17:20:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176296800900.91007.2385891703778454442.git-patchwork-notify@kernel.org>
Date: Wed, 12 Nov 2025 17:20:09 +0000
References: <E1vImWA-0000000DrIl-1HZY@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vImWA-0000000DrIl-1HZY@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: improve
 ndev->max_mtu setup readability
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

On Tue, 11 Nov 2025 11:26:34 +0000 you wrote:
> Improve the readibility of the code setting ndev->max_mtu. This depends
> on the hardware specific maximum defined by the MAC core, and also a
> platform provided maximum.
> 
> The code was originally checking that the platform specific maximum was
> between ndev->min_mtu..MAC core maximum before reducing ndev->max_mtu,
> otherwise if the platform specific maximum was less than ndev->min_mtu,
> issuing a warning.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: improve ndev->max_mtu setup readability
    https://git.kernel.org/netdev/net-next/c/7e975caa0f7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
