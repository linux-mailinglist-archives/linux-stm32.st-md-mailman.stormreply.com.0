Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C70A453BB
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 04:10:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26C06C7A824;
	Wed, 26 Feb 2025 03:10:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC1F0C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 03:10:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 96F8361215;
 Wed, 26 Feb 2025 03:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B799DC4CED6;
 Wed, 26 Feb 2025 03:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740539415;
 bh=EaM8nAcknuTEqgSWtgRX+O1SPtlqPr1RuKMMFdHdR3c=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ENi69153t9+nKAboDE1j2k8m0xn5XVkoy5WArA25idCLXE2KRrnFftC1EokGlxaGZ
 HhjBkzsCoFgm5soPcgidtOi1reK+q/VjngzTolfKYOhz+3UW+e6XTMWNjqrH2/bTWg
 KASP/xdUFXcC8rsghNLTUEux9I2YsUXC4ZTDzIhKpUAoSb9Z78kGapkU6IECtml4vT
 LtAx0o0rMDgTNrfKFoqUG1GzqFR3FZMANtDESWNIv9qNchraqzj4T0IowJXlXAOoro
 umW9L0O2kvaBNRRoHQPAvZ32HOi3YxIYY9jrZxRmF2JBiYMu2zD/oEEKRCqLaXhe7Q
 oIOfkpy0lf3jQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADC8A380CFDD; Wed, 26 Feb 2025 03:10:48 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174053944723.217003.15797703887455778925.git-patchwork-notify@kernel.org>
Date: Wed, 26 Feb 2025 03:10:47 +0000
References: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
In-Reply-To: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/2] net: stmmac: dwc-qos:
 clean up clock initialisation
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

On Mon, 24 Feb 2025 16:53:16 +0000 you wrote:
> Hi,
> 
> My single v1 patch has become two patches as a result of the build
> error, as it appears this code uses "data" differently from others.
> v2 still produced build warnings despite local builds being clean,
> so v3 addresses those.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] net: stmmac: dwc-qos: name struct plat_stmmacenet_data consistently
    https://git.kernel.org/netdev/net-next/c/cff608268baf
  - [net-next,v3,2/2] net: stmmac: dwc-qos: clean up clock initialisation
    https://git.kernel.org/netdev/net-next/c/196b07ba9104

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
