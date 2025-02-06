Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCB0A2A691
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 12:00:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38EE2C78F88;
	Thu,  6 Feb 2025 11:00:22 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D193C78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 11:00:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B039EA4410A;
 Thu,  6 Feb 2025 10:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577F2C4CEDD;
 Thu,  6 Feb 2025 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738839613;
 bh=lpTq10HbuJat5mBzaHY7lLZhSBugc0nzpDwYi/R8+iQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ax4G5C+hTI0afgJ6/cr2y/a4AUwUJ4g+kNwm8Dsa3XpeD9nt/pgkpsTVS3tRZlbwf
 8VLnoip3vbmsLgZWgteQ5HZtN4FHNanLP0WNF1N/bomBqY+NrqtQalLYRQdypUUWuG
 gpV3om44hnB8MaDMGeM+NvKoJovBoZQ2Av9qZiNPWNvAcnJI3ujRjAJL2C/bnmithC
 d966pUTv+lvT/VRHvDDvPjMp6qLkyW36A5lHWrbWiFuU4pCI3LvHUSbx7lyC11DyZm
 eIHgm7+RchhLBXeviGRS4c0riVHwtI9xwQuIxHnt5ImsKKPCzAH6y0yy9U/vbHSqdp
 cyOLrWyAJTT2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33F0F380AAD9; Thu,  6 Feb 2025 11:00:42 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173883964070.1434316.3945736866379293001.git-patchwork-notify@kernel.org>
Date: Thu, 06 Feb 2025 11:00:40 +0000
References: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net] Revert "net: stmmac: Specify hardware
 capability value when FIFO size isn't specified"
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 05 Feb 2025 12:57:47 +0000 you wrote:
> This reverts commit 8865d22656b4, which caused breakage for platforms
> which are not using xgmac2 or gmac4. Only these two cores have the
> capability of providing the FIFO sizes from hardware capability fields
> (which are provided in priv->dma_cap.[tr]x_fifo_size.)
> 
> All other cores can not, which results in these two fields containing
> zero. We also have platforms that do not provide a value in
> priv->plat->[tr]x_fifo_size, resulting in these also being zero.
> 
> [...]

Here is the summary with links:
  - [net] Revert "net: stmmac: Specify hardware capability value when FIFO size isn't specified"
    https://git.kernel.org/netdev/net/c/2a64c96356c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
