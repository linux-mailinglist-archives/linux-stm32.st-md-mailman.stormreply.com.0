Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F6DC67427
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 05:31:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3434C60460;
	Tue, 18 Nov 2025 04:31:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6ED3AC597BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 04:31:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4285A60613;
 Tue, 18 Nov 2025 04:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C70AC116B1;
 Tue, 18 Nov 2025 04:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763440258;
 bh=b0tK/QFOidIQQqfzTvlAPr1kSgWygac/TGHNviqWPbU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kHr0Uw0Bjoa7ZnKIST07TsbWvMUE7coMCj+Mn+sszlvaBiJPkR45qgQEmyH0T33cJ
 vwa7fSHLmtvdybBP8E9lnjb8zlIqCfSaX1NxNseYS5YrH/eYTQd93gQ723mIJBV310
 ZgzPP2k+/Xwc8SWo1C8oQKmD35q/G2YJdMssggnMOVtQw7aqQiGRvccfxmBHeg953M
 0mgNR3xgmJveKIbcHjMeyrqs4AmOtS4MG5/K829TC3wKSShgH5UwTqFEe9F29OXhvD
 WAVk2GvaqYjeqeBkHMB5Sl/2kk+3JcERe3sAQQzaOTFgSRZZMBfuqugbkGF6/7/xR1
 +DPh6QTK1f7Eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E143809A1E; Tue, 18 Nov 2025 04:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176344022426.3968687.3804479598141783177.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 04:30:24 +0000
References: <20251114003805.494387-1-inochiama@gmail.com>
In-Reply-To: <20251114003805.494387-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: looong.bin@gmail.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, uwu@icenowy.me,
 wangruikang@iscas.ac.cn, unicorn_wang@outlook.com, linux@armlinux.org.uk,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, ziyao@disroot.org, rmk+kernel@armlinux.org.uk,
 sophgo@lists.linux.dev, linux-arm-kernel@lists.infradead.org, dlan@gentoo.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, rabenda.cn@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH v8 0/3] net: stmmac: dwmac-sophgo: Add phy
 interface filter
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

On Fri, 14 Nov 2025 08:38:02 +0800 you wrote:
> As the SG2042 has an internal rx delay, the delay should be remove
> when init the mac, otherwise the phy will be misconfigurated.
> 
> Since this delay fix is common for other MACs, add a common helper
> for it. And use it to fix SG2042.
> 
> Change from v7:
> - https://lore.kernel.org/all/20251107111715.3196746-1-inochiama@gmail.com
> 1. patch 1: fix a mistake that using rgmii-txid instead of rgmii-rxid
>             for SG2042
> 
> [...]

Here is the summary with links:
  - [v8,1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
    https://git.kernel.org/netdev/net-next/c/6b1aa3c87fcb
  - [v8,2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
    https://git.kernel.org/netdev/net-next/c/24afd7827efb
  - [v8,3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
    https://git.kernel.org/netdev/net-next/c/db37c6e510de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
