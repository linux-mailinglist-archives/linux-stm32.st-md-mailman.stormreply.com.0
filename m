Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAF4A0A038
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jan 2025 03:10:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE4BBC78F72;
	Sat, 11 Jan 2025 02:10:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A049CC78F6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jan 2025 02:10:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 589265C595C;
 Sat, 11 Jan 2025 02:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2990C4CED6;
 Sat, 11 Jan 2025 02:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736561423;
 bh=DEfwp4XBTsdzzsNRV5w7wnpG6wWSu/8qAaGrRyAKc5I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qJf7OL/sLA88XpOeplNMc/0+yDnKglR9KA5yWmzEG+Nl5sT2fSuIK6KhvRAroa/6p
 QlctkjG3cK5lGL+ficRQBy8nLWEN3mkxJrUVyuoZFRp58EUCVfsFOBuLtMk6mb2Z1V
 pwLz7I+Tr3vp94q7sUbS4presUbVgwvyTsBYc+0JDJnqlepbVEdZ5F9xUtCFGe9wlL
 OXTcQjNx2fogkqNzVI+c3NhmKGoXoDRIXrY0qzJUHkJixQoSDRsoQDCk4x7f2s7Wcu
 emBvY+6tj5t44/urzVpXdLaQMtwezVL2MzrYioIQn35EzwqqfLm7wn8W1/7K4g3CEL
 xn5/csFmZpkdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C89380AA57; Sat, 11 Jan 2025 02:10:46 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173656144498.2267647.15302002781849970108.git-patchwork-notify@kernel.org>
Date: Sat, 11 Jan 2025 02:10:44 +0000
References: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
In-Reply-To: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v4 00/18] net: stmmac: clean up
 and fix EEE implementation
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

On Wed, 8 Jan 2025 16:47:24 +0000 you wrote:
> Hi,
> 
> This is a rework of stmmac's EEE support in light of the addition of EEE
> management to phylib. It's slightly more than 15 patches, but I think it
> makes sense to be so.
> 
> Patch 1 adds configuration of the receive clock phy_eee_rx_clock_stop()
> (which was part of another series, but is necessary for this patch set.)
> 
> [...]

Here is the summary with links:
  - [net-next,v4,01/18] net: phy: add configuration of rx clock stop mode
    https://git.kernel.org/netdev/net-next/c/cf337105ad38
  - [net-next,v4,02/18] net: stmmac: move tx_lpi_timer tracking to phylib
    https://git.kernel.org/netdev/net-next/c/1991819debaa
  - [net-next,v4,03/18] net: stmmac: use correct type for tx_lpi_timer
    https://git.kernel.org/netdev/net-next/c/bba9f4765515
  - [net-next,v4,04/18] net: stmmac: use unsigned int for eee_timer
    https://git.kernel.org/netdev/net-next/c/7e19a351b22d
  - [net-next,v4,05/18] net: stmmac: make EEE depend on phy->enable_tx_lpi
    https://git.kernel.org/netdev/net-next/c/beb1e0148e6d
  - [net-next,v4,06/18] net: stmmac: remove redundant code from ethtool EEE ops
    https://git.kernel.org/netdev/net-next/c/80fada6c0d3e
  - [net-next,v4,07/18] net: stmmac: clean up stmmac_disable_eee_mode()
    https://git.kernel.org/netdev/net-next/c/e40dd46d2fc5
  - [net-next,v4,08/18] net: stmmac: remove priv->tx_lpi_enabled
    https://git.kernel.org/netdev/net-next/c/865ff410a071
  - [net-next,v4,09/18] net: stmmac: report EEE error statistics if EEE is supported
    https://git.kernel.org/netdev/net-next/c/517dc0450675
  - [net-next,v4,10/18] net: stmmac: convert to use phy_eee_rx_clock_stop()
    https://git.kernel.org/netdev/net-next/c/a3242177d9f2
  - [net-next,v4,11/18] net: stmmac: remove priv->eee_tw_timer
    https://git.kernel.org/netdev/net-next/c/2914a5cd811a
  - [net-next,v4,12/18] net: stmmac: move priv->eee_enabled into stmmac_eee_init()
    https://git.kernel.org/netdev/net-next/c/0a900ea89a0c
  - [net-next,v4,13/18] net: stmmac: move priv->eee_active into stmmac_eee_init()
    https://git.kernel.org/netdev/net-next/c/1797dd4e3e8e
  - [net-next,v4,14/18] net: stmmac: use boolean for eee_enabled and eee_active
    https://git.kernel.org/netdev/net-next/c/cfd49e5fc30c
  - [net-next,v4,15/18] net: stmmac: move setup of eee_ctrl_timer to stmmac_dvr_probe()
    https://git.kernel.org/netdev/net-next/c/84f2776e3919
  - [net-next,v4,16/18] net: stmmac: remove unnecessary EEE handling in stmmac_release()
    https://git.kernel.org/netdev/net-next/c/27af08164247
  - [net-next,v4,17/18] net: stmmac: split hardware LPI timer control
    https://git.kernel.org/netdev/net-next/c/17f47da103a6
  - [net-next,v4,18/18] net: stmmac: remove stmmac_lpi_entry_timer_config()
    https://git.kernel.org/netdev/net-next/c/1655a2279971

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
