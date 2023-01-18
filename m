Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7C5671D2A
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 14:10:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B30C65E72;
	Wed, 18 Jan 2023 13:10:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3488FC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 13:10:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F15DD617D4;
 Wed, 18 Jan 2023 13:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F4179C433D2;
 Wed, 18 Jan 2023 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674047418;
 bh=oYonSHuDZS4OI1phKo81M9gyFbCoy6DvJ3Gg4q/1aJ8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BcttJZE6TaTO152ngaAMmaU1axuYWO41WtMMzRTIgkas3/Xp/JqwS1TYSxUQEzzYv
 egVZPTmmsJOEnlq7lEmZ+UEdv5D24qhvrH8917O4mr5+T7/wRBNmxSRu1nEC5G+foT
 7U3UFdH+Dhb3cO5XsjQIaGNEWshMfq+2LjMs2xRJE9ThFuiu8dS76o1YgfqCKw7dKS
 rcUKdKDaguKlfEPYgexdcpHjQ5ZgCkLRWffMT/KqGZqCKXqylswowewo0o1hsRHKnJ
 GXmFeXdRuMxxT4VnyLksA5EVginMJ4A5aSYC5L4HJ2AZsuodgnQb65Q9A/TlX6DHtK
 PWVBXbqw6uoMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CC771C3959E; Wed, 18 Jan 2023 13:10:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167404741783.5923.15821433404030533647.git-patchwork-notify@kernel.org>
Date: Wed, 18 Jan 2023 13:10:17 +0000
References: <20230113033347.264135-1-xiaoning.wang@nxp.com>
In-Reply-To: <20230113033347.264135-1-xiaoning.wang@nxp.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: edumazet@google.com, krzysztof.kozlowski+dt@linaro.org,
 shenwei.wang@nxp.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 linux-imx@nxp.com, kuba@kernel.org, pabeni@redhat.com, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, kernel@pengutronix.de, richardcochran@gmail.com,
 robh+dt@kernel.org, wei.fang@nxp.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, shawnguo@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH V2 0/7] Add eqos and fec support for imx93
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

On Fri, 13 Jan 2023 11:33:40 +0800 you wrote:
> Hi,
> 
> This patchset add imx93 support for dwmac-imx glue driver.
> There are some changes of GPR implement.
> And add fec and eqos nodes for imx93 dts.
> 
> Clark Wang (7):
>   net: stmmac: add imx93 platform support
>   dt-bindings: add mx93 description
>   dt-bindings: net: fec: add mx93 description
>   arm64: dts: imx93: add eqos support
>   arm64: dts: imx93: add FEC support
>   arm64: dts: imx93-11x11-evk: enable eqos
>   arm64: dts: imx93-11x11-evk: enable fec function
> 
> [...]

Here is the summary with links:
  - [V2,1/7] net: stmmac: add imx93 platform support
    https://git.kernel.org/netdev/net-next/c/e5bf35ca4547
  - [V2,2/7] dt-bindings: add mx93 description
    https://git.kernel.org/netdev/net-next/c/b2274ffe90be
  - [V2,3/7] dt-bindings: net: fec: add mx93 description
    https://git.kernel.org/netdev/net-next/c/f743e7664dca
  - [V2,4/7] arm64: dts: imx93: add eqos support
    https://git.kernel.org/netdev/net-next/c/1f4263ea6a4b
  - [V2,5/7] arm64: dts: imx93: add FEC support
    https://git.kernel.org/netdev/net-next/c/eaaf47108540
  - [V2,6/7] arm64: dts: imx93-11x11-evk: enable eqos
    https://git.kernel.org/netdev/net-next/c/1b110dd678d9
  - [V2,7/7] arm64: dts: imx93-11x11-evk: enable fec function
    https://git.kernel.org/netdev/net-next/c/c897dc7f3a8d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
