Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD68A015D6
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Jan 2025 17:40:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D54F4C78F68;
	Sat,  4 Jan 2025 16:40:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7050FC7803D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Jan 2025 16:40:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A54455C4C2B;
 Sat,  4 Jan 2025 16:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8F1C4CED2;
 Sat,  4 Jan 2025 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736008812;
 bh=tCT+7Os+RfJEqwMhOzVKsW5XxM91BFqHnsUi9tzq2kA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oy5Ey4K/rJxBiok5Y26aq2c/JBdNJxBbpvZS1uXWMh20I9iys5W5hqsFYHW/eUHHd
 v6ZOaZjH0QXOtztLErB4hHvKWZ4EJC0JYqxewwkswSUuw1JL7Y1H/F8EKXFR+Al8fM
 vfJkxYHjMO15shYbx6mNK52yMbekrMDrzerPB389rbERkWaV1Ejvz16UGeEVLhu++s
 nqxfzuwZJCQ5j/PJPRmDGLL8E4FhT0u6U9zFCKvO13Zr88ZXEQSj4WcYgfsg5rH/R1
 Ztmrntfq2NUoD9c6xJ8+q8lbxwVYSxNHQm3cFTxiFSSGUTSN671BANUyeixxGXbY34
 MFTMC3T5e+i4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 716E8380A96F; Sat,  4 Jan 2025 16:40:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173600883331.2467289.14997468976709274364.git-patchwork-notify@kernel.org>
Date: Sat, 04 Jan 2025 16:40:33 +0000
References: <20241220080726.1733837-1-0x1207@gmail.com>
In-Reply-To: <20241220080726.1733837-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: TSO: Simplify
 the code flow of DMA descriptor allocations
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 20 Dec 2024 16:07:26 +0800 you wrote:
> The TCP Segmentation Offload (TSO) engine is an optional function in
> DWMAC cores, it is implemented for dwmac4 and dwxgmac2 only, ancient
> dwmac100 and dwmac1000 are not supported by hardware. Current driver
> code checks priv->dma_cap.tsoen which is read from MAC_HW_Feature1
> register to determine if TSO is enabled in hardware configurations,
> if (!priv->dma_cap.tsoen) driver never sets NETIF_F_TSO for net_device.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: TSO: Simplify the code flow of DMA descriptor allocations
    https://git.kernel.org/netdev/net-next/c/356939999438

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
