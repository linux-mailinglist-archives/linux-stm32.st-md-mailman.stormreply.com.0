Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5686C9C813E
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 04:00:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6BE9C78F97;
	Thu, 14 Nov 2024 03:00:48 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA8A3C78F95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 03:00:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 90699A40296;
 Thu, 14 Nov 2024 02:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7D6C4CEC3;
 Thu, 14 Nov 2024 03:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731553240;
 bh=gbZQqgoltqwkJ/vm5DodVYLPZVBiaTAp0vA2MvKuZCY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gxN/j0XaazZWoNHJvyJSihstQrqhcQOZvPzddr12uATiXHq5rSBCPMVGZ4CZP3AqE
 dL15FKoPgsUl+LaHeAJdczLcq5c72YOHYxT8W1iCGzDVlPTAv7cHGA7qhsrGYZlxwK
 6N8FLtmcCDyIowDk2Fw90UmQ+G0u0Tn18g526479BYde1KQGWeDa8lpBXZO1D/qRTJ
 7zmqGwtos4+10aMTth6i+GWDf+RIgChvImDR3szcWa78Dp7LMsTx9Y7U6ErbxhI49S
 AJMqxYvNhR6T80xxPtB49SQoUAPIoxUJX2Dwe+BuNyldjPjoxlvjaC5qFYQP25ZJQN
 5jsQWsJ+NmU5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAF5F3809A80; Thu, 14 Nov 2024 03:00:51 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173155325074.1464897.8509953412141339085.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 03:00:50 +0000
References: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com, alexis.lothore@bootlin.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 daniel.machon@microchip.com
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/9] Support external
	snapshots on dwmac1000
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

On Tue, 12 Nov 2024 18:06:48 +0100 you wrote:
> Hi,
> 
> This is v4 on the series to support external snapshots on dwmac1000.
> 
> The main change since v3 is the move of the fifo flush wait in the
> ptp_clock_info enable() function within the mutex that protects the ptp
> registers. Thanks Jakub and Paolo for spotting this.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/9] net: stmmac: Don't modify the global ptp ops directly
    https://git.kernel.org/netdev/net-next/c/80dc1ff787a9
  - [net-next,v4,2/9] net: stmmac: Use per-hw ptp clock ops
    https://git.kernel.org/netdev/net-next/c/13e908800c0d
  - [net-next,v4,3/9] net: stmmac: Only update the auto-discovered PTP clock features
    https://git.kernel.org/netdev/net-next/c/0bfd0afc746c
  - [net-next,v4,4/9] net: stmmac: Introduce dwmac1000 ptp_clock_info and operations
    https://git.kernel.org/netdev/net-next/c/8e7620726beb
  - [net-next,v4,5/9] net: stmmac: Introduce dwmac1000 timestamping operations
    https://git.kernel.org/netdev/net-next/c/477c3e1f6363
  - [net-next,v4,6/9] net: stmmac: Enable timestamping interrupt on dwmac1000
    https://git.kernel.org/netdev/net-next/c/774f57d6562d
  - [net-next,v4,7/9] net: stmmac: Don't include dwmac4 definitions in stmmac_ptp
    https://git.kernel.org/netdev/net-next/c/85cebb7279e8
  - [net-next,v4,8/9] net: stmmac: Configure only the relevant bits for timestamping setup
    https://git.kernel.org/netdev/net-next/c/62935443214e
  - [net-next,v4,9/9] net: stmmac: dwmac_socfpga: This platform has GMAC
    https://git.kernel.org/netdev/net-next/c/b818268d9250

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
