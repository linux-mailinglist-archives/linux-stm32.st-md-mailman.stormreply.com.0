Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D054F4F9
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jun 2022 12:10:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDF99C5F1F9;
	Fri, 17 Jun 2022 10:10:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8E77C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 10:10:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1AE561D55;
 Fri, 17 Jun 2022 10:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE9C3C341C6;
 Fri, 17 Jun 2022 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655460614;
 bh=52/+SN6B+LFLyhgNHFfrjORprDXjBmbr0acNX3B3atA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DPznx/ogu/fxQ9dBt1h2G0/NTLaABcU3+4J1HY7VsFpLRdTXyJfIXBh+SpvF8HEqh
 zCRdei24qxitcSEgYhCJAtEVWRiJzvSU8L9AnocQ3WJssDhShiTjxjT9TaSB/ZXFfs
 CrX9jw5fnmyrO6ltRKAYvlTWcmJuWtVc2mlWduCUbFu38YZuHekmC09KEiUwJEoQtB
 fgAGoE1aYt2lADkraQAp1J5ZXb8JaRZ4tRVo1Y5iqfQ8f6qMclnu8qS7nPZKQl/7vJ
 0GfwUL+Kt7PVeTZMMJSNxi/2xqHidEaroXZHHRTIzWFdPEg3uVTfIr8BXtKk/3jb2f
 xygf9hBDER/fA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 925EEE56ADF; Fri, 17 Jun 2022 10:10:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165546061459.1839.10863742646357502516.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jun 2022 10:10:14 +0000
References: <20220615083908.1651975-1-boon.leong.ong@intel.com>
In-Reply-To: <20220615083908.1651975-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, olteanv@gmail.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, emilio.riva@ericsson.com,
 linux-stm32@st-md-mailman.stormreply.com, vivien.didelot@gmail.com,
 linux@armlinux.org.uk, edumazet@google.com, f.fainelli@gmail.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v5 0/5] pcs-xpcs,
 stmmac: add 1000BASE-X AN for network switch
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
by David S. Miller <davem@davemloft.net>:

On Wed, 15 Jun 2022 16:39:03 +0800 you wrote:
> Thanks for v4 review feedback in [1] and [2]. I have changed the v5
> implementation as follow.
> 
> v5 changes:
> 1/5 - No change from v4.
> 2/5 - No change from v4.
> 3/5 - [Fix] make xpcs_modify_changed() static and use
>       mdiodev_modify_changed() for cleaner code as suggested by
>       Russell King.
> 4/5 - [Fix] Use fwnode_get_phy_mode() as recommended by Andrew Lunn.
> 5/5 - [Fix] Make fwnode = of_fwnode_handle(priv->plat->phylink_node)
>       order after priv = netdev_priv(dev).
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/5] net: make xpcs_do_config to accept advertising for pcs-xpcs and sja1105
    https://git.kernel.org/netdev/net-next/c/fa9c562f9735
  - [net-next,v5,2/5] stmmac: intel: prepare to support 1000BASE-X phy interface setting
    https://git.kernel.org/netdev/net-next/c/c82386310d95
  - [net-next,v5,3/5] net: pcs: xpcs: add CL37 1000BASE-X AN support
    https://git.kernel.org/netdev/net-next/c/b47aec885bcd
  - [net-next,v5,4/5] stmmac: intel: add phy-mode and fixed-link ACPI _DSD setting support
    https://git.kernel.org/netdev/net-next/c/72edaf39fc65
  - [net-next,v5,5/5] net: stmmac: make mdio register skips PHY scanning for fixed-link
    https://git.kernel.org/netdev/net-next/c/ab21cf920928

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
