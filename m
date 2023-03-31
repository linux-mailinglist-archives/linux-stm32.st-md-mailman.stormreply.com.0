Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A87AC6D19DC
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 10:30:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CF12C6905A;
	Fri, 31 Mar 2023 08:30:21 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 245E4C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 08:30:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A270EB82D0F;
 Fri, 31 Mar 2023 08:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61B0CC4339C;
 Fri, 31 Mar 2023 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680251418;
 bh=7QfrtLvbG0uJ1TrCowUePYGhhQQUz93oXvSuBWFYU8o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Ae0pi98Q+nasfAkHWYoHFcUb1h3gd1I5498Awcf5IwdmEGh7GD4ZPF9jsoqQx/yIw
 9w5rU7q3/PxYPTF94G+oPnL85S8RtxB/CuMKVpwe8PY62/tE1W7Sed41cMyJ8ynUi3
 9wVuID9XBwlozlUy9dwwHabO3JAJuvjZP/lPiAadqwVa6r6F6bdkuWIHFtFS3Kn4jh
 sExqIpRUQLXFdUbkOdMHbxh1bKl1dmnhKEkLA9Xehv47SjYWaKhQzhLgsdSL3qUMzQ
 n6zMhpTvZtq1EGyOdbOdSXvezORCgnohYSrn58Kt02/nsp1SO4tHDnc1IGx+pPo75c
 NT2I2gwMXzFgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4723BC73FE2; Fri, 31 Mar 2023 08:30:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168025141828.29195.16930878780114551946.git-patchwork-notify@kernel.org>
Date: Fri, 31 Mar 2023 08:30:18 +0000
References: <20230330091404.3293431-1-michael.wei.hong.sit@intel.com>
In-Reply-To: <20230330091404.3293431-1-michael.wei.hong.sit@intel.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, weifeng.voon@intel.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, peter.jun.ann.lai@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, hong.aun.looi@intel.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net v5 0/3] Fix PHY handle no longer
	parsing
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

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 30 Mar 2023 17:14:01 +0800 you wrote:
> After the fixed link support was introduced, it is observed that PHY
> no longer attach to the MAC properly. So we introduce a helper
> function to determine if the MAC should expect to connect to a PHY
> and proceed accordingly.
> 
> Michael Sit Wei Hong (3):
>   net: phylink: add phylink_expects_phy() method
>   net: stmmac: check if MAC needs to attach to a PHY
>   net: stmmac: remove redundant fixup to support fixed-link mode
> 
> [...]

Here is the summary with links:
  - [net,v5,1/3] net: phylink: add phylink_expects_phy() method
    https://git.kernel.org/netdev/net/c/653a180957a8
  - [net,v5,2/3] net: stmmac: check if MAC needs to attach to a PHY
    https://git.kernel.org/netdev/net/c/fe2cfbc96803
  - [net,v5,3/3] net: stmmac: remove redundant fixup to support fixed-link mode
    https://git.kernel.org/netdev/net/c/6fc21a6ed595

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
