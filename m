Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C037037A
	for <lists+linux-stm32@lfdr.de>; Sat,  1 May 2021 00:30:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB113C58D7A;
	Fri, 30 Apr 2021 22:30:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BB0DC57B74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Apr 2021 22:30:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2A00F6147F;
 Fri, 30 Apr 2021 22:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619821811;
 bh=XVCO9O9G7bisl1YNGCySOUbejBlFNAz4x2iboi+HPMM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=P9ap/x9ZZ85fjGARq/R5Mx/7yINZ5m2vDn0crZ0pRnL67E9R3C8D1iy1Gz0Y+0L8a
 qrjt/ByO8Es0bUMCdCVDrOfxD0GNXFNx0gVkj4JtGt2Hfv1D7RON4QgUd0nRhGyGQ1
 VBR8n1K7TXqFHx0Avk6V3wz/rER4D/zkhXG2u5I5FL7j6ZG9oCtA6MAbvAGvCZj0gD
 pdE5JD+n+P2IsoPe4Z2BeEX20jpxW5RQtiQ1x9HWGlDp6nmBEFZgKAJ50l0WhcO++V
 pvC1W0678QKrRs+6jDm85TsI/nsYyAyjv07iSpwkbaroO9+FgHbKcck0eWyI1Wa8Zn
 ibXsMIlvrPnrA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1D1D160CD1;
 Fri, 30 Apr 2021 22:30:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161982181111.1234.7541800919565959093.git-patchwork-notify@kernel.org>
Date: Fri, 30 Apr 2021 22:30:11 +0000
References: <20210430031047.34888-1-wanjiabing@vivo.com>
In-Reply-To: <20210430031047.34888-1-wanjiabing@vivo.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, kael_w@yeah.net, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Remove duplicate declaration
	of stmmac_priv
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

On Fri, 30 Apr 2021 11:10:47 +0800 you wrote:
> In commit f4da56529da60 ("net: stmmac: Add support for external
> trigger timestamping"), struct stmmac_priv was declared at line 507
> which caused duplicate struct declarations.
> Remove later duplicate declaration here.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: Remove duplicate declaration of stmmac_priv
    https://git.kernel.org/netdev/net/c/f18c51b6513c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
