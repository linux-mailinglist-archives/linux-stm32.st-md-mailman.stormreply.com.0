Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 280F75760A9
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 13:40:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A602CC0D2BF;
	Fri, 15 Jul 2022 11:40:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93D99C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 11:40:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F951B82BAB;
 Fri, 15 Jul 2022 11:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 954B3C3411E;
 Fri, 15 Jul 2022 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657885214;
 bh=gPzsRiE5QwZ1jIMh1d6tdWaf8Lar3t+oij2C1a3b6XU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nbVOdS9a2sYOEsZ7Qc1vRcC5hfckjv6exNyLtnyb2yGN1JFGmtIwh7TDf//bvoWGY
 jRqNA0ApxsCiPB1pBU0C8ZGj5aHcHXc97IG5twUrQlQEFFHFUikEhyGf6fiD6Bjgds
 SQnxRlKQRa7J8LpilOcPnVWsvnbfmzzhO30+wOtXnsK64Uqy/6DIxr2Yb4zK/4bnfe
 oHwzLkYsd5zad13UN4iPvAkMXPSG4kQ6S8KuhQZAFNKANhkqRM1zku/8HAQ/4KcdZU
 yHSKrdeeYENNLl53r3zUHiM1Gm5bzOq2wI+Ex8hjOLgXP1OgyDSXQkDwGyIN+wbOEU
 G/U+M9hEVn9Yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 721ECE45227; Fri, 15 Jul 2022 11:40:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165788521446.32301.11367784374221397861.git-patchwork-notify@kernel.org>
Date: Fri, 15 Jul 2022 11:40:14 +0000
References: <20220714060014.18958-1-biao.huang@mediatek.com>
In-Reply-To: <20220714060014.18958-1-biao.huang@mediatek.com>
To: Biao Huang <biao.huang@mediatek.com>
Cc: mohammad.athari.ismail@intel.com, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 matthias.bgg@gmail.com, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net v5 0/3] stmmac: dwmac-mediatek: fix
	clock issue
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

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 14 Jul 2022 14:00:11 +0800 you wrote:
> changes in v5:
> 1. add reivewd-by as Matthias's comments.
> 2. fix "warning: unused variable 'ret' [-Wunused-variable]" as Jakub's comments
> 
> changes in v4:
> 1. improve commit message and test ko insertion/remove as Matthias's comments.
> 2. add patch "net: stmmac: fix pm runtime issue in stmmac_dvr_remove()" to
>    fix vlan filter deletion issue.
> 3. add patch "net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow"
>    to fix unbalanced ptp clock issue in suspend/resume flow.
> 
> [...]

Here is the summary with links:
  - [net,v5,1/3] stmmac: dwmac-mediatek: fix clock issue
    https://git.kernel.org/netdev/net/c/fa4b3ca60e80
  - [net,v5,2/3] net: stmmac: fix pm runtime issue in stmmac_dvr_remove()
    https://git.kernel.org/netdev/net/c/0d9a15913b87
  - [net,v5,3/3] net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow
    https://git.kernel.org/netdev/net/c/f4c7d8948e86

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
