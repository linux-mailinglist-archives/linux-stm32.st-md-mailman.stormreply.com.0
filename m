Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD92CB56B7A
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Sep 2025 21:10:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A2A4C3F938;
	Sun, 14 Sep 2025 19:10:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EB77C3F931
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Sep 2025 19:10:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AAD3344357;
 Sun, 14 Sep 2025 19:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F437C4CEF0;
 Sun, 14 Sep 2025 19:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757877017;
 bh=HyErwXZjJxtC9lke1N7NrfDdKBhf9mDw543eo29YW8w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=E1zPJ01dh7kcko3XfxPCXOE0PzCnY3Y+TW/DO9qYP7YofigcyrnOeNJZZYqewjcaA
 g1yCXHROYGtXy/JbC++uEb1NWs/JlSOJfqLX7JrDG+0/NF1lnaxT1n0HniKXJs734Y
 NaYz8max6eY8y4xXrgOMtvqcOaXgyVN9rj24O2l1G//UNKAy83cfi9DFA7QrX1ESIw
 hHXmHNS5/7ePiSnU2aFvKUImBS3tP2Md+MDk17UmqpPUJhIViDwauA8U5ziKQDr5A0
 dbd4YiCcnMrnR5W9g6Ncykc/hCLXmc6j/iu0aFTdZjuMaa2/InPKkR0D3DLdSXyLMu
 LheY9KHtjydDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70FFC39B167D; Sun, 14 Sep 2025 19:10:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175787701925.3530077.1414169170117971537.git-patchwork-notify@kernel.org>
Date: Sun, 14 Sep 2025 19:10:19 +0000
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: richardcochran@gmail.com, andrew@lunn.ch, hawk@kernel.org,
 daniel@iogearbox.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, john.fastabend@gmail.com,
 ast@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, sdf@fomichev.me,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, bpf@vger.kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/11] net: stmmac:
	timestamping/ptp cleanups
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 11 Sep 2025 12:07:03 +0100 you wrote:
> Hi,
> 
> This series cleans up the hardware timestamping / PTP initialisation
> and cleanup code in the stmmac driver. Several key points in no
> particular order:
> 
> 1. Golden rule: unregister first, then release resources.
>    stmmac_release_ptp didn't do this.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/11] net: stmmac: ptp: improve handling of aux_ts_lock lifetime
    https://git.kernel.org/netdev/net-next/c/9a1d6fa0012d
  - [net-next,v2,02/11] net: stmmac: disable PTP clock after unregistering PTP
    https://git.kernel.org/netdev/net-next/c/99a8789afd12
  - [net-next,v2,03/11] net: stmmac: fix PTP error cleanup in __stmmac_open()
    https://git.kernel.org/netdev/net-next/c/454bbe5913b2
  - [net-next,v2,04/11] net: stmmac: fix stmmac_xdp_open() clk_ptp_ref error cleanup
    https://git.kernel.org/netdev/net-next/c/586f1aebc9a1
  - [net-next,v2,05/11] net: stmmac: unexport stmmac_init_tstamp_counter()
    https://git.kernel.org/netdev/net-next/c/ff2e19d5690e
  - [net-next,v2,06/11] net: stmmac: add __stmmac_release() to complement __stmmac_open()
    https://git.kernel.org/netdev/net-next/c/67ec43792b11
  - [net-next,v2,07/11] net: stmmac: move stmmac_init_ptp() messages into function
    https://git.kernel.org/netdev/net-next/c/4fbd180acd57
  - [net-next,v2,08/11] net: stmmac: rename stmmac_init_ptp()
    https://git.kernel.org/netdev/net-next/c/b09f58ddc6ca
  - [net-next,v2,09/11] net: stmmac: add stmmac_setup_ptp()
    https://git.kernel.org/netdev/net-next/c/84b994ac4e4e
  - [net-next,v2,10/11] net: stmmac: move PTP support check into stmmac_init_timestamping()
    https://git.kernel.org/netdev/net-next/c/9d5059228c55
  - [net-next,v2,11/11] net: stmmac: move timestamping/ptp init to stmmac_hw_setup() caller
    https://git.kernel.org/netdev/net-next/c/98d8ea566b85

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
