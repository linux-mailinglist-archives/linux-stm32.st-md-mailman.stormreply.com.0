Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BCE3F72B5
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Aug 2021 12:10:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48F24C57B60;
	Wed, 25 Aug 2021 10:10:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6446FC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Aug 2021 10:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5BE0761176;
 Wed, 25 Aug 2021 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629886206;
 bh=OSv0PWWhZVtTGTqPHk5I4aEOsasp+kDfKfr1GgHP/Jg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hVsPT+kAgICx6tBRqyIhV1hRk3fq1W7DSNR3HAPr5WuXl5eeKpe6pOHyp3VqvwQ+N
 V2NcJFe7BRrX4E2rZW9V7IpHi87l3AwuzTSlIwr0GtiWQuR0C+NW1NStmGbAC8WtGk
 17WSzEYastYu2FK5g/4nxI7RphiZGXc1o5vvfqJK+Bn2S3bJUueux+HYt5Q7JjN2ny
 RAYPQYojThwaAWg6UuqqDpeDrHkkQ6uEc9jfxKUOtPC8rigejMj6CLuNajaMPQQI3p
 h43ADJxrIs7x0vOkLUl4N6z7/Rf3WdnHcaDH0/VbhNEALssh4Ly4nIJw1td90EyvnF
 ZmbQ7VbqWHZIw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4C1EF6097B;
 Wed, 25 Aug 2021 10:10:06 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162988620630.3256.11386363919352017742.git-patchwork-notify@kernel.org>
Date: Wed, 25 Aug 2021 10:10:06 +0000
References: <20210825005742.980267-1-yoong.siang.song@intel.com>
In-Reply-To: <20210825005742.980267-1-yoong.siang.song@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: linux-kernel@vger.kernel.org, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 boon.leong.ong@intel.com, kuba@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: fix kernel panic
 due to NULL pointer dereference of buf->xdp
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

On Wed, 25 Aug 2021 08:57:42 +0800 you wrote:
> Ensure a valid XSK buffer before proceed to free the xdp buffer.
> 
> The following kernel panic is observed without this patch:
> 
> RIP: 0010:xp_free+0x5/0x40
> Call Trace:
> stmmac_napi_poll_rxtx+0x332/0xb30 [stmmac]
> ? stmmac_tx_timer+0x3c/0xb0 [stmmac]
> net_rx_action+0x13d/0x3d0
> __do_softirq+0xfc/0x2fb
> ? smpboot_register_percpu_thread+0xe0/0xe0
> run_ksoftirqd+0x32/0x70
> smpboot_thread_fn+0x1d8/0x2c0
> kthread+0x169/0x1a0
> ? kthread_park+0x90/0x90
> ret_from_fork+0x1f/0x30
> 
> [...]

Here is the summary with links:
  - [net,v2,1/1] net: stmmac: fix kernel panic due to NULL pointer dereference of buf->xdp
    https://git.kernel.org/netdev/net/c/2b9fff64f032

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
