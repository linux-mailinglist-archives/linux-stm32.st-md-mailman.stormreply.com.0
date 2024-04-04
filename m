Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5B897DB5
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Apr 2024 04:30:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C35BFC6B45B;
	Thu,  4 Apr 2024 02:30:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A33CC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Apr 2024 02:30:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 664C6CE1D59;
 Thu,  4 Apr 2024 02:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F40AC43390;
 Thu,  4 Apr 2024 02:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712197829;
 bh=X8DfIdcDi4N/TU1s3UMLPmbO8VTXuYl1Q1HzzE8A/+I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=UrzPhlOYy4Spar0kSlbJIJsXNRobB8h4E4LnlCoAiyyIoiMCRS4CLmQBu/yQ0Zgcx
 kcgzHzyyxo1OOSxXOsLO/+aE/0JqFnGtLrUgYKAcFliT9x0av/Mi/MkYyBMGj8agZO
 32Kix23i30eq+KtkTHZWhv/hV76zZyiD/MdhXTf7yEpCLeN1KzqTSwti79fjel65mo
 YP0Pp9sqtTYFtEP0MkK78G2GTbgLOPRbKSNV5CTzKa9vEZefNfNKVlTdllAX+jgs5G
 VPIavOaRj8zJKGAmU7bhe3C/Ccypw37kpOmTWYJwAEThtyXR+CmvtfxGJ0c+PxZ2Gy
 xbGSVrqR/IQfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 91517D9A151; Thu,  4 Apr 2024 02:30:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171219782959.25056.10876480260034448901.git-patchwork-notify@kernel.org>
Date: Thu, 04 Apr 2024 02:30:29 +0000
References: <20240401192239.33942-1-piotrwejman90@gmail.com>
In-Reply-To: <20240401192239.33942-1-piotrwejman90@gmail.com>
To: Piotr Wejman <piotrwejman90@gmail.com>
Cc: Joao.Pinto@synopsys.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] net: stmmac: fix rx queue priority
	assignment
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

On Mon,  1 Apr 2024 21:22:39 +0200 you wrote:
> The driver should ensure that same priority is not mapped to multiple
> rx queues. From DesignWare Cores Ethernet Quality-of-Service
> Databook, section 17.1.29 MAC_RxQ_Ctrl2:
> "[...]The software must ensure that the content of this field is
> mutually exclusive to the PSRQ fields for other queues, that is,
> the same priority is not mapped to multiple Rx queues[...]"
> 
> [...]

Here is the summary with links:
  - [v4] net: stmmac: fix rx queue priority assignment
    https://git.kernel.org/netdev/net/c/b3da86d432b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
