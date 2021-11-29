Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 679F74614E2
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 13:20:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B801C57B6F;
	Mon, 29 Nov 2021 12:20:12 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BD55C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 12:20:11 +0000 (UTC)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ACB51B81026;
 Mon, 29 Nov 2021 12:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3F36A6056B;
 Mon, 29 Nov 2021 12:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638188409;
 bh=cL6EgVVC1DsCIYVnx1E2JDuO7ZUOxCNXbc27Nc9cyR8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OdoUKmFF/gpmMdkh7IzP8OmIrZjUB9HGHQFDJ1AFTP0V/xMawrEUZU81BFRcZutc3
 ma632BllgFwqU8yN31x7WhPxwIhO/LTxbUrFx5IypNifyJb9Bkl3lwwrTeJrWXIaVX
 JRcEqollL/uEKeB0wHq8CPIyQtXsjdk32R6vmiruycosecH3fplT+Xp7mYjTgue9hE
 UEknfYueFyqVhgCPR7EXs5SY6+/JVy+Pfa+7u4CZYlc6vbYKRaTv5xEZnWvmEcw55U
 lt3w9BZ821q4v2V5x5onetWlYDux3sye2Ix4qqpd3AK0+jdfrH1kbNZza2y279qg7z
 /B4oXJ7GSE+pA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2F04C609D5;
 Mon, 29 Nov 2021 12:20:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163818840918.20614.10733400123125984165.git-patchwork-notify@kernel.org>
Date: Mon, 29 Nov 2021 12:20:09 +0000
References: <20211126155115.12394-1-vincent.whitchurch@axis.com>
In-Reply-To: <20211126155115.12394-1-vincent.whitchurch@axis.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: Jose.Abreu@synopsys.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 kernel@axis.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Avoid DMA_CHAN_CONTROL
 write if no Split Header support
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

On Fri, 26 Nov 2021 16:51:15 +0100 you wrote:
> The driver assumes that split headers can be enabled/disabled without
> stopping/starting the device, so it writes DMA_CHAN_CONTROL from
> stmmac_set_features().  However, on my system (IP v5.10a without Split
> Header support), simply writing DMA_CHAN_CONTROL when DMA is running
> (for example, with the commands below) leads to a TX watchdog timeout.
> 
>  host$ socat TCP-LISTEN:1024,fork,reuseaddr - &
>  device$ ethtool -K eth0 tso off
>  device$ ethtool -K eth0 tso on
>  device$ dd if=/dev/zero bs=1M count=10 | socat - TCP4:host:1024
>  <tx watchdog timeout>
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: Avoid DMA_CHAN_CONTROL write if no Split Header support
    https://git.kernel.org/netdev/net/c/f8e7dfd6fdab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
