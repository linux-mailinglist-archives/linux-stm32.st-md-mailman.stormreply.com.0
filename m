Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 897A29687E5
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 14:50:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 366D6C78011;
	Mon,  2 Sep 2024 12:50:38 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15250C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 12:50:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E2DC8A42164;
 Mon,  2 Sep 2024 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA940C4CEC7;
 Mon,  2 Sep 2024 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725281429;
 bh=jUGbCvappkupnOCyTWEDiv39z61vi1zMHP+E6B0TIas=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nvGAMgLP3s8VI2YMGOKyxVIC8+pxlpcA9hoEhVhOygDvDypHdD6T365PX4HOYokqr
 fR249ww16kvtWdcdkRX+BxVAOg3thn01r/nfIZY9Z6/I/93WtYKSmH7FmtrN+OLYJm
 mobF67bxpBAPKmKA2SBzyUd0ETwR+4F/kr5H9kw9sl7obbEEZy+q6Oa5ZGjbR1pz/0
 avJuxrAY/34/EXtXP9vAwJ5oEDRyE4O0KaFUJqtZa32LjJLQ7GRBST79i0RbfX/kqB
 H1NLBTvNk/d8RwMTMMhyl84UMN7TFtljNfFQLP09rDeKkMHrlpvqzOqOwVffjKF5IC
 +SzLyCAQ53jrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADCBE3805D82; Mon,  2 Sep 2024 12:50:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172528143025.3879101.12070327930578718589.git-patchwork-notify@kernel.org>
Date: Mon, 02 Sep 2024 12:50:30 +0000
References: <20240829-stmmac-no-ethtool-begin-v2-1-a11b497a7074@redhat.com>
In-Reply-To: <20240829-stmmac-no-ethtool-begin-v2-1-a11b497a7074@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, quic_abchauha@quicinc.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, quic_scheluve@quicinc.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 d.dolenko@metrotek.ru
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: drop the ethtool
	begin() callback
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
by David S. Miller <davem@davemloft.net>:

On Thu, 29 Aug 2024 15:48:44 -0500 you wrote:
> This callback doesn't seem to serve much purpose, and prevents things
> like:
> 
>     - systemd.link files from disabling autonegotiation
>     - carrier detection in NetworkManager
>     - any ethtool setting
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: drop the ethtool begin() callback
    https://git.kernel.org/netdev/net-next/c/55ddb6c5a3ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
