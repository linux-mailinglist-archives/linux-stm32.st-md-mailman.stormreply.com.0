Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 986D1502820
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Apr 2022 12:20:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B45DC60496;
	Fri, 15 Apr 2022 10:20:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3787C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Apr 2022 10:20:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 707316222C;
 Fri, 15 Apr 2022 10:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 511E6C385A8;
 Fri, 15 Apr 2022 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650018014;
 bh=dWiZ6Nex83uUYtY7bm/jpBV/+lybuaL7Uo7GprLVjlc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hVLMeNdzGLdJ2AR8Zb6T4HRs5Fssw8pw7WnozHa2u0pTrBct8hwTZ4HAN+3UIzxiF
 kqJPaMmlTqOBev01Q3NQ+z/vjT9WxKcYvYCxN5pVQ4NABnDsiGqXZPSxQ9FTe0GRMK
 PlivtVADa+AVPfuHaRQ+fsLSwkkmBn/JDQjQYaO8FIzM66aCiL35n6H6Ziwh32oAbE
 fs3LJrPP/WHtKH/qfRScRH/WhjFkyF8orwlKthvtZczED8wWUhMfvlJP7KcCEklD5q
 b5O2r54ZuhkYFThDAyFEibJOw0aeWNRdR1kFRpxKwU2jJ2sN6Tt7sA30dB3NZAKlI8
 jqY7OlhOyMZgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 39C29EAC096; Fri, 15 Apr 2022 10:20:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165001801423.12692.14282066023712960077.git-patchwork-notify@kernel.org>
Date: Fri, 15 Apr 2022 10:20:14 +0000
References: <20220413093801.2538628-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220413093801.2538628-1-chi.minghao@zte.com.cn>
To: CGEL <cgel.zte@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, zealci@zte.com.cn,
 chi.minghao@zte.com.cn, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: stmmac_main: using
 pm_runtime_resume_and_get instead of pm_runtime_get_sync
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
by David S. Miller <davem@davemloft.net>:

On Wed, 13 Apr 2022 09:38:01 +0000 you wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> 
> [...]

Here is the summary with links:
  - net: stmmac: stmmac_main: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
    https://git.kernel.org/netdev/net-next/c/85648865bb95

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
