Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BBE6DB87C
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Apr 2023 05:10:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF01DC6B44C;
	Sat,  8 Apr 2023 03:10:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19D19C6B447
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 03:10:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C09A0654EC;
 Sat,  8 Apr 2023 03:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F5B0C433EF;
 Sat,  8 Apr 2023 03:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680923420;
 bh=uiapifrFQLVVBHm/VZbvEsqGYJYzkS2KTtix8p6V9t8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=m/p4elRnELl7fDRcaJH4BEvynBwSdlCS47UPy4A/rkhKGOzlDk5ylpPqt52bxrNLZ
 bb+X8Ix2LegcdHpVurxa301THbMVj770QdHAUMt4HYHi+tK0U8V2gyK6e4Lj9HKrI3
 W6v0819ogewc6JAj4D+atAqlkylRtCBr/6Pp/rjXIbv/zizX+VTlbyXe0ctatYuYjK
 6FyyBkBFfuNMNl+jOLXEaVUXtrTOWS7f4adCZfmbnAhu/W+Eh6hB1YcyJNF2c6+GGK
 YBo9JdZfTp1MC0D2jh4h3hv+NdNMjJ7epDSX265zYbBzQe3yZ9oHRADaNdmYYglyYE
 cJ2YQAEtlT5FA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EE74DC395C5; Sat,  8 Apr 2023 03:10:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168092341997.22423.14580442067480061333.git-patchwork-notify@kernel.org>
Date: Sat, 08 Apr 2023 03:10:19 +0000
References: <20230406-dwmac-anarion-sparse-v1-0-b0c866c8be9d@kernel.org>
In-Reply-To: <20230406-dwmac-anarion-sparse-v1-0-b0c866c8be9d@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: dwmac-anarion:
 address issues flagged by sparse
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

On Thu, 06 Apr 2023 19:30:08 +0200 you wrote:
> Two minor enhancements to dwmac-anarion to address issues flagged by
> sparse.
> 
> 1. Always return struct anarion_gmac * from anarion_config_dt()
> 2. Add __iomem annotation to register base
> 
> No functional change intended.
> Compile tested only.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: dwmac-anarion: Use annotation __iomem for register base
    https://git.kernel.org/netdev/net-next/c/9f12541d684b
  - [net-next,2/2] net: stmmac: dwmac-anarion: Always return struct anarion_gmac * from anarion_config_dt()
    https://git.kernel.org/netdev/net-next/c/51fe084b17e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
