Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C17772EA5
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 21:30:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1190BC6B45B;
	Mon,  7 Aug 2023 19:30:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAE7EC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 19:30:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46E6E621AC;
 Mon,  7 Aug 2023 19:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC2D3C433CC;
 Mon,  7 Aug 2023 19:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691436624;
 bh=uE2fa7Fe0pYN2Kl+HM144jNfenom/57ArJYynw749Y8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rKa2GrlyguweRNZ5knCI8EenRhfj2Xvv2Ldea63alaBe7mpjAlGAOeHhsepJQ14gb
 Jm8DJwFzGVGq3VyFl8f43PeOU/f/g56xUljiQnpgRNFf31oqYOKnl56HfUFW9ee0Uw
 x2fiek2lEFT/bjTqiWdNZ+YTEdt18OjnpYIn093Pb4A72qsKCER1Gm5ID5oxgWCrTP
 hSpy8fDAYm6XQQJPeeDzjc26MsT9BJYnhCbYlY7COpBJY+SKT/0p4aGDOzCmLu0Orx
 h7gYTFFULHHfLZZtUvi9q+U3h6XA4FJgoQaKdHWAFNK45uIaMreW5vGFCzImfKZouL
 CNchHLHJC/bqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AE4E5E270C3; Mon,  7 Aug 2023 19:30:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169143662470.21933.13583691380398650705.git-patchwork-notify@kernel.org>
Date: Mon, 07 Aug 2023 19:30:24 +0000
References: <20230719-stmmac_correct_mac_delay-v3-0-61e63427735e@pengutronix.de>
In-Reply-To: <20230719-stmmac_correct_mac_delay-v3-0-61e63427735e@pengutronix.de>
To: Johannes Zink <j.zink@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 richardcochran@gmail.com, kurt@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk, lkp@intel.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 0/2] net: stmmac: correct MAC
	propagation delay
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 01 Aug 2023 17:44:28 +0200 you wrote:
> ---
> Changes in v3:
> - work in Richard's review feedback. Thank you for reviewing my patch:
>   - as some of the hardware may have no or invalid correction value
>     registers: introduce feature switch which can be enabled in the glue
>     code drivers depending on the actual hardware support
>   - only enable the feature on the i.MX8MP for the time being, as the patch
>     improves timing accuracy and is tested for this hardware
> - Link to v2: https://lore.kernel.org/r/20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de
> 
> [...]

Here is the summary with links:
  - [v3,1/2] net: stmmac: correct MAC propagation delay
    https://git.kernel.org/netdev/net-next/c/26cfb838aa00
  - [v3,2/2] net: stmmac: dwmac-imx: enable MAC propagation delay correction for i.MX8MP
    https://git.kernel.org/netdev/net-next/c/6cb2e613c796

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
