Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A6E623A07
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Nov 2022 03:50:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 198F2C6504E;
	Thu, 10 Nov 2022 02:50:18 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79DDEC5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 02:50:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C5A7B82065;
 Thu, 10 Nov 2022 02:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F187C433D7;
 Thu, 10 Nov 2022 02:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668048614;
 bh=ahZ3E/50V7Zw58bHNzS10THCBASQ+JFWuXNa3ZbHRiQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KNg8mpGgIUrSKPH5DN4hvfcxCO7a4wvx5cJ8tdQSJ8mk2i9KYduEkI/LhBuBupTwT
 YWaX5w+Yh02xDRph2bc50RN5HfCN10ElRJysUvRImGNGx0IctaI28MgTD+HBFC1s1q
 5TSd+GmoH6sPLTqVlTmd7v5POVzyXLFCBKJACoY03dhZoFBcquqUqdBMbMNkhhBIk0
 MBgzXJMRq9vvPAFPPOcyYrNx5LYlmiSKJCdDieYyU3Q5ByQgnZCk35A0V0+sa9MdkS
 7OFOEaapq857w/zinZuffsyZ+AeId6C8QO9LvWuTA7A+JRqZpl2ULq51kSGVXn7xMP
 6FqqzOatx7lmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1FC53C395F6; Thu, 10 Nov 2022 02:50:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166804861412.6959.10905430097116561347.git-patchwork-notify@kernel.org>
Date: Thu, 10 Nov 2022 02:50:14 +0000
References: <20221108020811.12919-1-yi.fang.gan@intel.com>
In-Reply-To: <20221108020811.12919-1-yi.fang.gan@intel.com>
To: Gan Yi Fang <yi.fang.gan@intel.com>
Cc: muhammad.husaini.zulkifli@intel.com, linux-kernel@vger.kernel.org,
 weifeng.voon@intel.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 pei.lee.ling@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, michael.wei.hong.sit@intel.com, peppe.cavallaro@st.com,
 hong.aun.looi@intel.com, pabeni@redhat.com, tee.min.tan@intel.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] stmmac: intel: Update PCH PTP
 clock rate from 200MHz to 204.8MHz
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

On Mon,  7 Nov 2022 21:08:11 -0500 you wrote:
> From: "Tan, Tee Min" <tee.min.tan@intel.com>
> 
> Current Intel platform has an output of ~976ms interval
> when probed on 1 Pulse-per-Second(PPS) hardware pin.
> 
> The correct PTP clock frequency for PCH GbE should be 204.8MHz
> instead of 200MHz. PSE GbE PTP clock rate remains at 200MHz.
> 
> [...]

Here is the summary with links:
  - [net,1/1] stmmac: intel: Update PCH PTP clock rate from 200MHz to 204.8MHz
    https://git.kernel.org/netdev/net/c/dcea1a8107c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
