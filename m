Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9963489C713
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Apr 2024 16:30:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5776C71288;
	Mon,  8 Apr 2024 14:30:31 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7CBDC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 14:30:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B5964CE13B1;
 Mon,  8 Apr 2024 14:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 146D7C43390;
 Mon,  8 Apr 2024 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712586627;
 bh=Alfp2ELwhITazKMEegUqvVbJyfZKJCbUEoIYjFPYgmc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Y8LB4WOq8S/HKOQhBSfEl++bTKhnOqa+MVCjoT3nZKwZIP+iCIyBu+ibN53oksdkz
 y4amJknhZgJvaj7/9fNShGylwWb8GQZfjxbYK3Q27HvzCazJwQHtAxCTfShZpRXjCk
 0/3KJBS+Vg5YHmXGd7GVY6cLO7hvDPszraeG+YM5ZI6rR18LIrImi0/uwIHF6p4vaU
 b+NRCtF1c0s1fzeF5/9Pv6jWhwXTGVli4suxGVtF5OUOIGYR4dnwaABLIlqwGwWQDl
 CSme3uKEL0Q5bp+XGwwes4hqqZCDS7OKcaTD1FGqP9IahaOUZEke8KSAijKc1Ivpiy
 Q6rEm2aozqkRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 067A5D72A03; Mon,  8 Apr 2024 14:30:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171258662702.25921.3073865414312265648.git-patchwork-notify@kernel.org>
Date: Mon, 08 Apr 2024 14:30:27 +0000
References: <20240408012943.66508-1-minda.chen@starfivetech.com>
In-Reply-To: <20240408012943.66508-1-minda.chen@starfivetech.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] Add missing mmc statistics in DW
	GMAC
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

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon,  8 Apr 2024 09:29:41 +0800 you wrote:
> Add miss MMC statistic in DW GMAC
> 
> base on 6.9-rc1
> 
> changed
> v2:
>    patch2 : remove mmc_rx_control_g due to it is gotten in
> ethtool_ops::get_eth_ctrl_stats.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] net: stmmac: mmc_core: Add GMAC LPI statistics
    https://git.kernel.org/netdev/net/c/dfe073f8714d
  - [v2,2/2] net: stmmac: mmc_core: Add GMAC mmc tx/rx missing statistics
    https://git.kernel.org/netdev/net/c/ff20393bdc45

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
