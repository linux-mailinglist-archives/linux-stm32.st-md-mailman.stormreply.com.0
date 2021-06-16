Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 615743AA3FC
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jun 2021 21:10:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08EB7C59780;
	Wed, 16 Jun 2021 19:10:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF874C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 19:10:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5AFCC611CE;
 Wed, 16 Jun 2021 19:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623870603;
 bh=yzlIDihKnNvjknOPU2lHi5fsnt7+4ZwDFrQLheoFmTM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BK7Xv0RRI5lUngVut4W+X4ZaK14b3J/PL77EM6Of+bwp8+3ItpIsv/1/GG5bXteDY
 c74CH+H6OXy1rFXc9UQkQs9Fu/qYRh1gBEDP050wgDUyufzNo8ZGEHDIgzO3pXaOrK
 fk4MyVp1xgRETvHE/6FUbqc2/0EbvVEOEQPZlP6a3yh1UfBgSzJAa9LVzrxQ10ScJO
 rIvfAN2aRyKiqPLX+fwODBZCzIlC7fNily+7UmE6N950kMukvZSc8Me9jJkg3BBRbz
 d9C5BYnxj+InjpZKto0du/AiHCMITx6kLBFnkdvB+ZoagK9JfnpQAYXax6pjGf5nI/
 xNpilpvP/MoXw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4718060A54;
 Wed, 16 Jun 2021 19:10:03 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162387060328.23352.18155798235650955751.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jun 2021 19:10:03 +0000
References: <20210615172155.2839938-1-weiyongjun1@huawei.com>
In-Reply-To: <20210615172155.2839938-1-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 zhouyanjie@wanyeetech.com, hulkci@huawei.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Fix error return
 code in ingenic_mac_probe()
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

On Tue, 15 Jun 2021 17:21:55 +0000 you wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 2bb4b98b60d7 ("net: stmmac: Add Ingenic SoCs MAC support.")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: Fix error return code in ingenic_mac_probe()
    https://git.kernel.org/netdev/net-next/c/61273f9d8314

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
