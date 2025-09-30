Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ECEBAAF0C
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 04:00:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D90EAC3F93C;
	Tue, 30 Sep 2025 02:00:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1591FC36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 02:00:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BF11248880;
 Tue, 30 Sep 2025 02:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A363C4CEF4;
 Tue, 30 Sep 2025 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759197627;
 bh=r2SHYFrcUFIZfSRfIG042SXPAw55FPb1NYT4hakUlZU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OCNRapFBl9LNEBFYco2lY/ZCai5OeRtqIU+CdV9q7+q/U57RrnWtTQzZe0k5/iLvK
 JthHBiZkjxrvpTGoiM9UelfcowEW9vI6xVApYbPVm1fHmWYaSwfIQK5nXP7to+0rIB
 CcQA3LmSMKer+ySmMgfeU/TCgbFLMDuGPOKYO+nv9APIoN2yCzGLgkhdFYMxdTp6ux
 4RbBBEwNL9FS9Noc3xOFfmlVENgsvDCr1P0lmgI0fH8rUHVAJz6WnRKL+9BGslJizS
 8hv8vSmvBN66jGIrrcclYa1aXIbYGeQue/bEWFwuejdp62V6VU3caXCCPeo5hU7PA4
 yjz2fLN2wpBlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3412239D0C1A; Tue, 30 Sep 2025 02:00:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175919762074.1786573.3483201535680526845.git-patchwork-notify@kernel.org>
Date: Tue, 30 Sep 2025 02:00:20 +0000
References: <E1v38Y7-00000008UCQ-3w27@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1v38Y7-00000008UCQ-3w27@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hayashi.kunihiko@socionext.com, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 0x1207@gmail.com, andrew+netdev@lunn.ch, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: remove
 stmmac_hw_setup() excess documentation parameter
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

On Mon, 29 Sep 2025 08:43:55 +0100 you wrote:
> The kernel build bot reports:
> 
> Warning: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3438 Excess function parameter 'ptp_register' description in 'stmmac_hw_setup'
> 
> Fix it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 98d8ea566b85 ("net: stmmac: move timestamping/ptp init to stmmac_hw_setup() caller")
> Closes: https://lore.kernel.org/oe-kbuild-all/202509290927.svDd6xuw-lkp@intel.com/
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: remove stmmac_hw_setup() excess documentation parameter
    https://git.kernel.org/netdev/net-next/c/6d3728d424a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
