Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B0F4AC4E2
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:06:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13FBAC60465;
	Mon,  7 Feb 2022 16:06:28 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8180AC60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:06:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC50FB835CD;
 Thu,  3 Feb 2022 22:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 780ACC340EB;
 Thu,  3 Feb 2022 22:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643926252;
 bh=xP9CJWr1aBy5mpv9X2dpcHXvU38UDBv+cO2U3vskBiE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rcG6q+uta8JxabOggF80CvwgiDM4iZWoXpXMoWk97x7YEtnpfK6DMBbrkq0AO6uFE
 Pob5+tuxXXlonhnad4KOOqHNUVGBTbqh2i310NlTWfAxhs89cGM9WJml7nirsmowEE
 rgUf2tol2bSSN8bQwE2bEe3Yq7Wqz8YT4f5eBU6OHjlFesSYH+qUn4HS3hJ1jzjkFH
 rkP7I9J4kXdQhE3jc8jYIvJ0Z3eHGhGvH4LfqrGR7fv/s+iDjl+NC0D6t1fogk2Wjf
 TpwoC2z6GcZV6o4Ito975GUGWsyQh8Hj7YU8s7WMi2j51jC5+pCTHKsNis1ZkRpfCw
 nIi6EQBnkC09w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5B735E5869F; Thu,  3 Feb 2022 22:10:52 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164392625236.29991.16982092505073746974.git-patchwork-notify@kernel.org>
Date: Thu, 03 Feb 2022 22:10:52 +0000
References: <20220203160025.750632-1-yannick.vignon@oss.nxp.com>
In-Reply-To: <20220203160025.750632-1-yannick.vignon@oss.nxp.com>
To: Yannick Vignon <yannick.vignon@oss.nxp.com>
Cc: qiangqing.zhang@nxp.com, linux-kernel@vger.kernel.org,
 yannick.vignon@nxp.com, netdev@vger.kernel.org, xiaoliang.yang_1@nxp.com,
 mingkai.hu@nxp.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, sebastien.laveze@oss.nxp.com,
 joabreu@synopsys.com, rayagond@vayavyalabs.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, olteanv@gmail.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: ensure PTP time register
 reads are consistent
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

On Thu,  3 Feb 2022 17:00:25 +0100 you wrote:
> From: Yannick Vignon <yannick.vignon@nxp.com>
> 
> Even if protected from preemption and interrupts, a small time window
> remains when the 2 register reads could return inconsistent values,
> each time the "seconds" register changes. This could lead to an about
> 1-second error in the reported time.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: ensure PTP time register reads are consistent
    https://git.kernel.org/netdev/net/c/80d4609008e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
