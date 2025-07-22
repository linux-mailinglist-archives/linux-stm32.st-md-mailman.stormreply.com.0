Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FD1B0CEBC
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 02:30:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58CA2C3F933;
	Tue, 22 Jul 2025 00:30:11 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EA63C349C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 00:30:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4D017A55E36;
 Tue, 22 Jul 2025 00:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B36C4CEF7;
 Tue, 22 Jul 2025 00:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753144208;
 bh=EuXF+5F3Ni9nk0OZtht9On3rD4KnpjFnW5CiFlFPJ4U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hNvVM2ILTkgT2tJhvZUztstWQeW8RdLLShELouOYs4IMW5F81FnEhAePJrVZN1iZA
 LnRxGkRwfNx1V3F+vHpPpLbycJ52oZx4as5KD1Mq/OP2a3Mp8141w1YZdOnd6DVZsv
 V7ml8aNpHm+5fYhrOWAfCYOCD8sVDD/1+RTYoz8DZFh9IrkYDIgCQCH65Mte84SzNq
 LvYA3Xp8xB8zNX49Dx0UTdQhQup4aNiOkynqE5qbV7M+m/hZ8ufSOrMG6F1QJYTJjD
 ulTMxFwpCH14Ze7CDqzNDZkRO9nxNX9K8ycX14X03wId75FQ0nHQNR6aiNoKXTLf+J
 xYHdQ/G1KxnzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAE02383B267; Tue, 22 Jul 2025 00:30:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175314422650.243210.16859795582435366531.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 00:30:26 +0000
References: <20250717071109.8213-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250717071109.8213-1-biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: biju.das.au@gmail.com, linux-kernel@vger.kernel.org,
 geert+renesas@glider.be, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac:
 dwmac-renesas-gbeth: Add PM suspend/resume callbacks
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

On Thu, 17 Jul 2025 08:11:06 +0100 you wrote:
> Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
> 
> The PM deep entry is executed by pressing the SLEEP button and exit from
> entry is by pressing the power button.
> 
> Logs:
> root@smarc-rzg3e:~# PM: suspend entry (deep)
> Filesystems sync: 0.115 seconds
> Freezing user space processes
> Freezing user space processes completed (elapsed 0.002 seconds)
> OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> NOTICE:  BL2: SYS_LSI_PRR: 0x0
> NOTICE:  BL2: Booting BL31
> renesas-gbeth 15c30000.ethernet end0: Link is Down
> Disabling non-boot CPUs ...
> psci: CPU3 killed (polled 0 ms)
> psci: CPU2 killed (polled 0 ms)
> psci: CPU1 killed (polled 0 ms)
> Enabling non-boot CPUs ...
> Detected VIPT I-cache on CPU1
> GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> CPU1 is up
> Detected VIPT I-cache on CPU2
> GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> CPU2 is up
> Detected VIPT I-cache on CPU3
> GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> CPU3 is up
> dwmac4: Master AXI performs fixed burst length
> 15c30000.ethernet end0: No Safety Features support found
> 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
> 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
> dwmac4: Master AXI performs fixed burst length
> 15c40000.ethernet end1: No Safety Features support found
> 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
> 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
> OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: dwmac-renesas-gbeth: Add PM suspend/resume callbacks
    https://git.kernel.org/netdev/net-next/c/72b4612af36f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
