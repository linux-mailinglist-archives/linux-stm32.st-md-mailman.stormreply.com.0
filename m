Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A851684B600
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 14:10:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B3C8C6B476;
	Tue,  6 Feb 2024 13:10:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96D3BC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 13:10:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E98D1CE134E;
 Tue,  6 Feb 2024 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D8D0C433C7;
 Tue,  6 Feb 2024 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707225027;
 bh=63hxr8dgFRyLoazPW+F1Tfs3tLtAneTXVrW3w14F/Wo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=l3cETau6FE+wzLBwJXO72pNw0/ONbR1F/Um/35GkCkyZR9IHQC9gyddzl7ppajivm
 1i0JR2HREINMm/tz3/oC/kCxrulIj9j68B2gOA25ASG6tYP+DcGsv5Yew5wQcgBQYU
 Go4QLoiaaLT1RDV/1tMEk51auFGz7CoASK8widU2YqiSf8xxuNg+5SJJtVoq3Ryl2o
 fHJEEaHHuA38eSG//yFVr1Xl8v3kBfaeDUPYO8ggRMdb+3QQL+Ledc3B0szlrmLk0O
 bZY0DDHY9CN0G4MmsCpIOCBEtC0fURShqHvNh0JqmHMeomfyegVc7etczCYtHspNLe
 sUhj4qvmSMrOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 021BDE2F31F; Tue,  6 Feb 2024 13:10:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170722502700.6009.7954883492875206061.git-patchwork-notify@kernel.org>
Date: Tue, 06 Feb 2024 13:10:27 +0000
References: <20240203053133.1129236-1-0x1207@gmail.com>
In-Reply-To: <20240203053133.1129236-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, horms@kernel.org, jpinto@synopsys.com,
 netdev@vger.kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, xfr@outlook.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix a typo of
 register name in DPP safety handling
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
by Paolo Abeni <pabeni@redhat.com>:

On Sat,  3 Feb 2024 13:31:33 +0800 you wrote:
> DDPP is copied from Synopsys Data book:
> 
> DDPP: Disable Data path Parity Protection.
>     When it is 0x0, Data path Parity Protection is enabled.
>     When it is 0x1, Data path Parity Protection is disabled.
> 
> The macro name should be XGMAC_DPP_DISABLE.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: xgmac: fix a typo of register name in DPP safety handling
    https://git.kernel.org/netdev/net/c/1ce2654d87e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
