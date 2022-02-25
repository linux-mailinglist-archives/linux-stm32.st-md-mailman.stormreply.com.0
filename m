Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0424C42BF
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Feb 2022 11:50:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4CCFC60491;
	Fri, 25 Feb 2022 10:50:13 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23977C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 10:50:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B0EFB82E1F;
 Fri, 25 Feb 2022 10:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 328D7C340EF;
 Fri, 25 Feb 2022 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645786211;
 bh=LC08xMH6CWt69AaKVSvadbtW1VHUd5kvo4F8105Xn3s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=m/rycRA/3JDZtPIlVxvF05spVkxMWCU2KsoWyudLBjn/+vuN8miTZ3470lfzaJEyb
 zgdG7lGpXeunRXwt+WLmnZ9lob0g3aKH6oVR6VDMMJcOTukRfIFLxBNBjz9L9AXFBl
 6Q9faNDtTecp3PhoquJ7QTcYPMUENJJc99XGA+fPexBq9LLdECubHd6zK/K264KeMM
 rG6bM8NVs8f3HtEydMs9hhN5/l/mHASkyUVpC6AkNMPnuUDTy7fz8j43R0kElfJLjy
 0hUly9MfGcTDKDuiEa7aTZ3yMjXn8RtSEsmEN9kjm2TRBf1+NMLdEuUiQkGvnGcP4H
 eaySrIK/WoP+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 12FC5EAC09B; Fri, 25 Feb 2022 10:50:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164578621107.20500.7059281134747424686.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 10:50:11 +0000
References: <20220224113829.1092859-1-vincent.whitchurch@axis.com>
In-Reply-To: <20220224113829.1092859-1-vincent.whitchurch@axis.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: linux-kernel@vger.kernel.org, srinivas.kandagatla@st.com,
 netdev@vger.kernel.org, larper@axis.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 kernel@axis.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: only enable DMA
	interrupts when ready
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 24 Feb 2022 12:38:29 +0100 you wrote:
> In this driver's ->ndo_open() callback, it enables DMA interrupts,
> starts the DMA channels, then requests interrupts with request_irq(),
> and then finally enables napi.
> 
> If RX DMA interrupts are received before napi is enabled, no processing
> is done because napi_schedule_prep() will return false.  If the network
> has a lot of broadcast/multicast traffic, then the RX ring could fill up
> completely before napi is enabled.  When this happens, no further RX
> interrupts will be delivered, and the driver will fail to receive any
> packets.
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: only enable DMA interrupts when ready
    https://git.kernel.org/netdev/net/c/087a7b944c5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
