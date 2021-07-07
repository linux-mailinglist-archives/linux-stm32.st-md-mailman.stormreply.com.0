Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B26253BF109
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jul 2021 22:51:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F366C57B5B;
	Wed,  7 Jul 2021 20:51:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D6AEC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jul 2021 20:51:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C77EF61CD1;
 Wed,  7 Jul 2021 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625691064;
 bh=Ct4dOmBsNruy03UbUBokuSSXzn56Dr/qDtxqmnRYTJk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kRzqLVniqFPoXY0XbDpGnjZBziO5SJD12Ft+qVYK0IZnv/04VSlCpa/4akvaAem7m
 x9OW2b1GH4JWrnuw4y1sHMxWpe4rq5fDbA5Z3VhwbtekA0HfBTHVgUWtsikYmUckTo
 GMzBe7L/ovBIyam2asgsuETwFD8sG05uEgcTT/JbIzfkIlWsfuI6kKzdpZSiWjJxkI
 kLKponL+L1/D8RsjhHmEw6CtGdjmJhcvVNZFXw+ILtKhZpIKQ4vngQrBH14bm2Aqse
 K/Pk/PgTGTosD+fG0opGt9b+3mTmG8IEqYBW5awEqximn/rfYyfK+fFPbwoRPE5rJ/
 4HxkkOOxfpYWA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B9D2F609BA;
 Wed,  7 Jul 2021 20:51:04 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162569106475.4918.15116058947596602803.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jul 2021 20:51:04 +0000
References: <20210707075057.34348-1-yuehaibing@huawei.com>
In-Reply-To: <20210707075057.34348-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: zhangqing@loongson.cn, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, jiaxun.yang@flygoat.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] stmmac: dwmac-loongson: Fix unsigned
	comparison to zero
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

On Wed, 7 Jul 2021 15:50:57 +0800 you wrote:
> plat->phy_interface is unsigned integer, so the condition
> can't be less than zero and the warning will never printed.
> 
> Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [net] stmmac: dwmac-loongson: Fix unsigned comparison to zero
    https://git.kernel.org/netdev/net/c/0d472c69c6a5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
