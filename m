Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3269812D58
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Dec 2023 11:50:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8706FC6B47D;
	Thu, 14 Dec 2023 10:50:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32FEAC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 10:50:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AB192B821D6;
 Thu, 14 Dec 2023 10:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A038C433C9;
 Thu, 14 Dec 2023 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702551027;
 bh=SXb2V+uKEU2n7t6G6weVcddYl7DHNgyGn9EjuAISZ7Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PMs44FOKJKKcMWG467I+UZQgz3KFimsU98HZCl35q+mJO5LR67yFuO82gv1ydWkez
 De5Nc9B950jcxgWtUGAbw4AXWLCRYDmTg3cckGFSKJV84PbaaFJrl85B+OZ4FYR2gW
 fJYj3gg9/cmcYZtmKOfI11348XmFmE4VL6Pv4sfBDbKw8eNWiEfrW/e7BbizKNsYTw
 7lrotZL3Lp/6ciGzPs/O/+wGHtX7D+mwyBdSNJ6mymn9I/bs+rYUy92kYSlcmD2tH8
 qKsGvLpap5Vo9be4H8AA1VYxT2t3bW0oOtF0oxLiClwGX/W1etEdfoLuPyEHYQeY22
 nQe5z3zxtHx0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E93C1DD4EFA; Thu, 14 Dec 2023 10:50:26 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170255102695.29358.13778143091773009121.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 10:50:26 +0000
References: <20231212092208.22393-1-quic_snehshah@quicinc.com>
In-Reply-To: <20231212092208.22393-1-quic_snehshah@quicinc.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org, bhupesh.sharma@linaro.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, vkoul@kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH net v4] net: stmmac: dwmac-qcom-ethqos:
 Fix drops in 10M SGMII RX
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 12 Dec 2023 14:52:08 +0530 you wrote:
> In 10M SGMII mode all the packets are being dropped due to wrong Rx clock.
> SGMII 10MBPS mode needs RX clock divider programmed to avoid drops in Rx.
> Update configure SGMII function with Rx clk divider programming.
> 
> Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")
> Tested-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> 
> [...]

Here is the summary with links:
  - [net,v4] net: stmmac: dwmac-qcom-ethqos: Fix drops in 10M SGMII RX
    https://git.kernel.org/netdev/net/c/981d947bcd38

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
