Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 996D1C3376A
	for <lists+linux-stm32@lfdr.de>; Wed, 05 Nov 2025 01:20:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 399FCC57B72;
	Wed,  5 Nov 2025 00:20:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABD85C57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Nov 2025 00:20:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5491D44861;
 Wed,  5 Nov 2025 00:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C497C116B1;
 Wed,  5 Nov 2025 00:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762302049;
 bh=3MKFuCG76JthLJcZE3T3Op7stJ2k8Ttv8bqnfs9tWiE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=INojycZy/a78lhVsLvVbeiECZLvsgpUyNONTu4veLZSMfi2e3lJyk0lhbjUy3QZHZ
 NGDkYI9wKuMd+GNF8uaYyfmeV5vBqYG0eNH75xE9lfqkLTr6by2JUbcU2MxPGWLMNY
 wjqIqv4bXs0DnB0y1BJG5h7QYMVEH01j69TJfwp9D1CNtZ1GKdR3YLFkYEgU89DU9H
 3qJgmPG4RulqybvIwgtHGcVoUQR9GI0YGS1eP6mJzlwxLW39Q+Ha8g3OunNUZMxdz+
 mYWN4bT+tNgUNH9kDvYI8/YyHC9cMX7rIZ2X0P+YdUkW7agsF7NY7onfZo5qshndfO
 CmVHFirNLCsOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33CB2380AA54; Wed,  5 Nov 2025 00:20:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176230202300.3035250.17732707564655810857.git-patchwork-notify@kernel.org>
Date: Wed, 05 Nov 2025 00:20:23 +0000
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, s32@nxp.com, kernel@pengutronix.de, imx@lists.linux.dev,
 netdev@vger.kernel.org, s.hauer@pengutronix.de, jan.petrous@oss.nxp.com,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, festevam@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 00/11] net: stmmac:
	multi-interface stmmac
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

On Mon, 3 Nov 2025 11:49:35 +0000 you wrote:
> Hi,
> 
> This series adds a callback for platform glue to configure the stmmac
> core interface mode depending on the PHY interface mode that is being
> used. This is currently only called justbefore the dwmac core is reset
> since these signals are latched on reset.
> 
> [...]

Here is the summary with links:
  - [net-next,01/11] net: stmmac: imx: use phylink's interface mode for set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/42190a188fdb
  - [net-next,02/11] net: stmmac: s32: move PHY_INTF_SEL_x definitions out of the way
    https://git.kernel.org/netdev/net-next/c/d8df08b0df02
  - [net-next,03/11] net: stmmac: add phy_intf_sel and ACTPHYIF definitions
    https://git.kernel.org/netdev/net-next/c/38e8c0fb0fc3
  - [net-next,04/11] net: stmmac: add stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/2f2a7b907446
  - [net-next,05/11] net: stmmac: add support for configuring the phy_intf_sel inputs
    https://git.kernel.org/netdev/net-next/c/15ade7dbf64f
  - [net-next,06/11] net: stmmac: imx: convert to PHY_INTF_SEL_xxx
    https://git.kernel.org/netdev/net-next/c/8088ca0d88f8
  - [net-next,07/11] net: stmmac: imx: use FIELD_PREP()/FIELD_GET() for PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/27db57875c08
  - [net-next,08/11] net: stmmac: imx: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/cb09d1b9582a
  - [net-next,09/11] net: stmmac: imx: simplify set_intf_mode() implementations
    https://git.kernel.org/netdev/net-next/c/8fc75fe5948d
  - [net-next,10/11] net: stmmac: imx: cleanup arguments for set_intf_mode() method
    https://git.kernel.org/netdev/net-next/c/fb526d0c16c1
  - [net-next,11/11] net: stmmac: imx: use ->set_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/da836959c78a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
