Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA54778488
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Aug 2023 02:30:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC151C6B469;
	Fri, 11 Aug 2023 00:30:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DF50C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 00:30:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BE9964DCB;
 Fri, 11 Aug 2023 00:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 001F6C433CA;
 Fri, 11 Aug 2023 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691713822;
 bh=VTdqDcF8RsP1Tx5iHwaXGP1sG1BJp3vTg2yHLtubAGY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=c1cvUsLVvbNOxrcxKegdBTWgRa317/WWR1Oi1n6cAFjOaCcxZsBiY53OcJg1fS7Ev
 G89XIHnIu8dqylZvu+OMJMiBDLSZ4Rt7losPpISfhl3+FG02roRQxO9UCWBiKBOi7A
 fs3ku7qcm6EWDUA4kU/beALERnma4vRJb3x/bB1oztNxINbjIXS/IiRtzJGXVj1gXY
 YF7+XOdu/pbCTHWoV6Cm7VAkb87fSc0QPrkCdzQ4itEgwZzfsyQKTF0vOQpKCba7Ie
 dStQ0fBtVtYEhiK6Q4diHYrkE9LtkSbtCIQs/yQnGO3Od3b0l4WKqlK8ZLnvDWcnkY
 m6dFswKw9/Q9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D498FC595D0; Fri, 11 Aug 2023 00:30:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169171382186.19672.4297213896256628885.git-patchwork-notify@kernel.org>
Date: Fri, 11 Aug 2023 00:30:21 +0000
References: <20230807160716.259072-1-shenwei.wang@nxp.com>
In-Reply-To: <20230807160716.259072-1-shenwei.wang@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, simon.horman@corigine.com, edumazet@google.com,
 linux-amlogic@lists.infradead.org, nobuhiro1.iwamatsu@toshiba.co.jp,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, samuel@sholland.org, khilman@baylibre.com,
 linux@armlinux.org.uk, jernej.skrabec@gmail.com, veekhee@apple.com,
 wens@csie.org, joabreu@synopsys.com, linux-imx@nxp.com, kuba@kernel.org,
 pabeni@redhat.com, ahalaney@redhat.com, mcoquelin.stm32@gmail.com,
 bhupesh.sharma@linaro.org, martin.blumenstingl@googlemail.com,
 s.hauer@pengutronix.de, mkl@pengutronix.de, ruppala@nvidia.com,
 jh@henneberg-systemdesign.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, bartosz.golaszewski@linaro.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 net-next 0/2] update stmmac
	fix_mac_speed
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  7 Aug 2023 11:07:14 -0500 you wrote:
> Changes in V5:
>   - fixed the typo in if condition reported by Russell.
>   - fixed the build errors in dwmac-sti.c reported by 'kernel test robot'.
> 
> Changes in V4:
>   - Keep the 'unsigned int' type specifier in the fix_mac_speed
>     function declarations.
>   - Move imx93_dwmac_fix_mac_speed into the SoC specific ops.
>   - Use a read back to replace the wmb() instruction.
>   - Correct the target to 'net-next'.
> 
> [...]

Here is the summary with links:
  - [v5,net-next,1/2] net: stmmac: add new mode parameter for fix_mac_speed
    https://git.kernel.org/netdev/net-next/c/1fc04a0b9733
  - [v5,net-next,2/2] net: stmmac: dwmac-imx: pause the TXC clock in fixed-link
    https://git.kernel.org/netdev/net-next/c/4fa6c976158b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
