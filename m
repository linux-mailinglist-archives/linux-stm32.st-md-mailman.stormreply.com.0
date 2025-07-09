Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23643AFDCEE
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 03:29:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7B69C36B3C;
	Wed,  9 Jul 2025 01:29:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15DFBC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 01:29:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5D5A469E1;
 Wed,  9 Jul 2025 01:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E03C4CEED;
 Wed,  9 Jul 2025 01:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752024590;
 bh=7dXDS5QBly9oO2sE1NM/JgPZtBGwsyEdMtJpZ+LZ7Tk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hBxye0uMCrEUrTeWl/Qf/7v1u4kA0MVIgjCW4N8ffwujCLYS1JwAbATanCZtksnVH
 ZW4QoF0m/I0TgKgFAqUz4gPFy2KEg3SwR6G38x/dCDa4qHhO29SB2jZ4Vi3EPdTGR9
 ypdy370jSOrKTuTrHl6CkLehzNHQUqmevR5VgDD/yyaR0EPHamkM4UOAP71RtpijlD
 4xZmxtKHhIR1g/y89Gq61JU4/Rh9qFDQgekmBdkznEVKu7fn6d2p5krt4EaAfUYT99
 PbUfUfcHbdZUdLIC9u7t/+Uvqh9wEzB7wvHnq2LmKeCahh0IW52prFYf42kPnmRCHN
 8GPS8n4NsR49Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 71845380DBEE; Wed,  9 Jul 2025 01:30:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175202461300.186229.18400851039185559146.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 01:30:13 +0000
References: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
In-Reply-To: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
To: EricChan <chenchuangyu@xiaomi.com>
Cc: si.yanteng@linux.dev, xiaojianfeng1@xiaomi.com, netdev@vger.kernel.org,
 guyinggang@loongson.cn, chenhuacai@kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, xiongliang@xiaomi.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Fix interrupt handling
 for level-triggered mode in DWC_XGMAC2
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

On Thu, 3 Jul 2025 10:04:49 +0800 you wrote:
> According to the Synopsys Controller IP XGMAC-10G Ethernet MAC Databook
> v3.30a (section 2.7.2), when the INTM bit in the DMA_Mode register is set
> to 2, the sbd_perch_tx_intr_o[] and sbd_perch_rx_intr_o[] signals operate
> in level-triggered mode. However, in this configuration, the DMA does not
> assert the XGMAC_NIS status bit for Rx or Tx interrupt events.
> 
> This creates a functional regression where the condition
> if (likely(intr_status & XGMAC_NIS)) in dwxgmac2_dma_interrupt() will
> never evaluate to true, preventing proper interrupt handling for
> level-triggered mode. The hardware specification explicitly states that
> "The DMA does not assert the NIS status bit for the Rx or Tx interrupt
> events" (Synopsys DWC_XGMAC2 Databook v3.30a, sec. 2.7.2).
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: Fix interrupt handling for level-triggered mode in DWC_XGMAC2
    https://git.kernel.org/netdev/net/c/78b7920a0335

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
