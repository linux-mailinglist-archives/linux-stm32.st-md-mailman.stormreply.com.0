Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC0685EE90
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 02:20:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BAA3C6B45E;
	Thu, 22 Feb 2024 01:20:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C13B9C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 01:20:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E137CCE20EA;
 Thu, 22 Feb 2024 01:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4A9FC43399;
 Thu, 22 Feb 2024 01:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708564828;
 bh=8wE7LSzSUzn3cp9Xg12UtGywrPGB+Nkpsbgk+oPArVw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IdVb/9WcSY4lwLdC6Wv82xzQiLLh6qlFpc2+2cbo5NBE0ZhF5eA7tGeum5PadsDG2
 ZbdQBraCG02x/HWDF55/KHz+gLRTDprn0mrNh1kGPTuv2+wLX8AH1lc7bOIWUP4v5m
 AtId+M0/XPtFkTcth01Cgrrb5sLfi3JUaQVB3fewtdSPFv2GYyhnvSNpkMN8ahVBvG
 Ppr0KMWnHGoBqi8WAibOEOI1mcNW+BcA4mlkmn1nFploEu2KSs0aUyS8RJFYInHLiH
 +C0Sr7HZ2X0x7XmO937bBIOo40Y/3abGVST8HB7yq4TOECF3i4mzimdCNRJPuBGpOI
 YiJofRxh/2wSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9E833D84BC0; Thu, 22 Feb 2024 01:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170856482864.21333.14662830246754937684.git-patchwork-notify@kernel.org>
Date: Thu, 22 Feb 2024 01:20:28 +0000
References: <20240220-stmmac_est-v1-1-c41f9ae2e7b7@linutronix.de>
In-Reply-To: <20240220-stmmac_est-v1-1-c41f9ae2e7b7@linutronix.de>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: andriy.shevchenko@linux.intel.com, netdev@vger.kernel.org,
 bigeasy@linutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, rohan.g.thomas@intel.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Fix EST offset for dwmac
	5.10
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
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 20 Feb 2024 09:22:46 +0100 you wrote:
> Fix EST offset for dwmac 5.10.
> 
> Currently configuring Qbv doesn't work as expected. The schedule is
> configured, but never confirmed:
> 
> |[  128.250219] imx-dwmac 428a0000.ethernet eth1: configured EST
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: Fix EST offset for dwmac 5.10
    https://git.kernel.org/netdev/net/c/90d07e36d400

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
