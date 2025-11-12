Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63306C50470
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 03:00:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEE7AC628AA;
	Wed, 12 Nov 2025 02:00:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3600DC60497
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 02:00:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CCBF043C33;
 Wed, 12 Nov 2025 02:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A715EC4CEFB;
 Wed, 12 Nov 2025 02:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762912853;
 bh=Juz6pLF7SAhgmhKL45ZMU0F5tm2E81SzTf1c2RwwZA4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=HokDcZybggXfHF3SNp/0uNcSapDRBFf1O6vQpLIU2pojcO61vWpR9HJibg4Jz1e+0
 e5+Ku76PdB46WqZ3+F5yNqCQM9hzqrgxbhYCYxFD3YKCirmK/4doMpl7B8nxNq0292
 dhM22tKgktPPd0poKBVbgQQqVepMjJlT8dDtrkaPO4vdaiEy24+QpkXoWIhQxsxXJC
 suVvdv+GEjcBErCTq5sgx09mK0LhrHvx5K0xHlai1nc87B7x/S1gHQQ1z3n9FTnuc1
 piFo0/axYSBrVrAdE0ExxJ7FwpaLCiVOYg3SWBd5wdX+fK1iMCqwUC33+xIGFm4dTU
 Reyi7X//KPopw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB14A380DBCD; Wed, 12 Nov 2025 02:00:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176291282374.3632748.15831065649442897979.git-patchwork-notify@kernel.org>
Date: Wed, 12 Nov 2025 02:00:23 +0000
References: <aRH50uVDX4_9O5ZU@shell.armlinux.org.uk>
In-Reply-To: <aRH50uVDX4_9O5ZU@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, pabeni@redhat.com, neil.armstrong@linaro.org,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-amlogic@lists.infradead.org, kuba@kernel.org, jbrunet@baylibre.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: convert
 meson8b to use stmmac_get_phy_intf_sel()
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

On Mon, 10 Nov 2025 14:42:26 +0000 you wrote:
> This series splits out meson8b from the previous 16 patch series
> as that now has r-b tags.
> 
> This series converts meson8b to use stmmac_get_phy_intf_sel(). This
> driver is not converted to the set_phy_intf_sel() method as it is
> unclear whether there are ordering dependencies that would prevent
> it. I would appreciate the driver author looking in to whether this
> conversion is possible.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: stmmac: meson8b: use PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/12f42597ab14
  - [net-next,v2,2/3] net: stmmac: meson8b: use phy_intf_sel directly
    https://git.kernel.org/netdev/net-next/c/52d639da6fee
  - [net-next,v2,3/3] net: stmmac: meson8b: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/da3d1501235d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
