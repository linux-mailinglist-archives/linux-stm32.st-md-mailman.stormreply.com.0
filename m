Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280DB2C699
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 16:09:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D77F0C3F949;
	Tue, 19 Aug 2025 14:09:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E745CC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 14:09:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B87B65C6265;
 Tue, 19 Aug 2025 14:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6344EC4CEF1;
 Tue, 19 Aug 2025 14:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755612596;
 bh=C9R2a3UImpDUwLItRbJv/q0jFqTxivYVJ3q07lWXyDI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=apcXmVfafje+5HvFMjxEsJPOn0tFF4tPGhw+16QWPs9YoiW7GpcOluBCHsrNrvBRG
 bTE0og6J8sNXAkgXhPbt7zfNaUsrzssFfPn8ffER0/+EXGoTsq/ddbWaarIK6yA4Xb
 /LhNUMpMA8Mmz5J04vhLzSbQdXAEXfwNzAG97L8U7nl2Bvopemdu77tyXfpnMASV7h
 Cx59/ziGZ0FI2TRo8APi/jWQ+KruDxim9jvZ5QuCdR+DAWf+YYLHvVxK1Mldd7UtYH
 T11iBytdeNXR/ghlc3bmyeaTleuZ1TayMWmBZXv/prdaKy7hrDzp3XC1tgLs9h31Yp
 aC4LQzgR9fYFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 71057383BF58; Tue, 19 Aug 2025 14:10:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175561260627.3565986.5334175865969423538.git-patchwork-notify@kernel.org>
Date: Tue, 19 Aug 2025 14:10:06 +0000
References: <20250815023515.114-1-kernel@airkyi.com>
In-Reply-To: <20250815023515.114-1-kernel@airkyi.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: linux-kernel@vger.kernel.org, jonas@kwiboo.se, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 andrew+netdev@lunn.ch, edumazet@google.com, chaoyi.chen@rock-chips.com,
 mcoquelin.stm32@gmail.com, david.wu@rock-chips.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: ethernet: stmmac:
 dwmac-rk: Make the clk_phy could be used for external phy
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 15 Aug 2025 10:35:15 +0800 you wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> For external phy, clk_phy should be optional, and some external phy
> need the clock input from clk_phy. This patch adds support for setting
> clk_phy for external phy.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy
    https://git.kernel.org/netdev/net-next/c/da114122b831

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
