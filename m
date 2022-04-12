Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 308614FCD38
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Apr 2022 05:40:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEDC0C628AD;
	Tue, 12 Apr 2022 03:40:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F0A8C5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 03:40:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 683BEB81A93;
 Tue, 12 Apr 2022 03:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B934CC385AE;
 Tue, 12 Apr 2022 03:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649734811;
 bh=QSsKy83Tm0f2ZZsihBg96iw58bRZQn7S4W9PNzeh6IU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NxtyIYEfueBaHbM2MfB0w9z9bqeoYdVe4N7T0pIWDfo3db0loc10hklAXeu7IqXHq
 E1oahx3XM2qt4aJwziCkzRp9iCoSeE4ILLvDk7tGS1YNh0g2wFfgAIbjhdK7rdave+
 OgMKkzMHKd71phnAwvEvZwDk2xEFofUXQFs6YGv62NhufhyECL0ugAGGKTRqv3SOu3
 u7bf+Lge3+xJD/67kDljEw+ouUB2XelIVyw8tpTsrbauROWPbmES5ev0DuhtR4kS5A
 hkxIcCMiz8nqYImM4EFI0AaNPsn/D2dF3xzfeqEQZN/CLkJsw0OeJv20cKKYPyNyxt
 ZOGtifyQm5u2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A1D2BE8DBD1; Tue, 12 Apr 2022 03:40:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164973481165.21815.4242211129127788144.git-patchwork-notify@kernel.org>
Date: Tue, 12 Apr 2022 03:40:11 +0000
References: <20220408081250.2494588-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220408081250.2494588-1-chi.minghao@zte.com.cn>
To: CGEL <cgel.zte@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, zealci@zte.com.cn,
 chi.minghao@zte.com.cn, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: using
 pm_runtime_resume_and_get instead of pm_runtime_get_sync
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  8 Apr 2022 08:12:50 +0000 you wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> 
> [...]

Here is the summary with links:
  - net: stmmac: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
    https://git.kernel.org/netdev/net-next/c/e2d0acd40c87

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
