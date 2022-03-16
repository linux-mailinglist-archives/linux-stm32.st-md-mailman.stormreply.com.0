Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 366284DB137
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Mar 2022 14:20:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCEB7C5F1F2;
	Wed, 16 Mar 2022 13:20:14 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66AB8C5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 13:20:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E7AE7B81B34;
 Wed, 16 Mar 2022 13:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84EA1C340F0;
 Wed, 16 Mar 2022 13:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647436812;
 bh=tbcOFjyGFmBEwOjIh+3jseYE1fvFZySauTJiPWeHSxQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Gum5FAn1JMTLcenLuYd4xxPKwYN/TcLuars1ooFUTgakM/hpQeodftoHNBLqYRDP/
 r4x9h0/sJC5MHmJInTBtUpjs0iMHG/moQHxyv4RbEYnucVidanSQVkSn++BT611/Bu
 okPYd0KVL3soFDhwrHGgC6kaojRznvmTqVssOsdSqV6UTMBShUJYpUpVQqbGrQtGZb
 UHfpJQmYMkjp3P4Yt7XCoB/ts5RbLgVRXn5tKFeAmfY/H386ao84G/HtZ3/+NOzNJK
 luKf7p7YOdtAIjhjvnvWzJ2/KDDhciOQeJobgB8IOcyaRWR+eJMzR8EuyjnwChMFI8
 g46+zgsaItBUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 60947EAC09C; Wed, 16 Mar 2022 13:20:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164743681238.18574.8037993673780755676.git-patchwork-notify@kernel.org>
Date: Wed, 16 Mar 2022 13:20:12 +0000
References: <20220314075713.29140-1-biao.huang@mediatek.com>
In-Reply-To: <20220314075713.29140-1-biao.huang@mediatek.com>
To: Biao Huang <biao.huang@mediatek.com>
Cc: joabreu@synopsys.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, dkirjanov@suse.de, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, matthias.bgg@gmail.com,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v13 0/7] MediaTek Ethernet
	Patches on MT8195
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
by David S. Miller <davem@davemloft.net>:

On Mon, 14 Mar 2022 15:57:06 +0800 you wrote:
> Changes in v13:
> 1. add reviewed-by in "net: dt-bindings: dwmac: add support for mt8195"
>    as Rob's comments.
> 2. drop num_clks defined in mediatek_dwmac_plat_data struct in "stmmac:
>    dwmac-mediatek: Reuse more common features" as Angelo's comments.
> 
> Changes in v12:
> 1. add a new patch "stmmac: dwmac-mediatek: re-arrange clock setting" to
>    this series, to simplify clock handling in driver, which benefits to
>    binding file mediatek-dwmac.yaml.
> 2. modify dt-binding description in patch "net: dt-bindings: dwmac: add
>    support for mt8195" as Rob's comments in v10 series, put mac_cg to the
>    end of clock list.
> 3. there are small changes in patch "stmmac: dwmac-mediatek: add support
>    for mt8195", @AngeloGioacchino, please review it kindly.
> 
> [...]

Here is the summary with links:
  - [net-next,v13,1/7] stmmac: dwmac-mediatek: add platform level clocks management
    https://git.kernel.org/netdev/net-next/c/3186bdad97d5
  - [net-next,v13,2/7] stmmac: dwmac-mediatek: Reuse more common features
    https://git.kernel.org/netdev/net-next/c/a71e67b21081
  - [net-next,v13,3/7] stmmac: dwmac-mediatek: re-arrange clock setting
    https://git.kernel.org/netdev/net-next/c/4fe3075fa699
  - [net-next,v13,4/7] arm64: dts: mt2712: update ethernet device node
    https://git.kernel.org/netdev/net-next/c/79e1177809f2
  - [net-next,v13,5/7] net: dt-bindings: dwmac: Convert mediatek-dwmac to DT schema
    https://git.kernel.org/netdev/net-next/c/150b6adda6b1
  - [net-next,v13,6/7] stmmac: dwmac-mediatek: add support for mt8195
    https://git.kernel.org/netdev/net-next/c/f2d356a6ab71
  - [net-next,v13,7/7] net: dt-bindings: dwmac: add support for mt8195
    https://git.kernel.org/netdev/net-next/c/ee410d510032

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
