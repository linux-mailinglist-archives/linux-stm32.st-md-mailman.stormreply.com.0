Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE2B64DBF8
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Dec 2022 14:10:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4160C65E46;
	Thu, 15 Dec 2022 13:10:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDC6DC64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Dec 2022 13:10:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD4ED61DAB;
 Thu, 15 Dec 2022 13:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10996C433F2;
 Thu, 15 Dec 2022 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671109817;
 bh=ZX9vkL5qKOiJKCBuB10CRXHUblrj1ri5jUDkoUac8bU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uUAUWWEEV/p7VH8sjQ9kTb/K0REc/qzYHeDQCDdRT9h1uOGf8MdZISenB/sXdaTk3
 pR5mLfX5idQk5Xd0MApKsdRkjEP77qnXFqmAoY7a6jS3vst1pDLX9VVlrSJVzqjnb7
 3YafS/fHEkKtHs+/J1xszDTqaxUWGf4iWZjaVvCZfVz1KJzAzNsfaSyXmVDLYmeV7Q
 AqZSL7VkWrYR+fc1WCMVLdHnKdu3hMr+hmsr5REUyUGI6zm0L74xRnCRmvRe+XO9Ij
 hcFd0yr3GYfAbADyFzt45QRJrnuNf582MFxY5GbyR1w21L/9Mw0Tm4+jutlq1f40Ha
 4LGhfdMK67IbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EB0AEC197B4; Thu, 15 Dec 2022 13:10:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167110981695.21157.9894715143404186757.git-patchwork-notify@kernel.org>
Date: Thu, 15 Dec 2022 13:10:16 +0000
References: <20221214080117.3514615-1-cuigaosheng1@huawei.com>
In-Reply-To: <20221214080117.3514615-1-cuigaosheng1@huawei.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: hawk@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, john.fastabend@gmail.com,
 ast@kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net,
 v2] net: stmmac: fix errno when create_singlethread_workqueue()
 fails
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 14 Dec 2022 16:01:17 +0800 you wrote:
> We should set the return value to -ENOMEM explicitly when
> create_singlethread_workqueue() fails in stmmac_dvr_probe(),
> otherwise we'll lose the error value.
> 
> Fixes: a137f3f27f92 ("net: stmmac: fix possible memory leak in stmmac_dvr_probe()")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: fix errno when create_singlethread_workqueue() fails
    https://git.kernel.org/netdev/net/c/2cb815cfc78b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
