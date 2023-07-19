Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D53759262
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jul 2023 12:10:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FA71C6B442;
	Wed, 19 Jul 2023 10:10:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04DB0C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jul 2023 10:10:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0CF661380;
 Wed, 19 Jul 2023 10:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2FC2C43391;
 Wed, 19 Jul 2023 10:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689761421;
 bh=c2UEHPFuhGfZOFd31QJQjfIX++Nbo6YKMqG9JatMuTU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oJMsmvwZmkpUeh7anTEfAa/IBxDqJUCHmHkgHDIIC5FGvua/XZKRDcyLRJjcLbhmu
 ueSV/ebApoM4f/6qK0rBZdPe/0Cz7qM8kXV3m+J7wju1TgoryW3WhwKE6Hk9y1k2p6
 M2aQ50hU90xwEjG8R4rzRN9i2VMMQ+TL+BNciL/J+IZ8R463ML8G70gRRyoIvmmpLa
 NSmX5l7GkcTiAuj8pl9Owg3sG6NbRWzh7YnN6JwSWc7CmzTLAV25LMFwP2dwjQ36J4
 yM0YJLuZ9ycu3aNchxsZusFBumZPBXZW19rDYQXhzrJOiQKZ8llfPHhrd8RXAMSJID
 WMKqRbkn/aOcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B5A30E21EFF; Wed, 19 Jul 2023 10:10:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168976142174.5988.2207846071493224223.git-patchwork-notify@kernel.org>
Date: Wed, 19 Jul 2023 10:10:21 +0000
References: <20230717120603.5053-1-rohan.g.thomas@intel.com>
In-Reply-To: <20230717120603.5053-1-rohan.g.thomas@intel.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Cc: andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: xgmac: Fix L3L4
	filter count
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

On Mon, 17 Jul 2023 20:06:03 +0800 you wrote:
> Get the exact count of L3L4 filters when the L3L4FNUM field of
> HW_FEATURE1 register is >= 8. If L3L4FNUM < 8, then the number of L3L4
> filters supported by XGMAC is equal to L3L4FNUM. From L3L4FNUM >= 8
> the number of L3L4 filters goes on like 8, 16, 32, ... Current
> maximum of L3L4FNUM = 10.
> 
> Also, fix the XGMAC_IDDR bitmask of L3L4_ADDR_CTRL register. IDDR
> field starts from the 8th bit of the L3L4_ADDR_CTRL register. IDDR[3:0]
> indicates the type of L3L4 filter register while IDDR[8:4] indicates
> the filter number (0 to 31). So overall 9 bits are used for IDDR
> (i.e. L3L4_ADDR_CTRL[16:8]) to address the registers of all the
> filters. Currently, XGMAC_IDDR is GENMASK(15,8), causing issues
> accessing L3L4 filters above 15 for those XGMACs configured with more
> than 16 L3L4 filters.
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: stmmac: xgmac: Fix L3L4 filter count
    https://git.kernel.org/netdev/net-next/c/47448ff2d5c7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
