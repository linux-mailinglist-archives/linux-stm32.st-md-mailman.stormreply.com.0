Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C22F2563DEE
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Jul 2022 05:20:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78D69C640EC;
	Sat,  2 Jul 2022 03:20:19 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16DCDC03FDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Jul 2022 03:20:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8537DB83092;
 Sat,  2 Jul 2022 03:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A71BC341D3;
 Sat,  2 Jul 2022 03:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656732015;
 bh=J+IFHIfwo1xv6slO5esRVm/qGVJpn8jG0JMuyhmShrI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ao+cz+I7rw/XVDZFVhD/Z6wUsb/NHPLZYHtVv735Hf6OmjjZ0SOCk9d6KrU2CPawP
 +f8MXpu2GgW3ORyW0qVTvP7weWzeyQqZVlPE7nO+o88saT8K9QyjqiDXdNsKT4wii1
 9CpZAtUU5bwJQKDTtOTgg0xKPu5vCtaWe3h++oU7pP4ouOrVwR+squBi2Pw/xauG9q
 +2skv66X0cbJSGXoTFUUqUiKjb2Gx7FcFLNoeSn/cML9jhInC64Kr+F/ndwd2y91IG
 spY2DWukmQYFZwUTZnN1XfgVVYcj9GuM40bUacUIDqu+4l+82m11FG7dzQ6K72Vvyj
 9VVIYHt49NMtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 540B6E49BBC; Sat,  2 Jul 2022 03:20:15 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165673201533.6297.13051532360363595502.git-patchwork-notify@kernel.org>
Date: Sat, 02 Jul 2022 03:20:15 +0000
References: <20220630125222.14357-1-yuanjilin@cdjrlc.com>
In-Reply-To: <20220630125222.14357-1-yuanjilin@cdjrlc.com>
To: Jilin Yuan <yuanjilin@cdjrlc.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmicro/stmmac: fix repeated words in
	comments
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

On Thu, 30 Jun 2022 20:52:22 +0800 you wrote:
> Delete the redundant word 'all'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - stmicro/stmmac: fix repeated words in comments
    https://git.kernel.org/netdev/net-next/c/93d663c7e5a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
