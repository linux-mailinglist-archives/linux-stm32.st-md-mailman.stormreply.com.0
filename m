Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D2891314
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Mar 2024 06:10:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57C9EC71281;
	Fri, 29 Mar 2024 05:10:35 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E90E1C6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Mar 2024 05:10:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E9C2ACE2E81;
 Fri, 29 Mar 2024 05:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CE90C43390;
 Fri, 29 Mar 2024 05:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711689031;
 bh=JTlplW2/Out9DISgdpv3W0wq4268A6szm5K/uLb8+M4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nWa6yq7q0+RkYhBkUumSxNQlbGHy/y8vaJShXUfvvnWsticJ7QRiexJr9pvtKzF0L
 VF2u1sTAt1cyN2Uaw7C9FUp/xkc9WXItgrBsqZjABHyBdH4O4A1Jbp3JI2U3aNKVPa
 PHLeHoF8sME4ifJ8LI3agjOPzrXDwHRbpJVCqwBXjcp9lJpPgT4KIIq1206OqjbqqU
 YfQaboUPO/Bkgo8xsORi8zjPETbGH+XLB/py9xvx+QucO6GiZhpcg39fnoffgb7fML
 OKLeV8eJY3C8NbGqimf3ZS82clxP5b0D4jxijQh6iG5J0JBTu5B9HpAmwUfWCJG6uc
 3+JwNmWddmB3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 169F6D2D0EB; Fri, 29 Mar 2024 05:10:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171168903108.21197.8126750416012356121.git-patchwork-notify@kernel.org>
Date: Fri, 29 Mar 2024 05:10:31 +0000
References: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
In-Reply-To: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: andrew@lunn.ch, thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 linux-renesas-soc@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 edumazet@google.com, joabreu@synopsys.com, xiaoning.wang@nxp.com,
 mcoquelin.stm32@gmail.com, miquel.raynal@bootlin.com, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next RESEND v6 0/7] Fix missing
	PHY-to-MAC RX clock
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

On Tue, 26 Mar 2024 14:32:06 +0100 you wrote:
> Hello everyone,
> 
> This is version six of my series that addresses the issue with some MAC/PHY
> combinations.
> 
> Notable changes in v6:
>   - Corrected trailers
> 
> [...]

Here is the summary with links:
  - [RESEND,net-next,v6,1/7] net: phylink: add PHY_F_RXC_ALWAYS_ON to PHY dev flags
    https://git.kernel.org/netdev/net-next/c/21d9ba5bc551
  - [RESEND,net-next,v6,2/7] net: phylink: add rxc_always_on flag to phylink_pcs
    https://git.kernel.org/netdev/net-next/c/dceb393a0a8e
  - [RESEND,net-next,v6,3/7] net: stmmac: don't rely on lynx_pcs presence to check for a PHY
    https://git.kernel.org/netdev/net-next/c/10658e99d952
  - [RESEND,net-next,v6,4/7] net: stmmac: Support a generic PCS field in mac_device_info
    https://git.kernel.org/netdev/net-next/c/f7bff228a616
  - [RESEND,net-next,v6,5/7] net: stmmac: Signal to PHY/PCS drivers to keep RX clock on
    https://git.kernel.org/netdev/net-next/c/58329b03a595
  - [RESEND,net-next,v6,6/7] net: phy: qcom: at803x: Avoid hibernating if MAC requires RX clock
    https://git.kernel.org/netdev/net-next/c/30dc5873967e
  - [RESEND,net-next,v6,7/7] net: pcs: rzn1-miic: Init RX clock early if MAC requires it
    https://git.kernel.org/netdev/net-next/c/0f671b3b6edf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
