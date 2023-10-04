Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4927B8E07
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 22:30:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0218BC6C831;
	Wed,  4 Oct 2023 20:30:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 715A8C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 20:30:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19E5161783;
 Wed,  4 Oct 2023 20:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B027FC433C8;
 Wed,  4 Oct 2023 20:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696451426;
 bh=mdDX07PCg9576DleQyl2CYXvWPdBHOjEh3zc5XJe1gg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=QpNozK2TBgVwFAxoyMxA4s/bPvwW+g46RiuKu2xeB+/FmGEo3325gSpAJOLrhscrz
 DzFRRqOtiHtO4mzRsVzVjGMI7i0wo8iWFsvCONfuNiYGLg2CdHWjH2Ij9vucO3gb4h
 KaAv8DqQn9afT7+eVhsXqDTiPyIHENWJZbaFu6/IyNBQF20wxtC7iora0XH15jBYEt
 snyC+fbRMaQKM2p6jFckBXbFqwuCiMck6g6nmbdzSjeoe+OKzrjq/o40E2EuuE22yf
 y2s1A/foU9nqLb3kEJLPi/FZ7z4UHshcdbcXvmlJFE0IFfq5iui0xgQonyDG/3rCrW
 a8xYTDPqEvpPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 94C5AC395EC; Wed,  4 Oct 2023 20:30:26 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169645142659.7929.1401837139446302985.git-patchwork-notify@kernel.org>
Date: Wed, 04 Oct 2023 20:30:26 +0000
References: <20230927175749.1419774-1-ben.wolsieffer@hefring.com>
In-Reply-To: <20230927175749.1419774-1-ben.wolsieffer@hefring.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-stm32: fix resume
	on STM32 MCU
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 27 Sep 2023 13:57:49 -0400 you wrote:
> The STM32MP1 keeps clk_rx enabled during suspend, and therefore the
> driver does not enable the clock in stm32_dwmac_init() if the device was
> suspended. The problem is that this same code runs on STM32 MCUs, which
> do disable clk_rx during suspend, causing the clock to never be
> re-enabled on resume.
> 
> This patch adds a variant flag to indicate that clk_rx remains enabled
> during suspend, and uses this to decide whether to enable the clock in
> stm32_dwmac_init() if the device was suspended.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: dwmac-stm32: fix resume on STM32 MCU
    https://git.kernel.org/netdev/net/c/6f195d6b0da3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
