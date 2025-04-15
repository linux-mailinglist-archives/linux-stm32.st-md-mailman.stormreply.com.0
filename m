Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18914A8A30B
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 17:40:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA2A8C78F81;
	Tue, 15 Apr 2025 15:40:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD669C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 15:40:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 996064A347;
 Tue, 15 Apr 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C15FC4CEEC;
 Tue, 15 Apr 2025 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744731605;
 bh=TTwmd1qwkjcOawvuF4ndw/Outr89qvs8u05lc+zv+W8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=AMeqfwmfD6A9pIDzu3d/lmYs1WsH0T9j6UvqjmHnx4SEQhytxzB6e1QvO8i48Yii3
 8ElS2c3NgPgVOCI/xqx2lXz54ZLTbfWPTt7s5Bv6Gx+VzvLCdXzhNsobeFoJYcS+zh
 vz0cyqL8vgBBW32ozO/XKk2sc+VNUVGGqAMFiV6UW/Sj1nU7TeVHHKxv967YysxwCf
 5ab29NCzuhYCmZ7ZqdvarzZbDAhZMKDQ6zYtryOP7KXoaXaP93OTMlrzLjeWEmZcYd
 yHQEoJ847f6DKOTWyHGZjpl/CicwY1tn626O4JUIRjVi6ABOyHWSB/dLUmewN23feX
 kyLrtMUWmxVzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADF113822D55; Tue, 15 Apr 2025 15:40:44 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174473164325.2680773.1202751718118032665.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 15:40:43 +0000
References: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
In-Reply-To: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: ingenic:
	cleanups
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

On Mon, 14 Apr 2025 16:51:18 +0100 you wrote:
> Hi,
> 
> Another series for another stmmac glue platform.
> 
> Convert Ingenic to use the stmmac platform PM ops and the
> devm_stmmac_pltfr_probe() helper.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: ingenic: convert to stmmac_pltfr_pm_ops
    https://git.kernel.org/netdev/net-next/c/debfcb3f5848
  - [net-next,2/2] net: stmmac: ingenic: convert to devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/96f8bf85d11a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
