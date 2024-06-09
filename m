Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C07B0901669
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Jun 2024 17:00:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ADC1C6C838;
	Sun,  9 Jun 2024 15:00:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD813C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Jun 2024 15:00:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F197620E8;
 Sun,  9 Jun 2024 15:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CAA9C4AF1D;
 Sun,  9 Jun 2024 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717945231;
 bh=sEvuJelJntixemBHKj20oqZhgwHOot8BPhwBUz8Va0I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=o7Wu94engqJPD62reFT6OXz+oNclILQNOIe2LJ5yD2OtKS1skqbvsJqPK+6zE6TrJ
 yE9gWVCo6sEIpnsSomPs63Ux8EaJpp7YM3RJgj6EnKQINA5+qU1wCojX052/HRC46j
 XpDT8GCoQCkDXSeU1SOn6nt6dhFxheb3hkJMYjstRfsJdq//lIH9l+0ac99riW/G23
 +JMuRfKZEiF4pMIJc9o0R9382sGe2Sc7Ajf/o+fIt7UAEOx6RovCjYCClMLGkT2j3i
 MNwM7HJ/k5yfPfTTkW73m+SFhWFFElMDV3VTDuQX79+Trk6YBkL/+r5S0LK4BtX68Y
 MBVIKVLEzQCPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 18321CF3BA5; Sun,  9 Jun 2024 15:00:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171794523109.27019.808801880558550935.git-patchwork-notify@kernel.org>
Date: Sun, 09 Jun 2024 15:00:31 +0000
References: <20240605-configure_ethernet_host_dma_width-v2-1-4cc34edfa388@quicinc.com>
In-Reply-To: <20240605-configure_ethernet_host_dma_width-v2-1-4cc34edfa388@quicinc.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, jh@henneberg-systemdesign.com,
 edumazet@google.com, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, vkoul@kernel.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: dwmac-qcom-ethqos:
 Configure host DMA width
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 5 Jun 2024 11:57:18 -0700 you wrote:
> Commit 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA
> address width") added support in the stmmac driver for platform drivers
> to indicate the host DMA width, but left it up to authors of the
> specific platforms to indicate if their width differed from the addr64
> register read from the MAC itself.
> 
> Qualcomm's EMAC4 integration supports only up to 36 bit width (as
> opposed to the addr64 register indicating 40 bit width). Let's indicate
> that in the platform driver to avoid a scenario where the driver will
> allocate descriptors of size that is supported by the CPU which in our
> case is 36 bit, but as the addr64 register is still capable of 40 bits
> the device will use two descriptors as one address.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: dwmac-qcom-ethqos: Configure host DMA width
    https://git.kernel.org/netdev/net/c/0579f2724904

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
