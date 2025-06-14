Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D317AD996F
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jun 2025 03:30:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3846AC36B3D;
	Sat, 14 Jun 2025 01:30:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7F3FC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 01:30:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 208A14AB3B;
 Sat, 14 Jun 2025 01:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8697C4CEE3;
 Sat, 14 Jun 2025 01:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749864616;
 bh=IpEiRYgc9LKV8Z1ziQUlfI4E1VV+WgxlOCcgZoh2KBU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FgVuJ7n2LYhSWOVu/G6MkUV9r2o2F9qZzsaF4iw3FsgyGkqtiNaqI+2nEBDLibZvX
 DZEP7l2xkroSQauSLSJCYnys0yUR4V4JRCbSDryZo23wQfB+QmHcS5+BdSf0yiNpWe
 E9sJWrIXCQA+1losiRK0nyqK/wbLD/s3EChAC+uU5RlLjgBObgJilcfjXFkBtUnKWt
 DMYMqNOE22f5MC3+vP+Ux08CKRm6gL/02oyMGLbcIjgtkpY1EdtnNcLY37Mi7ZXhfG
 EC2ZolxZ4IoDd0F4JdEkvUEiicnSvLuC0uvW1lXCMCz6v5SblnIS2sJT03e4O/V1l6
 hnUTkU8xwkrHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADE4F380AAD0; Sat, 14 Jun 2025 01:30:46 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174986464550.950968.6157080480528979172.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jun 2025 01:30:45 +0000
References: <E1uPjjx-0049r5-NN@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uPjjx-0049r5-NN@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: improve
 .set_clk_tx_rate() method error message
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

On Thu, 12 Jun 2025 16:21:17 +0100 you wrote:
> Improve the .set_clk_tx_rate() method error message to include the
> PHY interface mode along with the speed, which will be helpful to
> the RK implementations.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: improve .set_clk_tx_rate() method error message
    https://git.kernel.org/netdev/net-next/c/bd1d76a6f18f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
