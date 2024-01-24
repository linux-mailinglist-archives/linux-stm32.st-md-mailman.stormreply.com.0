Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE5783B306
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 21:30:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8665C6B444;
	Wed, 24 Jan 2024 20:30:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E578C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 20:30:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E577E6200D;
 Wed, 24 Jan 2024 20:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C83BC43394;
 Wed, 24 Jan 2024 20:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706128226;
 bh=7E96YLzl01LGs3tIQR8nbla5IaWuZRVsGIuS0bJ9CzU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KduiNtAwZIx/I/f6Cbt9YS2wXTbz1SEXUy9R2myM36I5ojYB01E84P16k9FpzjNyn
 s9oLIXWqYk0T+q5fFbiPP2vtmLn4AcULVQ9jTq6U0Fsi8ysZq5s6xaV9/geGfP25xG
 fUtvpsyO2d/nHVv75dl4z0HzirRcLac6hwJjhyvh4AhuwhzLXWubKeTK3+U0vA/+UV
 PksdEG9qJGJFl6YoiFDd8jaL/hpTZajzbixCoNik1O1KNYX3xXu9VPISrvG8z6gid6
 rM7n5i6YoMoertn1+Rihg6O+QQLB0WIDmZ1bN3n6PD20Q1TVUmq5MMIb13WK2+z852
 vPEjBwN48ToGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 72213D8C962; Wed, 24 Jan 2024 20:30:26 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170612822646.416.13224306306608084186.git-patchwork-notify@kernel.org>
Date: Wed, 24 Jan 2024 20:30:26 +0000
References: <AS8P193MB1285A810BD78C111E7F6AA34E4752@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <AS8P193MB1285A810BD78C111E7F6AA34E4752@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 fancer.lancer@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 jiri@nvidia.com, kuba@kernel.org, akpm@linux-foundation.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: Wait a bit for the
	reset to take effect
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

On Mon, 22 Jan 2024 19:19:09 +0100 you wrote:
> otherwise the synopsys_id value may be read out wrong,
> because the GMAC_VERSION register might still be in reset
> state, for at least 1 us after the reset is de-asserted.
> 
> Add a wait for 10 us before continuing to be on the safe side.
> 
> > From what have you got that delay value?
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: Wait a bit for the reset to take effect
    https://git.kernel.org/netdev/net/c/a5f5eee282a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
