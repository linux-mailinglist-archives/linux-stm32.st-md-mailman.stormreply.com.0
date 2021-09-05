Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2368F400F81
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Sep 2021 14:10:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8491AC59781;
	Sun,  5 Sep 2021 12:10:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDD41C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Sep 2021 12:10:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 12B1E61027;
 Sun,  5 Sep 2021 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630843805;
 bh=eCRJ5yerTqnwpninFmP8ox7avYfWeyLMV+GF7C/+Qeo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=r/2NdhEgwfZyWmgwck6pDPlE3YfRHGouCoinG/kXJiNkVA2/8QsW4TOtWUgmb0W0P
 2NHojWpuV9UmIm7b3fiVhGqhLgnAekojXaXjqNDEhzIH6/62qx2/37ymITpc4VMXQ8
 pTXCtdbQ4DTkv9bg/rOkyh193O4/puCb7XtresP6VVfsTLeh9hnRQFHKXyMvddbObW
 sxztyekScWwws0qwYD0zuhhoEzn6oG0MujXw+f3XpIMNeeLPgVMGLexr5D52cwNRwr
 IFJhsfahVCBrYC2G3yl8bVZkdJydM5f6o8du6ul2o979SYvCtCEYD2K+ShVa59wVip
 3zrm4p2WDmB6Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 02CF660986;
 Sun,  5 Sep 2021 12:10:05 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163084380500.2594.10060610886272582296.git-patchwork-notify@kernel.org>
Date: Sun, 05 Sep 2021 12:10:05 +0000
References: <20210903020026.1381962-1-yoong.siang.song@intel.com>
In-Reply-To: <20210903020026.1381962-1-yoong.siang.song@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@st.com, daniel@iogearbox.net,
 netdev@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, bpf@vger.kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, hawk@kernel.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Fix overall budget
 calculation for rxtx_napi
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

On Fri,  3 Sep 2021 10:00:26 +0800 you wrote:
> tx_done is not used for napi_complete_done(). Thus, NAPI busy polling
> mechanism by gro_flush_timeout and napi_defer_hard_irqs will not able
> be triggered after a packet is transmitted when there is no receive
> packet.
> 
> Fix this by taking the maximum value between tx_done and rx_done as
> overall budget completed by the rxtx NAPI poll to ensure XDP Tx ZC
> operation is continuously polling for next Tx frame. This gives
> benefit of lower packet submission processing latency and jitter
> under XDP Tx ZC mode.
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: Fix overall budget calculation for rxtx_napi
    https://git.kernel.org/netdev/net/c/81d0885d68ec

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
