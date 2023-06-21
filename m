Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF27379E4
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 05:50:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B8DFC65E4F;
	Wed, 21 Jun 2023 03:50:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9D72C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 03:50:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64EA06146E;
 Wed, 21 Jun 2023 03:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B514DC433C0;
 Wed, 21 Jun 2023 03:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687319425;
 bh=D35HmKlZtJ5h1JeXspSb0lCLLuaJdO/xC8NRMTwz20s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=r82mCGXv0GiHbdJSJF0qAiJiiz1KqxFHmFrncm65vQrSZwFmyyLV5bNQL0J5zs2Sr
 +Is7zkoBtJE18tCoMEnIVSIx8A2kQPrGFbcIOSLDqTCGSBv5ZxR1doJslEKc9TXYGa
 qhEBJ453ewI1hcGemB6a/gEqFk8L3ylZPC5Oz5V95FIkbSgG7yuPTHsUA32nvqin10
 ODyUSf9x/lADdDnqS4CX10IBkAztrdM5L/Ndd5PexQOw7utT33lpL+Tme4jUaJAoAk
 i6BKEqYQt5jwpvox8FWyUc/i/RojYk+DtYNr9bE5W9vBbUqFG+kd1HGGSGYs76IqA+
 JwZpznrNuR2Rw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8F2C3C4166E; Wed, 21 Jun 2023 03:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168731942557.12823.16246597315060099180.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 03:50:25 +0000
References: <20230619092402.195578-1-brgl@bgdev.pl>
In-Reply-To: <20230619092402.195578-1-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: edumazet@google.com, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, bartosz.golaszewski@linaro.org,
 joabreu@synopsys.com, agross@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 ahalaney@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [RESEND PATCH net-next v2 00/14] net: stmmac:
 dwmac-qcom-ethqos: add support for EMAC4
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

On Mon, 19 Jun 2023 11:23:48 +0200 you wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the dwmac-qcom-ethqos driver to support EMAC4. While at it: rework the
> code somewhat. The bindings have been reviewed by DT maintainers.
> 
> This is a sub-series of [1] with only the patches targetting the net subsystem
> as they can go in independently.
> 
> [...]

Here is the summary with links:
  - [RESEND,v2,01/14] net: stmmac: dwmac-qcom-ethqos: shrink clock code with devres
    https://git.kernel.org/netdev/net-next/c/9fc68f23a6d3
  - [RESEND,v2,02/14] net: stmmac: dwmac-qcom-ethqos: rename a label in probe()
    https://git.kernel.org/netdev/net-next/c/9bc580609139
  - [RESEND,v2,03/14] net: stmmac: dwmac-qcom-ethqos: tweak the order of local variables
    https://git.kernel.org/netdev/net-next/c/7b5e64a93825
  - [RESEND,v2,04/14] net: stmmac: dwmac-qcom-ethqos: use a helper variable for &pdev->dev
    https://git.kernel.org/netdev/net-next/c/302555a0ae33
  - [RESEND,v2,05/14] net: stmmac: dwmac-qcom-ethqos: add missing include
    https://git.kernel.org/netdev/net-next/c/ee8dacca2fd3
  - [RESEND,v2,06/14] net: stmmac: dwmac-qcom-ethqos: add a newline between headers
    https://git.kernel.org/netdev/net-next/c/97f73bc59e16
  - [RESEND,v2,07/14] net: stmmac: dwmac-qcom-ethqos: remove stray space
    https://git.kernel.org/netdev/net-next/c/f2b1758554eb
  - [RESEND,v2,08/14] net: stmmac: dwmac-qcom-ethqos: add support for the optional serdes phy
    https://git.kernel.org/netdev/net-next/c/0dec3b48aa4e
  - [RESEND,v2,09/14] net: stmmac: dwmac-qcom-ethqos: add support for the phyaux clock
    https://git.kernel.org/netdev/net-next/c/feeb27165c46
  - [RESEND,v2,10/14] net: stmmac: dwmac-qcom-ethqos: prepare the driver for more PHY modes
    https://git.kernel.org/netdev/net-next/c/25c4a0769443
  - [RESEND,v2,11/14] net: stmmac: dwmac-qcom-ethqos: add support for SGMII
    https://git.kernel.org/netdev/net-next/c/463120c31c58
  - [RESEND,v2,12/14] net: stmmac: add new switch to struct plat_stmmacenet_data
    https://git.kernel.org/netdev/net-next/c/aa571b6275fb
  - [RESEND,v2,13/14] dt-bindings: net: qcom,ethqos: add description for sa8775p
    https://git.kernel.org/netdev/net-next/c/d0e3d29f8771
  - [RESEND,v2,14/14] net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p platforms
    https://git.kernel.org/netdev/net-next/c/8c4d92e82d50

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
