Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E272237A
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jun 2023 12:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F4CCC6A5E7;
	Mon,  5 Jun 2023 10:30:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E8FDC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jun 2023 10:30:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1AC0562262;
 Mon,  5 Jun 2023 10:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2663C433A8;
 Mon,  5 Jun 2023 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685961025;
 bh=r7SBNDzqQ4HkG3iYEwb6pL1Y01Nzjaui1CwJ0WgZ5iM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=o2hLna/xHHsvisys85SwYE1VKoBEIh5hdOaMAHHcM87tv5pAsgUMZspkTSpIPLJFQ
 aPdI5meRPprATPVmR2x6PtdfvjyW1nZ6JsaYBKu8mtDAzx0ygRjfBBbc9NXtFZPtbj
 KqrObSzNdt1sCi9pvBgRu7XPIja/z+64wzoiKpflkoenLOkniLx7Ck0KJROQYbd8lN
 G4G54wOrjociaXqL2AGgb42s4l/FfhKMJxbgaq+WR/SUEkcbyM61ZPvCNlPrvZjCmk
 eMZL5ULx08CoJicLRZt3a5isLTKmI5UZa0HwmkWO2OZ56VgbK9XraIj99tdYRz4OKI
 kAEpq/uP0Elcg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C021AE8723C; Mon,  5 Jun 2023 10:30:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168596102478.26938.1530517069555858195.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 10:30:24 +0000
References: <20230601141454.67858-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20230601141454.67858-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew@lunn.ch, vladimir.oltean@nxp.com, edumazet@google.com,
 thomas.petazzoni@bootlin.com, ioana.ciornei@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 linux@armlinux.org.uk, joabreu@synopsys.com, simon.horman@corigine.com,
 kuba@kernel.org, pabeni@redhat.com, broonie@kernel.org,
 alexis.lothore@bootlin.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, davem@davemloft.net,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/4] net: add a regmap-based
 mdio driver and drop TSE PCS
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
by David S. Miller <davem@davemloft.net>:

On Thu,  1 Jun 2023 16:14:50 +0200 you wrote:
> Hello everyone,
> 
> This is the V4 of a series that follows-up on the work [1] aiming to drop the
> altera TSE PCS driver, as it turns out to be a version of the Lynx PCS exposed
> as a memory-mapped block, instead of living on an MDIO bus.
> 
> One step of this removal involved creating a regmap-based mdio driver
> that translates MDIO accesses into the actual underlying bus that
> exposes the register. The register layout must of course match the
> standard MDIO layout, but we can now account for differences in stride
> with recent work on the regmap subsystem [2].
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] net: mdio: Introduce a regmap-based mdio driver
    https://git.kernel.org/netdev/net-next/c/642af0f92cbe
  - [net-next,v4,2/4] net: ethernet: altera-tse: Convert to mdio-regmap and use PCS Lynx
    https://git.kernel.org/netdev/net-next/c/db48abbaa18e
  - [net-next,v4,3/4] net: pcs: Drop the TSE PCS driver
    https://git.kernel.org/netdev/net-next/c/196eec4062b0
  - [net-next,v4,4/4] net: stmmac: dwmac-sogfpga: use the lynx pcs driver
    https://git.kernel.org/netdev/net-next/c/5d1f3fe7d2d5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
