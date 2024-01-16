Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786D82EB32
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 10:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCBDCC6B457;
	Tue, 16 Jan 2024 09:00:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2EB0C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 09:00:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75E3661136;
 Tue, 16 Jan 2024 09:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D0E3C433F1;
 Tue, 16 Jan 2024 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705395624;
 bh=53zGYMNuY6A9Eru6GhkOhn5Cr1dIJ1faHUaqKCzyNPc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=teJThpGpwKmSmAZ3a7jv/FnjTVitb/G9qIZimHkXPdMZs3eNwSZHsuzBDMd5mHtdO
 4PEOUieCh074GQOOW5LNKoVlULhCnfZdpIoUYqmfhnQk2zJMdrSOGuBnuUZ4rla5o7
 SnoJeTTupXq+0p3sm2EyqsQLzDpLUXioY+msu7ixQPdm6JxQVhA8G1Q9GhIxCm/lNw
 iAJaRyJxIvZFYrxOeYenbUA4cSjiiW7uvzxWTv4avVmNYQjQKwtOnXL77bT+SNj8L1
 3+1PwYNpgJK4lsuNsSgbYXM9ON/yUgMX7/Ss7rVZuzoeQwejfK1l4NCpI10GYXLQPl
 Ro/8IU8HgKdnA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 00593D8C96D; Tue, 16 Jan 2024 09:00:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170539562399.29237.17991521216280406145.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jan 2024 09:00:23 +0000
References: <20240112021249.24598-1-maqianga@uniontech.com>
In-Reply-To: <20240112021249.24598-1-maqianga@uniontech.com>
To: Qiang Ma <maqianga@uniontech.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: ethtool: Fixed calltrace
 caused by unbalanced disable_irq_wake calls
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 12 Jan 2024 10:12:49 +0800 you wrote:
> We found the following dmesg calltrace when testing the GMAC NIC notebook:
> 
> [9.448656] ------------[ cut here ]------------
> [9.448658] Unbalanced IRQ 43 wake disable
> [9.448673] WARNING: CPU: 3 PID: 1083 at kernel/irq/manage.c:688 irq_set_irq_wake+0xe0/0x128
> [9.448717] CPU: 3 PID: 1083 Comm: ethtool Tainted: G           O      4.19 #1
> [9.448773]         ...
> [9.448774] Call Trace:
> [9.448781] [<9000000000209b5c>] show_stack+0x34/0x140
> [9.448788] [<9000000000d52700>] dump_stack+0x98/0xd0
> [9.448794] [<9000000000228610>] __warn+0xa8/0x120
> [9.448797] [<9000000000d2fb60>] report_bug+0x98/0x130
> [9.448800] [<900000000020a418>] do_bp+0x248/0x2f0
> [9.448805] [<90000000002035f4>] handle_bp_int+0x4c/0x78
> [9.448808] [<900000000029ea40>] irq_set_irq_wake+0xe0/0x128
> [9.448813] [<9000000000a96a7c>] stmmac_set_wol+0x134/0x150
> [9.448819] [<9000000000be6ed0>] dev_ethtool+0x1368/0x2440
> [9.448824] [<9000000000c08350>] dev_ioctl+0x1f8/0x3e0
> [9.448827] [<9000000000bb2a34>] sock_ioctl+0x2a4/0x450
> [9.448832] [<900000000046f044>] do_vfs_ioctl+0xa4/0x738
> [9.448834] [<900000000046f778>] ksys_ioctl+0xa0/0xe8
> [9.448837] [<900000000046f7d8>] sys_ioctl+0x18/0x28
> [9.448840] [<9000000000211ab4>] syscall_common+0x20/0x34
> [9.448842] ---[ end trace 40c18d9aec863c3e ]---
> 
> [...]

Here is the summary with links:
  - net: stmmac: ethtool: Fixed calltrace caused by unbalanced disable_irq_wake calls
    https://git.kernel.org/netdev/net/c/a23aa0404218

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
