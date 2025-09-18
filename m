Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 339B5B23DA7
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Aug 2025 03:20:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21771C36B15;
	Wed, 13 Aug 2025 01:20:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEEB7C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Aug 2025 01:20:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7EBD3600B0;
 Wed, 13 Aug 2025 01:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12942C4CEF0;
 Wed, 13 Aug 2025 01:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755048009;
 bh=0OvQcSBq7+nWfUTs0J8PYw0DBRmzFTWE1hI4XBot3Ek=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rckoJnAbdr6SDwFTCpifJP3CXyIKCp2JAyVGAJCMzU2Yb50Z8L2QyT+g+C36PYcIQ
 XbAU7olp91xZdfzeOjZYFmIRQKuN4Mn4RpwaXGLq00JHa98ZITidgRvOudkM9pkArv
 xCkatqb2CpqtPbhIVJNeIwtxDVdctGOgDKWNqRZ4+A7e4aSczfe/3S44AEgbnIDbtH
 FrVu1y0ffWLJ6WZFmy//1Pq4cEoFEAaPEv42JmzTNQuZ4UgxeakTaq6z618Row18qu
 rFte8M4R022SDwy1JvuKYyP2XqQb6Z4cM+JqUGnWDQyRfzMVJ17+lcAKFlHqtS/j9E
 QlYDpSdwp2Jyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34A9C39D0C2E; Wed, 13 Aug 2025 01:20:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175504802100.2913300.7913222842711784004.git-patchwork-notify@kernel.org>
Date: Wed, 13 Aug 2025 01:20:21 +0000
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, kuba@kernel.org,
 hkallweit1@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: stmmac: improbe
 suspend/resume architecture
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

On Mon, 11 Aug 2025 19:50:58 +0100 you wrote:
> Hi,
> 
> This series improves the stmmac suspend/resume architecture by
> providing a couple of method hooks in struct plat_stmmacenet_data which
> are called by core code, and thus are available for any of the
> platform glue drivers, whether using a platform or PCI device.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: stmmac: add suspend()/resume() platform ops
    https://git.kernel.org/netdev/net-next/c/07bbbfe7addf
  - [net-next,2/9] net: stmmac: provide a set of simple PM ops
    https://git.kernel.org/netdev/net-next/c/7e84b3fae58c
  - [net-next,3/9] net: stmmac: platform: legacy hooks for suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/b51f34bc85e3
  - [net-next,4/9] net: stmmac: intel: convert to suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/062b42801733
  - [net-next,5/9] net: stmmac: loongson: convert to suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/38772638d6d1
  - [net-next,6/9] net: stmmac: pci: convert to suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/c91918a1e976
  - [net-next,7/9] net: stmmac: rk: convert to suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/d7a276a5768f
  - [net-next,8/9] net: stmmac: stm32: convert to suspend()/resume() methods
    https://git.kernel.org/netdev/net-next/c/c7308b2f3d0d
  - [net-next,9/9] net: stmmac: mediatek: convert to resume() method
    https://git.kernel.org/netdev/net-next/c/d6e1f2272960

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
