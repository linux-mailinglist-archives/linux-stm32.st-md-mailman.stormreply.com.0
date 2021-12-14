Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 543974742C4
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Dec 2021 13:40:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0083FC5E2C5;
	Tue, 14 Dec 2021 12:40:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7054BC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 12:40:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BA385B81978;
 Tue, 14 Dec 2021 12:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56D78C34606;
 Tue, 14 Dec 2021 12:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639485610;
 bh=h8V7zXX+upGWCiSmZdX9Mv0fkIwrT5zALRr/nQXpHfo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=B522xN9Hviu+kuYoqoo6wXCWIcXjzgvQbzIoUI+G7teuEfFxcw3lFre4CySiHkA8k
 MIgB3tB05H3X87gJVAZbNTYkdsV6yolZ+OxQsBw2tFW/ym9uB5jZNmFtHWrMuhlP2O
 6sNRe6zxRDrA1mz/lfpTe9dq/4j5NxOC+ww8lzA5ZH4b6eT5/AE/aQp6CSfZdWPb5Z
 xsNytCtaF0w+8lj5sNeaJRwR0gyKgFKVWOA/qshkmR6exJPQ1QFyQ5WQuCgC9r0oHL
 fM7qSVotdJUco5Q+SVmZSy8rc9wJTdHglRXr46KTOKKw9kFdhNAmtTFusL01Spbua5
 nMqSUvBsWFe1w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4384C60A2F;
 Tue, 14 Dec 2021 12:40:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163948561027.12013.1168434953133030170.git-patchwork-notify@kernel.org>
Date: Tue, 14 Dec 2021 12:40:10 +0000
References: <20211211145134.630258-1-boon.leong.ong@intel.com>
In-Reply-To: <20211211145134.630258-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: yannick.vignon@oss.nxp.com, alexandre.torgue@st.com, netdev@vger.kernel.org,
 bigeasy@linutronix.de, kurt@linutronix.de, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 olteanv@gmail.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: fix tc flower
 deletion for VLAN priority Rx steering
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

On Sat, 11 Dec 2021 22:51:34 +0800 you wrote:
> To replicate the issue:-
> 
> 1) Add 1 flower filter for VLAN Priority based frame steering:-
> $ IFDEVNAME=eth0
> $ tc qdisc add dev $IFDEVNAME ingress
> $ tc qdisc add dev $IFDEVNAME root mqprio num_tc 8 \
>    map 0 1 2 3 4 5 6 7 0 0 0 0 0 0 0 0 \
>    queues 1@0 1@1 1@2 1@3 1@4 1@5 1@6 1@7 hw 0
> $ tc filter add dev $IFDEVNAME parent ffff: protocol 802.1Q \
>    flower vlan_prio 0 hw_tc 0
> 
> [...]

Here is the summary with links:
  - [net,v2,1/1] net: stmmac: fix tc flower deletion for VLAN priority Rx steering
    https://git.kernel.org/netdev/net/c/aeb7c75cb774

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
