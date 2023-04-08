Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 485026DB87D
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Apr 2023 05:10:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1121C6B44F;
	Sat,  8 Apr 2023 03:10:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 828F5C6B447
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 03:10:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59A22654D3;
 Sat,  8 Apr 2023 03:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EE69C4339C;
 Sat,  8 Apr 2023 03:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680923420;
 bh=CfCeXl8q/07dq1dhVX7n2ybua/2fD/no/1tbeJLHymc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DgIJbH7A2taTVkVJweUeR/a9ydk1lPDmsIiHQcpmzqktdRhfskr0kQmd/LwU5Pke8
 rh8dyQoq9XgohWqdnHlOZ3OPEHzYwhmaDWELNYl4ypqpRurLNU3vOke6730gXw/ZL3
 EgRZTvShucH+mWAG+m6JRWWBIPhi9y7gb3wVlVt2eJBZZsRIOHUBU9MeVT9bbZbeqs
 BlfLLIanYngbzlpyAqW4TjpDXVIzeTfHO3tue7/bWVqGewmzfSsFdsdUd834xRqTM3
 5tJh01zlfhYS790kZ8m+584KVBxhX/AfWSJhqIdaUejbvJomQY0x4D3wmsTxYu8beR
 WQVsazz6cM5IA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0EA05E21EF2; Sat,  8 Apr 2023 03:10:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168092342005.22423.17778361822558891683.git-patchwork-notify@kernel.org>
Date: Sat, 08 Apr 2023 03:10:20 +0000
References: <20230406125412.48790-1-vladimir.oltean@nxp.com>
In-Reply-To: <20230406125412.48790-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: remove set but
 unused mask in stmmac_ethtool_set_link_ksettings()
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

On Thu,  6 Apr 2023 15:54:12 +0300 you wrote:
> This was never used since the commit that added it - e58bb43f5e43
> ("stmmac: initial support to manage pcs modes").
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 9 ---------
>  1 file changed, 9 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: remove set but unused mask in stmmac_ethtool_set_link_ksettings()
    https://git.kernel.org/netdev/net-next/c/07e75db6b1b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
