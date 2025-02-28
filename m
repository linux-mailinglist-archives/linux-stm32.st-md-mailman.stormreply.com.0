Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B33A4A192
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 19:30:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A9D9C7128F;
	Fri, 28 Feb 2025 18:30:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9E7DC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 18:30:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3C35461FC3;
 Fri, 28 Feb 2025 18:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917B1C4CEED;
 Fri, 28 Feb 2025 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740767401;
 bh=OilwAZ5RXV38zTb+M44/89NDdAfBWpMVpgBj9F3ie5M=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qko06JpBaB0Mhqay9/mFCbAZRqjBKioIFBIjsaLX69CFiooIOK6cQTIib8VidkwDa
 6920EKQBFWvPxU/KaDSCCQeUmtMyIhUFxJ4SaiAw+TBD9dSJ0sDdr0AIc+oDoyea1u
 Cc0CV4QGr2nGWBKrENwhuXlvL4dMSg7D60RJwDn6Ay2EiIGoH5Re4bbPE/fUduBWAl
 ED/lJ4r/dxbL76l1rHW5blvs99gEzk0NkQhN1AmHpo1/2Viw687dTXHMY1839QATdA
 CihdYAaDCONwhLA+EZWj70TPPMYxNRubEUWc1r8VX0g5dC2CXgcB4OQ0nXMhkcf+XD
 ym4ylURLCwE1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB9B4380CFF1; Fri, 28 Feb 2025 18:30:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174076743376.2237263.14950662798271470831.git-patchwork-notify@kernel.org>
Date: Fri, 28 Feb 2025 18:30:33 +0000
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, kernel@esmil.dk, imx@lists.linux.dev, edumazet@google.com,
 guoren@kernel.org, linux-riscv@lists.infradead.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 khilman@baylibre.com, drew@pdp7.com, kuba@kernel.org, pabeni@redhat.com,
 kernel@pengutronix.de, martin.blumenstingl@googlemail.com,
 s.hauer@pengutronix.de, jan.petrous@oss.nxp.com, minda.chen@starfivetech.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, shawnguo@kernel.org,
 davem@davemloft.net, wefu@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next 00/11] net: stmmac: cleanup
	transmit clock setting
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

On Thu, 27 Feb 2025 09:16:15 +0000 you wrote:
> Hi,
> 
> A lot of stmmac platform code which sets the transmit clock is very
> similar - they decode the speed to the clock rate (125, 25 or 2.5 MHz)
> and then set a clock to that rate.
> 
> The DWMAC core appears to have a clock input for the transmit section
> called clk_tx_i which requires this rate.
> 
> [...]

Here is the summary with links:
  - [net-next,01/11] net: stmmac: provide set_clk_tx_rate() hook
    https://git.kernel.org/netdev/net-next/c/dea5c8ec20be
  - [net-next,02/11] net: stmmac: provide generic implementation for set_clk_tx_rate method
    https://git.kernel.org/netdev/net-next/c/12bce6d5404e
  - [net-next,03/11] net: stmmac: dwc-qos: use generic stmmac_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/17c24f6dc641
  - [net-next,04/11] net: stmmac: starfive: use generic stmmac_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/c81eb3da0be8
  - [net-next,05/11] net: stmmac: s32: use generic stmmac_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/36fa8c960720
  - [net-next,06/11] net: stmmac: intel: use generic stmmac_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/61356fb1b0d6
  - [net-next,07/11] net: stmmac: imx: use generic stmmac_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/b693ce4f2704
  - [net-next,08/11] net: stmmac: rk: switch to use set_clk_tx_rate() hook
    https://git.kernel.org/netdev/net-next/c/c8caf6100f6d
  - [net-next,09/11] net: stmmac: ipq806x: switch to use set_clk_tx_rate() hook
    https://git.kernel.org/netdev/net-next/c/ca723519c28b
  - [net-next,10/11] net: stmmac: meson: switch to use set_clk_tx_rate() hook
    https://git.kernel.org/netdev/net-next/c/2a7d55f901a5
  - [net-next,11/11] net: stmmac: thead: switch to use set_clk_tx_rate() hook
    https://git.kernel.org/netdev/net-next/c/945db208fbe7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
