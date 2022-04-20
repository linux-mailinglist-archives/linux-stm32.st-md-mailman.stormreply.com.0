Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E05085AC
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Apr 2022 12:20:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1ED8C6049B;
	Wed, 20 Apr 2022 10:20:14 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD963C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Apr 2022 10:20:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42EBEB81A62;
 Wed, 20 Apr 2022 10:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 038FEC385A8;
 Wed, 20 Apr 2022 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650450011;
 bh=/kdrOscUXpoTe8OKXrVoGjhZrmlONVarr3cDpQHst9I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=r4euG7tA1dKEixKtNEorriN9zHT/PHz65n++wmmdngajFBvjX1BpmR3HS1B3dPmvs
 ACZgRaO+sTLRl06co6jxBAGu3LelTq4yHaKHEM1KeJ/wBs+FAJGvAsD4E6fMgq5wTr
 6ZnzYXjhj60w5lsL1Bj+8+cUUKgdIV7jHj2JYbZBALB3tmeZnmAgXTqL9TZ6jN2IYa
 vN+NChKpFlgPwqWcQ3HwsrIr8aJiLlxUBB57D2nzj7Xii3XbeUPUtjSTo+zEnEem46
 YNRr/+IHFg9WfL5CXNU3E6T1UwiNn3zWi8InFzzv3zTUPS7ssBEebc5l1BTcrAxn0E
 miEuziuYqydIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DC37EE7399D; Wed, 20 Apr 2022 10:20:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165045001089.14273.9231245992154971496.git-patchwork-notify@kernel.org>
Date: Wed, 20 Apr 2022 10:20:10 +0000
References: <20220419084226.38340-1-haokexin@gmail.com>
In-Reply-To: <20220419084226.38340-1-haokexin@gmail.com>
To: Kevin Hao <haokexin@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, zhengdejin5@gmail.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net] net: stmmac: Use
 readl_poll_timeout_atomic() in atomic state
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

On Tue, 19 Apr 2022 16:42:26 +0800 you wrote:
> The init_systime() may be invoked in atomic state. We have observed the
> following call trace when running "phc_ctl /dev/ptp0 set" on a Intel
> Agilex board.
>   BUG: sleeping function called from invalid context at drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c:74
>   in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 381, name: phc_ctl
>   preempt_count: 1, expected: 0
>   RCU nest depth: 0, expected: 0
>   Preemption disabled at:
>   [<ffff80000892ef78>] stmmac_set_time+0x34/0x8c
>   CPU: 2 PID: 381 Comm: phc_ctl Not tainted 5.18.0-rc2-next-20220414-yocto-standard+ #567
>   Hardware name: SoCFPGA Agilex SoCDK (DT)
>   Call trace:
>    dump_backtrace.part.0+0xc4/0xd0
>    show_stack+0x24/0x40
>    dump_stack_lvl+0x7c/0xa0
>    dump_stack+0x18/0x34
>    __might_resched+0x154/0x1c0
>    __might_sleep+0x58/0x90
>    init_systime+0x78/0x120
>    stmmac_set_time+0x64/0x8c
>    ptp_clock_settime+0x60/0x9c
>    pc_clock_settime+0x6c/0xc0
>    __arm64_sys_clock_settime+0x88/0xf0
>    invoke_syscall+0x5c/0x130
>    el0_svc_common.constprop.0+0x4c/0x100
>    do_el0_svc+0x7c/0xa0
>    el0_svc+0x58/0xcc
>    el0t_64_sync_handler+0xa4/0x130
>    el0t_64_sync+0x18c/0x190
> 
> [...]

Here is the summary with links:
  - [v2,net] net: stmmac: Use readl_poll_timeout_atomic() in atomic state
    https://git.kernel.org/netdev/net/c/234901de2bc6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
