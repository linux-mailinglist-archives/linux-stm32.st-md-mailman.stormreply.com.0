Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FBD40F8D8
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Sep 2021 15:10:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DEA6C5A4F7;
	Fri, 17 Sep 2021 13:10:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57178C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Sep 2021 13:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 98F39611C4;
 Fri, 17 Sep 2021 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631884207;
 bh=nO1/aVBlG82KIoJKcsFqGqOzauFVzjv1LobclgXvjTQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KvIywNfGDvZqpVzng3hIxCh79JaiLLt0Elx1W6BoHzYFgYpZiCVZvctc7ZuPTWMCr
 invnPoVund2Vf5ocbaN+z8ludE2PkIGxzpyIUz7WXocI9SN8bg+L/dtrptBeI+BAaB
 a/SbuBTQ1FcVXVzmxZu8XwRzHmUgP0EHSOUovHhCe3PZ5HssoVhqmFoTXYW8iaDRai
 2U89M1E9tQ6GzbkrN9owhEeNjoMFytLQJsbd09io4IuezYpI/kFfgQwH3X9q76QTf7
 CyPtw8uP4lt4GEckwNFoJ3ytTlTYohg2N8FN0vhAaoC+o3wejhf3iru8Wk3pE8XG6f
 x0XDwsHdtuuDg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 876E1609B4;
 Fri, 17 Sep 2021 13:10:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163188420754.25822.8146846295180412777.git-patchwork-notify@kernel.org>
Date: Fri, 17 Sep 2021 13:10:07 +0000
References: <20210916073737.9216-1-caihuoqing@baidu.com>
In-Reply-To: <20210916073737.9216-1-caihuoqing@baidu.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, nobuhiro1.iwamatsu@toshiba.co.jp, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-visconti: Make use of
 the helper function dev_err_probe()
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

On Thu, 16 Sep 2021 15:37:36 +0800 you wrote:
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> And using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-visconti: Make use of the helper function dev_err_probe()
    https://git.kernel.org/netdev/net-next/c/b20b54fb00a8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
