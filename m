Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D91C516462
	for <lists+linux-stm32@lfdr.de>; Sun,  1 May 2022 14:30:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D004C60467;
	Sun,  1 May 2022 12:30:16 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4371C5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 May 2022 12:30:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B56FB80D57;
 Sun,  1 May 2022 12:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F34FC385B1;
 Sun,  1 May 2022 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651408212;
 bh=JO2rWXaz1VO0+8Q8t4MBxoVTpRn6Ze8m+8FYdHuCNZ0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=mqanLxjMuoHBLTRBiJzKguslOljxPP6fPzWozxj3KepbrmuvJeNflGGUlXMhWdLY4
 xHNKJd/z/JC0Uz3qRgobsjsq1YYyaqMClom2VUEx4wmSCTHyWeeljWEq+/HWHyBJ8/
 NfQqGGf0KIB3yXNHdyt9kpC+YFUE3R5PC+mJiH4pkYQIvvZ5TcHYKBcJZQ8ubIHLAe
 yHnafj8NW68uQ3RP+B0BX0PUmpzIBopjn6vgsyUeecHY5SodET4s406dsffwyugein
 HGA2iB+vRrodT0gr6xVQ3NevRc88xSy5adp91K24gOD3HwOIi29o2s8bm6mTQLy8k6
 OjN+5hhsCtTkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2E7B9E6D402; Sun,  1 May 2022 12:30:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165140821218.17181.9897594388304532293.git-patchwork-notify@kernel.org>
Date: Sun, 01 May 2022 12:30:12 +0000
References: <20220429115807.2198448-1-tee.min.tan@linux.intel.com>
In-Reply-To: <20220429115807.2198448-1-tee.min.tan@linux.intel.com>
To: Tan Tee Min <tee.min.tan@linux.intel.com>
Cc: weifeng.voon@intel.com, kurt@linutronix.de, edumazet@google.com,
 boon.leong.ong@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 vee.khee.wong@linux.intel.com, xiaoliang.yang_1@nxp.com, joabreu@synopsys.com,
 kuba@kernel.org, pabeni@redhat.com, bhupesh.sharma@linaro.org,
 pei.lee.ling@intel.com, Ong@vger.kernel.org, hong.aun.looi@intel.com,
 tee.min.tan@intel.com, peppe.cavallaro@st.com, michael.wei.hong.sit@intel.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 mnhagan88@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, yoong.siang.song@intel.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: disable Split
 Header (SPH) for Intel platforms
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

On Fri, 29 Apr 2022 19:58:07 +0800 you wrote:
> Based on DesignWare Ethernet QoS datasheet, we are seeing the limitation
> of Split Header (SPH) feature is not supported for Ipv4 fragmented packet.
> This SPH limitation will cause ping failure when the packets size exceed
> the MTU size. For example, the issue happens once the basic ping packet
> size is larger than the configured MTU size and the data is lost inside
> the fragmented packet, replaced by zeros/corrupted values, and leads to
> ping fail.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/1] net: stmmac: disable Split Header (SPH) for Intel platforms
    https://git.kernel.org/netdev/net/c/47f753c1108e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
