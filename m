Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4584846D28
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 11:00:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84CEDC6DD9F;
	Fri,  2 Feb 2024 10:00:34 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E17AC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 10:00:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2225DCE29C1;
 Fri,  2 Feb 2024 10:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A738C433F1;
 Fri,  2 Feb 2024 10:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706868030;
 bh=REjEIQrnQERARGidm7gNYzGY6yUMPRZUpbx7KHkn8Jo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oEgjRovbR2P8NSAlqdZ6bYr8Yq/WI2RmzrN3RC2XXakiaY6HdFrKK/OoNJkPHLKug
 bDQathmKTYSuEQc3Jy0tyCsQZw0hfUP8rx18E0wbKRgMYi+POupmghy/o33MSbHHCX
 VQsvBJKF7St19tA0OTA/wNEUFL0i5PfqHfkdCACXX6GEHuhEsLgnTEWFWT+bqkcfbf
 xlZCTNiqiKN6yWjZ1wrR2eG46jM0cOT9Owa4Is9QisZ60t1T/6AGph+ApgmY2jKNfP
 hj9JoKecy95QsViDRZftZEQksaptQYmVPha2uGdkBH1U9FukybWFfXTWU1k1euNnSC
 SstKzcvVkO3Sw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2C758D8C970; Fri,  2 Feb 2024 10:00:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170686803017.11061.18210179700306129756.git-patchwork-notify@kernel.org>
Date: Fri, 02 Feb 2024 10:00:30 +0000
References: <20240131020828.2007741-1-0x1207@gmail.com>
In-Reply-To: <20240131020828.2007741-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, horms@kernel.org, jpinto@synopsys.com,
 netdev@vger.kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, xfr@outlook.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: xgmac: fix handling
 of DPP safety error for DMA channels
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
by David S. Miller <davem@davemloft.net>:

On Wed, 31 Jan 2024 10:08:28 +0800 you wrote:
> Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> XGMAC core") checks and reports safety errors, but leaves the
> Data Path Parity Errors for each channel in DMA unhandled at all, lead to
> a storm of interrupt.
> Fix it by checking and clearing the DMA_DPP_Interrupt_Status register.
> 
> Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: xgmac: fix handling of DPP safety error for DMA channels
    https://git.kernel.org/netdev/net/c/46eba193d04f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
