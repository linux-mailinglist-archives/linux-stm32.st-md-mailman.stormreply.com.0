Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BB577FE3
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Jul 2022 12:40:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE219C0AA15;
	Mon, 18 Jul 2022 10:40:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B762FC03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 10:40:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 903756113B;
 Mon, 18 Jul 2022 10:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9CC1C341CA;
 Mon, 18 Jul 2022 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658140813;
 bh=EeKXZ6CcPVkLtdX1V9Ln6BwMwvbGoPwYHlkZCajCNJ8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TBFQJ44emheuMue5Q3vr5PCUanER4SCc1fAP68JJnCA1IAlGw5iL5TnX+qQuUnjz+
 4EE/e9D9S/7Jc7a4KXo5Bh+OWawYkXMOBTqF9Cx+nqyfpCE2xHHqVy1FUtvzEx2yHh
 Jdq9DehfOsRbnBcmBGPGnvuQciyw6CzcxjaNRQo6WbGYy/3QvdVoaPnWMB76Ze0MDR
 qcB+fuAQQuiXK5I9hI3q4RpQGf3bIoEfpO390bmPtgw/JDqdP5vtjzOg4EG4dDAH1r
 bOqIkitKHRr97plFwdFNb/HtOpSVB6jo+kfDrwiGqH5q5O/MWEAlp45/2LRqsLlO7X
 hmAxD6ZKagvng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CBE25E451B0; Mon, 18 Jul 2022 10:40:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165814081283.19605.8778988230924846190.git-patchwork-notify@kernel.org>
Date: Mon, 18 Jul 2022 10:40:12 +0000
References: <20220715074701.194776-1-junxiao.chang@intel.com>
In-Reply-To: <20220715074701.194776-1-junxiao.chang@intel.com>
To: Junxiao Chang <junxiao.chang@intel.com>
Cc: Joao.Pinto@synopsys.com, netdev@vger.kernel.org, f.fainelli@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 cedric@bytespeed.nl, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix dma queue left shift
	overflow issue
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 15 Jul 2022 15:47:01 +0800 you wrote:
> When queue number is > 4, left shift overflows due to 32 bits
> integer variable. Mask calculation is wrong for MTL_RXQ_DMA_MAP1.
> 
> If CONFIG_UBSAN is enabled, kernel dumps below warning:
> [   10.363842] ==================================================================
> [   10.363882] UBSAN: shift-out-of-bounds in /build/linux-intel-iotg-5.15-8e6Tf4/
> linux-intel-iotg-5.15-5.15.0/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:224:12
> [   10.363929] shift exponent 40 is too large for 32-bit type 'unsigned int'
> [   10.363953] CPU: 1 PID: 599 Comm: NetworkManager Not tainted 5.15.0-1003-intel-iotg
> [   10.363956] Hardware name: ADLINK Technology Inc. LEC-EL/LEC-EL, BIOS 0.15.11 12/22/2021
> [   10.363958] Call Trace:
> [   10.363960]  <TASK>
> [   10.363963]  dump_stack_lvl+0x4a/0x5f
> [   10.363971]  dump_stack+0x10/0x12
> [   10.363974]  ubsan_epilogue+0x9/0x45
> [   10.363976]  __ubsan_handle_shift_out_of_bounds.cold+0x61/0x10e
> [   10.363979]  ? wake_up_klogd+0x4a/0x50
> [   10.363983]  ? vprintk_emit+0x8f/0x240
> [   10.363986]  dwmac4_map_mtl_dma.cold+0x42/0x91 [stmmac]
> [   10.364001]  stmmac_mtl_configuration+0x1ce/0x7a0 [stmmac]
> [   10.364009]  ? dwmac410_dma_init_channel+0x70/0x70 [stmmac]
> [   10.364020]  stmmac_hw_setup.cold+0xf/0xb14 [stmmac]
> [   10.364030]  ? page_pool_alloc_pages+0x4d/0x70
> [   10.364034]  ? stmmac_clear_tx_descriptors+0x6e/0xe0 [stmmac]
> [   10.364042]  stmmac_open+0x39e/0x920 [stmmac]
> [   10.364050]  __dev_open+0xf0/0x1a0
> [   10.364054]  __dev_change_flags+0x188/0x1f0
> [   10.364057]  dev_change_flags+0x26/0x60
> [   10.364059]  do_setlink+0x908/0xc40
> [   10.364062]  ? do_setlink+0xb10/0xc40
> [   10.364064]  ? __nla_validate_parse+0x4c/0x1a0
> [   10.364068]  __rtnl_newlink+0x597/0xa10
> [   10.364072]  ? __nla_reserve+0x41/0x50
> [   10.364074]  ? __kmalloc_node_track_caller+0x1d0/0x4d0
> [   10.364079]  ? pskb_expand_head+0x75/0x310
> [   10.364082]  ? nla_reserve_64bit+0x21/0x40
> [   10.364086]  ? skb_free_head+0x65/0x80
> [   10.364089]  ? security_sock_rcv_skb+0x2c/0x50
> [   10.364094]  ? __cond_resched+0x19/0x30
> [   10.364097]  ? kmem_cache_alloc_trace+0x15a/0x420
> [   10.364100]  rtnl_newlink+0x49/0x70
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix dma queue left shift overflow issue
    https://git.kernel.org/netdev/net/c/613b065ca32e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
