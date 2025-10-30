Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8110EC1E14F
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 03:00:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43B7BC62D79;
	Thu, 30 Oct 2025 02:00:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5C7CC62D78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 02:00:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B8490404C7;
 Thu, 30 Oct 2025 02:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9743BC4CEFD;
 Thu, 30 Oct 2025 02:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761789640;
 bh=TF+xR6KkE5OxIUkvy+8hHfKZ6+KB/cpOjzBZ3NfVqqU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IRTOC1bpzA0kKLl18DqZ2dgnna/3cQnn4+WjtiR4iC1LuGUru3GrZx9p8l8KGMkZ+
 q5A2hgO6cs8ZuchhZNhelEp5cceJPktfnyn/p1MskQDcVFnt8NDh+TR4jpgA82kHLV
 a44FDRqic4yuZZbwVTcTJzh1hwstNCOFjJ9m16p9GsiGvnJclrPEIXxktoNbY12EcC
 a/lGzfZ7Xka8HlEbGNsXBjdp1ZF39BwjhFficNpwajotUCJwMA01UA//eePWi1tVHu
 NFlogkCIy53t9ZMe25+8MNhX89gz6g44JAKASaSS8Nf0CzI8Q9PYiHVAEosoAUoF+1
 xT6250KQsYmUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 CBAC43A55ED9; Thu, 30 Oct 2025 02:00:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176178961774.3282477.10436173337048887248.git-patchwork-notify@kernel.org>
Date: Thu, 30 Oct 2025 02:00:17 +0000
References: <e869999b-2d4b-4dc1-9890-c2d3d1e8d0f8@gmail.com>
In-Reply-To: <e869999b-2d4b-4dc1-9890-c2d3d1e8d0f8@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next] net: stmmac: mdio: fix
 incorrect phy address check
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

On Sat, 25 Oct 2025 20:35:47 +0200 you wrote:
> max_addr is the max number of addresses, not the highest possible address,
> therefore check phydev->mdio.addr > max_addr isn't correct.
> To fix this change the semantics of max_addr, so that it represents
> the highest possible address. IMO this is also a little bit more intuitive
> wrt name max_addr.
> 
> Fixes: 4a107a0e8361 ("net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reported-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: stmmac: mdio: fix incorrect phy address check
    https://git.kernel.org/netdev/net-next/c/cf35f4347ddd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
