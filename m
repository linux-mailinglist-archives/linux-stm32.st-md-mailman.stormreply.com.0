Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A623B673D7F
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jan 2023 16:30:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39414C6904C;
	Thu, 19 Jan 2023 15:30:22 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4149C69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 15:30:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CFBD8B8252B;
 Thu, 19 Jan 2023 15:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62A2EC433EF;
 Thu, 19 Jan 2023 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674142218;
 bh=FP4ru6E8Oo1JNr9DNk54UNNPsvn5fuH6fMcjfdBl9lY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bFB7tr99GI5Hq9EBVHmPrjqEzs9dqNrQDOhNaSTZhid/ub9KtLtAbp6OrBy+XmNZd
 Ys9K9qWgQGZpyCFNH5lCqncShoKEdtrNFA266NAB6zpE/qD6ZzYuobsVgof6W0XFC3
 smDWAszIxvhLusZnZm+S1wiJcv/xWWC4lmGNyooLA6sEPZtCMcTIueGF/qexVHMRL0
 GSqDqp59ittarba+p35/hEqdy+bVRKTY6oyU5blSnT90PMfmI5yNaNsMw1XGzUl31k
 gDr0yNHZtLCad1rWNA2lx7AZFozMamdVIkRPdHcdbqG9lVoP8sQvqoLVo+ySOAT4NR
 Eh/O2sbpfBD4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2E094E54D27; Thu, 19 Jan 2023 15:30:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167414221817.31934.14400606803161415762.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jan 2023 15:30:18 +0000
References: <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
In-Reply-To: <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
To: Michael Walle <michael@walle.cc>
Cc: andrew@lunn.ch, linux-aspeed@lists.ozlabs.org, jesse.brandeburg@intel.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 linux@armlinux.org.uk, joabreu@synopsys.com, joel@jms.id.au, kuba@kernel.org,
 pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com,
 sean.wang@mediatek.com, linux-mediatek@lists.infradead.org, john@phrozen.org,
 matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, andrew@aj.id.au,
 bryan.whitehead@microchip.com, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, hkallweit1@gmail.com, davem@davemloft.net,
 nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/6] net: phy: Remove
	probe_capabilities
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

This series was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Jan 2023 11:01:35 +0100 you wrote:
> With all the drivers which used .probe_capabilities converted to the
> new c45 MDIO access methods, we can now decide based upon these whether
> a bus driver supports c45 and we can get rid of the not widely used
> probe_capabilites.
> 
> Unfortunately, due to a now broader support of c45 scans, this will
> trigger a bug on some boards with a (c22-only) Micrel PHY. These PHYs
> don't ignore c45 accesses correctly, thinking they are addressed
> themselves and distrupt the MDIO access. To avoid this, a blacklist
> for c45 scans is introduced.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/6] net: mdio: Move mdiobus_scan() within file
    https://git.kernel.org/netdev/net-next/c/81d874e7c84e
  - [net-next,v2,2/6] net: mdio: Rework scanning of bus ready for quirks
    https://git.kernel.org/netdev/net-next/c/d41e127757f3
  - [net-next,v2,3/6] net: mdio: Add workaround for Micrel PHYs which are not C45 compatible
    https://git.kernel.org/netdev/net-next/c/348659337485
  - [net-next,v2,4/6] net: mdio: scan bus based on bus capabilities for C22 and C45
    https://git.kernel.org/netdev/net-next/c/1a136ca2e089
  - [net-next,v2,5/6] net: phy: Decide on C45 capabilities based on presence of method
    https://git.kernel.org/netdev/net-next/c/fbfe97597c77
  - [net-next,v2,6/6] net: phy: Remove probe_capabilities
    https://git.kernel.org/netdev/net-next/c/da099a7fb13d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
