Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C400A57382A
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jul 2022 16:00:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F0EDC640FE;
	Wed, 13 Jul 2022 14:00:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 514CEC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 14:00:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0453061D9B;
 Wed, 13 Jul 2022 14:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2BD9C3411E;
 Wed, 13 Jul 2022 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657720814;
 bh=0PczgnRAsUni8FhdXd7dUovVQEbHB53hDhpjR6g6koA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FY6Xi7+vjU+PQ0Hj18jJFFzU+nOFduhKr/HnZ+wtwUCJqQEsaQI3fwf+T/W1BCxJI
 cj8EW+WX8lLE2cXLKdqjautuf6xRJW763HEnOxwLDvNiMFhc6u3kAUI0RuK0zhfTkZ
 Ba0MyAjQ7TRCx7XRiOG2qhkgrllJBx4FgueA1xmoVFha/weuSP7rU2SHKqh9yShyW2
 1Jmc0XzaGUu8crOKFcieyRK3h62BcgQDb92XbFv8xYMt9rMB7Sus/dv3Ri/GA33Nnk
 mJlRNUL/1YbPoXw0bpgG3XRQCfKLI5lvTAlTmHJzALc9RFAe4lsZ+h+u/Mt7mxbNzM
 FvYXdIcaJ6R1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B030DE45227; Wed, 13 Jul 2022 14:00:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165772081471.13863.9875407606261109151.git-patchwork-notify@kernel.org>
Date: Wed, 13 Jul 2022 14:00:14 +0000
References: <Ys2IUUhvm2sfLEps@kili>
In-Reply-To: <Ys2IUUhvm2sfLEps@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: andrew@lunn.ch, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, zhouyanjie@wanyeetech.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix leaks in probe
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

On Tue, 12 Jul 2022 17:42:25 +0300 you wrote:
> These two error paths should clean up before returning.
> 
> Fixes: 2bb4b98b60d7 ("net: stmmac: Add Ingenic SoCs MAC support.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis, not tested.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix leaks in probe
    https://git.kernel.org/netdev/net/c/23aa6d5088e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
