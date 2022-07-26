Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 260785809A1
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jul 2022 04:50:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB326C640EF;
	Tue, 26 Jul 2022 02:50:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE97DC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jul 2022 02:50:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95C74614E6;
 Tue, 26 Jul 2022 02:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03B01C341C8;
 Tue, 26 Jul 2022 02:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658803815;
 bh=Vy54MVlfrb3/EozZgqR+L9CfuXU2/kOebhXV8UQNnlc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=g7skRmagOWuLGAKzonuZNrHXq+El+IMdGkDuekdSva3904YejfZa2Ud+3nZIxHsaU
 NpzpBoYxr3HcnIWLBpYd55WTyWbiesbe/2HSZXG4y2L9FKrf0x2iqVRYwviyIAC57h
 eFdNu5MlvGudRvRh3UuU1pad8/RTdReTdJiHxjGqHHZxFPYdKhh3pgRtODfxpr2/Od
 r1dBXH9Nm23GoXOnB7UP7ncJ2Qcufzq7czg6t683B0lSN1DDUdREjwWqXi+NumMMTB
 8X5RwI4+UhLWw0JwL76dWpjeeuAhXHUG/6ZhoCnYnjrFHV1YHTbolgY34Q/xB+nyP7
 Hq2iS51G4e1tw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E3C6AE450B7; Tue, 26 Jul 2022 02:50:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165880381492.11874.3864813905774312951.git-patchwork-notify@kernel.org>
Date: Tue, 26 Jul 2022 02:50:14 +0000
References: <20220723142933.16030-1-ansuelsmth@gmail.com>
In-Reply-To: <20220723142933.16030-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH v5 0/5] *Add MTU change with
	stmmac interface running
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 23 Jul 2022 16:29:28 +0200 you wrote:
> This series is to permit MTU change while the interface is running.
> Major rework are needed to permit to allocate a new dma conf based on
> the new MTU before applying it. This is to make sure there is enough
> space to allocate all the DMA queue before releasing the stmmac driver.
> 
> This was tested with a simple way to stress the network while the
> interface is running.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/5] net: ethernet: stmicro: stmmac: move queue reset to dedicated functions
    https://git.kernel.org/netdev/net-next/c/f9ec5723c3db
  - [net-next,v5,2/5] net: ethernet: stmicro: stmmac: first disable all queues and disconnect in release
    https://git.kernel.org/netdev/net-next/c/7028471edb64
  - [net-next,v5,3/5] net: ethernet: stmicro: stmmac: move dma conf to dedicated struct
    https://git.kernel.org/netdev/net-next/c/8531c80800c1
  - [net-next,v5,4/5] net: ethernet: stmicro: stmmac: generate stmmac dma conf before open
    https://git.kernel.org/netdev/net-next/c/ba39b344e924
  - [net-next,v5,5/5] net: ethernet: stmicro: stmmac: permit MTU change with interface up
    https://git.kernel.org/netdev/net-next/c/347007968744

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
