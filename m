Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 641FE7D1CA2
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Oct 2023 13:00:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06B0CC6A5EA;
	Sat, 21 Oct 2023 11:00:27 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6CF9C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Oct 2023 11:00:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DBE1FCE17D7;
 Sat, 21 Oct 2023 11:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19345C433C9;
 Sat, 21 Oct 2023 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697886023;
 bh=EGGs2rA0P7U9N9aLbE/lY/EjgINVOXULfVH0cySWkuE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ap3CeC5+7iOeBoD0fcxnyUMsmfCWcXOinV7vMR404J+5p/GAfN0tt/iRahwah0Brj
 2sCYOn5zbG04/p/0yzGO0Wd61BBNKvNsKu2a/SE3UBHfDe1chjBkOe3H3RPlfC7jFp
 ugIZ3S8E0+oOkzx3d8rGctM1hsaBMnXUSpDXfk4gq2pJlzQba2JP/WI+C5l8HO7jJK
 SLQOxfYZe0UVWi6bGfUSiWH9jHqS08VdiPmg0iaBCu6SnMLbDtGUMSFHm+e86Zh0WG
 /PoaJG0MYH9c8Pt2CH+QOM+RG9shzIufHGLGkrESvrT//s5CDtn1lhkzoppt2rJHtW
 dxpGPLfLG4+1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F21FBC04DD9; Sat, 21 Oct 2023 11:00:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169788602298.24143.12150015949890853801.git-patchwork-notify@kernel.org>
Date: Sat, 21 Oct 2023 11:00:22 +0000
References: <20231020032535.1777746-1-yi.fang.gan@intel.com>
In-Reply-To: <20231020032535.1777746-1-yi.fang.gan@intel.com>
To: Gan@ci.codeaurora.org, Yi Fang <yi.fang.gan@intel.com>
Cc: linux-kernel@vger.kernel.org, yoong.siang.song@intel.com,
 weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 boon.leong.ong@intel.com, kuba@kernel.org, hong.aun.looi@intel.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: update MAC
 capabilities when tx queues are updated
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
by David S. Miller <davem@davemloft.net>:

On Fri, 20 Oct 2023 11:25:35 +0800 you wrote:
> From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> 
> Upon boot up, the driver will configure the MAC capabilities based on
> the maximum number of tx and rx queues. When the user changes the
> tx queues to single queue, the MAC should be capable of supporting Half
> Duplex, but the driver does not update the MAC capabilities when it is
> configured so.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/1] net: stmmac: update MAC capabilities when tx queues are updated
    https://git.kernel.org/netdev/net/c/95201f36f395

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
