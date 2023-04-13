Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F40926E0C20
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 13:10:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DC67C69063;
	Thu, 13 Apr 2023 11:10:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57324C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 11:10:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E571061506;
 Thu, 13 Apr 2023 11:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 441A6C433EF;
 Thu, 13 Apr 2023 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681384221;
 bh=047FHGu9Eh8p6igVsqOs4jlOjs1RHZPTczyCtqb9f/4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YXVm+OHaLTnqBfgcKFP4knXEdr5JTsUgTwsBhgF7TOKENOpQCuekM2c0EA/h+WIO+
 YYGrz9UHaKjWR7pe5/O/f96cTWNM4/jIgCSJe6AqzAhHC2+3WjxmUtAMendPPL1PfL
 ve/zg2SM8urW4HmGiHtPRvG3fv+fVB5FC1ieep42EfYzMrRnl0Yvi4I2jGws4XRNqi
 MxfNbnB0tK0lkuJxFAQhgUdQj/m7ceHdXldw/uNJtR7fL6AUlvUyR1uloPdcBGmsNa
 W2EtSA541g5l3/e6j5d9kV9KsKtz6mixNhqv+GtKD0dNCL3yXlxupt1uysCy8iyp6a
 FndSwIFFyplDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1C284E52443; Thu, 13 Apr 2023 11:10:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168138422111.3376.5659809856940118374.git-patchwork-notify@kernel.org>
Date: Thu, 13 Apr 2023 11:10:21 +0000
References: <20230411200409.455355-1-ahalaney@redhat.com>
In-Reply-To: <20230411200409.455355-1-ahalaney@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, agross@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrey.konovalov@linaro.org,
 ncai@quicinc.com, devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v4 00/12] Add EMAC3 support for
	sa8540p-ride
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 11 Apr 2023 15:03:57 -0500 you wrote:
> This is a forward port / upstream refactor of code delivered
> downstream by Qualcomm over at [0] to enable the DWMAC5 based
> implementation called EMAC3 on the sa8540p-ride dev board.
> 
> From what I can tell with the board schematic in hand,
> as well as the code delivered, the main changes needed are:
> 
> [...]

Here is the summary with links:
  - [net-next,v4,01/12] dt-bindings: net: snps,dwmac: Update interrupt-names
    https://git.kernel.org/netdev/net-next/c/d554ba0ea03c
  - [net-next,v4,02/12] dt-bindings: net: snps,dwmac: Add Qualcomm Ethernet ETHQOS compatibles
    https://git.kernel.org/netdev/net-next/c/d70c215bdd17
  - [net-next,v4,03/12] dt-bindings: net: qcom,ethqos: Convert bindings to yaml
    https://git.kernel.org/netdev/net-next/c/02e98ce3db14
  - [net-next,v4,04/12] dt-bindings: net: qcom,ethqos: Add Qualcomm sc8280xp compatibles
    https://git.kernel.org/netdev/net-next/c/25926a703ec1
  - [net-next,v4,05/12] net: stmmac: Remove unnecessary if statement brackets
    https://git.kernel.org/netdev/net-next/c/7c6b942b81ca
  - [net-next,v4,06/12] net: stmmac: Fix DMA typo
    https://git.kernel.org/netdev/net-next/c/d638dcb52b09
  - [net-next,v4,07/12] net: stmmac: Remove some unnecessary void pointers
    https://git.kernel.org/netdev/net-next/c/0c3f3c4f4b15
  - [net-next,v4,08/12] net: stmmac: Pass stmmac_priv in some callbacks
    https://git.kernel.org/netdev/net-next/c/1d84b487bc2d
  - [net-next,v4,09/12] net: stmmac: dwmac4: Allow platforms to specify some DMA/MTL offsets
    https://git.kernel.org/netdev/net-next/c/33719b57f52e
  - [net-next,v4,10/12] net: stmmac: dwmac-qcom-ethqos: Respect phy-mode and TX delay
    https://git.kernel.org/netdev/net-next/c/164a9ebe9742
  - [net-next,v4,11/12] net: stmmac: dwmac-qcom-ethqos: Use loopback_en for all speeds
    https://git.kernel.org/netdev/net-next/c/030f1d5972aa
  - [net-next,v4,12/12] net: stmmac: dwmac-qcom-ethqos: Add EMAC3 support
    https://git.kernel.org/netdev/net-next/c/b68376191c69

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
