Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 402324E6BAC
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Mar 2022 02:00:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E95FAC60497;
	Fri, 25 Mar 2022 01:00:14 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36DDDC60469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 01:00:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33D9AB82709;
 Fri, 25 Mar 2022 01:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4B8DC340EE;
 Fri, 25 Mar 2022 01:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648170011;
 bh=d5wIT0LEc5NSb6GdheZy9GT6g8BIIfqcfuV9J4NhnkI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jaCMjPx9bND0CXArgbcaExEPjQBupRg9h2aRPxs2Az1yPbBA/5zDhs8FxtibXyvhz
 6EPqBtkz6BPwc/jqpqgnfK4HMWnwtjNiV5PWak7D/75c9IuQRfFUoEa9RQl6MLdNL6
 YdXhTBFmTGQ6/Gf3ERw+aEcLNEQkioBVX8YllIZ1i0RGPfkQ08slYVAdHTLvwz64e7
 gDuY+sa5Tba17THbnH1KVlqnm//N4qLJ4JYBBV8AeXrG+QPXZqPQ9lgy44KpLiMgOv
 R3sZy7ok5S1QbBOeWzZf5EvNvVEOPQQrqjmNZLvruCm1zlmibXYEcHAklI+GTwB7P6
 EjscCWYnSa7PA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C1D50F0383F; Fri, 25 Mar 2022 01:00:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164817001079.21015.15011506494031889384.git-patchwork-notify@kernel.org>
Date: Fri, 25 Mar 2022 01:00:10 +0000
References: <20220323033255.2282930-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220323033255.2282930-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-kernel@vger.kernel.org, bhupesh.sharma@linaro.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 vkoul@kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable
 RGMII functional clock on resume
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
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 22 Mar 2022 20:32:55 -0700 you wrote:
> When the Qualcomm ethqos driver is properly described in its associated
> GDSC power-domain, the hardware will be powered down and loose its state
> between qcom_ethqos_probe() and stmmac_init_dma_engine().
> 
> The result of this is that the functional clock from the RGMII IO macro
> is no longer provides and the DMA software reset in dwmac4_dma_reset()
> will time out, due to lacking clock signal.
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-qcom-ethqos: Enable RGMII functional clock on resume
    https://git.kernel.org/netdev/net/c/ffba2123e171

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
