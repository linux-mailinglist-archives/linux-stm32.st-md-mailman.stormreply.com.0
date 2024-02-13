Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 557A7852C3B
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 10:30:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0041C6C83D;
	Tue, 13 Feb 2024 09:30:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9F95C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 09:30:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BCA48CE1A2D;
 Tue, 13 Feb 2024 09:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F121DC433F1;
 Tue, 13 Feb 2024 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707816627;
 bh=6R1CJ0dGx75FGRWFH3QoOEfdCto9Yy4a+qw6NC+I+1s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=D/GVy0dQLe8DdnFbnjmOsXsBs7rnBLZeSRc15GthUhA91B1+0axJuyzr8hqT2zYML
 6yNYRVfYvZfDVOKvZohl/SomS4cGE22kZNoRu7suPVNi3jw+dO3P4tl+Px3YubeJKf
 vuA2/EmZ9Tr3GqQ+RSnZ57Z1xWeinEixLPLuNHjjmyDKUy/urLnYBWhEJtzJU2JbAg
 zDS+OU4ltQJh5jOjjHJ983h8JiX/5XpKOQKrY43RXrpyAg8cwcrBmaYIhuNYoY2AjP
 Ie0XvfVus6AcLHxRaHXR+QseMJKk6vq3xPHOcmq62R27o/64JH/RrVlcLE8CwFvCAE
 Zf3QPI63Tk0eQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C32B4C1614E; Tue, 13 Feb 2024 09:30:26 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170781662679.26596.16174122173623372072.git-patchwork-notify@kernel.org>
Date: Tue, 13 Feb 2024 09:30:26 +0000
References: <20240208-stmmac_irq-v1-1-8bab236026d4@linutronix.de>
In-Reply-To: <20240208-stmmac_irq-v1-1-8bab236026d4@linutronix.de>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: yannick.vignon@nxp.com, netdev@vger.kernel.org, bigeasy@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Simplify mtl IRQ
	status checking
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

On Thu, 08 Feb 2024 11:35:25 +0100 you wrote:
> Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO overflow
> interrupts") disabled the RX FIFO overflow interrupts. However, it left the
> status variable around, but never checks it.
> 
> As stmmac_host_mtl_irq_status() returns only 0 now, the code can be
> simplified.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: Simplify mtl IRQ status checking
    https://git.kernel.org/netdev/net-next/c/6256fbfd651c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
