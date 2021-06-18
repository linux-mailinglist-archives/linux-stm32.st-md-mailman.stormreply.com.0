Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6CB3AD2AA
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Jun 2021 21:20:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1736C59780;
	Fri, 18 Jun 2021 19:20:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0748C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 19:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AB2C0613F9;
 Fri, 18 Jun 2021 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624044006;
 bh=HZ4786m59RuoK2hhVqx9AEvfGS19lUp25OPPq29lkUU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=m2OgkkTsdmofpAAu+W1ppBUgg89bpi+1Rut7sSdt4QOX6ZIbFyLif7ypQ6aA9wbDU
 +gaLLp7pX/cIr1d3ak3nb/YXyOoBCqpjRZvUolGJxw4RsExGqy2Z749K4WvUnarJ9G
 CBNVDmLMxX7RS/B6IcVMKj2YSCD44wPK/yl9n0vtH1CFeznK0ul49HoIZ+ZTCqYti3
 9dmnEQhninmnPpwIjfL8s+AKlz08LFngtHSp+2R62c5ugzIWHd17Zi/ebJcfoqBe4z
 c0fJK90vs8Vpa4E8ZyAYo63WkC7rga5LTcxlZSOSDTQMkAWuhSiCe9B2T35tqHuufu
 dGroWBUz9RBdA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9BDEA60CE2;
 Fri, 18 Jun 2021 19:20:06 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162404400663.12339.191732752255079680.git-patchwork-notify@kernel.org>
Date: Fri, 18 Jun 2021 19:20:06 +0000
References: <20210618094425.100395-1-colin.king@canonical.com>
In-Reply-To: <20210618094425.100395-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: remove redundant continue
	statement
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

On Fri, 18 Jun 2021 10:44:25 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The continue statement in the for-loop has no effect, remove it.
> 
> Addresses-Coverity: ("Continue has no effect")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: remove redundant continue statement
    https://git.kernel.org/netdev/net-next/c/c44924c532fb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
