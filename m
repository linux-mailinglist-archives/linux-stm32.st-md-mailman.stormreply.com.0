Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6737CFBA4
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Oct 2023 15:50:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94AE9C6C838;
	Thu, 19 Oct 2023 13:50:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9E4CC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 13:50:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2FC061458;
 Thu, 19 Oct 2023 13:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49C7AC433CA;
 Thu, 19 Oct 2023 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697723424;
 bh=KGkjy3SWE/bKA0U7i+Yr3cNTc5UcUvO6Rcal+ZDSr/c=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Fkn9QIdXC75u7o2BeSQnw8oriqaVsbkdmn8v7q3Y4UoyL+L4MJZ6h9ik/lLagxydE
 DiwqkqGxNnBtwxyWLLVyiJQXVHd4QfSCRXI47MpLNXPHoB3UeMqiBqVYOCVgwVxpuz
 WGVUQeHGqcB31bycdXPE+CMA2FBzGfJVQCcYtQy1Mw+XRXhVFzDmvemnA03138jiaX
 QRTCN/gxN/c9idAg16/UIMcJsg98IMHOjg3hZ1pBKVuKkgMb6hcxP+4shcAWE0G4tv
 WHlcF8N2+AfteiNJsG2Qabz7gH0V/Ge5Ytg+YR2AF6mqMRIBmoaNbdKTdVpPzoJveJ
 8FBb2rjRTJuwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2C8F1C595CE; Thu, 19 Oct 2023 13:50:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169772342417.4360.7732259077441281905.git-patchwork-notify@kernel.org>
Date: Thu, 19 Oct 2023 13:50:24 +0000
References: <20231018123550.27110-1-ansuelsmth@gmail.com>
In-Reply-To: <20231018123550.27110-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-wireless@vger.kernel.org, pkshih@realtek.com, jiri@resnulli.us,
 horms@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 kvalo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, liuhangbin@gmail.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, rajur@chelsio.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH v4 0/4] net: stmmac: improve tx
	timer logic
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

On Wed, 18 Oct 2023 14:35:46 +0200 you wrote:
> This series comes with the intention of restoring original performance
> of stmmac on some router/device that used the stmmac driver to handle
> gigabit traffic.
> 
> More info are present in patch 3. This cover letter is to show results
> and improvements of the following change.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] net: introduce napi_is_scheduled helper
    https://git.kernel.org/netdev/net-next/c/7f3eb2174512
  - [net-next,v4,2/4] net: stmmac: improve TX timer arm logic
    https://git.kernel.org/netdev/net-next/c/2d1a42cf7f77
  - [net-next,v4,3/4] net: stmmac: move TX timer arm after DMA enable
    https://git.kernel.org/netdev/net-next/c/a594166387fe
  - [net-next,v4,4/4] net: stmmac: increase TX coalesce timer to 5ms
    https://git.kernel.org/netdev/net-next/c/039550960a22

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
