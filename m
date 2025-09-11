Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 815D1B52582
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 03:10:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EF86C3087A;
	Thu, 11 Sep 2025 01:10:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05195C32EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 01:10:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB6E944B26;
 Thu, 11 Sep 2025 01:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83677C4CEEB;
 Thu, 11 Sep 2025 01:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757553005;
 bh=MVGxfRakQnPxyH3uyjRFiBz07temXygvvaFLoRNylVo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KR8pWo3JR3b3F+aXwXyH2fVJl5W6keyReuBUyj2196B0cEit46XXGgkoJlGkE2EGj
 qGWFr2glITXyI0/GNojAltsc5NXDcJwHcOjp8EM1MjWCd7cLU93sHbA84wIyLGMDCX
 0QJRw3BIFaT73mgaGtehKMzLj/BRCw4VAlHCUSTuRNnmbhTUSq3wele7+ogUGXiJem
 8TR+9z9YME5oaLBYfd7zfw3jVx2rBZxSvsmjLhfAkbmnfeQkmaPN+yQtW9Ybjwth0o
 9vUCt+HT5fKQ37eSJ4giiOuxpow5/hyBJQJjh5K9FZ+k5Eno0kebMcalRcxqVP39wu
 aXgpEcOe7svng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 85E48383BF69; Thu, 11 Sep 2025 01:10:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175755300850.1617124.3396751776402491049.git-patchwork-notify@kernel.org>
Date: Thu, 11 Sep 2025 01:10:08 +0000
References: <E1uw0ff-00000004IQJ-3AMp@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uw0ff-00000004IQJ-3AMp@rmk-PC.armlinux.org.uk>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwc-qos: use PHY WoL
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

On Tue, 09 Sep 2025 16:54:15 +0100 you wrote:
> Mark Tegra platforms to use PHY's wake-on-Lan capabilities rather than
> the stmmac wake-on-Lan.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> This is the last patch that is needed to WoL on the Jetson Xavier NX
> to be functional - the only patch that hasn't been through netdev
> is the DT patch that's being merged through a different route. Once
> all patches come together (in other words, at the next -rc1), then
> WoL will be functional on this platform.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwc-qos: use PHY WoL
    https://git.kernel.org/netdev/net-next/c/724b22d38a83

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
