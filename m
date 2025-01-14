Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF1DA0FF09
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 04:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D043C7802D;
	Tue, 14 Jan 2025 03:10:24 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A94F0C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 03:10:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A226A400D3;
 Tue, 14 Jan 2025 03:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A19AC4CEDF;
 Tue, 14 Jan 2025 03:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736824215;
 bh=CVj7TdloU+gXG15A51Peimye0OPTDRYZodtEP33PreQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cgGCAKYt4Z8Bvt5yPHuzRjwgq66Qk+KX8Rk1orS5F9+AyZx8Y7udllHQcsV6Y4UkM
 aMEkvnIv9bI6OdLNQwy8Mti+10ZMuQ3mbnfoYN8kV5ueFTtyn3OyoUIBkez6kVfMbJ
 A8y2CVvIWyQR88uEcmUfXXk1GclAdwRGWhBgPrnCyyoEUKV/3GTgftoC95MYoMmPrF
 178ZXRLME6ijIQ5jckBIxzWigi+RMn88oBWLsnbAy7m7BpY+hHpW28i8ze2c8wtuDH
 tR4GN6MBBQyjBrXdqmSrYd9rama6K/kAUAQICON9xHOUbTH/fkuBNeyEuCaBaVzC7q
 xH5OkE+ybhUDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34B0E380AA5F; Tue, 14 Jan 2025 03:10:39 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173682423774.3717681.2700579800997856759.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jan 2025 03:10:37 +0000
References: <20250109155842.60798-1-rgallaispou@gmail.com>
In-Reply-To: <20250109155842.60798-1-rgallaispou@gmail.com>
To: =?utf-8?q?Rapha=C3=ABl_Gallais-Pou_=3Crgallaispou=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: sti: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
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

On Thu,  9 Jan 2025 16:58:42 +0100 you wrote:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
> Changes in v2:
>   - Split serie in single patches
>   - Remove irrelevant 'Link:' from commit log
>   - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-5-c7d4c4856336@gmail.com
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: sti: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
    https://git.kernel.org/netdev/net-next/c/6e702e6aba84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
