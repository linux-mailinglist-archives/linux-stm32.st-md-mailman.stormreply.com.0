Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B01035E8C9
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Apr 2021 00:10:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1087AC57B78;
	Tue, 13 Apr 2021 22:10:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94C2CC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 22:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D606861249;
 Tue, 13 Apr 2021 22:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618351810;
 bh=FSLHKB18JSSgjogb29XxS0VuBaUCWkBk7hZ8VUgrRkg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BPw910v5yOEtt9nWt01ryGQB7wRe8IBSuf6TxfvpyriWcV6iWe43QvbtkOoniZ4Wl
 9JLgpGfmt+j1IVjXxN6txmlpUXOEQ3anpj5Qkc2Px1QZuLx8FeOgGpZvqzkLjGyvFa
 Oh7Zd2pzDvadK0Kx4TB4VpR6dVYKvAazmetMp4iYeQTNmIhEUcPAfrEE+ZCjR/vrcs
 uqwAVAEwYxG2zJa3o90eFRnKgwXJqb3NdpWcAyCZ/Y+675nUWoAPbQqlz0awTGB2tT
 vuSLVU77+Z+VZvrGI1Z4IkxDC+75PzqfrOf7SKnyIgGEHeAFTMzeZ+8rkhffc8sAQ3
 aYQa94FH4k2DA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CE1BC60CCF;
 Tue, 13 Apr 2021 22:10:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161835181083.31494.7438008757120147305.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 22:10:10 +0000
References: <20210413093626.3447-1-boon.leong.ong@intel.com>
In-Reply-To: <20210413093626.3447-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: songliubraving@fb.com, kafai@fb.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@st.com, daniel@iogearbox.net, yhs@fb.com,
 linux-stm32@st-md-mailman.stormreply.com, bpf@vger.kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, alexandre.torgue@foss.st.com,
 andrii@kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, kpsingh@kernel.org, peppe.cavallaro@st.com,
 netdev@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hawk@kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/7] stmmac: add XDP ZC support
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

This series was applied to netdev/net-next.git (refs/heads/master):

On Tue, 13 Apr 2021 17:36:19 +0800 you wrote:
> Hi,
> 
> This is the v2 patch series to add XDP ZC support to stmmac driver.
> 
> Summary of v2 patch change:-
> 
> 6/7: fix synchronize_rcu() is called stmmac_disable_all_queues() that is
>      used by ndo_setup_tc().
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] net: stmmac: rearrange RX buffer allocation and free functions
    https://git.kernel.org/netdev/net-next/c/4298255f26fa
  - [net-next,v2,2/7] net: stmmac: introduce dma_recycle_rx_skbufs for stmmac_reinit_rx_buffers
    https://git.kernel.org/netdev/net-next/c/80f573c995fc
  - [net-next,v2,3/7] net: stmmac: refactor stmmac_init_rx_buffers for stmmac_reinit_rx_buffers
    https://git.kernel.org/netdev/net-next/c/da5ec7f22a0f
  - [net-next,v2,4/7] net: stmmac: rearrange RX and TX desc init into per-queue basis
    https://git.kernel.org/netdev/net-next/c/de0b90e52a11
  - [net-next,v2,5/7] net: stmmac: Refactor __stmmac_xdp_run_prog for XDP ZC
    https://git.kernel.org/netdev/net-next/c/bba71cac680f
  - [net-next,v2,6/7] net: stmmac: Enable RX via AF_XDP zero-copy
    https://git.kernel.org/netdev/net-next/c/bba2556efad6
  - [net-next,v2,7/7] net: stmmac: Add TX via XDP zero-copy socket
    https://git.kernel.org/netdev/net-next/c/132c32ee5bc0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
