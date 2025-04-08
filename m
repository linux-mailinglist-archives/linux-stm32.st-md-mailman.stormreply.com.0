Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 801E0A815E4
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 21:38:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A88EC78F95;
	Tue,  8 Apr 2025 19:38:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66AEBC78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 19:37:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B0AB0A483E0;
 Tue,  8 Apr 2025 19:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60554C4CEE5;
 Tue,  8 Apr 2025 19:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744141077;
 bh=85wIl317j4jiqoJgOO4oESIHzu0abN/wXL9l0EY3Ies=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aVHLsyvOWP+kNWbam7Tzo8XFBXpS13rzOknrm9cfpuvzhC+LIv/jiBJJCBvHhMHJV
 qkeRQSgZYZIx5ci0Cpz93Qet9TDxTvkxuXp4axZajQeQIsf3skDOvNPpPpZOhOL48I
 6BlL/FfpNgXaqM4tRvtCmJf4k7HqKBNM8jnZzNy6Ci4oJkZpH1h0+VFOw6Pp4w53Rm
 R2yVW4TX03ZXeYfhUcQtuR8TQVpXZxrMC2CkPxiqRPMS+Iiz9wURzXqpB/WtbpLYom
 ZeBd3NnBzmEsHDOtEYxnoiYUCEPr9bqSpZOgrufWVzE1vUbv4nbtPwW49rZXTmGD6q
 TY535/rH79KRg==
Date: Tue, 8 Apr 2025 12:37:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250408123755.1077e29b@kernel.org>
In-Reply-To: <E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
References: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
 <E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Prabhakar <prabhakar.csengg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwc-qos: use
 stmmac_pltfr_find_clk()
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

On Mon, 07 Apr 2025 19:38:49 +0100 Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index cd431f84f34f..f5c68e3b4354 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -34,16 +34,6 @@ struct tegra_eqos {
>  	struct gpio_desc *reset;
>  };
>  
> -static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_dat,
> -				    const char *name)
> -{
> -	for (int i = 0; i < plat_dat->num_clks; i++)
> -		if (strcmp(plat_dat->clks[i].id, name) == 0)
> -			return plat_dat->clks[i].clk;
> -
> -	return NULL;
> -}

Missed one user?

drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c:355:25: error: call to undeclared function 'dwc_eth_find_clk'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  355 |         plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat,
      |                                ^
drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c:355:23: error: incompatible integer to pointer conversion assigning to 'struct clk *' from 'int' [-Wint-conversion]
  355 |         plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat,
      |                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
  356 |                                                 data->stmmac_clk_name);
      |                                                 ~~~~~~~~~~~~~~~~~~~~~~
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
