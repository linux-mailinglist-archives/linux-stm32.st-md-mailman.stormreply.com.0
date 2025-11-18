Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40675C6733C
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 05:01:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E020EC60460;
	Tue, 18 Nov 2025 04:00:59 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED053C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 04:00:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA211605E8;
 Tue, 18 Nov 2025 04:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9026EC116D0;
 Tue, 18 Nov 2025 04:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763438457;
 bh=F4b0uEqOqFj1s5GHGqft9QBk76aJhOT/4bbfeDN+fD4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=EVj55QexA1j6BraMVP2dlwMLN2CRv/d0/XGEpHooJ1Yep11lNKf3yEUw+fd74fQb0
 0PUhZI/fW2p0yuHqQd3q+NUU3+AdT3QojoSXQprU7AWQSoI0r45Wt+HIOFqI0L5awv
 Su4ZfcZEn6yptm61rjpMFZ9FlapiYRmCE/EuReG8l62zx9vGMT9SfNPeIK8mPd83+2
 wPtLT1zFknOTZxQ/bPuO1EjtB9r41MWNVGQYLyTiKPtPqKMakQvowEA13SUjkzthic
 2N/xdmvS2WmI4SzYmVNqDO2bgV8nFV0j56D5T2DF4w09WXfsSiZdzl+SZpc10DAP3U
 sWTwPiVgRZEPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70FE93809A1C; Tue, 18 Nov 2025 04:00:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176343842426.3578356.2997761543219536696.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 04:00:24 +0000
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, sophgo@lists.linux.dev, inochiama@gmail.com,
 unicorn_wang@outlook.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 00/11] net: stmmac: clean up
 plat_dat allocation/initialisation
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

On Fri, 14 Nov 2025 15:27:16 +0000 you wrote:
> This series cleans up the plat_dat allocation and initialisation,
> moving common themes into the allocator.
> 
> This results in a nice saving:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  | 43 +---------------
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   | 22 +-------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c |  1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 34 ++++++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 39 +-------------
>  .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 60 ++++------------------
>  7 files changed, 53 insertions(+), 148 deletions(-)

Here is the summary with links:
  - [net-next,01/11] net: stmmac: add stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/511171e47f8b
  - [net-next,02/11] net: stmmac: move initialisation of phy_addr to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/99e6ddaabdb4
  - [net-next,03/11] net: stmmac: move initialisation of clk_csr to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/ae4f29712bf3
  - [net-next,04/11] net: stmmac: move initialisation of maxmtu to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/528478a746a5
  - [net-next,05/11] net: stmmac: move initialisation of multicast_filter_bins to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/07cedb9eed41
  - [net-next,06/11] net: stmmac: move initialisation of unicast_filter_entries to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/bcb145c69690
  - [net-next,07/11] net: stmmac: move initialisation of queues_to_use to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/d5e788e86fe3
  - [net-next,08/11] net: stmmac: setup default RX channel map in stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/b6d013b3260b
  - [net-next,09/11] net: stmmac: remove unnecessary .use_prio queue initialisation
    https://git.kernel.org/netdev/net-next/c/c03101cb1bf0
  - [net-next,10/11] net: stmmac: remove unnecessary .prio queue initialisation
    https://git.kernel.org/netdev/net-next/c/0a20999ed452
  - [net-next,11/11] net: stmmac: remove unnecessary .pkt_route queue initialisation
    https://git.kernel.org/netdev/net-next/c/6409249ccc15

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
