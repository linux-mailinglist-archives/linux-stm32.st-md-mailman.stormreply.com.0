Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6524843F6E
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 13:30:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67743C6C841;
	Wed, 31 Jan 2024 12:30:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD954C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 12:30:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9F9C461716;
 Wed, 31 Jan 2024 12:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42649C433F1;
 Wed, 31 Jan 2024 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706704225;
 bh=dQmcqZyGCVpAunYCRVp1AfKJ2llbhfxVUlSByVXTwik=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uhYm0Y3j9PWV/aB5FFde4SBDymNc0aJ4tykkrM2Uo+tDHBJ4HwxWwwlZS3pHvKaQ0
 FPnyYFNVdrfdKAVxkABTPaLxjRwIbGpVsAYfR2OnW8o5qbXDSW9s5AzIG78zkEcPI1
 T4OVzTCm6V/4edy1E4p40JwONH7u6r5hHapKmhCpk40ou7J7DnvmYf7lRBE90Dr8SL
 arhAp1eOxb3PorXNQHsVNWQXC6Aiv7+ANEWldizh5ITwAM/Bofrdf2Mw/LcUIaUR+S
 XWF/KlCLZWelHr7bM4LuEecbptwQUsE/FPEVTuoFYJLcxavv/1dRy1ZgfGKqMN511Y
 +HJxDoHRd8mAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1C054DC99E5; Wed, 31 Jan 2024 12:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170670422511.21491.17051926451255201000.git-patchwork-notify@kernel.org>
Date: Wed, 31 Jan 2024 12:30:25 +0000
References: <20240127040443.24835-1-rohan.g.thomas@intel.com>
In-Reply-To: <20240127040443.24835-1-rohan.g.thomas@intel.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Cc: ast@kernel.org, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, richardcochran@gmail.com, bpf@vger.kernel.org,
 john.fastabend@gmail.com, fancer.lancer@gmail.com, linux@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: EST conformance
	support
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

On Sat, 27 Jan 2024 12:04:40 +0800 you wrote:
> Hi,
> 
> This patchset enables support for queueMaxSDU and transmission overrun
> counters which are required for Qbv conformance.
> 
> Rohan G Thomas (3):
>   net: stmmac: Offload queueMaxSDU from tc-taprio
>   net: stmmac: est: Per Tx-queue error count for HLBF
>   net: stmmac: Report taprio offload status
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: Offload queueMaxSDU from tc-taprio
    https://git.kernel.org/netdev/net-next/c/c5c3e1bfc9e0
  - [net-next,2/3] net: stmmac: est: Per Tx-queue error count for HLBF
    https://git.kernel.org/netdev/net-next/c/fd5a6a71313e
  - [net-next,3/3] net: stmmac: Report taprio offload status
    https://git.kernel.org/netdev/net-next/c/5ca63ffdb94b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
