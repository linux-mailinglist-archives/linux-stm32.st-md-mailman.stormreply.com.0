Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5BA89096
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 02:30:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A54A8C78F75;
	Tue, 15 Apr 2025 00:30:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23302C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 00:30:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BCACD4A5BA;
 Tue, 15 Apr 2025 00:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E0EC4CEE2;
 Tue, 15 Apr 2025 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744677005;
 bh=yjpdz4PuIqTD7mEXGatsyIxmp7A6s9XAhTm4vrHfH2s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CE6nEiad/1W1gBK8pSqbDaMepRZj/zt+jzb/w3Nz54ovwAX29XRmP548oeJdXcgIX
 uuxv3syie1V12w+LbBquq0yyQ+DXyuZBfgNS6E9KfyQuIuruyHosRloD84MqEtYRWj
 DxcfjdjqJiR5iYjv+9HRMVwtqw4z+O/+rblyG4fxUM64JbKWaNmEsXAbDErzJru2P9
 5+w8+E6IjWmj0v87YPBwRYmmeMqvJ5tCxxO2LimaYu8sILZ9rGM28i7WI/hkMmn8Vn
 sOESEqhEeurj2hHBGo+4N4wz7XM8GMRlZZD2rsb1Iyhs130qpDf+3yRyT0j3uCOdHP
 Bqz4dMs3V61Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE54C3822D1A; Tue, 15 Apr 2025 00:30:44 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174467704323.2083973.2524046763560331419.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 00:30:43 +0000
References: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
In-Reply-To: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, treding@nvidia.com, p.zabel@pengutronix.de,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jonathanh@nvidia.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32]
	=?iso-8859-1?q?=5BPATCH_net-next_v2_0/5=5D_net=3A_s?=
	=?iso-8859-1?q?tmmac=3A_remove_unnecessary_initialisation_of_1=B5s?=
	=?iso-8859-1?q?_TIC_counter?=
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

On Sat, 12 Apr 2025 09:05:37 +0100 you wrote:
> Hi,
> 
> In commit 8efbdbfa9938 ("net: stmmac: Initialize MAC_ONEUS_TIC_COUNTER
> register"), code to initialise the LPI 1us counter in dwmac4's
> initialisation was added, making the initialisation in glue drivers
> unnecessary. This series cleans up the now redundant initialisation.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] net: stmmac: dwc-qos: remove tegra_eqos_init()
    https://git.kernel.org/netdev/net-next/c/dadc3a6be469
  - [net-next,v2,2/5] net: stmmac: intel: remove eee_usecs_rate and hardware write
    https://git.kernel.org/netdev/net-next/c/17ec6dbaaed3
  - [net-next,v2,3/5] net: stmmac: intel-plat: remove eee_usecs_rate and hardware write
    https://git.kernel.org/netdev/net-next/c/35031c6256f1
  - [net-next,v2,4/5] net: stmmac: remove eee_usecs_rate
    https://git.kernel.org/netdev/net-next/c/651f88cb046c
  - [net-next,v2,5/5] net: stmmac: remove GMAC_1US_TIC_COUNTER definition
    https://git.kernel.org/netdev/net-next/c/25af74ed68c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
