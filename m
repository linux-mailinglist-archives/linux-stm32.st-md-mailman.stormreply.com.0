Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E30E3969B0D
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 13:00:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E65DC78011;
	Tue,  3 Sep 2024 11:00:41 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2931C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 11:00:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4749EA43272;
 Tue,  3 Sep 2024 11:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1404CC4CEC9;
 Tue,  3 Sep 2024 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725361232;
 bh=ylMqV+jJH9dxcuCIPmf7jFWF++944PIohyUMVAUrUr4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IjbeojbNE5gbiQqgVSKXWrua+vTQU4QpXPN0ft2U2UOxsIDV1zfGRfEGqjhm+7uKA
 cSzetxYkfncpnwUTqrhz694qhDDc7ac9rsN/HuF08CJYQKaaHUAPpXo9yN5G2XYtBg
 GbixvswnB4F1pnDkMjxkz/5CG7uFpwVNsT3zHO0tmMA3mRikJDVvNZ2vjH28Hl2f6k
 N0XndhQIQFvwY4uiH1th2XXM1aPbEEJ9wv10q7gyz96hHpZxz2UBEE0fs2og8EVSAn
 siDq4zBURfBqJkJsVr85YIq1q7b5QhdlMMducpcUWIClQzm188W1Gei4vCK096vvMw
 pEB7Ixjf6fcjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ED8D73805D82; Tue,  3 Sep 2024 11:00:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172536123276.255858.14746783448329293832.git-patchwork-notify@kernel.org>
Date: Tue, 03 Sep 2024 11:00:32 +0000
References: <20240830031325.2406672-1-ruanjinjie@huawei.com>
In-Reply-To: <20240830031325.2406672-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: andrew@lunn.ch, linus.walleij@linaro.org, justin.chen@broadcom.com,
 edumazet@google.com, krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, samuel@sholland.org, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 linux-sunxi@lists.linux.dev, sebastian.hesselbarth@gmail.com,
 woojung.huh@microchip.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, UNGLinuxDriver@microchip.com,
 mcoquelin.stm32@gmail.com, alsi@bang-olufsen.dk, olteanv@gmail.com,
 davem@davemloft.net, jic23@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/8] net: Simplified with
	scoped function
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

On Fri, 30 Aug 2024 11:13:17 +0800 you wrote:
> Simplify with scoped for each OF child loop, as well as dev_err_probe().
> 
> Changes in v4:
> - Drop the fix patch and __free() patch.
> - Rebased on the fix patch has been stripped out.
> - Remove the extra parentheses.
> - Ensure Signed-off-by: should always be last.
> - Add Reviewed-by.
> - Update the cover letter commit message.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/8] net: stmmac: dwmac-sun8i: Use for_each_child_of_node_scoped()
    https://git.kernel.org/netdev/net-next/c/81b4eb62878a
  - [net-next,v4,2/8] net: dsa: realtek: Use for_each_child_of_node_scoped()
    https://git.kernel.org/netdev/net-next/c/51c884291a94
  - [net-next,v4,3/8] net: phy: Use for_each_available_child_of_node_scoped()
    https://git.kernel.org/netdev/net-next/c/1dce520abd46
  - [net-next,v4,4/8] net: mdio: mux-mmioreg: Simplified with scoped function
    https://git.kernel.org/netdev/net-next/c/b00f7f4f8e93
  - [net-next,v4,5/8] net: mdio: mux-mmioreg: Simplified with dev_err_probe()
    https://git.kernel.org/netdev/net-next/c/4078513fc86c
  - [net-next,v4,6/8] net: mv643xx_eth: Simplify with scoped for each OF child loop
    https://git.kernel.org/netdev/net-next/c/3a3eea209e6d
  - [net-next,v4,7/8] net: dsa: microchip: Use scoped function to simplfy code
    https://git.kernel.org/netdev/net-next/c/f834d572b7e9
  - [net-next,v4,8/8] net: bcmasp: Simplify with scoped for each OF child loop
    https://git.kernel.org/netdev/net-next/c/e8ac8974451e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
