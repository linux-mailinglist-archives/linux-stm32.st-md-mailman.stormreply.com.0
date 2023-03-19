Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C30796C00A0
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Mar 2023 12:00:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B06BC6A5E7;
	Sun, 19 Mar 2023 11:00:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FA2EC6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 11:00:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E333260FAD;
 Sun, 19 Mar 2023 11:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3426FC433EF;
 Sun, 19 Mar 2023 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679223617;
 bh=wAMjv+OQaBXJ0DzFRZTo13CKHGO51sndjYWxpSODoV0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LHLqBnDqmheJ2y5ayl1U+OEBaxWeJCSaHsKCxcS9br6z1sTZvzbH4VmxOHF2efhPC
 NSeqAmkYrKMmwFoa3pFZQbvfwCr7NsAPt3fYswTtBHUgHJeiQBmyiyJTLNZr7GIm1H
 XZyCGsn9WqJxO6xo/H5ytLt2h4AaRpjoosfRPlX/roOtemddgdbD3mxnghvUL+Kphl
 q1rlB788rV+Q/etpSOmWrHVLUvoTZEMGibgsLr/3zqpfp5dp9aQBYrq7eZnLtd297V
 idTy2XTVZODyM/OYkcO24rRyeuYyDdufu3jXJXy8eWvkceP8XbVC9TWtwSFWnURfni
 Ci+h7NaGJAGdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 12542E21EE6; Sun, 19 Mar 2023 11:00:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167922361707.26931.13628628366196424198.git-patchwork-notify@kernel.org>
Date: Sun, 19 Mar 2023 11:00:17 +0000
References: <20230317080817.980517-1-jh@henneberg-systemdesign.com>
In-Reply-To: <20230317080817.980517-1-jh@henneberg-systemdesign.com>
To: Jochen Henneberg <jh@henneberg-systemdesign.com>
X-Topics: 
Cc: weifeng.voon@intel.com, kurt@linutronix.de, edumazet@google.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 tee.min.tan@linux.intel.com, veekhee@apple.com, joabreu@synopsys.com,
 linux-imx@nxp.com, kuba@kernel.org, pabeni@redhat.com,
 andrey.konovalov@linaro.org, mcoquelin.stm32@gmail.com, s.hauer@pengutronix.de,
 mohammad.athari.ismail@intel.com, linux-mediatek@lists.infradead.org,
 ruppala@nvidia.com, matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net V3] net: stmmac: Fix for mismatched
 host/device DMA address width
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri, 17 Mar 2023 09:08:17 +0100 you wrote:
> Currently DMA address width is either read from a RO device register
> or force set from the platform data. This breaks DMA when the host DMA
> address width is <=32it but the device is >32bit.
> 
> Right now the driver may decide to use a 2nd DMA descriptor for
> another buffer (happens in case of TSO xmit) assuming that 32bit
> addressing is used due to platform configuration but the device will
> still use both descriptor addresses as one address.
> 
> [...]

Here is the summary with links:
  - [net,V3] net: stmmac: Fix for mismatched host/device DMA address width
    https://git.kernel.org/netdev/net/c/070246e4674b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
