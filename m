Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 594F93F724B
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Aug 2021 11:50:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBF8FC57B60;
	Wed, 25 Aug 2021 09:50:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC636C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Aug 2021 09:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E37A6610FD;
 Wed, 25 Aug 2021 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629885005;
 bh=G9W19wcM7scN5TQI5aCEGctxyPWqb76aI4QghIn1k44=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=T2Rd6S2Y6qeStlduHD6EE0+u4FNeu23Pg6ejMu5pFTLW9GWCCHnAP63t1j9/7zO2f
 i79zpmRX57TPJWgjo+iLJmDsDGqPciyWNXnYh5wgw9gzqDkw9GRcnFcynfO934GMcU
 B69aFjXC7ORzbHcOrwl0p7JjISS/ROb6zZBBBrchirvRdILedFW9Q53UF7r0ajbxXA
 3XWPKCPKRz8p/0bMN0hJyXjLGGyU6mCAFKNcQFabqLy3VrWm2F1d6gii4FDSTbwZhE
 jl6XlQY0ovXdWomHJXYDke2e+fBUu0/IbQjkOH3jGK27PNIWVGXpmWueQ0P/XVWCgb
 lWB9Rr5HzNuUg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D0A6760A12;
 Wed, 25 Aug 2021 09:50:05 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162988500584.26256.659865970373423632.git-patchwork-notify@kernel.org>
Date: Wed, 25 Aug 2021 09:50:05 +0000
References: <20210823143754.14294-1-michael.riesch@wolfvision.net>
In-Reply-To: <20210823143754.14294-1-michael.riesch@wolfvision.net>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-rockchip@lists.infradead.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: fix unbalanced
 pm_runtime_enable warnings
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

On Mon, 23 Aug 2021 16:37:54 +0200 you wrote:
> This reverts commit 2c896fb02e7f65299646f295a007bda043e0f382
> "net: stmmac: dwmac-rk: add pd_gmac support for rk3399" and fixes
> unbalanced pm_runtime_enable warnings.
> 
> In the commit to be reverted, support for power management was
> introduced to the Rockchip glue code. Later, power management support
> was introduced to the stmmac core code, resulting in multiple
> invocations of pm_runtime_{enable,disable,get_sync,put_sync}.
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-rk: fix unbalanced pm_runtime_enable warnings
    https://git.kernel.org/netdev/net/c/2d26f6e39afb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
