Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BE4B9CEB7
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 02:50:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02677C3F94D;
	Thu, 25 Sep 2025 00:50:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF830C3F949
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 00:50:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8BC9841A75;
 Thu, 25 Sep 2025 00:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9B9C4CEE7;
 Thu, 25 Sep 2025 00:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758761430;
 bh=JOl8bvOaXKHP/plKSiwbXnFjVcEniK9Q1dE2r/E8ICA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LqPSWHN/3chhCOmy+6YDPFN6xr8NDxzNO998lF9/Ht+yNjj1+/ryFEXHvdi3MFwOF
 YIO81ZOdsUqiOOBydKwfNk5kaHi1kgSOoCUrrckwpPePseATf+b88RMEnSfBL6wmor
 i9MlFI2y9QiIMofu7E1nZJFpIDteI9gw5e1GcTj7tYisIrEsOFf9TdMcaoqx5EWCpE
 foJyUvGBudfGMWJvxptNTuThOu2IP3THl246s1RUgZuqlwif8OXYPIa2JY9X1vjk1O
 NKcXnEmEmqAg+5umPWUvoUpLKXMKFi8n+NgG9KjqEZ61Dh2nq/TyU6YrFpqrdSr8GZ
 s5RrflQCldl4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAEE139D0C20; Thu, 25 Sep 2025 00:50:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175876142648.2757835.630635315199558536.git-patchwork-notify@kernel.org>
Date: Thu, 25 Sep 2025 00:50:26 +0000
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: yet more
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

On Tue, 23 Sep 2025 12:25:30 +0100 you wrote:
> Building on the previous cleanup series, this cleans up yet more stmmac
> code.
> 
> - Move stmmac_bus_clks_config() into stmmac_platform() which is where
>   its onlny user is.
> 
> - Move the xpcs Clause 73 test into stmmac_init_phy(), resulting in
>   simpler code in __stmmac_open().
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: stmmac: move stmmac_bus_clks_config() to stmmac_platform.c
    https://git.kernel.org/netdev/net-next/c/79d6e14e9cb3
  - [net-next,2/6] net: stmmac: move xpcs clause 73 test into stmmac_init_phy()
    https://git.kernel.org/netdev/net-next/c/f005ec4a3d6b
  - [net-next,3/6] net: stmmac: move PHY attachment error message into stmmac_init_phy()
    https://git.kernel.org/netdev/net-next/c/9641d727162d
  - [net-next,4/6] net: stmmac: move initialisation of priv->tx_lpi_timer to stmmac_open()
    https://git.kernel.org/netdev/net-next/c/bae62989a31b
  - [net-next,5/6] net: stmmac: move PHY handling out of __stmmac_open()/release()
    https://git.kernel.org/netdev/net-next/c/db299a0c09e9
  - [net-next,6/6] net: stmmac: simplify stmmac_init_phy()
    https://git.kernel.org/netdev/net-next/c/50acea3662bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
