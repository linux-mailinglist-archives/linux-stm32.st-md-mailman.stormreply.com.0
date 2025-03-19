Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826BA697DF
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 19:19:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0842C78F60;
	Wed, 19 Mar 2025 18:19:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89DB4C7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 18:19:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F063682C6;
 Wed, 19 Mar 2025 18:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540ACC4CEE9;
 Wed, 19 Mar 2025 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742408394;
 bh=1uv1URa/oRq4i2/FSY/Z0hXKn2aDIlpZ/PJX3KA9iqs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Ogkry/uLGFZPAuy9ejUxn3abPrdKF6wuiAYtx7Ke5zGAoP9cciScohsOPprgiOBHj
 Mq2O9kLJliQOawhOYOX0HV4eHyeqyahRbkeBdvQRW/QrcYCNbMATJElWb1iEJhQ6De
 Yc1hgyUQmpXnj7PlAexV3FvsN7LZ70bJHmRP7CzJUPB4/XLAI0s0XorSnA/fxgSRom
 WYU+okgQyi/zJLo7oBxhHXo+ZcUUVvBLe9VsBXdTSaa2LQzettZzLnvnT24mLFwc+0
 uj9+duZ2Xo6/NN2M94mFN2E+Lykvv7lArfUaBdIAfoB9eurJ9/C/uh8mK5oJU7lU7/
 sblt3k6OiHOFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 369E1380CFFE; Wed, 19 Mar 2025 18:20:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174240843003.1143902.13702964341385385111.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 18:20:30 +0000
References: <E1tsRyv-0064nU-O9@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tsRyv-0064nU-O9@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, jpinto@synopsys.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, larper@axis.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwc-qos-eth: use
	devm_kzalloc() for AXI data
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 12 Mar 2025 19:43:09 +0000 you wrote:
> Everywhere else in the driver uses devm_kzalloc() when allocating the
> AXI data, so there is no kfree() of this structure. However,
> dwc-qos-eth uses kzalloc(), which leads to this memory being leaked.
> Switch to use devm_kzalloc().
> 
> Fixes: d8256121a91a ("stmmac: adding new glue driver dwmac-dwc-qos-eth")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: dwc-qos-eth: use devm_kzalloc() for AXI data
    https://git.kernel.org/netdev/net/c/c9cb135bc604

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
