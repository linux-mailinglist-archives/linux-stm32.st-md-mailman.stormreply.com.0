Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F6C153E7
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 15:50:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E61DC628D4;
	Tue, 28 Oct 2025 14:50:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76E11C628D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 14:50:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5997B61412;
 Tue, 28 Oct 2025 14:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2944C4CEE7;
 Tue, 28 Oct 2025 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761663033;
 bh=6K/S8d0IVvVTkkQFbLMvHUlIli4SloaGEMV2HIrhuwM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=eM3+yCt18RfkfiycnlMD+IvDLDucmNxUByaJkwdlM7uZYjsJ8fBZwFjTAzV0RB5lL
 sFPDBmjn86sWiCRf+aR1aShxtEs70ohGhHYM0uMFfNlX2oR8FE/OwHVPS3YBnJiuUa
 UJuD2VaKLrJjcttYbLX9gAqgYAx9KvOAsHAeZmxGY9PXzYGrrFQJf6kZMLF03R764c
 xPthxPygltd4liezV6i2XVnOkOwImZNv7ws4EOyWJnJbOpUFe7/RmHElLefFyY4a5e
 evRh8bFWhCOLbQFsclRhijStG53G74u9aTqhOgA4dpVlbd4a3ehw7FztfGk/TrwtAW
 YnZmkl9H7GdRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB21C39EFA55; Tue, 28 Oct 2025 14:50:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176166301074.2258992.15898542633680780702.git-patchwork-notify@kernel.org>
Date: Tue, 28 Oct 2025 14:50:10 +0000
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: kory.maincent@bootlin.com, vadim.fedorenko@linux.dev,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 alexis.lothore@bootlin.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac: Add support
 for coarse timestamping
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 24 Oct 2025 09:07:16 +0200 you wrote:
> Hello everyone,
> 
> This is V2 for coarse timetamping support in stmmac. This version uses a
> dedicated devlink param "ts_coarse" to control this mode.
> 
> This doesn't conflict with Russell's cleanup of hwif.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: Move subsecond increment configuration in dedicated helper
    https://git.kernel.org/netdev/net-next/c/792000fbcd0c
  - [net-next,v2,2/2] net: stmmac: Add a devlink attribute to control timestamping mode
    https://git.kernel.org/netdev/net-next/c/6920fa0c764d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
