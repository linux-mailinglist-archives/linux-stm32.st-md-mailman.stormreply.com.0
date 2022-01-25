Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5175A49B8F4
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 17:46:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06C08C5F1D5;
	Tue, 25 Jan 2022 16:46:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FD27C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 16:46:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6950E60B55;
 Tue, 25 Jan 2022 16:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CA27C340EC;
 Tue, 25 Jan 2022 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643129174;
 bh=E6nb9O5phzVJO80Rxm8R+fHyUvq0B/Pzt/JBMopH6iU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Aj6lWgOhJpgv3x1BncmUdCyFRng8SiLmfGyPTCxHkfMUR1JMn6Twk+8WePAKRGPic
 IbhUu7r5A8Ifu5WTwgFrBBgPhQUt5JfvELDSnKgXRpYaGYNnph6TIarRtiTYgWkD1G
 VGG/aePlYwnTn/jf+y+NvCp7XweWNkBLAanmL7CFiBcggNrsdeUyXwWqYdp7uQMI9P
 zgFapGX43/V2d2XrCNnJi29JVtcL5XH99FSxT8iU0fAFQ1R5VQ9fZAhcCH6y6EC/fl
 GqIoiP3cDoLYacwhY+z/ezyJ/0bGrzAGVVgz623zzL1Qm9L6HCS8eeNNTBlLfQs22V
 eqt7QKWi1WFNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 31E2FE5D087; Tue, 25 Jan 2022 16:46:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164312917420.15904.15680846947944122595.git-patchwork-notify@kernel.org>
Date: Tue, 25 Jan 2022 16:46:14 +0000
References: <20220123155458.2288-1-jszhang@kernel.org>
In-Reply-To: <20220123155458.2288-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: reduce unnecessary wakeups
	from eee sw timer
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
by David S. Miller <davem@davemloft.net>:

On Sun, 23 Jan 2022 23:54:58 +0800 you wrote:
> Currently, on EEE capable platforms, if EEE SW timer is used, the SW
> timer cause 1 wakeup/s even if the TX has successfully entered EEE.
> Remove this unnecessary wakeup by only calling mod_timer() if we
> haven't successfully entered EEE.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> [...]

Here is the summary with links:
  - net: stmmac: reduce unnecessary wakeups from eee sw timer
    https://git.kernel.org/netdev/net/c/c74ead223deb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
