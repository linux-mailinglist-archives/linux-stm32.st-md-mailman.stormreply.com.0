Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6219EA791
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2024 06:10:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5888BC78021;
	Tue, 10 Dec 2024 05:10:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9D90C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 05:10:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74BEB5C4CED;
 Tue, 10 Dec 2024 05:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE6FC4CED6;
 Tue, 10 Dec 2024 05:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733807421;
 bh=3PFxSSpWAf1uej3O7h8d+RzULqKyQZ0CsWOcHahIS8Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=r5DIW0r/VhAd2ECaJf98oP2OK0PH5pluM0LmVmvuXQftBAz3Kvc0GBB1gYNAWofoU
 OvWYB4nuOAJP48oZC8JU3OMa89t5wynMF/6vWpKf6mgKoLBg15ElQJcYnPRRIZZQ3g
 7BPWUKVGpiTSTo1uzVTiyeFOTVmFlEn/wjsc5dX60ETAFfBFEj4dnZ0w9MnPa5tXy4
 YO4s3JkG5/CuHuN3to7O8HnS3i3evzVxJWa7ivs39csiVplv63toxbTbTnwJfRexh0
 QCrB7X697iWUdw0gmKR4deBPF9E0U5bVl8MpuuTTkwq7NjjMEoXt057QK6aOP1oc3L
 /foaMsTnmJ8Kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 716FC380A95E; Tue, 10 Dec 2024 05:10:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173380743727.355055.17303486442146316315.git-patchwork-notify@kernel.org>
Date: Tue, 10 Dec 2024 05:10:37 +0000
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
To: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Cc: andrew@lunn.ch, s32@nxp.com, kernel@esmil.dk, imx@lists.linux.dev,
 claudiu.beznea@tuxon.dev, edumazet@google.com, iyappan@os.amperecomputing.com,
 quan@os.amperecomputing.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 linux@armlinux.org.uk, joabreu@synopsys.com, jacob.e.keller@intel.com,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 keyur@os.amperecomputing.com, jan.petrous@oss.nxp.com,
 minda.chen@starfivetech.com, rmk+kernel@armlinux.org.uk,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, 0x1207@gmail.com,
 netdev@vger.kernel.org, nicolas.ferre@microchip.com, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, vkoul@kernel.org,
 kernel@pengutronix.de, krzk+dt@kernel.org, emil.renner.berthing@canonical.com,
 shawnguo@kernel.org, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v8 00/15] Add support for
 Synopsis DWMAC IP on NXP Automotive SoCs S32G2xx/S32G3xx/S32R45
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

On Thu, 05 Dec 2024 17:42:57 +0100 you wrote:
> The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> interface over Pinctrl device or the output can be routed
> to the embedded SerDes for SGMII connectivity.
> 
> The provided stmmac glue code implements only basic functionality,
> interface support is restricted to RGMII only. More, including
> SGMII/SerDes support will come later.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,01/15] net: stmmac: Fix CSR divider comment
    https://git.kernel.org/netdev/net-next/c/31cdd8418234
  - [net-next,v8,02/15] net: stmmac: Extend CSR calc support
    https://git.kernel.org/netdev/net-next/c/c8fab05d021d
  - [net-next,v8,03/15] net: stmmac: Fix clock rate variables size
    https://git.kernel.org/netdev/net-next/c/cb09f61a9ab8
  - [net-next,v8,04/15] net: phy: Add helper for mapping RGMII link speed to clock rate
    https://git.kernel.org/netdev/net-next/c/386aa60abdb6
  - [net-next,v8,05/15] net: dwmac-dwc-qos-eth: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/37b66c483e4c
  - [net-next,v8,06/15] net: dwmac-imx: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/839b75ea4d94
  - [net-next,v8,07/15] net: dwmac-intel-plat: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/8470bfc83515
  - [net-next,v8,08/15] net: dwmac-rk: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/30b4a9b5c335
  - [net-next,v8,09/15] net: dwmac-starfive: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/b561d717a799
  - [net-next,v8,10/15] net: macb: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/04207d28f468
  - [net-next,v8,11/15] net: xgene_enet: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/fd59bca4d5ea
  - [net-next,v8,12/15] net: dwmac-sti: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/1ead57775507
  - [net-next,v8,13/15] dt-bindings: net: Add DT bindings for DWMAC on NXP S32G/R SoCs
    https://git.kernel.org/netdev/net-next/c/91f10e589520
  - [net-next,v8,14/15] net: stmmac: dwmac-s32: add basic NXP S32G/S32R glue driver
    https://git.kernel.org/netdev/net-next/c/cd197ac5d661
  - [net-next,v8,15/15] MAINTAINERS: Add Jan Petrous as the NXP S32G/R DWMAC driver maintainer
    https://git.kernel.org/netdev/net-next/c/6bc6234cbd5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
