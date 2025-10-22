Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC23BF9A49
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 03:50:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51023C5E2C3;
	Wed, 22 Oct 2025 01:50:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D396FC5E2AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 01:50:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 18FD24538F;
 Wed, 22 Oct 2025 01:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECABCC4CEF1;
 Wed, 22 Oct 2025 01:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761097836;
 bh=/eTy4JtMv/vr6iqZocb7lPKZoXLwzYl/RYQlWEEt4bQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gITWc2OepTEpTH4QeVoo+w086E3kiGzcJG00wK8LBjY2B4lJptF5+B+uD+kE84QQx
 HpzOaME48fucUHFOuR2cS+JxAAd7rCvc7exS4onFB62gaqgLJ0wMy5wCs6cGyPCvVm
 9bG3cA7mMyI3FJhPoQgao/V80EL8ceQNGMiq6SSHb3fnbG+JNOC96kD8WRJMdzgX0+
 X3RHum0oDVWqfHVPPUarE97kpYjSjdw+CJsP1nxEYsd1g9TJqOE4ZrkHARCV4DVogY
 qVmJ3WJQVLAq/JPWwUi1J8vNKzokw+1aaXpmWYd/fLnXzngKJpWsH5T0ElbSrI+EFt
 8Dj6Y0ZPc821A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70DE03A55FAA; Wed, 22 Oct 2025 01:50:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176109781700.1305042.6815334207593742023.git-patchwork-notify@kernel.org>
Date: Wed, 22 Oct 2025 01:50:17 +0000
References: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
In-Reply-To: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux@armlinux.org.uk, andrew+netdev@lunn.ch, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next] net: stmmac: mdio: use
 phy_find_first to simplify stmmac_mdio_register
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

On Sat, 18 Oct 2025 20:48:07 +0200 you wrote:
> Simplify the code by using phy_find_first().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - remove variable addr and use phydev->mdio.addr
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register
    https://git.kernel.org/netdev/net-next/c/4a107a0e8361

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
