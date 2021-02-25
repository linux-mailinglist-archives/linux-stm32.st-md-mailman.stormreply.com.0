Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BA33247D2
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Feb 2021 01:20:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19DABC57B59;
	Thu, 25 Feb 2021 00:20:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B730C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 00:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5EA8D64F11;
 Thu, 25 Feb 2021 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614212407;
 bh=wnAIPBprFZceo32iwm9Vth3MHQM2ktK6F0R+YU0JY6k=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pSs4eDtlDBdy8xXCn8PFnvKOUX10VKBzqXAx1lY389efFLVInUU7qesO+guHYAZDS
 VgLHBnQ0XlDk35p4YFT2edPuVpyrbTxRy0k2rA9TjHKlbmXpWpSA34+dQvulFAJ/oz
 WNZFeWe48s9FFWWhK4LswkRmz1cJJtY2ZtHL8ORHzRbE5ork5Fhj4ETlzPyRYpULGH
 +0NuF3ptYEHeIifdRGM8jiWBZ07KDR3x/beYsupvlip9aseW8nxi5iqXu+8ieIiFnB
 KKmR3yoDmZxQgzyjcNwhYgB4cdVnZwb9Ytd7awde4UwPZ5KDIZczhDPXNmjt0otBr9
 fEglBTs2fY8bg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 502CF609F2;
 Thu, 25 Feb 2021 00:20:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161421240732.21407.2002592111735114066.git-patchwork-notify@kernel.org>
Date: Thu, 25 Feb 2021 00:20:07 +0000
References: <20210223104803.4047281-1-weiyongjun1@huawei.com>
In-Reply-To: <20210223104803.4047281-1-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, hulkci@huawei.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix missing spin_lock_init
 in visconti_eth_dwmac_probe()
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

On Tue, 23 Feb 2021 10:48:03 +0000 you wrote:
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
> 
> Fixes: b38dd98ff8d0 ("net: stmmac: Add Toshiba Visconti SoCs glue driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: Fix missing spin_lock_init in visconti_eth_dwmac_probe()
    https://git.kernel.org/netdev/net/c/17d7fd47aa90

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
