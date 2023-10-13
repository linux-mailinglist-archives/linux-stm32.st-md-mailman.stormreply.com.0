Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A77C7C8189
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 11:10:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBDCDC6B44B;
	Fri, 13 Oct 2023 09:10:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 784CCC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 09:10:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33DC862063;
 Fri, 13 Oct 2023 09:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEDC8C433CB;
 Fri, 13 Oct 2023 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697188231;
 bh=x7mc+kQYSsekJK4vlCye+6KPOUJkFZpCl0x3sxdgaaw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=AQtTwPCmajOmNNQPHtTr/zoA/M7SdwCrA5V9FAtAtdm7Ym6xjJjw7WotI6tBpMCpM
 MyVA/dkPX2f9eKdrX0iFiy9ikBV2W2VDPlNKUFZ8eMx9ZmhJxej7QyBa8B18SbMGv5
 qSC6fuBbLr1aYasdO92fsMbZJ7T8gtFwgCtgBkHb337NFEyvLcivFYDSTAVpENqPfi
 rKTXLxmnF43ghcQfVDVluH/VqcQ6iZ9Xu+3MCZpKld29GOou5Hxl0hyL6TCagn+Jah
 NifCVuHcJH3km9jk78Jz6A6enfGvNufLaykR9nKnZWYPzTjSmmuYLJhppVGPHklyhR
 PIGjkkXd6p94A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D3F2AE1F669; Fri, 13 Oct 2023 09:10:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169718823086.32613.16429893280352977849.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 09:10:30 +0000
References: <20231009172923.2457844-3-robh@kernel.org>
In-Reply-To: <20231009172923.2457844-3-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Shyam-sundar.S-k@amd.com, edumazet@google.com,
 iyappan@os.amperecomputing.com, quan@os.amperecomputing.com,
 pantelis.antoniou@gmail.com, shenwei.wang@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, joyce.ooi@intel.com,
 linux@armlinux.org.uk, joabreu@synopsys.com, xiaoning.wang@nxp.com,
 linux-imx@nxp.com, kuba@kernel.org, pabeni@redhat.com, yisen.zhuang@huawei.com,
 grygorii.strashko@ti.com, keyur@os.amperecomputing.com, wei.fang@nxp.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 salil.mehta@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next] net: ethernet: Use
	device_get_match_data()
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

On Mon,  9 Oct 2023 12:28:58 -0500 you wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/net/ethernet/altera/altera_tse.h      |  2 +-
>  drivers/net/ethernet/altera/altera_tse_main.c | 13 ++----
>  drivers/net/ethernet/amd/xgbe/xgbe-platform.c | 42 +------------------
>  .../net/ethernet/apm/xgene/xgene_enet_main.c  | 15 +------
>  .../net/ethernet/apm/xgene/xgene_enet_main.h  |  3 +-
>  drivers/net/ethernet/freescale/fec_main.c     | 12 +++---
>  .../ethernet/freescale/fs_enet/fs_enet-main.c | 18 ++++----
>  .../net/ethernet/freescale/fs_enet/mii-fec.c  | 10 ++---
>  drivers/net/ethernet/freescale/fsl_pq_mdio.c  | 12 ++----
>  drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 11 ++---
>  .../stmicro/stmmac/dwmac-intel-plat.c         |  9 ++--
>  drivers/net/ethernet/ti/davinci_emac.c        | 12 ++----
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c  | 13 ++----
>  13 files changed, 40 insertions(+), 132 deletions(-)

Here is the summary with links:
  - [net-next] net: ethernet: Use device_get_match_data()
    https://git.kernel.org/netdev/net-next/c/b0377116decd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
