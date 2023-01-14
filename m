Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AD666A97A
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jan 2023 06:50:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C886C65E55;
	Sat, 14 Jan 2023 05:50:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD267C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jan 2023 05:50:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DEE960B45;
 Sat, 14 Jan 2023 05:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99D12C433EF;
 Sat, 14 Jan 2023 05:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673675418;
 bh=ngfQjwFKmCSeocAW86AdE9in/ESlzA2f+NOfkGPnaOg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PbzAb7FuLH7rstaaHzkqO/TKJ0jhzX5/WVGU1Atan9l2+aId0YIBwQBc6HEWGIdOx
 NpBUiimoP/3W4GeYmgQWkIyK0QxD26i1VH8jDscuPlEWm/rxaumM/fnWM8Us8rXkdc
 xVnwryq7I1nXtFLtPG4iU0vHUeQs6adLDniT54mEpUIdDbaTldpzW/tSZCCv49Latq
 ASQ9j+AGIg2kynwAdJes0zFQh1cxh1mZpE8rDdsFr7ssJaPfEAj30VnTs0y0CgEV7e
 g99L+fsWom9cv4n4jn7ebEEiBWKp8bDx58WvX+T4uizSBRsOOFIll46WgLTttVOLUn
 Um0jMC9DtZRtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 75D05E21EE0; Sat, 14 Jan 2023 05:50:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167367541847.15756.1816103460556617097.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jan 2023 05:50:18 +0000
References: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
In-Reply-To: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
To: Michael Walle <michael@walle.cc>
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com,
 linux-aspeed@lists.ozlabs.org, vladimir.oltean@nxp.com, edumazet@google.com,
 leoyang.li@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, kuba@kernel.org,
 pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com,
 rjui@broadcom.com, sean.wang@mediatek.com, claudiu.manoil@nxp.com,
 linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 sbranden@broadcom.com, andrew@aj.id.au, bryan.whitehead@microchip.com,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, hkallweit1@gmail.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH net-next 00/10] net: mdio: Continue
	separating C22 and C45
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
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Jan 2023 16:15:07 +0100 you wrote:
> I've picked this older series from Andrew up and rebased it onto
> the latest net-next.
> 
> This is the second patch set in the series which separates the C22
> and C45 MDIO bus transactions at the API level to the MDIO bus drivers.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> 
> [...]

Here is the summary with links:
  - [net-next,01/10] net: mdio: cavium: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/93641ecbaa1f
  - [net-next,02/10] net: mdio: i2c: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/87e3bee0f247
  - [net-next,03/10] net: mdio: mux-bcm-iproc: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/d544a25930a7
  - [net-next,04/10] net: mdio: aspeed: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/c3c497eb8b24
  - [net-next,05/10] net: mdio: ipq4019: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/c58e39942adf
  - [net-next,06/10] net: ethernet: mtk_eth_soc: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/900888374e73
  - [net-next,07/10] net: lan743x: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/3d90c03cb416
  - [net-next,08/10] net: stmmac: Separate C22 and C45 transactions for xgmac2
    https://git.kernel.org/netdev/net-next/c/5b0a447efff5
  - [net-next,09/10] net: stmmac: Separate C22 and C45 transactions for xgmac
    https://git.kernel.org/netdev/net-next/c/3c7826d0b106
  - [net-next,10/10] enetc: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/80e87442e69b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
