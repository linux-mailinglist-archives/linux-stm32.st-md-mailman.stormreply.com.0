Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD4152BB44
	for <lists+linux-stm32@lfdr.de>; Wed, 18 May 2022 15:00:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31AA6C03FDB;
	Wed, 18 May 2022 13:00:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81A16C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 May 2022 13:00:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0EFDCB82012;
 Wed, 18 May 2022 13:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3E23C3411B;
 Wed, 18 May 2022 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652878811;
 bh=ewLhXzl4evBQ5bhwbwqCw5ixGLCJ1ubKJAU7euCx42E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=HG/b97J5w5DCdZpEgOshkSd6i9YtA373Lqzt71AQ1yqssWNJEhZ2+RcV97RUHy8++
 Fv3BRBB7SztL0n5XkQ0UAYUl11Tbm20n4tTng1+1LWgOB5MzdB7r12pIWmXjCSZdz4
 Vx5o27IMtxHf56LfFlPMltaSSUI8XQNwRJ0u0dFx+pxhpnhvTIxf9LKXtSzTre7lBy
 WknQ3cYAbZ4oOHzab8zGHdQaS5OQ5IwyWcFSo7GCWGhivGnAaQoNnAgbdfAvTIricH
 3YPcCUQziVpEPQSuvedL5UQL0pJq7GW21i94nybVQVIB7eqJtRIWZFLoygbdGMWAiG
 8x1ZhW9rj8ZfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B1CB3F03935; Wed, 18 May 2022 13:00:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165287881172.21214.7192522722740611844.git-patchwork-notify@kernel.org>
Date: Wed, 18 May 2022 13:00:11 +0000
References: <20220517081602.1826154-1-vincent.whitchurch@axis.com>
In-Reply-To: <20220517081602.1826154-1-vincent.whitchurch@axis.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: Jose.Abreu@synopsys.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, kernel@axis.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: remove unused
	get_addr() callback
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
by David S. Miller <davem@davemloft.net>:

On Tue, 17 May 2022 10:16:01 +0200 you wrote:
> The last caller of the stmmac_desc_ops::get_addr() callback was removed
> a while ago, so remove the unused callback.
> 
> Note that the callback also only gets half the descriptor address on
> systems with 64-bit descriptor addresses, so that should be fixed if it
> needs to be resurrected later.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: remove unused get_addr() callback
    https://git.kernel.org/netdev/net-next/c/e991d0ed0b7a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
