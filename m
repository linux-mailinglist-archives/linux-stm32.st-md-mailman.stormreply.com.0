Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA5A8A30A
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 17:40:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE732C78F68;
	Tue, 15 Apr 2025 15:40:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC5C0C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 15:40:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2678C4A2F9;
 Tue, 15 Apr 2025 15:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A2AC4CEEB;
 Tue, 15 Apr 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744731604;
 bh=7KBpmcvDBu/KzzwX4IoFm1q8sj2SXnAZYc6au3Szlxo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ib/1seQyBnL2lBlJq/wLpmIomb86PnfCSgDHWETSzyCFBuhBsvsETHcz3oOgavwgJ
 1lUbsKbj5hipvX5b63bclfP3UcSruBOMiVIANaOcJeQtly43wUYehAWMHcAoFk5oKR
 7UweC9mSmF1tp/++Xs+3HZoQPEQVkZwemhAJVAsPSvSfGqCR1OHTrlS+PAeao0+UDo
 lFgTCdaksFBA2pW5GYxjU4W+pSFvb1I3czQQ9eEsf/I1Tq+0/ZlqEIB+A/S2iEs2ub
 RFdJubthdtadfLdV4Y0HzX1mA/sGN2RmSFc6l2Pw3plhqteprwvqD+ZZ/HzzNjfver
 ZW9z9fNT1n24g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33BF53822D55; Tue, 15 Apr 2025 15:40:43 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174473164174.2680773.17904225005838619235.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 15:40:41 +0000
References: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
In-Reply-To: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH v2 net-next 0/4] net: stmmac: anarion:
	cleanups
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

On Mon, 14 Apr 2025 10:05:56 +0100 you wrote:
> A series of cleanups to the anarion glue driver.
> 
> Clean up anarion_config_dt() error handling, printing a human readable
> error rather than the numeric errno, and use ERR_CAST().
> 
> Using a switch statement with incorrect "fallthrough;" for RGMII vs
> non-RGMII is unnecessary when we have phy_interface_mode_is_rgmii().
> Convert to use the helper.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: stmmac: anarion: clean up anarion_config_dt() error handling
    https://git.kernel.org/netdev/net-next/c/c30a45a7e072
  - [net-next,v2,2/4] net: stmmac: anarion: clean up interface parsing
    https://git.kernel.org/netdev/net-next/c/a55ec9c811aa
  - [net-next,v2,3/4] net: stmmac: anarion: use stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/5956527e26ff
  - [net-next,v2,4/4] net: stmmac: anarion: use devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/a1afabef915c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
