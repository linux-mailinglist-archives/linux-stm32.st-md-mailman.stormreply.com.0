Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C70766282
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 05:40:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88583C6B465;
	Fri, 28 Jul 2023 03:40:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FA20C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 03:40:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7872A61FC6;
 Fri, 28 Jul 2023 03:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F83BC433C8;
 Fri, 28 Jul 2023 03:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690515623;
 bh=j68cQbaROJUzWuEyrIA7FjWkBHFT7+vx0pq6TM5mFdA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jV7NtV4MJomK4uQuDChlFl6SS8gaqadVCPjeSQxFkkILdxMLASvGp+vr6ieXqe9h2
 AoCUQXMrrINJcoIWILnRaeR6YZcJ4HufDazNoQLOXJgdLVZ3akxqmCFjc0nI5u0XAJ
 rSPpADuDOJHPRwWmRazZkhcMVLGpr7qB7asej8LMTjvX5gq6zMTZ4ZKfssWON5G/we
 3onzcCh88/gVMsHC1oOOD2jmuZXjYQZW3HcWBEW/axNBLRtM/5//RWZdHTSVD5CmUz
 MD9fJSJL4Q/k6nJ+241n/CRXcq511JhnjYZ3en7c3qoE8VoYbV/epKx33MiE4g6k0l
 E+0Zc4RcICwAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 354BBC691D7; Fri, 28 Jul 2023 03:40:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169051562321.23821.5865219947273364361.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jul 2023 03:40:23 +0000
References: <20230725211853.895832-2-ahalaney@redhat.com>
In-Reply-To: <20230725211853.895832-2-ahalaney@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, jsuraj@qti.qualcomm.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac: Increase
	clk_ptp_ref rate
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

On Tue, 25 Jul 2023 16:04:24 -0500 you wrote:
> This series aims to increase the clk_ptp_ref rate to get the best
> possible PTP timestamping resolution possible. Some modified disclosure
> about my development/testing process from the RFC/RFT v1 follows.
> 
> Disclosure: I don't know much about PTP beyond what you can google in an
> afternoon, don't have access to documentation about the stmmac IP,
> and have only tested that (based on code comments and git commit
> history) the programming of the subsecond register (and the clock rate)
> makes more sense with these changes. Qualcomm has tested a similar
> change offlist, verifying PTP more formally as I understand it.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: Make ptp_clk_freq_config variable type explicit
    https://git.kernel.org/netdev/net-next/c/d928d14be651
  - [net-next,v2,2/2] net: stmmac: dwmac-qcom-ethqos: Use max frequency for clk_ptp_ref
    https://git.kernel.org/netdev/net-next/c/db845b9b2040

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
