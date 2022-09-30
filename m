Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF225F0B5C
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Sep 2022 14:10:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0835EC64104;
	Fri, 30 Sep 2022 12:10:21 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 268D9C63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Sep 2022 12:10:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96F0FB8271A;
 Fri, 30 Sep 2022 12:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D849EC43470;
 Fri, 30 Sep 2022 12:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664539817;
 bh=Wr9kLRkpR89dsJoFBQYKEU+VDLeRWEFtjxk7UOSaQIY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GcJf0GR0bU7IOZnZi7DJA0OYE7pugV3SZD7osq3e1LC6SmOBOTHvkLfAeJCPzLlgx
 KaTFe6EdbWne43W1pVCDxguRGzeOWcWzXp9kHBkXk01T0jtbXh8OeMT5HJQKU65+O8
 oTUTeoYh+3oJiGjD59jnwW6YYT2+1E4mSMouo3JgkOFivkYMOC5sfpEAqUYJsw7s8L
 9xgtby86T/5oa8QS2BxD42CvKbV7dm68RkBPO4vm7N4G4vCf28sndMHz5N2Dyq5dKV
 NakcWPPqJMDKn/HEe5LYQofpCghNUUGNMzaE6wYonKF58FS/16483IbroiegSrCJ2h
 U0E9Hm3LnlDuQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B6DD5C395DA; Fri, 30 Sep 2022 12:10:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166453981774.22292.11611575581235201348.git-patchwork-notify@kernel.org>
Date: Fri, 30 Sep 2022 12:10:17 +0000
References: <20220929014758.12099-1-jianguo.zhang@mediatek.com>
In-Reply-To: <20220929014758.12099-1-jianguo.zhang@mediatek.com>
To: Jianguo Zhang <jianguo.zhang@mediatek.com>
Cc: joabreu@synopsys.com, mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org,
 biao.huang@mediatek.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com,
 matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v7 0/4] Mediatek ethernet patches for
	mt8188
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

On Thu, 29 Sep 2022 09:47:54 +0800 you wrote:
> Changes in v7:
> 
> v7:
> 1) Add 'Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>' info in commit message of
> patch 'dt-bindings: net: snps,dwmac: add new property snps,clk-csr',
> 'arm64: dts: mediatek: mt2712e: Update the name of property 'clk_csr''
> and 'net: stmmac: add a parse for new property 'snps,clk-csr''.
> 
> [...]

Here is the summary with links:
  - [v7,1/4] dt-bindings: net: mediatek-dwmac: add support for mt8188
    https://git.kernel.org/netdev/net-next/c/c827b7a3fed5
  - [v7,2/4] dt-bindings: net: snps,dwmac: add new property snps,clk-csr
    https://git.kernel.org/netdev/net-next/c/22ba1afdec08
  - [v7,3/4] arm64: dts: mediatek: mt2712e: Update the name of property 'clk_csr'
    https://git.kernel.org/netdev/net-next/c/7871785ce92d
  - [v7,4/4] net: stmmac: add a parse for new property 'snps,clk-csr'
    https://git.kernel.org/netdev/net-next/c/83936ea8d8ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
