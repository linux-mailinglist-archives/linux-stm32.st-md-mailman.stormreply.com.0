Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 882CC498146
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 14:40:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EC20C5F1D5;
	Mon, 24 Jan 2022 13:40:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95AB4C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 13:40:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DE8761296;
 Mon, 24 Jan 2022 13:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5D84C340E7;
 Mon, 24 Jan 2022 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643031610;
 bh=dee1fRxc4gg7X1d98rKG3dz7x+qLTHmpqKgRlioZx3g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=h2mEx8o+BEPlMCVUTHG+pnmkatkvu5I+4wjyqIwzzLMIdHYasEa4uyufNVWptzNDD
 iBt0VYcXbAPNNBo7s/1Yj1E08FcJGPm5t/yJR7npXIK8wgp0oMhtcuWWGCEMqh379E
 KQj3P6bQSXqWhL1FVX+zfcWt3BRtKD9IndAM3OJpiQHsHjZ0tRmzh+OLbWealk6Un1
 8nrECR1AZz9WmfKUUxneB1SK0L/vkIBO1GKdz2py63QFWZ4pf0qgekhbTwivs00Q5i
 alBKEpWSbraqdtm7TXiP34EwbEFMJLJKFfO+zgFYF8ZsImT+mKlcPX/sla5AvOfkNI
 Cpyhxc724sl3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 ACF72F60790; Mon, 24 Jan 2022 13:40:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164303161069.21877.8559780902897550675.git-patchwork-notify@kernel.org>
Date: Mon, 24 Jan 2022 13:40:10 +0000
References: <20220123122758.2876-1-jszhang@kernel.org>
In-Reply-To: <20220123122758.2876-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: remove unused members in
	struct stmmac_priv
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Sun, 23 Jan 2022 20:27:58 +0800 you wrote:
> The tx_coalesce and mii_irq are not used at all now, so remove them.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h | 2 --
>  1 file changed, 2 deletions(-)

Here is the summary with links:
  - net: stmmac: remove unused members in struct stmmac_priv
    https://git.kernel.org/netdev/net/c/de8a820df2ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
