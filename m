Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C4726D3B
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 22:40:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C993FC6A5E7;
	Wed,  7 Jun 2023 20:40:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02C12C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 20:40:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B109664601;
 Wed,  7 Jun 2023 20:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11881C433A0;
 Wed,  7 Jun 2023 20:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686170423;
 bh=BOLn3A57823G4qBo+ym8mgcosf66TbhUNu7uFQ63o34=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Vn94KhGlUumk436ycANz1+dZzKB4nm7+IZU9Iqm17MzNu5Ov41U0a5GbNEW+epRix
 fLGAnjPtINH7rBEYu+dic7HHQyRHIxdfM+07UdsM69cqacN+/XAn6Frwmrr8OtF9vW
 rCU5wB8V3izIHUEdFAYJy7/ql/D/2kMXKFSaDHH02mxLFgJXGZuy7wVBj131niUzbr
 4UxUgQulWeYuwzxajdhHWLvMwOwiIeQUHaAAIuMYCPjNjQlexYabhJ3yQDxkwmKd9/
 doIaGaObGDYwUjOJTkBDUwxcBnHclN53UrbQ2Ai+AknzRm1sAZ0IftqDxyyk2yySkz
 vK+Mkst2lfpzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E2550E29F3C; Wed,  7 Jun 2023 20:40:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168617042292.11974.2218551142896764762.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jun 2023 20:40:22 +0000
References: <20230607135941.407054-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20230607135941.407054-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew@lunn.ch, vladimir.oltean@nxp.com, edumazet@google.com,
 thomas.petazzoni@bootlin.com, ioana.ciornei@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 linux@armlinux.org.uk, joabreu@synopsys.com, simon.horman@corigine.com,
 kuba@kernel.org, pabeni@redhat.com, maciej.fijalkowski@intel.com,
 alexis.lothore@bootlin.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, chenfeiyang@loongson.cn,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/5] Followup fixes for the
 dwmac and altera lynx conversion
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

On Wed,  7 Jun 2023 15:59:36 +0200 you wrote:
> Hello everyone,
> 
> Here's yet another version of the cleanup series for the TSE PCS replacement
> by PCS Lynx. It includes Kconfig fixups, some missing initialisations
> and a slight rework suggested by Russell for the dwmac cleanup sequence,
> along with more explicit zeroing of local structures as per MAciej's
> review.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/5] net: altera-tse: Initialize local structs before using it
    https://git.kernel.org/netdev/net-next/c/2d830f7a4134
  - [net-next,v4,2/5] net: altera_tse: Use the correct Kconfig option for the PCS_LYNX dependency
    https://git.kernel.org/netdev/net-next/c/fae555f5a56f
  - [net-next,v4,3/5] net: stmmac: make the pcs_lynx cleanup sequence specific to dwmac_socfpga
    https://git.kernel.org/netdev/net-next/c/a8dd7404c214
  - [net-next,v4,4/5] net: altera_tse: explicitly disable autoscan on the regmap-mdio bus
    https://git.kernel.org/netdev/net-next/c/fa19a5d9dcff
  - [net-next,v4,5/5] net: dwmac_socfpga: initialize local data for mdio regmap configuration
    https://git.kernel.org/netdev/net-next/c/06b9dede1e7d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
