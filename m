Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F259C4B67
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 02:00:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD377C78F71;
	Tue, 12 Nov 2024 01:00:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D2B0C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 01:00:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 904945C5E64;
 Tue, 12 Nov 2024 00:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5969C4CECF;
 Tue, 12 Nov 2024 01:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731373222;
 bh=5Ly3KTlyGxLxMdfFr4jX9+4qFB8MuIzcMl8Y+2r08GU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jD3ihzeYm/MAbIy4isBJM1MmRNUzcwsucpzXgKO/fNR0HDtN1wk4pit0UyrV3natq
 /4l9xghiGQ3os6R24qcWqKOXYqTqveKbsecGFt8G2a5wsRjQMSYpPQpcnO/iENk/Jk
 kkU9SxNhZE3DottWuaBvCA2f27+GozRRTJZODg//cuszNdt56uvFr4Xf69QZgKt/gc
 noNUpVGAMH2jvRBxMWbE6ph65wfYL3L0oTYS8x1SNga/iTN9VArWKbfGCh7k3AKZ6k
 WMJW7eMXjsMJJaQcPBwAI4Ad/E+q3VJR3ASKI3KM5W1prIBt5UnMqTDweM0YLfAImx
 EwZQ5zUn/Ac5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB0853809A80; Tue, 12 Nov 2024 01:00:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173137323274.33228.17724047786767970520.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 01:00:32 +0000
References: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
In-Reply-To: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, lftan.linux@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/3] net: stmmac: dwmac4:
	Fixes issues in dwmac4
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

On Thu,  7 Nov 2024 14:36:33 +0800 you wrote:
> This patch series fixes issues in the dwmac4 driver. These three patches
> don't cause any user-visible issues, so they are targeted for net-next.
> 
> Patch #1:
> Corrects the masking logic in the MTL Operation Mode RTC mask and shift
> macros. The current code lacks the use of the ~ operator, which is
> necessary to clear the bits properly.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] net: stmmac: dwmac4: Fix MTL_OP_MODE_RTC mask and shift macros
    https://git.kernel.org/netdev/net-next/c/6d4a34fe429f
  - [net-next,v3,2/3] net: stmmac: dwmac4: Fix the MTL_OP_MODE_*_MASK operation
    https://git.kernel.org/netdev/net-next/c/3fccba8fdc1b
  - [net-next,v3,3/3] net: stmmac: dwmac4: Receive Watchdog Timeout is not in abnormal interrupt summary
    https://git.kernel.org/netdev/net-next/c/671672977012

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
