Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B293E342C
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Aug 2021 10:50:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96464C597BC;
	Sat,  7 Aug 2021 08:50:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16029C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Aug 2021 08:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2777B60EC0;
 Sat,  7 Aug 2021 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628326207;
 bh=L03Kf59/VG57iU49qSzYSwXV02Uek8uVwPIGgByYm8Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DXy0hgpBuabZhcZziSBIvvEk+2Iu8Y0q9LCl7kLAIgCeXesyKkbPlPyWwC/krgHqo
 h+WYVwaHSSGDFos/QslVBKrlXGu+exFMAedKLupGObbI5XD0j0C560//WCT3qflbCr
 3LN16IeQfGqzCVhFGI4oJckAXwdBh0c8zY/MvN/LaT2AAG6puKiYKwSuu+v5CxTux8
 yeNsuFH/XSgy2pDRWJnLsuyvHMuyv1jeoNigDJkxb+U8S1lfldkPT2dpKeKRzFrufW
 FOpw+NIYuaK/Lkq0dQk+UATlTBhh+LLcRm0WAiq5h0QDH4T4fYB1e5azEhQ7dUR3Uq
 LUMBkLVkH51Dw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0EFDE609F1;
 Sat,  7 Aug 2021 08:50:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162832620705.3915.11584546852979312079.git-patchwork-notify@kernel.org>
Date: Sat, 07 Aug 2021 08:50:07 +0000
References: <20210806191339.576318-1-nathan@kernel.org>
In-Reply-To: <20210806191339.576318-1-nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, samitolvanen@google.com,
 netdev@vger.kernel.org, ndesaulniers@google.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, clang-built-linux@googlegroups.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: ethernet: stmmac: Do not use
 unreachable() in ipq806x_gmac_probe()
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

On Fri,  6 Aug 2021 12:13:40 -0700 you wrote:
> When compiling with clang in certain configurations, an objtool warning
> appears:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.o: warning: objtool:
> ipq806x_gmac_probe() falls through to next function phy_modes()
> 
> This happens because the unreachable annotation in the third switch
> statement is not eliminated. The compiler should know that the first
> default case would prevent the second and third from being reached as
> the comment notes but sanitizer options can make it harder for the
> compiler to reason this out.
> 
> [...]

Here is the summary with links:
  - net: ethernet: stmmac: Do not use unreachable() in ipq806x_gmac_probe()
    https://git.kernel.org/netdev/net-next/c/4367355dd909

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
