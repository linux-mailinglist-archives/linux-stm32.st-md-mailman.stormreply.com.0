Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B06CA6E2AD
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 19:49:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0F29C7802F;
	Mon, 24 Mar 2025 18:49:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66C11C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 18:49:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A412E4381A;
 Mon, 24 Mar 2025 18:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A05C4CEDD;
 Mon, 24 Mar 2025 18:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742842195;
 bh=5mJQMRQsVibHd/5bNNk88AKE105YGw+TZJNqXyev8w8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tibyIlAmKi10TBcgbcIfgj80LnAb4flQKSfrvR1TlD9mnGZeWL4PZYsgPbx2KnR0O
 6zd8HM5WMjab+2rO9OChcJ9P41fkPpUxwkFRTwHsECxFZGLv22XJdmJThYzAg55vPK
 eM3zjMsh8hJ0L3rdO1jnvr0rUdjBW3w7ECFYPsRHsT4zoVRHXatIMzYGYh95WptVre
 1oy2h/Hz518+fR09MfIC3YiKDY/uWhLnsW02dhOoWL+oY3smD1Dy9MX448t7Z7GEsf
 gY6IzC2OFGUIyJE4ytBCzBax8rybCKIUVaT0O5k/ugiPlaqWMFyibgvrbLEnX1oEAy
 oVeTsCjDPeszw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34660380664D; Mon, 24 Mar 2025 18:50:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174284223202.4131627.8031895461636997073.git-patchwork-notify@kernel.org>
Date: Mon, 24 Mar 2025 18:50:32 +0000
References: <20250318032424.112067-1-dqfext@gmail.com>
In-Reply-To: <20250318032424.112067-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 boon.leong.ong@intel.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Fix accessing freed
	irq affinity_hint
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

On Tue, 18 Mar 2025 11:24:23 +0800 you wrote:
> The cpumask should not be a local variable, since its pointer is saved
> to irq_desc and may be accessed from procfs.
> To fix it, use the persistent mask cpumask_of(cpu#).
> 
> Cc: stable@vger.kernel.org
> Fixes: 8deec94c6040 ("net: stmmac: set IRQ affinity hint for multi MSI vectors")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: Fix accessing freed irq affinity_hint
    https://git.kernel.org/netdev/net/c/c60d101a226f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
