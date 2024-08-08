Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B894C166
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Aug 2024 17:31:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDC7AC78018;
	Thu,  8 Aug 2024 15:31:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 690A8C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Aug 2024 15:31:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 35A346185A;
 Thu,  8 Aug 2024 15:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D651CC4AF09;
 Thu,  8 Aug 2024 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723131067;
 bh=b0Ntq0hiv6W5Rugq26Zm2PR/moZySDGj4O+rKgORl8U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Bc9N0dHp0jJTNA2iOOPjgk30YQW1YvwhPsc/Om5L24Vsy3SQzGKPU/YQcpNh3tdH5
 P3BPnKX9H70c/TzkHqN+CBH3OSaMvvo0RbItD/GbvD7arNwnDNj84Q1intGI9MM4fX
 ubK3V1GCf+b1ESczHosyptH0pgmuKS2x2qn7xlIbkRnOKWkm3QWPy5ptL00Q9DTWzX
 PnZEvR24kYYSd1MgCXqkGNizzxEOS7GKhusTwFYxbUY4RxXxWcuPSCmoribtJUQY+L
 KvOO/FeCvT1kki5u6so9b3o6T0GJV5p2dYq7lSfJU78ltMuf2hg2G3atPs5EiiwsrN
 yjJJ23NdfKOIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB0B9382336A; Thu,  8 Aug 2024 15:31:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172313106649.3210703.16681223591090496086.git-patchwork-notify@kernel.org>
Date: Thu, 08 Aug 2024 15:31:06 +0000
References: <E1sbJvd-001rGD-E3@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1sbJvd-001rGD-E3@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: dwmac4: fix PCS
	duplex mode decode
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

On Tue, 06 Aug 2024 14:08:41 +0100 you wrote:
> dwmac4 was decoding the duplex mode from the GMAC_PHYIF_CONTROL_STATUS
> register incorrectly, using GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK (value 1)
> rather than GMAC_PHYIF_CTRLSTATUS_LNKMOD (bit 16). Fix this.
> 
> Fixes: 70523e639bf8c ("drivers: net: stmmac: reworking the PCS code.")
> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: dwmac4: fix PCS duplex mode decode
    https://git.kernel.org/netdev/net/c/85ba108a529d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
