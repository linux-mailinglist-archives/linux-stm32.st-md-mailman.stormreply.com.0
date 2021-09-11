Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 226874075CB
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Sep 2021 11:30:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD864C5A4D5;
	Sat, 11 Sep 2021 09:30:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E3EAC59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Sep 2021 09:30:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 196DF61216;
 Sat, 11 Sep 2021 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631352606;
 bh=qdaWEUd1KSrLpISbbqbmAzB80NVLQS21cH6iG8/ZBZw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qOSkB35zTtfCVAWtwAb3pw6H2aNP5lAUirDjwRVqDTrazC9HEv4Ju62gbnExW1BC/
 YjRCV8lsADelggta77QGJoX7YEyUyxF+rulizSM5UDtD/7nGNc2Oq+zVDGILg55CVg
 AbyM64GBagjFr4WDwLcbrk9QSfnjyXq7o2Bb28IxAjKhbdQKg+10Qa8CYMesFey5Rl
 hV4ahWodfytLxb+KCYaw9n+jRUZfqFfQf0AZT2gfwsaG04lMHzPDiqSct41wEUVPMR
 BXmL9045/w/JPgMcSKMqzmyFYk9IUX7mOeC7Vy6C0ThWHg+Lvk+exrQDd3bXbeq1sQ
 ArfZTUHZQgt9A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0DA7C609ED;
 Sat, 11 Sep 2021 09:30:06 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163135260605.6855.16868234164937660969.git-patchwork-notify@kernel.org>
Date: Sat, 11 Sep 2021 09:30:06 +0000
References: <20210910195535.12533-1-jesper.nilsson@axis.com>
In-Reply-To: <20210910195535.12533-1-jesper.nilsson@axis.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, kernel@axis.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: allow CSR clock of 300MHz
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

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 10 Sep 2021 21:55:34 +0200 you wrote:
> The Synopsys Ethernet IP uses the CSR clock as a base clock for MDC.
> The divisor used is set in the MAC_MDIO_Address register field CR
> (Clock Rate)
> 
> The divisor is there to change the CSR clock into a clock that falls
> below the IEEE 802.3 specified max frequency of 2.5MHz.
> 
> [...]

Here is the summary with links:
  - net: stmmac: allow CSR clock of 300MHz
    https://git.kernel.org/netdev/net/c/08dad2f4d541

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
