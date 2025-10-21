Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB5BF4290
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 02:40:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E7E6C5A4F1;
	Tue, 21 Oct 2025 00:40:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3157C5A4E4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 00:40:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1601461407;
 Tue, 21 Oct 2025 00:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F8AC4CEFB;
 Tue, 21 Oct 2025 00:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761007250;
 bh=UU1RkXwZN8NwOrfKRqz1pbaC+bNTIeLHOSMus2MSmCI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=RuVmwOUXaDCl969T+Def4jubbj5ikNZL1Jx+dMTQsZsDS/LntPH3l06U4H+N30OaJ
 0iJUOXcIrix6lyQw/c0S5arVQH19mYzFYMxfDmHLYV10LYhcnA5wToKukUmz3TfFcd
 UhpG5GehVxOG9PrEA2NWHu+QaoG8iQz6vY19Zow4+5SvQh/B6T4o8Qt7dcHJJb+rtm
 7fYIZnsdZxRgs52WtPeOThufbn/RooNRUOnd9shGeA16HyvZItmqx7NAU2AILD2gsQ
 3jyVQv/3Yup5sCGwmxrLirr0UYNWqw4fgY+Vl3YUdBeWN8UHqdQgqEtwYAIwlfFEoz
 8ARJgAhOeJJSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADEF33A4102D; Tue, 21 Oct 2025 00:40:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176100723252.470828.3402215548050414141.git-patchwork-notify@kernel.org>
Date: Tue, 21 Oct 2025 00:40:32 +0000
References: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
In-Reply-To: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hayashi.kunihiko@socionext.com, kees@kernel.org,
 vladimir.oltean@nxp.com, 0x1207@gmail.com, swathi.ks@samsung.com,
 edumazet@google.com, jszhang@kernel.org, horms@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, eleanor15x@gmail.com,
 yoong.siang.song@intel.com, faizal.abdul.rahim@linux.intel.com,
 o.rempel@pengutronix.de, shenwei.wang@nxp.com, quic_abchauha@quicinc.com,
 jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com,
 yangtiezhu@loongson.cn, daniel.machon@microchip.com,
 leyfoon.tan@starfivetech.com, linux-arm-msm@vger.kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 yong.liang.choong@linux.intel.com, alexis.lothore@bootlin.com,
 dfustini@tenstorrent.com, linux-arm-kernel@lists.infradead.org,
 rohan.g.thomas@altera.com, olteanv@gmail.com, inochiama@gmail.com,
 andrew+netdev@lunn.ch, vkoul@kernel.org, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 michal.swiatkowski@linux.intel.com, emil.renner.berthing@canonical.com,
 matthew.gerlach@altera.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/14] net: stmmac: phylink
	PCS conversion
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

On Thu, 16 Oct 2025 15:35:22 +0100 you wrote:
> This series is radical - it takes the brave step of ripping out much of
> the existing PCS support code and throwing it all away.
> 
> I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
> flag with Bartosz Golaszewski, and the conclusion I came to is that
> this is to workaround the breakage that I've been going on about
> concerning the phylink conversion for the last five or six years.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/14] net: stmmac: remove broken PCS code
    https://git.kernel.org/netdev/net-next/c/813882ae2275
  - [net-next,v2,02/14] net: stmmac: remove xstats.pcs_* members
    https://git.kernel.org/netdev/net-next/c/14f74bc6dc69
  - [net-next,v2,03/14] net: stmmac: remove SGMII/RGMII/SMII interrupt handling
    https://git.kernel.org/netdev/net-next/c/2e2c878a3141
  - [net-next,v2,04/14] net: stmmac: remove PCS "mode" pause handling
    https://git.kernel.org/netdev/net-next/c/ebc5d656b78c
  - [net-next,v2,05/14] net: stmmac: remove unused PCS loopback support
    https://git.kernel.org/netdev/net-next/c/19064a58bd3c
  - [net-next,v2,06/14] net: stmmac: remove hw->ps xxx_core_init() hardware setup
    https://git.kernel.org/netdev/net-next/c/aa1b6775aef7
  - [net-next,v2,07/14] net: stmmac: remove RGMII "pcs" mode
    https://git.kernel.org/netdev/net-next/c/70589b05a03e
  - [net-next,v2,08/14] net: stmmac: move reverse-"pcs" mode setup to stmmac_check_pcs_mode()
    https://git.kernel.org/netdev/net-next/c/c7b0d7874de0
  - [net-next,v2,09/14] net: stmmac: simplify stmmac_check_pcs_mode()
    https://git.kernel.org/netdev/net-next/c/412d5f32cb36
  - [net-next,v2,10/14] net: stmmac: hw->ps becomes hw->reverse_sgmii_enable
    https://git.kernel.org/netdev/net-next/c/5d1e7621f869
  - [net-next,v2,11/14] net: stmmac: do not require snps,ps-speed for SGMII
    https://git.kernel.org/netdev/net-next/c/5c61db08d9ae
  - [net-next,v2,12/14] net: stmmac: only call stmmac_pcs_ctrl_ane() for integrated SGMII PCS
    https://git.kernel.org/netdev/net-next/c/045d7e5727c4
  - [net-next,v2,13/14] net: stmmac: provide PCS initialisation hook
    https://git.kernel.org/netdev/net-next/c/237e54caeaef
  - [net-next,v2,14/14] net: stmmac: convert to phylink PCS support
    https://git.kernel.org/netdev/net-next/c/2c81f3357136

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
