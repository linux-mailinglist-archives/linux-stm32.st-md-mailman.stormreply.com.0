Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5AE60F4C5
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Oct 2022 12:20:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 042EAC04003;
	Thu, 27 Oct 2022 10:20:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4FBEC03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 10:20:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DB406227C;
 Thu, 27 Oct 2022 10:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE421C433B5;
 Thu, 27 Oct 2022 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666866016;
 bh=/i906t4LlgLzrU1t6JV+mYaTQDQSgmlrOwu7+7bznmc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Yvc1/MjS6fUCueEKtcsxRHDuZnNaajAt+9xfNbZVH/iMbYI+LRaP0WhqkALoKApO/
 fxa7yYTNDIwOXcjif0MvKvDg86CRx3gJOj1V4s0yibndVPxn1A9o8qYF5OGSdl+eEQ
 eD6t6trRyKymdju1E0MaiM+3d9Jum/p7bXJg0R9XsAMxvM/Cu2k2kflsQYwDt+GmRo
 vAxg6yPHUoL8rjjowiGxsSufQ3r6Mq+PscXFYAfwY4FAG+Fjqu5xjUILvwYOIHcL+H
 Tv4nJC0awkad55ekWWFPhM0iS9dZTEQoewhCyCjlgJ47vuUd9BC8Oazf3am7KjtXYt
 AghIdM7ps92Gg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D0DF6E270D8; Thu, 27 Oct 2022 10:20:15 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166686601585.8143.16275733107810431975.git-patchwork-notify@kernel.org>
Date: Thu, 27 Oct 2022 10:20:15 +0000
References: <20221025081747.1884926-1-junxiao.chang@intel.com>
In-Reply-To: <20221025081747.1884926-1-junxiao.chang@intel.com>
To: Junxiao Chang <junxiao.chang@intel.com>
Cc: Joao.Pinto@synopsys.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 veekhee@gmail.com, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next,
 v2] net: stmmac: remove duplicate dma queue channel macros
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

This patch was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 25 Oct 2022 16:17:47 +0800 you wrote:
> It doesn't need extra macros for queue 0 & 4. Same macro could
> be used for all 8 queues. Related queue/channel functions could
> be combined together.
> 
> Original macro which has two same parameters is unsafe macro and
> might have potential side effects. Each MTL RxQ DMA channel mask
> is 4 bits, so using (0xf << chan) instead of GENMASK(x + 3, x) to
> avoid unsafe macro.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: remove duplicate dma queue channel macros
    https://git.kernel.org/netdev/net-next/c/330543d04f2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
