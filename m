Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B19C2EC03
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 02:30:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AA66C62D5E;
	Tue,  4 Nov 2025 01:30:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62008C62D53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 01:30:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BF942436E0;
 Tue,  4 Nov 2025 01:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1562C116D0;
 Tue,  4 Nov 2025 01:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762219841;
 bh=2hn7TExh5bvx/aSQHQygAQxTFzzeJn1z4S8zBCuEYyE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=P0m+rRTQdzvbstTPD3HFTlSgA0enZRpwijBg3E7RGaOfh3LSFoYBRbsz63kvJcYwG
 zjmBAgvtrlVnIJ8kZuYyzPAJsIJ7eoIRDUY0QTNmjeV0t4lBvrQYZ+SA6oX3WJkALx
 G6PQxjS0s+UvxSaZ7JdfhI4thWNGQYhz3mzz0az5gTeU2bYT1iIR0d67OlRW/R9L1O
 J+FMcfp0qvxqpBOKKv1gi8c4+lmTRjzZ7FvB1IFypDR/7/GHrNV42i7Ey05kfG0O2u
 DIqIDM1xZX9cefoP+1YyT7WuAVTzqEZktUDcKe6bzEasrwWzWPyX59kMAjMIkSYkho
 JhzWKtGAd9Ucg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33BB13809A8A; Tue,  4 Nov 2025 01:30:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176221981575.2281445.16125578755361920845.git-patchwork-notify@kernel.org>
Date: Tue, 04 Nov 2025 01:30:15 +0000
References: <20251030182454.182406-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20251030182454.182406-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: kory.maincent@bootlin.com, vadim.fedorenko@linux.dev,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 alexis.lothore@bootlin.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: rename devlink
 parameter ts_coarse into phc_coarse_adj
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 30 Oct 2025 19:24:53 +0100 you wrote:
> The devlink param "ts_coarse" doesn't indicate that we get coarse
> timestamps, but rather that the PHC clock adjusments are coarse as the
> frequency won't be continuously adjusted. Adjust the devlink parameter
> name to reflect that.
> 
> The Coarse terminlogy comes from the dwmac register naming, update the
> documentation to better explain what the parameter is about.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: rename devlink parameter ts_coarse into phc_coarse_adj
    https://git.kernel.org/netdev/net-next/c/209ff7af79bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
