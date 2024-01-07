Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B399F826522
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Jan 2024 17:40:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62647C6B476;
	Sun,  7 Jan 2024 16:40:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51D89C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jan 2024 16:40:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BA20EB80ACF;
 Sun,  7 Jan 2024 16:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B727BC433C9;
 Sun,  7 Jan 2024 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704645623;
 bh=xJqTpdHlsLkBAuHocAoxuNoxLY3qzEXuQy/c9JHk+s0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IHbt0KpCwhjDyH/rAE8sir2BMYQ33KvASkvfBX40YxDm4klh+qK8Dhv2ovn9SbnPk
 /Vgj1bKs4H42Uav6qUXPT7Kit1VolhcH4kKGgz23+AoGf/NrE/BNG84NYdWZ7af9GQ
 jU69Ka6YW/psTlafj5ivo2+IWXITiIGh/RKtKi+WfcyYG2wq+pw1fjW1YI/4sh/n8r
 iaN2XwNKmCVLuPprWw8jcQoJlF7PHsjY8M5/KY+MLcejZzDOUk3x3nCxZNJ7K7gQna
 gQhS4IzyWYSPdhK5jNtIC5uVrYtsMrle5dQmYQld45tWuCY0WXYj32S3U36ZHsDkqC
 lEwU9n9CSk52Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9C3ADC4167E; Sun,  7 Jan 2024 16:40:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170464562363.18664.8264531122295136817.git-patchwork-notify@kernel.org>
Date: Sun, 07 Jan 2024 16:40:23 +0000
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
In-Reply-To: <20240105070925.2948871-1-leong.ching.swee@intel.com>
To: Leong Ching Swee <leong.ching.swee@intel.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, netdev@vger.kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/4] net: stmmac: Enable Per
	DMA Channel interrupt
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
by David S. Miller <davem@davemloft.net>:

On Fri,  5 Jan 2024 15:09:21 +0800 you wrote:
> From: Swee Leong Ching <leong.ching.swee@intel.com>
> 
> Hi,
> Add Per DMA Channel interrupt feature for DWXGMAC IP.
> 
> Patchset (link below) contains per DMA channel interrupt, But it was
> achieved.
> https://lore.kernel.org/lkml/20230821203328.GA2197059-
> robh@kernel.org/t/#m849b529a642e1bff89c05a07efc25d6a94c8bfb4
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] dt-bindings: net: snps,dwmac: per channel irq
    https://git.kernel.org/netdev/net-next/c/67d47c8ada0f
  - [net-next,v2,2/4] net: stmmac: Make MSI interrupt routine generic
    https://git.kernel.org/netdev/net-next/c/477bd4beb93b
  - [net-next,v2,3/4] net: stmmac: Add support for TX/RX channel interrupt
    https://git.kernel.org/netdev/net-next/c/9072e03d3208
  - [net-next,v2,4/4] net: stmmac: Use interrupt mode INTM=1 for per channel irq
    https://git.kernel.org/netdev/net-next/c/36af9f25ddfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
