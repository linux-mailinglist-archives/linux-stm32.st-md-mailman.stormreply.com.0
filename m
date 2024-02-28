Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 681B286A71A
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Feb 2024 04:20:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E726C6C855;
	Wed, 28 Feb 2024 03:20:37 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 355D1C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Feb 2024 03:20:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CA6FDCE1FC3;
 Wed, 28 Feb 2024 03:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFF99C433B2;
 Wed, 28 Feb 2024 03:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709090431;
 bh=G/G1oButwF41ut3ZIuOiyg1G4uJOT5AFCqYpQIx/8FI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=sFGXVGR1wYleJqY+qqrIVo71LSeSdwb/1YTAi35lxE8h3whwfFabbdMAIRwjR6CLS
 dvaiYlX7u4HC1EhNssRdjiJTi+PS4Lp1njIUH3H8aYYVXFsncXL5UfSOGZq4NXHcg1
 jVdDUXmwrNbd3rxR64EGsg1vrkUSlf3KR5yOM2+GaLlMmd9NRzsabrhtuHduQ+/aDO
 vfjkMP0aPMyMEB38r4505UCe9p5/oVQOlUQtw/Eg5nNkuBt3JczNJeB8H+AZYiLByi
 TTTS0aep+uT5buqxLHxV67xqJcGc/xM9A8tdijV1vbVfNlgK9s9jm8kLIvH+60jdWw
 n8m0zrqs8av2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A5386D990A8; Wed, 28 Feb 2024 03:20:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170909043166.27277.9836937383707472245.git-patchwork-notify@kernel.org>
Date: Wed, 28 Feb 2024 03:20:31 +0000
References: <20240222-stmmac_xdp-v2-1-4beee3a037e4@linutronix.de>
In-Reply-To: <20240222-stmmac_xdp-v2-1-4beee3a037e4@linutronix.de>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: yoong.siang.song@intel.com, maciej.fijalkowski@intel.com, hawk@kernel.org,
 daniel@iogearbox.net, netdev@vger.kernel.org, bigeasy@linutronix.de,
 john.fastabend@gmail.com, fancer.lancer@gmail.com, ast@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, sdf@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Complete meta data
	only when enabled
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

On Sun, 25 Feb 2024 12:38:37 +0100 you wrote:
> Currently using plain XDP/ZC sockets on stmmac results in a kernel crash:
> 
> |[  255.822584] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> |[...]
> |[  255.822764] Call trace:
> |[  255.822766]  stmmac_tx_clean.constprop.0+0x848/0xc38
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: Complete meta data only when enabled
    https://git.kernel.org/netdev/net/c/f72a1994698e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
