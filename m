Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B397CCE7A8C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Dec 2025 17:43:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 692FFC57B78;
	Mon, 29 Dec 2025 16:43:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0810C01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Dec 2025 16:43:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8DD6D4411A;
 Mon, 29 Dec 2025 16:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6683DC4CEF7;
 Mon, 29 Dec 2025 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767026603;
 bh=lnxWlId6PQ4och+lJMqlnXFu7vv7RTBCRW9v7SAjrAw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ESIE5I3D4iCVueW0ZOTmyF5JoDd4C/Y64q8wc4ZoqPn8wHI3MKG9a8LsB5mQ6wylG
 0NGjl4SvV/TuAJ0/O6e2IZOWObzK4fNNbsUxr2G0zQNcLiZ1fNt9im0+ViUGN3zdBY
 OPLN9LRIFOozLmpN0Inwdn86KpgAa0mkjuHMME0FGyydwH3jFegS7GeVlpfCba8WDe
 C/G27X7lfv5+nw+klTFAgAS/LNwrCVLMMu2NilvlHEXBDdyltmHTZx0IhsmMH4fsGW
 8ltZKP7o6oqMhyzV2yoEDYQGqlNeQsBpvfm82YMlWwfGuMzCJy2zXul57aIniQdt2S
 0rh58ElxoMBZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3B7C63808200; Mon, 29 Dec 2025 16:40:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176702640604.3003866.8845654519033252561.git-patchwork-notify@kernel.org>
Date: Mon, 29 Dec 2025 16:40:06 +0000
References: <20251204071332.1907111-1-wei.fang@nxp.com>
In-Reply-To: <20251204071332.1907111-1-wei.fang@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, hayashi.kunihiko@socionext.com,
 vladimir.oltean@nxp.com, edumazet@google.com, boon.leong.ong@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, 0x1207@gmail.com, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, hawk@kernel.org, ast@kernel.org, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix the crash issue for
 zero copy XDP_TX action
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
by Paolo Abeni <pabeni@redhat.com>:

On Thu,  4 Dec 2025 15:13:32 +0800 you wrote:
> There is a crash issue when running zero copy XDP_TX action, the crash
> log is shown below.
> 
> [  216.122464] Unable to handle kernel paging request at virtual address fffeffff80000000
> [  216.187524] Internal error: Oops: 0000000096000144 [#1]  SMP
> [  216.301694] Call trace:
> [  216.304130]  dcache_clean_poc+0x20/0x38 (P)
> [  216.308308]  __dma_sync_single_for_device+0x1bc/0x1e0
> [  216.313351]  stmmac_xdp_xmit_xdpf+0x354/0x400
> [  216.317701]  __stmmac_xdp_run_prog+0x164/0x368
> [  216.322139]  stmmac_napi_poll_rxtx+0xba8/0xf00
> [  216.326576]  __napi_poll+0x40/0x218
> [  216.408054] Kernel panic - not syncing: Oops: Fatal exception in interrupt
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix the crash issue for zero copy XDP_TX action
    https://git.kernel.org/netdev/net/c/a48e23221000

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
