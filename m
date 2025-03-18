Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D95A67716
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 16:00:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2617C7802F;
	Tue, 18 Mar 2025 15:00:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 395FFC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 15:00:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB62A5C58BF;
 Tue, 18 Mar 2025 14:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8457EC4CEE3;
 Tue, 18 Mar 2025 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742309998;
 bh=r0NrzcNDxEAo6t+Xoz4A+ZsjzVa5mHQEjDvSbM8+ItM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Y7BIYDHM86vWww2amj46/mLjgIS9Pd+7uQlOXialHBqRDb8TRbN8eHCTUEXr44qjw
 aOIsxiBVjuJYca07fp8YJLOmvV2xbFRNjwOTK8w5dGpjOC458+667lzGFnKd2sgF/1
 MEqYnxpu7gk3iP8HTvN1PWsLX0tL2Uj55mHuE+F3f28JLUTnj9Z4g7dyNsZ3F+4/H6
 R50JhgxMv4KAL7casbv0AMtCC8Z+tM+JYOUVRCDLWi9HIqN1ZRbUBrCJxUCMly60Ol
 WGvhYD4LhyMINquvspNJGrgYwK7dKnt2Dl9H9NLPMMwWUBPcz/3jkWkeTnNeNlWhPd
 3mvxeqCe3WO5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33FFB380DBE8; Tue, 18 Mar 2025 15:00:35 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174231003400.344268.9977818669398853411.git-patchwork-notify@kernel.org>
Date: Tue, 18 Mar 2025 15:00:34 +0000
References: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
In-Reply-To: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 samuel@sholland.org, khilman@baylibre.com, jernej.skrabec@gmail.com,
 wens@csie.org, kuba@kernel.org, pabeni@redhat.com, linux-sunxi@lists.linux.dev,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/9] net: stmmac: remove
 unnecessary of_get_phy_mode() calls
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

On Wed, 12 Mar 2025 09:14:53 +0000 you wrote:
> Hi,
> 
> This series removes unnecessary of_get_phy_mode() calls from the stmmac
> glue drivers. stmmac_probe_config_dt() / devm_stmmac_probe_config_dt()
> already gets the interface mode using device_get_phy_mode() and stores
> it in plat_dat->phy_interface.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/9] net: stmmac: qcom-ethqos: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/8ee1c926f31e
  - [net-next,v2,2/9] net: stmmac: mediatek: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/46f84d700cb8
  - [net-next,v2,3/9] net: stmmac: anarion: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/e3ef12172a83
  - [net-next,v2,4/9] net: stmmac: ipq806x: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/f07cb4b4b481
  - [net-next,v2,5/9] net: stmmac: meson8b: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/3e5833060efb
  - [net-next,v2,6/9] net: stmmac: rk: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/9886718ad1c5
  - [net-next,v2,7/9] net: stmmac: sti: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/3e2858bb3f59
  - [net-next,v2,8/9] net: stmmac: sun8i: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/3d9e9dfce04c
  - [net-next,v2,9/9] net: stmmac: sunxi: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/00d2c3c07124

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
