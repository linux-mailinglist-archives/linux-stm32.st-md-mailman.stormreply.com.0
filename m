Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D32B46838
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Sep 2025 04:00:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2B65C35E3F;
	Sat,  6 Sep 2025 02:00:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FF78C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Sep 2025 02:00:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 10F3444BCD;
 Sat,  6 Sep 2025 02:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9FCC4CEF1;
 Sat,  6 Sep 2025 02:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757124004;
 bh=EXTpDimrD71jZCY57QxP2cDPjeFi4jI26zptPDAqL6E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZQw+RFSjo978Rw1kRGeSIP1gERbi/QgVd3Ke0m/cOa4cmj9XZb1gHB6p8Avbw6riF
 HWpmRWC/gHF/UCpEA4BxLDVQG8xhh6WmHXk7fj3W9ifIco7Yv7xr+slg4OtJCEoEEk
 h/bL3gs+cnVte8GBNLscn3XfShLxxDnvKFNOTVfIr9L/5qfhaE9hafhWi1PrkosRiz
 Im6rrUXkZ9diP1D36rBNANDOxCjAYh3xtQm1IfNtDxMF0niqQ2b5/akxIeCtwDeYnL
 56OovFMCHSo8/WoBDe3HQ1KsiOFXQSDWlZibTocwX6C5I2H0AulAuOYNDm+2s6wCci
 M3Nvm7WPHntag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D97383BF69; Sat,  6 Sep 2025 02:00:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175712400925.2744531.10227247903778981138.git-patchwork-notify@kernel.org>
Date: Sat, 06 Sep 2025 02:00:09 +0000
References: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
In-Reply-To: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: correctly
 populate ptp_clock_ops.getcrosststamp
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

On Wed, 3 Sep 2025 15:00:16 +0100 you wrote:
> Hi,
> 
> While reviewing code in the stmmac PTP driver, I noticed that the
> getcrosststamp() method is always populated, irrespective of whether
> it is implemented or not by the stmmac platform specific glue layer.
> 
> Where a platform specific glue layer does not implement it, the core
> stmmac driver code returns -EOPNOTSUPP. However, the PTP clock core
> code uses the presence of the method in ptp_clock_ops to determine
> whether this facility should be advertised to userspace (see
> ptp_clock_getcaps()).
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: ptp: conditionally populate getcrosststamp() method
    https://git.kernel.org/netdev/net-next/c/bb427fb839de
  - [net-next,2/2] net: stmmac: intel: only populate plat->crosststamp when supported
    https://git.kernel.org/netdev/net-next/c/0c9fbb38e2a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
