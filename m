Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F69C367227
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 20:00:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B44A9C58D60;
	Wed, 21 Apr 2021 18:00:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A3A9C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 18:00:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 91E5161428;
 Wed, 21 Apr 2021 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619028009;
 bh=tiMyA8uflJsNUltyx2Mx3G9j+bLWDuEnLCalQhQEUk4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XHPVoz9VqaBLJ0eKMzyI9cjNF7yWlm1h1H0l0bK34yMTSDQalYc2nCmpkUFCFAm1z
 stq41NXBSJNtybG57XWHCHwS/a3mJv8dvl30gGYKeiZccg9G0tAQyvXNQV79Y+nnvt
 uLIjHEhl3zWJnkX9+N5t9GEjg3uBGzJ+bIopxch6hzf20V0H2Edc0cWJinW5IWn81I
 iP1U9//STJxFYsYe1XX3rga0QaT9Pgi0opx3U1Cz9utIVpB/vbEIeCOrYqA3w98MFN
 a+lHZBKlEWWRofaJn+ZKMnO3wp5xMhPgTauyDz9ANsugjbUlS6J/XnU155UeXk3mLJ
 uMe2InCkaWx6g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 85D4E60A2A;
 Wed, 21 Apr 2021 18:00:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161902800954.24373.14896291622755574691.git-patchwork-notify@kernel.org>
Date: Wed, 21 Apr 2021 18:00:09 +0000
References: <20210421091149.5035-1-boon.leong.ong@intel.com>
In-Reply-To: <20210421091149.5035-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix TSO and TBS
 feature enabling during driver open
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

This patch was applied to netdev/net.git (refs/heads/master):

On Wed, 21 Apr 2021 17:11:49 +0800 you wrote:
> TSO and TBS cannot co-exist and current implementation requires two
> fixes:
> 
>  1) stmmac_open() does not need to call stmmac_enable_tbs() because
>     the MAC is reset in stmmac_init_dma_engine() anyway.
>  2) Inside stmmac_hw_setup(), we should call stmmac_enable_tso() for
>     TX Q that is _not_ configured for TBS.
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: fix TSO and TBS feature enabling during driver open
    https://git.kernel.org/netdev/net/c/5e6038b88a57

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
