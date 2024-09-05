Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D7B96D33B
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 11:30:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EABCC78013;
	Thu,  5 Sep 2024 09:30:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20057C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 09:30:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8DFBC5C55BC;
 Thu,  5 Sep 2024 09:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF452C4CEC3;
 Thu,  5 Sep 2024 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725528627;
 bh=QNKlD7fPFoj/uyo9ThXb2ei2wcNIAH6fD2Z4QRFzEew=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=HtROgWNIG9oUOfBtE/NqJdB8SlN/K4R2xr1M89aig+9OKCIHyPCdZ4QlxIwUtKVxt
 fioE/d7w0Fw/JOxxK1b2Drw4EC2V+smESGHgxm3Fg1lAYaWG2JDesGWirPn836SCa+
 eFuwvIz98Lx0oZ8vta95kSo1LyWTUvS6vwzhXvgr7dbNifWImvx2RwIUgi1h/mkdJ2
 hbBVpY5Rg63H5Xctm/dc5L4suUcOwzCg6lITzKaiYp7FMZK1J+7sXYpCY5f/XT7pfv
 S+toBV4gRLqqcFqmrA+rysshWV6XDrn51ZKs2D74r7A1oQp4OENr/3DbkdM4aLKdLN
 +HmAHQa5bnJUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADF2D3822D30; Thu,  5 Sep 2024 09:30:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172552862851.1327461.7737934782782986812.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 09:30:28 +0000
References: <20240831011114.2065912-1-ende.tan@starfivetech.com>
In-Reply-To: <20240831011114.2065912-1-ende.tan@starfivetech.com>
To: EnDe Tan <ende.tan@starfivetech.com>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, leyfoon.tan@starfivetech.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 minda.chen@starfivetech.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, endeneer@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next, v4,
	1/1] net: stmmac: Batch set RX OWN flag and other flags
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

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 31 Aug 2024 09:11:14 +0800 you wrote:
> From: Tan En De <ende.tan@starfivetech.com>
> 
> Minimize access to the RX descriptor by collecting all the flags in a
> local variable and then updating the descriptor at once.
> 
> Signed-off-by: Tan En De <ende.tan@starfivetech.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/1] net: stmmac: Batch set RX OWN flag and other flags
    https://git.kernel.org/netdev/net-next/c/d2095989943b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
