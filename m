Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 791FC84CF6B
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 18:10:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A1E8C6B476;
	Wed,  7 Feb 2024 17:10:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37B37C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 17:10:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 38036CE1AAD;
 Wed,  7 Feb 2024 17:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71F2DC433C7;
 Wed,  7 Feb 2024 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707325829;
 bh=rbi1Mri1Q1kvWYtXQKDMaRM+0y0i4iW40rVJZRr8moY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hotxVQdK3akuF6Gr/P+sQHz7c6hKc7k5miFraUa6qHP4gtcEPFyWsKN8IQkV6CbN9
 YMrBD/wuMWyRVV2eeezjo4NTL54l4LZbKcTLhbDtIaHkbJDYy9U9tEz8MAoeiXTf9x
 GS5RFMVclnOHSlQDpFL1czceakX2yrBNRQEiehJhUjM4cly8q3GUTjSL2zBwqXha8/
 pWKDPWAg01s97Exa2AI4XGVw7H2mpbi4MrV7aVLyYxj/Vt9F9nqutRdCm7YZlS6iBE
 SzesYfAM1/k0AN5CjFADIYKLmQcCIi2+hFSsHrmBH9ghu9zBGTohY2bX/iKA1J8wuf
 REsSktiajCIbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 57FC9E2F2F1; Wed,  7 Feb 2024 17:10:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170732582935.14396.12248558616645018742.git-patchwork-notify@kernel.org>
Date: Wed, 07 Feb 2024 17:10:29 +0000
References: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
In-Reply-To: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, justin.chen@broadcom.com, edumazet@google.com,
 bcm-kernel-feedback-list@broadcom.com, shenwei.wang@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, opendmb@gmail.com,
 florian.fainelli@broadcom.com, joabreu@synopsys.com, xiaoning.wang@nxp.com,
 linux-imx@nxp.com, kuba@kernel.org, pabeni@redhat.com, bh74.an@samsung.com,
 wei.fang@nxp.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 mcoquelin.stm32@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/6] net: eee network driver
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

On Sun, 4 Feb 2024 12:12:43 +0000 you wrote:
> Hi,
> 
> Since commit d1420bb99515 ("net: phy: improve generic EEE ethtool
> functions") changed phylib to set eee->eee_active and eee->eee_enabled,
> overriding anything that drivers have set these to prior to calling
> phy_ethtool_get_eee().
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/6] net: stmmac: remove eee_enabled/eee_active in stmmac_ethtool_op_get_eee()
    https://git.kernel.org/netdev/net-next/c/0cb6daf549f9
  - [net-next,v2,2/6] net: sxgbe: remove eee_enabled/eee_active in sxgbe_get_eee()
    https://git.kernel.org/netdev/net-next/c/d0d8c548789d
  - [net-next,v2,3/6] net: fec: remove eee_enabled/eee_active in fec_enet_get_eee()
    https://git.kernel.org/netdev/net-next/c/b573cb0a5586
  - [net-next,v2,4/6] net: bcmgenet: remove eee_enabled/eee_active in bcmgenet_get_eee()
    https://git.kernel.org/netdev/net-next/c/409359c1c2ef
  - [net-next,v2,5/6] net: bcmasp: remove eee_enabled/eee_active in bcmasp_get_eee()
    https://git.kernel.org/netdev/net-next/c/0cbfdfe3fb80
  - [net-next,v2,6/6] net: dsa: b53: remove eee_enabled/eee_active in b53_get_mac_eee()
    https://git.kernel.org/netdev/net-next/c/3465df5533af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
