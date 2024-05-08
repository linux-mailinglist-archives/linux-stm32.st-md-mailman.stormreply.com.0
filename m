Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 363BB8BFC09
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2024 13:30:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E062EC62EFE;
	Wed,  8 May 2024 11:30:40 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D601C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 May 2024 11:30:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B4FDFCE1874;
 Wed,  8 May 2024 11:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B95A4C4DDE7;
 Wed,  8 May 2024 11:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715167828;
 bh=JplgA3sOoAVitsl+Ba7UDOQPODwGUUkz1NsrTl0hLEE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XMeOaKTw9qZBqxZJ1u1IXitPaUkLmyrU0U/oIhNh+zqMJ8Ej1iXUrlODKuPia5MoT
 w8eCFCwo8PK7Bx+zp8M0EQiFSTCrzXoym8dcwMjyz2QVdv4gsLnbBY3EDvXmDFWelW
 sd3OshvIAUZR+UnjUKlFbW/WcOkYNG1X5l09kDRB6TA34D8o8F9hjuewZ62TTdav0s
 bDqhe0gdgcpxopBk0AhvfkcJoVmyqyEPISfcV5b96CBJ/D4wyR7UNkbbRECBCFr5o6
 FxJiw3ogarNXW5L/zjGy0eJ/fT4fyJyJUFb1kn6ecauyedcFBclRK6cJph2ECebEuF
 UpkgXsOruEK4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A74A9C54BB0; Wed,  8 May 2024 11:30:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171516782868.10113.14186792810495215260.git-patchwork-notify@kernel.org>
Date: Wed, 08 May 2024 11:30:28 +0000
References: <20240506123248.17740-1-ansuelsmth@gmail.com>
In-Reply-To: <20240506123248.17740-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH] net: stmmac: dwmac-ipq806x:
 account for rgmii-txid/rxid/id phy-mode
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
by David S. Miller <davem@davemloft.net>:

On Mon,  6 May 2024 14:32:46 +0200 you wrote:
> Currently the ipq806x dwmac driver is almost always used attached to the
> CPU port of a switch and phy-mode was always set to "rgmii" or "sgmii".
> 
> Some device came up with a special configuration where the PHY is
> directly attached to the GMAC port and in those case phy-mode needs to
> be set to "rgmii-id" to make the PHY correctly work and receive packets.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwmac-ipq806x: account for rgmii-txid/rxid/id phy-mode
    https://git.kernel.org/netdev/net-next/c/abb45a2477f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
