Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AE1A9F259
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 15:29:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3A8EC78F67;
	Mon, 28 Apr 2025 13:29:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD09EC78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 13:29:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 72F3749CDF;
 Mon, 28 Apr 2025 13:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0EBC4CEE4;
 Mon, 28 Apr 2025 13:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745846993;
 bh=elk4Zqa+3hCtmUiNsAt9MfBksCuGpsquiK6zsRxydTQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TD7QBfDg6kXdOzjRs6gtAIizZopWFFNqcvzVQOUhE4adYd3tKK9ZWRiOnvUE6xSVd
 jqwrYMQ8+CvdekMObGo0NgaCNDmpuD0w0cXxKLSIz47iIeS/A+QYeABeLViatbJfgl
 WYuFL3DJJsVzqm0ssKDEWQxyOqyy4bbuIUxmpfwxhdut/618sWFo6Maqz94oacg6/C
 PFGArhwz0OFSGUVyUCsQRZIPi4wGKLvIrlI/LJUOfHZ/1qnX4nKj5+7grom/3aVSVM
 0hcg7j0y6Ieg1gwWvMRkF6+1AoV5y9QGkFI2DE13pzJZ78Bj3EwkJ7EatPc+D16aoT
 QizlVzaNHtOoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70BF93822D43; Mon, 28 Apr 2025 13:30:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174584703225.917720.8866587140005702000.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 13:30:32 +0000
References: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew@lunn.ch, horms@kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, edumazet@google.com, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/3] net: stmmac: socfpga:
 1000BaseX support and cleanups
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

On Thu, 24 Apr 2025 09:12:19 +0200 you wrote:
> Hi everyone,
> 
> This V3 is simply a re-send of V2, targeting net-next instead of net as
> the V2 did by mistake.
> 
> No other changes besides a rebase on net-next were made.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] net: stmmac: socfpga: Enable internal GMII when using 1000BaseX
    https://git.kernel.org/netdev/net-next/c/6fba40e7f610
  - [net-next,v3,2/3] net: stmmac: socfpga: Don't check for phy to enable the SGMII adapter
    https://git.kernel.org/netdev/net-next/c/3bf19459da62
  - [net-next,v3,3/3] net: stmmac: socfpga: Remove unused pcs-mdiodev field
    https://git.kernel.org/netdev/net-next/c/8fb33581bb8a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
