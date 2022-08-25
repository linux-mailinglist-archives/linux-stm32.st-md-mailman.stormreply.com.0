Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02F5A19EC
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 22:00:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37742C640FB;
	Thu, 25 Aug 2022 20:00:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B08CBC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 20:00:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3663161211;
 Thu, 25 Aug 2022 20:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 007EFC43144;
 Thu, 25 Aug 2022 20:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661457618;
 bh=WEwkjv+SNVa+fRU64wpKmLH8loYcwWf8LGObhUM/nyI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TIWE9sCUflL5SdYILoA50L7KjGYQfmykOYYd1Y1/UdWQhAIBE0lzG1v3j70/4Nva+
 Q2qMy+60jNQmjE/I82IdS17Mh/fmvCdLyGdNgrS+Yy4cEVcb+sNt3epNyNr/0MEkkx
 O9DJ8/gckRUBjRB2h0Aia573KzLEOXtNKGDkmOa7H+PrfLUQjYwgyBcd9Uurpoq0w5
 9ScwlYRNUHXubQRYRBESsaxSLRdQJmLOSPc6sW2j+v5gPVmfGrmneuOHybKKlFL2L6
 rMehZRzpNMvQg8qsa8nR+H3acDyHDWhVHJs7nrm0KoX+U9pMDei+BO5NoNruUybS6P
 MJOKzHFHi8Xsw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D9615E2A042; Thu, 25 Aug 2022 20:00:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166145761788.4210.4923470466947390397.git-patchwork-notify@kernel.org>
Date: Thu, 25 Aug 2022 20:00:17 +0000
References: <e99857ce-bd90-5093-ca8c-8cd480b5a0a2@gmail.com>
In-Reply-To: <e99857ce-bd90-5093-ca8c-8cd480b5a0a2@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: da@lessconfused.com, netdev@vger.kernel.org, qi.duan@amlogic.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, rayagond@vayavyalabs.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Subject: Re: [Linux-stm32] [PATCH v2 net] net: stmmac: work around sporadic
	tx issue on link-up
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
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 24 Aug 2022 22:34:49 +0200 you wrote:
> This is a follow-up to the discussion in [0]. It seems to me that
> at least the IP version used on Amlogic SoC's sometimes has a problem
> if register MAC_CTRL_REG is written whilst the chip is still processing
> a previous write. But that's just a guess.
> Adding a delay between two writes to this register helps, but we can
> also simply omit the offending second write. This patch uses the second
> approach and is based on a suggestion from Qi Duan.
> Benefit of this approach is that we can save few register writes, also
> on not affected chip versions.
> 
> [...]

Here is the summary with links:
  - [v2,net] net: stmmac: work around sporadic tx issue on link-up
    https://git.kernel.org/netdev/net/c/a3a57bf07de2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
