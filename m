Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83803923F2D
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2024 15:40:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B700C6DD9E;
	Tue,  2 Jul 2024 13:40:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BA4CC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2024 13:40:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 132EACE1E02;
 Tue,  2 Jul 2024 13:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C7AAC116B1;
 Tue,  2 Jul 2024 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719927632;
 bh=oWyMMPuMnk/cVjDHZftH+TzqlB1ahjPwRtOGWTrmum4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=iBPVwi6LyVgmhJNUGEtqynTEpSRPX/kUSJrh9ZjrUKwHEy0Z/svKF1QxOl0ldaJ6/
 YnNkN53iWQNyVTRWUot5Fx2Q/1Y0YqzT+OIPcl73IDoGywY2wzbcqsxumYOeKK+RP9
 31690r0e+f+OYTvzOPfDex/4GcMC/fUJ9QFZmW1GC6dQRNohtAbC/fZFh4Q2IkXEVI
 yN0l5chOUxW6g2tDVzwKGbssDRXy+wydi3WPfotNJl4M4bbS3EBmrfDQakGbbbdzlZ
 s92nAey6swXuU3dsjDnxmuH8tmEmR2eshfvkJqQ68Ud2JKFX7p+1dK1KWKyCu6ZbdH
 VSb9Fl9S+hReQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 38CB5CF3B95; Tue,  2 Jul 2024 13:40:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171992763222.28501.4782727810061359612.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jul 2024 13:40:32 +0000
References: <20240701014720.2547856-1-quic_yijiyang@quicinc.com>
In-Reply-To: <20240701014720.2547856-1-quic_yijiyang@quicinc.com>
To: YijieYang <quic_yijiyang@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org, quic_jiegan@quicinc.com,
 edumazet@google.com, bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 quic_aiquny@quicinc.com, quic_tengfan@quicinc.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, vkoul@kernel.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: fix error
	array size
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

On Mon, 1 Jul 2024 09:47:20 +0800 you wrote:
> From: Yijie Yang <quic_yijiyang@quicinc.com>
> 
> Correct member @num_por with size of right array @emac_v4_0_0_por for
> struct ethqos_emac_driver_data @emac_v4_0_0_data.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8c4d92e82d50 ("net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p platforms")
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-qcom-ethqos: fix error array size
    https://git.kernel.org/netdev/net/c/b698ab56837b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
