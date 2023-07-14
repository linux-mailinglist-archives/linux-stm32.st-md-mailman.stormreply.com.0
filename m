Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881D753047
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jul 2023 06:00:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 305DCC6B44F;
	Fri, 14 Jul 2023 04:00:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E8F7C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 04:00:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4709861BE9;
 Fri, 14 Jul 2023 04:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 988B2C433D9;
 Fri, 14 Jul 2023 04:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689307223;
 bh=6bPJwDcuSz1rKBjG/24ejrCn4JBeXx8kMtEpTwCEv2U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=AAU+8ZLPWahRElzfzmALzyJASlYHee9u0PGrejGSQIwx5fo25CRbvg4uxgfJ6rEqf
 RXL16BSxfG7kART5wIhq3dxChc2wTsmVl1yAfGiMPHb3codCrZYAX0ElN6vp+qwTlM
 O/vWd7nokniqxUVN2Ve9HbEZl610bfjNAMMvnbqt2xq+i5O76kpNZjvj4blQKgYT4z
 xiCmnj/LiVwqBddhhniXy5srW7jbbEpN2AvTNNC3bXILfPUCFP+EJAqvSCiergccsW
 YS5ywkC9aI11si9SNweKTYwHKYWoz4FVlUcu8tkTNN1QQy1gCJ2Y42r2IpQiHzb2Wk
 Bu54B8qkv5xRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7FF81E29F45; Fri, 14 Jul 2023 04:00:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168930722351.11211.15860000420900768155.git-patchwork-notify@kernel.org>
Date: Fri, 14 Jul 2023 04:00:23 +0000
References: <20230710090001.303225-1-brgl@bgdev.pl>
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-tegra@vger.kernel.org, edumazet@google.com, thierry.reding@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com, wens@csie.org,
 joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com,
 linux-sunxi@lists.linux.dev, bhupesh.sharma@linaro.org,
 richardcochran@gmail.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, bartosz.golaszewski@linaro.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 00/12] net: stmmac: replace
 boolean fields in plat_stmmacenet_data with flags
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

On Mon, 10 Jul 2023 10:59:49 +0200 you wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.
> 
> v2 -> v3:
> - fix build on intel platforms even more
> - collect review tags from Andrew
> 
> [...]

Here is the summary with links:
  - [net-next,v3,01/12] net: stmmac: replace the has_integrated_pcs field with a flag
    https://git.kernel.org/netdev/net-next/c/d26979f1cef7
  - [net-next,v3,02/12] net: stmmac: replace the sph_disable field with a flag
    https://git.kernel.org/netdev/net-next/c/309efe6eb499
  - [net-next,v3,03/12] net: stmmac: replace the use_phy_wol field with a flag
    https://git.kernel.org/netdev/net-next/c/fd1d62d80ebc
  - [net-next,v3,04/12] net: stmmac: replace the has_sun8i field with a flag
    https://git.kernel.org/netdev/net-next/c/d8daff284e30
  - [net-next,v3,05/12] net: stmmac: replace the tso_en field with a flag
    https://git.kernel.org/netdev/net-next/c/68861a3bcc1c
  - [net-next,v3,06/12] net: stmmac: replace the serdes_up_after_phy_linkup field with a flag
    https://git.kernel.org/netdev/net-next/c/efe92571bfc3
  - [net-next,v3,07/12] net: stmmac: replace the vlan_fail_q_en field with a flag
    https://git.kernel.org/netdev/net-next/c/fc02152bdbb2
  - [net-next,v3,08/12] net: stmmac: replace the multi_msi_en field with a flag
    https://git.kernel.org/netdev/net-next/c/956c3f09b9c4
  - [net-next,v3,09/12] net: stmmac: replace the ext_snapshot_en field with a flag
    https://git.kernel.org/netdev/net-next/c/aa5513f5d95f
  - [net-next,v3,10/12] net: stmmac: replace the int_snapshot_en field with a flag
    https://git.kernel.org/netdev/net-next/c/621ba7ad7891
  - [net-next,v3,11/12] net: stmmac: replace the rx_clk_runs_in_lpi field with a flag
    https://git.kernel.org/netdev/net-next/c/743dd1db85f4
  - [net-next,v3,12/12] net: stmmac: replace the en_tx_lpi_clockgating field with a flag
    https://git.kernel.org/netdev/net-next/c/9d0c0d5ebd63

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
