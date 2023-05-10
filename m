Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7886FD3E5
	for <lists+linux-stm32@lfdr.de>; Wed, 10 May 2023 04:50:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32294C6904F;
	Wed, 10 May 2023 02:50:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED2C3C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 May 2023 02:50:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAC90638F0;
 Wed, 10 May 2023 02:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3A43C433D2;
 Wed, 10 May 2023 02:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683687020;
 bh=uYGUc2iemDUAZix/3j2XeIERBHlEpfWv5ACO+Ofk21I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=RdJEjA12dj4F0THfzvCLgpra7SlZYVF+g9Ir2ZbBYbG/XP2Y38KPlnt5ahBVPBLaF
 CDcpN/4wfGFX8iYkh5gxGQo4JJlU+7+NY+QS/lvnsUShqwUo2ZiTnOoXknq6uGv4Sc
 jRexMbAPkWn3DoiCxIyI5bA9H+diGdO3sURPsERlWWVOOBr7IZM3EnvF1tDz6axlg8
 qpo/cukK6uI7oOCDgck/wXKeKELjp/46GZCPEPUeUvZu9NdUYiv+j/HYQXuPAuYIPT
 qRJ92f7uH7g/UOhnuueRtE+HnnWfFQLo4wJRWrG88DbZ3WYiQODnWUmaVglJUkx6eI
 BtAYDjqPenspA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AA571C39562; Wed, 10 May 2023 02:50:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168368702069.23144.12939098876302994192.git-patchwork-notify@kernel.org>
Date: Wed, 10 May 2023 02:50:20 +0000
References: <20230506235845.246105-1-marex@denx.de>
In-Reply-To: <20230506235845.246105-1-marex@denx.de>
To: Marek Vasut <marex@denx.de>
Cc: pabeni@redhat.com, marcel.ziswiler@toradex.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kuba@kernel.org, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, francesco.dolcini@toradex.com,
 peppe.cavallaro@st.com, hws@denx.de, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Initialize
	MAC_ONEUS_TIC_COUNTER register
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

On Sun,  7 May 2023 01:58:45 +0200 you wrote:
> Initialize MAC_ONEUS_TIC_COUNTER register with correct value derived
> from CSR clock, otherwise EEE is unstable on at least NXP i.MX8M Plus
> and Micrel KSZ9131RNX PHY, to the point where not even ARP request can
> be sent out.
> 
> i.MX 8M Plus Applications Processor Reference Manual, Rev. 1, 06/2021
> 11.7.6.1.34 One-microsecond Reference Timer (MAC_ONEUS_TIC_COUNTER)
> defines this register as:
> "
> This register controls the generation of the Reference time (1 microsecond
> tic) for all the LPI timers. This timer has to be programmed by the software
> initially.
> ...
> The application must program this counter so that the number of clock cycles
> of CSR clock is 1us. (Subtract 1 from the value before programming).
> For example if the CSR clock is 100MHz then this field needs to be programmed
> to value 100 - 1 = 99 (which is 0x63).
> This is required to generate the 1US events that are used to update some of
> the EEE related counters.
> "
> 
> [...]

Here is the summary with links:
  - net: stmmac: Initialize MAC_ONEUS_TIC_COUNTER register
    https://git.kernel.org/netdev/net/c/8efbdbfa9938

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
