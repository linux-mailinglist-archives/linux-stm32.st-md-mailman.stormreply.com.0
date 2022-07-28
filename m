Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC24D584574
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Jul 2022 20:10:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 237EEC640F6;
	Thu, 28 Jul 2022 18:10:19 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 862BDC640F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Jul 2022 18:10:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 056DAB824D8;
 Thu, 28 Jul 2022 18:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1C46C433B5;
 Thu, 28 Jul 2022 18:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659031814;
 bh=ppCmYlclJCNj1Oq4JCRie1DNfqM3IDoEheXuO58cvTg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=eLM26ccgbZnNt0CUIvvwJbBC6poS7oR7/G7lozocJNnsWBDxawsTE6oPYLvcekSPN
 ovhwHnCYigojA0lNzHgTrDin14WQ/SByLA2OVU7L2NpfhksLivH7MZNJH2J8xeFsfY
 upCMg0rPvG+0n9X7WTX/mMT9xEfyqLAthPpDj6B+pjyDeG4ARdXrKwLsIMvAkusSjw
 m+TfAmO8YGLPI68SUg9e5Dz+pdwTFTRUpG4dq/+gx+mL3O8uP1QYGhApfb7oEkBcC1
 ze5Hje/u8jYLcuTh3tF+WaMTjKeNCb5lvS6x9mArIv0MifFmqvap/ThP+fuXo8Szs3
 CIOAPxN00q3Qg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C93C6C43143; Thu, 28 Jul 2022 18:10:13 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165903181382.2291.8863547537135721463.git-patchwork-notify@kernel.org>
Date: Thu, 28 Jul 2022 18:10:13 +0000
References: <YuJ4aZyMUlG6yGGa@kili>
In-Reply-To: <YuJ4aZyMUlG6yGGa@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: biao.huang@mediatek.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, matthias.bgg@gmail.com,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net] stmmac: dwmac-mediatek: fix resource
	leak in probe
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

On Thu, 28 Jul 2022 14:52:09 +0300 you wrote:
> If mediatek_dwmac_clks_config() fails, then call stmmac_remove_config_dt()
> before returning.  Otherwise it is a resource leak.
> 
> Fixes: fa4b3ca60e80 ("stmmac: dwmac-mediatek: fix clock issue")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [net] stmmac: dwmac-mediatek: fix resource leak in probe
    https://git.kernel.org/netdev/net/c/4d3d3a1b244f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
