Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24DC76E85
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Nov 2025 03:00:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D9B7C5F1D9;
	Fri, 21 Nov 2025 02:00:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F79AC597BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Nov 2025 02:00:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CCDFC60216;
 Fri, 21 Nov 2025 02:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0F3C4CEF1;
 Fri, 21 Nov 2025 02:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763690450;
 bh=oURpXBr3KdDn9PGKvZ71lA/uZ3b0bjDvzcwrD9A6oco=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=RDaxqjBXt1j3UIdjy7D7SVnLs8g7GgWn0u8nIwwGC1fkiNvamtVFDj/FQO/M8D/eh
 ZYIA8xclzKyMLPZroHugJ3RkCZs5j9pKq0uWtuDFi0aBxiZtSOUzYSr5VSAEob6tbA
 +24SZmZdWrSItahXVbfOjubhuO2Q9wBLd3uWK8Q1anPuB2bUlhg79qq/F3gvp3PXJe
 GCBA+D0/jJI9zu1fGsaJShWGCCkqQPKRf5p99z7rHol3XvaTdbp8EZvcxoMvleDjLd
 cvjpgHB4iUi5H3cdt7LM8reUKZkE25YppGHm/F3OQ8XDVF7CXgsxWVC/aJfF3PxY64
 b0Fp/3p8/tkTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE07F3A41003; Fri, 21 Nov 2025 02:00:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176369041551.1856901.1355582687378802410.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 02:00:15 +0000
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
In-Reply-To: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, s32@nxp.com, heiko@sntech.de, fustini@kernel.org,
 edumazet@google.com, guoren@kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 kuba@kernel.org, pabeni@redhat.com, keguang.zhang@gmail.com,
 linux-sunxi@lists.linux.dev, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, davem@davemloft.net,
 wefu@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: pass struct
	device to init/exit
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 19 Nov 2025 10:02:56 +0000 you wrote:
> Rather than passing the platform device to the ->init() and ->exit()
> methods, make these methods useful for other devices by passing the
> struct device instead. Update the implementations appropriately for
> this change.
> 
> Move the calls for these methods into the core driver's probe and
> remove methods from the stmmac_platform layer.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: pass struct device to init()/exit() methods
    https://git.kernel.org/netdev/net-next/c/85081acc6b11
  - [net-next,2/3] net: stmmac: move probe/remove calling of init/exit
    https://git.kernel.org/netdev/net-next/c/32da89a840e8
  - [net-next,3/3] net: stmmac: rk: convert to init()/exit() methods
    https://git.kernel.org/netdev/net-next/c/1a62894e040d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
