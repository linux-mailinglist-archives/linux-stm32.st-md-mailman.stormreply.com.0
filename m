Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74BB30A65
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 02:30:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 332DFC349C4;
	Fri, 22 Aug 2025 00:30:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B3ABC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 00:30:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E964C41A0F;
 Fri, 22 Aug 2025 00:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C636BC4CEED;
 Fri, 22 Aug 2025 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755822621;
 bh=7BDziKGy0nYnSWBVNd9Y5a/fWiagJtMenNbERVY62z4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=r4VCFcVUOqFKQasKbMSVD1e7GJJ7Yq94Zh7XZXHQEfnBc460BPXaFvSUBnvI+mQHW
 LMF4ggA8+sTKBOqBwJudBQXKKupmlUClsHOwmTVXuyw8nENcN/92rfGYytfIjkOtwW
 ChxO81ClVPUvous5/b7+/yb3PnOW5h/v0WIswBFcsGhOxqWoQwk2AzRKONdOPHXisW
 USggvjcyYHZpTUvC8jtA0Thv3GEnb+/0Dc3rCE2S/emYyzyR+Sum4HaOyYQ3cdiKSH
 lB5xdqylwz+Gg+LnLkCqfwm+ytgBHwrAV2oILe2Rcp5FleispZDaHBjVnch834IGVF
 hXg//iKHfAPDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33CF3383BF68; Fri, 22 Aug 2025 00:30:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175582263074.1251664.13209370832398636375.git-patchwork-notify@kernel.org>
Date: Fri, 22 Aug 2025 00:30:30 +0000
References: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uojpo-00BMoL-4W@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix
 stmmac_simple_pm_ops build errors
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

On Wed, 20 Aug 2025 15:30:40 +0100 you wrote:
> The kernel test robot reports that various drivers have an undefined
> reference to stmmac_simple_pm_ops. This is caused by
> EXPORT_SYMBOL_GPL_SIMPLE_DEV_PM_OPS() defining the struct as static
> and omitting the export when CONFIG_PM=n, unlike DEFINE_SIMPLE_PM_OPS()
> which still defines the struct non-static.
> 
> Switch to using DEFINE_SIMPLE_PM_OPS() + EXPORT_SYMBOL_GPL(), which
> means we always define stmmac_simple_pm_ops, and it will always be
> visible for dwmac-* to reference whether modular or built-in.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: fix stmmac_simple_pm_ops build errors
    https://git.kernel.org/netdev/net-next/c/dac72136aa6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
