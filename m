Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE916E726C
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Apr 2023 06:50:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C36C1C6B45E;
	Wed, 19 Apr 2023 04:50:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EAD1C6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 04:50:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A71963B0C;
 Wed, 19 Apr 2023 04:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3295EC4339E;
 Wed, 19 Apr 2023 04:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681879818;
 bh=69Tud3bSSGNHl0lC6ZBQofnTfR5CiybZ4tvETIL9Nz0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gQxfCyBAGlwYOBB1+JBZD/k+7HcjZpACEwUTdlEfpU7Ncv+8U+f0G/bWBbsoCeGsm
 wsl8IepB0W+cyAJDrf+m00vVKKyPRXykgpLw7+2LQAhnR9nGIDAHNFcHFvsv/pqbjP
 spaanqSwVGRkLFoFg6Vf0h1agKMXqlE2WLgyAusfhh6zBKsTVKIvIsh++oIgI/t3s/
 o8QIhKmMyzxWCYE4HxiVHRTCu8mgkcA7tAX4LE+2nAWPEjv1CtgvagL9bVf88WKo4e
 HJCYPUVp95UCqohZmahFGuGyaeW94HOaVEWkuaKFTAFYc7e4R1uGHjXeGyx60r7RVb
 FIKt6MdXufpZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 106CDE50D63; Wed, 19 Apr 2023 04:50:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168187981806.31004.15139314026801382632.git-patchwork-notify@kernel.org>
Date: Wed, 19 Apr 2023 04:50:18 +0000
References: <20230416195523.61075-1-avolmat@me.com>
In-Reply-To: <20230416195523.61075-1-avolmat@me.com>
To: Alain Volmat <avolmat@me.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: ethernet: stmmac: dwmac-sti: remove
 stih415/stih416/stid127
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

On Sun, 16 Apr 2023 21:55:23 +0200 you wrote:
> Remove no more supported platforms (stih415/stih416 and stid127)
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> ---
> Patch sent previously as part of serie: https://lore.kernel.org/all/20230209091659.1409-8-avolmat@me.com/
> 
> [...]

Here is the summary with links:
  - net: ethernet: stmmac: dwmac-sti: remove stih415/stih416/stid127
    https://git.kernel.org/netdev/net-next/c/14cac662235e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
