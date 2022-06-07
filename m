Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD7553FAE0
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jun 2022 12:10:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B367C5E2CC;
	Tue,  7 Jun 2022 10:10:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1840AC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jun 2022 10:10:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97B23B81EDA;
 Tue,  7 Jun 2022 10:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5940AC34115;
 Tue,  7 Jun 2022 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654596612;
 bh=uxBnGi0lvT4IHjDBL9QfFrsy/vJI+5YmmsBX/iL2cfg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bzZs64XsqxOYukKB6buDwq6W4Pejor7a65ovN2xzSrG10sP/mVTKxieqa4bgYP8ND
 f1pBuFlzMB77VvFKSyZlnRh5w14OPG6OCb43Ku230hyUhvPU5Hjwb1+8RcS7dRhUGF
 MvSxjqXRBImun85jSONPFz47Kp2Ox5EvCVm1LnoB/dg3ZJc7a/fCOn4wqNHaXO4Nfj
 FUiJjdJKYnKrZlmrobhgW13NnYWNUeJ2cARiEtri+m8mw554fmuYX69NpmAAH9X8Kq
 ysZbJjspmv0LEpnO+cWGx+NAY0GoL2D3MbCmHnF2TlV3On0MjyU0mcQwipNz5VuK6u
 iOwPR05l1BdXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3941CE737E8; Tue,  7 Jun 2022 10:10:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165459661222.7137.14626873072976245963.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jun 2022 10:10:12 +0000
References: <1ac9b6787b0db83b0095711882c55c77c8ea8da0.1654462241.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <1ac9b6787b0db83b0095711882c55c77c8ea8da0.1654462241.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: vee.khee.wong@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: intel: Fix an error handling path
 in intel_eth_pci_probe()
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

On Sun,  5 Jun 2022 22:50:48 +0200 you wrote:
> When the managed API is used, there is no need to explicitly call
> pci_free_irq_vectors().
> 
> This looks to be a left-over from the commit in the Fixes tag. Only the
> .remove() function had been updated.
> 
> So remove this unused function call and update goto label accordingly.
> 
> [...]

Here is the summary with links:
  - stmmac: intel: Fix an error handling path in intel_eth_pci_probe()
    https://git.kernel.org/netdev/net/c/5e74a4b3ec18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
