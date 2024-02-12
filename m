Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1376E8510DC
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 11:30:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8600C6C83C;
	Mon, 12 Feb 2024 10:30:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33989C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 10:30:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE45860EEB;
 Mon, 12 Feb 2024 10:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 827E8C433F1;
 Mon, 12 Feb 2024 10:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707733826;
 bh=mdLN9Mi0jBOEC7J635BO3YYQtUbzRw+yuJA/UGXvjgo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=t9aVtuRR0a0TBp4xR3gWY2JNWvBFEPf6a1e9Hxup7PNiU62kxaMhHI7RZP9C+0mX/
 uOd9BVQszU0WONCEVh2W2bitnRC+WRrNdmRMqt/rkqc+hRi8pPkz4XEQ+qsFdSABH7
 BNCxxMYwUOKN1NLLFexIT+Jost3iPqqwhhavUJaXnIoTnKvhfwa1k1oWwajGD42Kvb
 uTBkgW1iIxFT5W8FKvC9SR1ovNf41PcMDUdd9XX3CBYy9ZOiJCuEDH6JdovOYedFgM
 QHNtYg4FIBrArbHy4bjOb0kAXnytrGumAMYG0ADtpEqdvN17KpsuQkXsO6iW1QMkFv
 uH3/9JRK7XSjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 63CABD84BC3; Mon, 12 Feb 2024 10:30:26 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170773382640.15535.14931143276870991018.git-patchwork-notify@kernel.org>
Date: Mon, 12 Feb 2024 10:30:26 +0000
References: <20240208231145.2732931-1-quic_abchauha@quicinc.com>
In-Reply-To: <20240208231145.2732931-1-quic_abchauha@quicinc.com>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, quic_jjohnson@quicinc.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next v4] net: stmmac:
 dwmac-qcom-ethqos: Enable TBS on all queues but 0
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

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu,  8 Feb 2024 15:11:45 -0800 you wrote:
> TSO and TBS cannot co-exist. TBS requires special descriptor to be
> allocated at bootup. Initialising Tx queues at probe to support
> TSO and TBS can help in allocating those resources at bootup.
> 
> TX queues with TBS can support etf qdisc hw offload.
> 
> This is similar to the patch raised by NXP
> commit 3b12ec8f618e ("net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings")
> 
> [...]

Here is the summary with links:
  - [net-next,v4] net: stmmac: dwmac-qcom-ethqos: Enable TBS on all queues but 0
    https://git.kernel.org/netdev/net-next/c/0918c1dcd55c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
