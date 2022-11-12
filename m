Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD3626713
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Nov 2022 06:10:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B70BC6506B;
	Sat, 12 Nov 2022 05:10:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96DC1C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Nov 2022 05:10:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F3C860B41;
 Sat, 12 Nov 2022 05:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 772AAC433B5;
 Sat, 12 Nov 2022 05:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668229817;
 bh=b9hy5Uu/5y7S/TF2TAungVdatpEEDrM3Mfp/gMVTcQg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Qu9JGc2sCb/GEwSr0HpmKCLsOu7Zz+SEslo20KxWtTw6zVIcuD61md/ia6uY7Vc5P
 EvLLAX4uTA/zF/MPBJ7MWjneV+jpj8ljcBhHzjsYYWaWGBqo0FVgX0aTPw0n2/PEf4
 bIZWo43mm6GKi6wGFRBZK3j1j2ftDzdTO6AuobXbCDlhR1FeDj0M9U88KwSf/5WTOu
 dpx+scy55B3e19ZBxEG36dMalX48TNJn7zrf8RRFauQ78z3F96Yd+MGuR4AGkCWbj9
 xul1FzVbhNo6odPPaXAs9Yonc+4Ca/3gD/Bjr+wKi0ZjJClEzZMplAs+tL3d7fgwgq
 1LfU6heYafYoQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3F40FC395F7; Sat, 12 Nov 2022 05:10:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166822981724.20406.14762867463134105044.git-patchwork-notify@kernel.org>
Date: Sat, 12 Nov 2022 05:10:17 +0000
References: <20221110064552.22504-1-noor.azura.ahmad.tarmizi@linux.intel.com>
In-Reply-To: <20221110064552.22504-1-noor.azura.ahmad.tarmizi@linux.intel.com>
To: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@linux.intel.com>
Cc: yoong.siang.song@intel.com, linux-kernel@vger.kernel.org, hawk@kernel.org,
 daniel@iogearbox.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, faizal.abdul.rahim@intel.com,
 john.fastabend@gmail.com, ast@kernel.org, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, bpf@vger.kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: ensure tx function
 is not running in stmmac_xdp_release()
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

On Thu, 10 Nov 2022 14:45:52 +0800 you wrote:
> From: Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>
> 
> When stmmac_xdp_release() is called, there is a possibility that tx
> function is still running on other queues which will lead to tx queue
> timed out and reset adapter.
> 
> This commit ensure that tx function is not running xdp before release
> flow continue to run.
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: ensure tx function is not running in stmmac_xdp_release()
    https://git.kernel.org/netdev/net/c/77711683a504

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
