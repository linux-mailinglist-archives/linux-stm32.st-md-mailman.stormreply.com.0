Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A03B0BD5
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 19:50:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86D03C597AE;
	Tue, 22 Jun 2021 17:50:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08640C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 17:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1EFBD61353;
 Tue, 22 Jun 2021 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624384206;
 bh=ESgFv0vtJ21tRzqywt1ll8Kx5wBSrdb3mdom7uZBV+4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WGmbPdZKWEIGOuZqUyeEYKlD8yyAVzaSEGw7QIDtMrfy4nWDiuFV/wtYkczckA1f9
 N3Dpy+/mDvhpsgfzSFkdo8Kg398LSI2a7yfDasev4x7VTNn7ATlvQtnLHTIMQHvMZK
 MNXRUGUxzKpsFCldIjm5qwq7Ox7C7tk3W0eUsFMgq36EsSTH4GF/SdydIQdIDyoF1e
 y8P0WlV0l5119sWWQ1x6D4cd03bfy1R9SbTZBT+en5/y0724KL9rd0D4HDCOTIaQAe
 jhVi4HMQ9sqCEyEh7af/qrlLcT+MHUwZnxWfbeFMvAK6oyAov278A/jr3zIESMB7eH
 NAdIGpOWsGlzw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0F88B60A6C;
 Tue, 22 Jun 2021 17:50:06 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162438420605.559.7709125546546487044.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jun 2021 17:50:06 +0000
References: <YNHOz8Aqo7Y1ZwO+@mwanda>
In-Reply-To: <YNHOz8Aqo7Y1ZwO+@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: zhangqing@loongson.cn, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, alexandre.torgue@foss.st.com,
 jiaxun.yang@flygoat.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] stmmac: dwmac-loongson: fix
 uninitialized variable in loongson_dwmac_probe()
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 22 Jun 2021 14:51:43 +0300 you wrote:
> The "mdio" variable is never set to false.  Also it should be a bool
> type instead of int.
> 
> Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] stmmac: dwmac-loongson: fix uninitialized variable in loongson_dwmac_probe()
    https://git.kernel.org/netdev/net-next/c/b0e03950dd71

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
