Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAACB6D8D73
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 04:30:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 585ADC6A616;
	Thu,  6 Apr 2023 02:30:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0857C6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 02:30:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9A5864122;
 Thu,  6 Apr 2023 02:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F76FC433D2;
 Thu,  6 Apr 2023 02:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680748218;
 bh=3vmq/aqfbwSmZiecl7SOMVN6Ty8I+cMF/5ynkmxVNAM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YOekC06V9atZffKzhqsJmRk6ZWz90aLzTAVi1gs16VFOtF/fJ0Vp9MVVKJJzzDdhF
 pHFza4svN2bQkN+IwtbG96WpFaZ7lNgFDh+buM9ykcz9LOP8dwBv3xope/BdkHzWtj
 4wEU72ubxe5q1tPObJA0W/OgRangwbvH+xRadUe/K8FygQuAtczQm3Vhxgo2nc4kHq
 SZiDnU9f6hfalpV26rUy6vvy4C9lYAq4ydYZWAzZvzqUV0N841Y6mjUhbOdmVmvyll
 4RcJxr4kyUv6l7tklgACppZeVcFsz39A3wtZrP+4Lmj1o52gQhfrir+mTIkTylyxL6
 l2R/qyrSxTFsg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 03682C395D8; Thu,  6 Apr 2023 02:30:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168074821801.25080.4300121511824003788.git-patchwork-notify@kernel.org>
Date: Thu, 06 Apr 2023 02:30:18 +0000
References: <20230403222302.328262-1-shenwei.wang@nxp.com>
In-Reply-To: <20230403222302.328262-1-shenwei.wang@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, kurt@linutronix.de, edumazet@google.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 tee.min.tan@linux.intel.com, veekhee@apple.com, joabreu@synopsys.com,
 linux-imx@nxp.com, kuba@kernel.org, pabeni@redhat.com,
 andrey.konovalov@linaro.org, mcoquelin.stm32@gmail.com, s.hauer@pengutronix.de,
 ruppala@nvidia.com, jh@henneberg-systemdesign.com, peppe.cavallaro@st.com,
 netdev@vger.kernel.org, kernel@pengutronix.de, shawnguo@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v6 1/2] net: stmmac: add support for
	platform specific reset
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

On Mon,  3 Apr 2023 17:23:01 -0500 you wrote:
> This patch adds support for platform-specific reset logic in the
> stmmac driver. Some SoCs require a different reset mechanism than
> the standard dwmac IP reset. To support these platforms, a new function
> pointer 'fix_soc_reset' is added to the plat_stmmacenet_data structure.
> The stmmac_reset in hwif.h is modified to call the 'fix_soc_reset'
> function if it exists. This enables the driver to use the platform-specific
> reset logic when necessary.
> 
> [...]

Here is the summary with links:
  - [v6,1/2] net: stmmac: add support for platform specific reset
    https://git.kernel.org/netdev/net-next/c/10739ea31328
  - [v6,2/2] net: stmmac: dwmac-imx: use platform specific reset for imx93 SoCs
    https://git.kernel.org/netdev/net-next/c/b536f32b5b03

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
