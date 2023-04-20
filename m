Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1584D6E87A2
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Apr 2023 03:50:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAB56C65048;
	Thu, 20 Apr 2023 01:50:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 550C7C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Apr 2023 01:50:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14F3564457;
 Thu, 20 Apr 2023 01:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F449C433EF;
 Thu, 20 Apr 2023 01:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681955419;
 bh=Cu26XDuyq5lcZoz0ShVQmRachFypR8wCCTGfVCRr0kc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=AeNMQfvQL0xUGhQZuwBID+Vfg1KL01GzIazg36wgQpBQjLeyr+EbHsqyuEsqCwNvB
 wlp97j9vNEzaL7Qn2704lFswH4gETlVdMKGuHbSetDGAK0f1P9BYp6+/0UDr0uLLBe
 ua6FVCIWByeAwuQApHRNpRtnsgtjVr7FFXNa24+SHe7QzRUpt4yTanuc/NHODMWw5O
 aAD17rUpoJm5XVDvWLsge1PAa9mCObK91qvVPBTB9RlgVxuzP8+kR263Tuyluuc7dC
 K1q/MYWu0E0vPLRCP874RTsEMCBYEK1sC57HRDuv5qfrBIh2Kmp+jIeHokZZ/dzXY+
 HI7qyXJrRmvOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4D301E4D033; Thu, 20 Apr 2023 01:50:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168195541930.13596.18249490996446633117.git-patchwork-notify@kernel.org>
Date: Thu, 20 Apr 2023 01:50:19 +0000
References: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
In-Reply-To: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org,
 trix@redhat.com, martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 llvm@lists.linux.dev, ndesaulniers@google.com,
 linux-stm32@st-md-mailman.stormreply.com, nathan@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, netdev@vger.kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-meson8b:
 Avoid cast to incompatible function type
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
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 18 Apr 2023 13:07:33 +0200 you wrote:
> Rather than casting clk_disable_unprepare to an incompatible function
> type provide a trivial wrapper with the correct signature for the
> use-case.
> 
> Reported by clang-16 with W=1:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c:276:6: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>                                         (void(*)(void *))clk_disable_unprepare,
>                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> No functional change intended.
> Compile tested only.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwmac-meson8b: Avoid cast to incompatible function type
    https://git.kernel.org/netdev/net-next/c/43bb6100d8d5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
