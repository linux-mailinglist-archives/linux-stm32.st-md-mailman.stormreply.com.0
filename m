Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB2B8BB13
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Sep 2025 02:30:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57B3BC3F93A;
	Sat, 20 Sep 2025 00:30:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB64FC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Sep 2025 00:30:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A0FEF6013C;
 Sat, 20 Sep 2025 00:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A72C4CEF0;
 Sat, 20 Sep 2025 00:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758328219;
 bh=Yes7uCAJIf1OW9O4lN6N9kWrrNuylVquEJn5lf44T44=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LlSAb8P8UrBmrtodlL0ShRrL0RB/FGZLzl+svKgxt3WY1vou6qUJwz7D00B/ZXSle
 dmmeHMKIrCaZPNQYJ+hbARFCLF3BeG7+mz+dA8iu16BHLxtWaMVYHn18eynY59S/H9
 /yJYfv6NkCmIc8bZBwewQOWosl+jp9OATHySy4BBchEKejpLe42R6GnT0ArMrcZcQl
 7KvspaiqADgBilZFJk9CxI1SLjT2ttZ6NdGhUs5mUL1c8a84R8T5jqZSj0cStOifYd
 T2cP/YDSwrwUsiYhSxYdupE+K5NMm8whtP8u94NItPIpXVKTOcTvlB1gTfV4WKbTHf
 PN2u2DiCDEE6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADFF439D0C20; Sat, 20 Sep 2025 00:30:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175832821850.3748897.10411784128279455244.git-patchwork-notify@kernel.org>
Date: Sat, 20 Sep 2025 00:30:18 +0000
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, kernel@esmil.dk, imx@lists.linux.dev, edumazet@google.com,
 guoren@kernel.org, linux-riscv@lists.infradead.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org, kuba@kernel.org,
 pabeni@redhat.com, linux-sunxi@lists.linux.dev, kernel@pengutronix.de,
 s.hauer@pengutronix.de, minda.chen@starfivetech.com, vz@mleia.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, fustini@kernel.org,
 hkallweit1@gmail.com, shawnguo@kernel.org, davem@davemloft.net,
 wefu@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next 00/10] net: stmmac: remove
	mac_interface
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

On Wed, 17 Sep 2025 16:11:33 +0100 you wrote:
> The dwmac core supports a range of interfaces, but when it comes to
> SerDes interfaces, the core itself does not include the SerDes block.
> Consequently, it has to provide an interface suitable to interface such
> a block to, and uses TBI for this.
> 
> The driver also uses "PCS" for RGMII, even though the dwmac PCS block
> is not present for this interface type - it was a convenice for the
> code structure as RGMII includes inband signalling of the PHY state,
> much like Cisco SGMII does at a high level.
> 
> [...]

Here is the summary with links:
  - [net-next,01/10] net: stmmac: rework mac_interface and phy_interface documentation
    https://git.kernel.org/netdev/net-next/c/32a8d2a197c1
  - [net-next,02/10] net: stmmac: use phy_interface in stmmac_check_pcs_mode()
    https://git.kernel.org/netdev/net-next/c/0522f152a2c9
  - [net-next,03/10] net: stmmac: imx: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/db1948da6860
  - [net-next,04/10] net: stmmac: ingenic: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/9ff682b4a28f
  - [net-next,05/10] net: stmmac: socfpga: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/de696c63c1dc
  - [net-next,06/10] net: stmmac: starfive: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/6cb2b69c3419
  - [net-next,07/10] net: stmmac: stm32: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/0ca60c26f655
  - [net-next,08/10] net: stmmac: sun8i: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/0fe080fa884e
  - [net-next,09/10] net: stmmac: thead: convert to use phy_interface
    https://git.kernel.org/netdev/net-next/c/3a94ecdf1afb
  - [net-next,10/10] net: stmmac: remove mac_interface
    https://git.kernel.org/netdev/net-next/c/6b0ed6a3a89c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
