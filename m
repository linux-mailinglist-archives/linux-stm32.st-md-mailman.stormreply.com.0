Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6810C38B9E1
	for <lists+linux-stm32@lfdr.de>; Fri, 21 May 2021 01:00:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06A48C57B60;
	Thu, 20 May 2021 23:00:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC214C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 23:00:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 600EB613AE;
 Thu, 20 May 2021 23:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621551610;
 bh=d3OAH1SWRvHEo0ZPbCi0Z6vsFyuPVS9WwpZ0HO2l2T8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KjzhLn0pulgUajUesBp7AGBpChrD+gXv7ir7cJ7lCThbc3RhstNY9+tmyxTp40Lv5
 5sVjFxN6CwEfke5AjFZx78T0feXLJ4YfPId9Noy8VhGTiISqsvJTIE0+1iuPQYd3X5
 Huao7b1YonR1DGYFzkc2mBWpXhm8Mnv43odEmiz0yJzMM9tWeLnOhY78Tz/Fi68Urv
 wXxLkpqwhQfDwIEfHdnYeL0doKK5JRZTjoY17OT0Ro7OfYvLiQYN6lCRl+WGZeDJ7L
 lBbm2mvz4Nmsf222fsGNcq7lY+AyNZPOf0yLUT7Lq1KXLUKW/kpjsBr2zKeK2QoVdj
 SfElfdUVsKwHQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 532F1609F6;
 Thu, 20 May 2021 23:00:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162155161033.31527.4405992814200131855.git-patchwork-notify@kernel.org>
Date: Thu, 20 May 2021 23:00:10 +0000
References: <20210520125117.1015-1-qiangqing.zhang@nxp.com>
In-Reply-To: <20210520125117.1015-1-qiangqing.zhang@nxp.com>
To: Joakim Zhang <qiangqing.zhang@nxp.com>
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, linux-imx@nxp.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/2] net: fixes for stmmac
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

This series was applied to netdev/net.git (refs/heads/master):

On Thu, 20 May 2021 20:51:15 +0800 you wrote:
> Two clock fixes for stmmac driver.
> 
> Joakim Zhang (2):
>   net: stmmac: correct clocks enabled in stmmac_vlan_rx_kill_vid()
>   net: stmmac: fix system hang if change mac address after interface
>     ifdown
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: stmmac: correct clocks enabled in stmmac_vlan_rx_kill_vid()
    https://git.kernel.org/netdev/net/c/b3dcb3127786
  - [net,2/2] net: stmmac: fix system hang if change mac address after interface ifdown
    https://git.kernel.org/netdev/net/c/4691ffb18ac9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
