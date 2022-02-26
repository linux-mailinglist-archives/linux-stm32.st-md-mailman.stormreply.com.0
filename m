Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A694C5433
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Feb 2022 07:30:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC6EAC60491;
	Sat, 26 Feb 2022 06:30:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38DFBC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Feb 2022 06:30:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D254B60DB5;
 Sat, 26 Feb 2022 06:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C1F3C340F1;
 Sat, 26 Feb 2022 06:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645857011;
 bh=/K+I88kFOkeotgI9D4BFG3RofsTfjAhqd7KXqU4y6qw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Emu15xM8K5moMZczgPYnEUx4sphKNE03tKA6hoGeOp2h50mVmuvLrVND6cl1r0MfY
 kpnZRapYOs4yOsDze4Cwm3cJmEdU7dytrAuum3nYBhxPkkyE1YCS6V+SUvNWgPFpjB
 1zLPG+jkcsn/9AnnDTCrrMkhPAmrp67NPdyD8uAmrBQYB8OsiwlihauJ3pV6R4Tk0T
 um6cQP+m+oxacpR63vJ8Q0O29e8Vhmp0L15upjtGofU2NsgjlmtZEtfUtTDkzdob20
 HcIHBR8U97Qj/X7pNpYHknibN8SP9kLTdxk7GO7SwG7I+uEjM3xkvGgFLaXpHswigN
 Spd+TTVjEiObw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7D41AEAC09B; Sat, 26 Feb 2022 06:30:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164585701150.29742.14448723094715573192.git-patchwork-notify@kernel.org>
Date: Sat, 26 Feb 2022 06:30:11 +0000
References: <20220225023325.474242-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20220225023325.474242-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: Enable
 2.5Gbps for Intel AlderLake-S
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 25 Feb 2022 10:33:25 +0800 you wrote:
> Intel AlderLake-S platform is capable of running on 2.5GBps link speed.
> 
> This patch enables 2.5Gbps link speed on AlderLake-S platform.
> 
> Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Here is the summary with links:
  - [net-next,1/1] stmmac: intel: Enable 2.5Gbps for Intel AlderLake-S
    https://git.kernel.org/netdev/net-next/c/23d743301198

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
