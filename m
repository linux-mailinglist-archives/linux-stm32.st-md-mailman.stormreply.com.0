Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D095851273
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 12:40:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E558CC6B45B;
	Mon, 12 Feb 2024 11:40:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5A33C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 11:40:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2BA41CE1273;
 Mon, 12 Feb 2024 11:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35EABC433B1;
 Mon, 12 Feb 2024 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707738026;
 bh=lzBgTEGIQJNtaXuo/iOt+XACv5fKcsFpX+j1R22SN5A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=A+AGlfFPYMjdAPkui+tWSm5Cs3u1nOwNJox21MeBgYasgspMcpDZbsiMyhW6cfCtj
 ataCN5UJ7jG8Y7j8tzEZldL1O77am2UvULaQxS/bORhntK6KuRK7Pf5A0t6I6TNh1r
 Ta8UpWzpt8dYEEuwZCcadwwYZXQwenqVPCmOaCuOwicBwbcg+LTOgMCdeRKpvEA8+B
 S9gCEGmVZDETd/ImnqyHM4Paj6c79A+NsDzuak/Kb+okJIKXl79I36owDWLlN2CuRC
 oBHirQhwElE5MiqyVfSLp3yR8C38iqtXudUsggzgC/ibfh6KGK+c/W7YnCg+IEZ0c7
 RPWFjwW8NXVYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 18742D84BCF; Mon, 12 Feb 2024 11:40:26 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170773802609.23861.7253263581992379232.git-patchwork-notify@kernel.org>
Date: Mon, 12 Feb 2024 11:40:26 +0000
References: <cover.1707467850.git.quic_jsuraj@quicinc.com>
In-Reply-To: <cover.1707467850.git.quic_jsuraj@quicinc.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Cc: edumazet@google.com, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, kernel@quicinc.com,
 joabreu@synopsys.com, agross@kernel.org, kuba@kernel.org, psodagud@quicinc.com,
 ahalaney@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
 netdev@vger.kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v13 0/2] Ethernet common fault
	IRQ support
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
by David S. Miller <davem@davemloft.net>:

On Fri, 9 Feb 2024 14:20:10 +0530 you wrote:
> Changes since v13:
> - Update correct sender email
> 
> Changes since v12:
> - Update correct sender email
> 
> Changes since v11:
> - Update debug message print
> 
> [...]

Here is the summary with links:
  - [net-next,v13,1/2] dt-bindings: net: qcom,ethqos: add binding doc for safety IRQ for sa8775p
    https://git.kernel.org/netdev/net-next/c/1963e65b3dfe
  - [net-next,v13,2/2] net: stmmac: Add driver support for common safety IRQ
    https://git.kernel.org/netdev/net-next/c/5c2215167d12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
