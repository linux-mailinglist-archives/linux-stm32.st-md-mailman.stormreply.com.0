Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F66598A96
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Aug 2022 19:40:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 172E4C640F2;
	Thu, 18 Aug 2022 17:40:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCA19C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Aug 2022 17:40:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A29AB61733;
 Thu, 18 Aug 2022 17:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C93FC433C1;
 Thu, 18 Aug 2022 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660844436;
 bh=yNeFws/1Db4rGKVqEFTLGuONzvqcqQUN7ZodpwwhCmU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fgLXQbFEcJQkozcIVtrGPmx0kFbkR0CRxU8sgIUbagwA8UnFrHtD0A2z0rF4L+Zzq
 sCYvgLVILtpUERgXpzSekRXMQoUux0EOztlOJb+xSdA3btxru7Mwl97ykGR07raqvD
 WRCxR4IT+/NB+UtIhL/RxuSi6wQutEXFnYi+QcdTplP4q+FRjy47228anQoatr1VGQ
 Yemk+5CcrEU39LLSnQyyGQLCKtHrTbTYpICaD2jEATdI6Pj9aIoDWugGkTuZLNplhm
 Q/GIxBlub1f06XFnyFkXl7yIJIljxqf6adxOuv8O4TnNH7PDk23brfdFXfAcgDfb/E
 3UoNLMOkAOszg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5DBDDE2A058; Thu, 18 Aug 2022 17:40:36 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166084443637.19225.202296976141883530.git-patchwork-notify@kernel.org>
Date: Thu, 18 Aug 2022 17:40:36 +0000
References: <d7c8c1dadf40df3a7c9e643f76ffadd0ccc1ad1b.1660659689.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d7c8c1dadf40df3a7c9e643f76ffadd0ccc1ad1b.1660659689.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: andrew@lunn.ch, andriy.shevchenko@linux.intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, qiangqing.zhang@nxp.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, netdev@vger.kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] stmmac: intel: Add a missing
 clk_disable_unprepare() call in intel_eth_pci_remove()
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

This series was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 16 Aug 2022 16:23:57 +0200 you wrote:
> Commit 09f012e64e4b ("stmmac: intel: Fix clock handling on error and remove
> paths") removed this clk_disable_unprepare()
> 
> This was partly revert by commit ac322f86b56c ("net: stmmac: Fix clock
> handling on remove path") which removed this clk_disable_unprepare()
> because:
> "
>    While unloading the dwmac-intel driver, clk_disable_unprepare() is
>    being called twice in stmmac_dvr_remove() and
>    intel_eth_pci_remove(). This causes kernel panic on the second call.
> "
> 
> [...]

Here is the summary with links:
  - [v2,1/2] stmmac: intel: Add a missing clk_disable_unprepare() call in intel_eth_pci_remove()
    https://git.kernel.org/netdev/net/c/5c23d6b717e4
  - [v2,2/2] stmmac: intel: Simplify intel_eth_pci_remove()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
