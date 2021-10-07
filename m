Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5334257BC
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Oct 2021 18:20:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 651AFC597B3;
	Thu,  7 Oct 2021 16:20:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 561CAC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Oct 2021 16:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 871096135E;
 Thu,  7 Oct 2021 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633623607;
 bh=L0i1qPf2V13h6B1q2pkjFrt4h5K0cOE8115GACJqXNM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WIol9e7/V2qd5ftXNq8bBX9zBiph0QVHWMxPs3j+0nVe/rGDX7vMdAkbkEFpiZwIa
 qyUYdBNV9ejiDmmQBYfzIHg/EKrONFCur/x0T8LdVFjFPx34bCQjJCqlD+dvL6D6b2
 zubmsn6NmJiVT7ZqwuhuZNmk0ukebzUADOEUSxrDyC8KSWO8971H2sATsMmr7fy+3p
 TmDWILz95aOsUI1FtNGEqYSHHev5+GuUzExgk9O9KmI+2sKjb0qsr+07WaG/TDxXzT
 8DQ7Y6qcU40sP1GIkUL5olJi+eRUm+JOwCnjQbQNA0yyYU2aOOivX59y7ri4TVsmSp
 SZRHPgUqJJ+gw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7FE7860971;
 Thu,  7 Oct 2021 16:20:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163362360751.31605.17812637314977823996.git-patchwork-notify@kernel.org>
Date: Thu, 07 Oct 2021 16:20:07 +0000
References: <20211006180944.GA913477@embeddedor>
In-Reply-To: <20211006180944.GA913477@embeddedor>
To: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, linux-hardening@vger.kernel.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH][next] net: stmmac: selftests: Use
 kcalloc() instead of kzalloc()
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

On Wed, 6 Oct 2021 13:09:44 -0500 you wrote:
> Use 2-factor multiplication argument form kcalloc() instead
> of kzalloc().
> 
> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [next] net: stmmac: selftests: Use kcalloc() instead of kzalloc()
    https://git.kernel.org/netdev/net-next/c/36371876e000

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
