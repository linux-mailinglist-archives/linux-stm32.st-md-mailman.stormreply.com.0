Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E237A8A6543
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 09:38:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA89CC6B45B;
	Tue, 16 Apr 2024 07:38:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAAEBC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 07:38:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B75D2000C;
 Tue, 16 Apr 2024 07:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713253123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1FXHS0Dan/Zrf+0lP3wL/voTzdU1rNvLhXyoXYOBuWU=;
 b=C4ZMXEEo5ujJch9Vo0Aa5lUyCcnncL86YDaBD3U2XWGIVmm4TSzygL9U3K7eTVi4NRjLbt
 wUC4pnKg2eM/TWwC1zboCj6aciX3Utv7bJ1KtAHQIIg/NVvf/u4kwoSfKuRUwzsbzWBOeA
 FDJalRVH040WA8Ph101j50vGqFIzQfw5Ma+sCk2i3vQVBN/+gQ7khdcSZonK/Rz0MSciWs
 daJ1pUXeE7GW6uDbIv+m/Q3H8NTG3hZ4DrqFi6e0ZJg2KfZR9wCG2hGEuyOkju0MVkr4O3
 G8pi+6ZbFjPZBagjZx+DFmz90T8frlVxnpDTZRMAFNYV9XYmhDjuaSRuHb+e/Q==
Date: Tue, 16 Apr 2024 09:39:20 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <20240412180340.7965-2-fancer.lancer@gmail.com>
Message-ID: <7db899b0-4547-2c4c-60a5-8321d698cce4@bootlin.com>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
 <20240412180340.7965-2-fancer.lancer@gmail.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Bhadram Varka <vbhadram@nvidia.com>, Yanteng Si <siyanteng@loongson.cn>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/4] net: stmmac: Apply
 half-duplex-less constraint for DW QoS Eth only
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

On Fri, 12 Apr 2024, Serge Semin wrote:

> There are three DW MAC IP-cores which can have the multiple Tx/Rx queues
> enabled:
> DW GMAC v3.7+ with AV feature,
> DW QoS Eth v4.x/v5.x,
> DW XGMAC/XLGMAC
> Based on the respective HW databooks, only the DW QoS Eth IP-core doesn't
> support the half-duplex link mode in case if more than one queues enabled:
> 
> "In multiple queue/channel configurations, for half-duplex operation,
> enable only the Q0/CH0 on Tx and Rx. For single queue/channel in
> full-duplex operation, any queue/channel can be enabled."
> 
> The rest of the IP-cores don't have such constraint. Thus in order to have
> the constraint applied for the DW QoS Eth MACs only, let's move the it'
> implementation to the respective MAC-capabilities getter and make sure the
> getter is called in the queues re-init procedure.
> 
> Fixes: b6cfffa7ad92 ("stmmac: fix DMA channel hang in half-duplex mode")
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  7 +++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++----------------
>  2 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index cef25efbdff9..ec6a13e644b3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -71,6 +71,13 @@ static void dwmac4_core_init(struct mac_device_info *hw,
>  static void dwmac4_phylink_get_caps(struct stmmac_priv *priv)
>  {
>  	priv->phylink_config.mac_capabilities |= MAC_2500FD;
> +
> +	if (priv->plat->tx_queues_to_use > 1)
> +		priv->phylink_config.mac_capabilities &=
> +			~(MAC_10HD | MAC_100HD | MAC_1000HD);
> +	else
> +		priv->phylink_config.mac_capabilities |=
> +			(MAC_10HD | MAC_100HD | MAC_1000HD);
>  }
>  
>  static void dwmac4_rx_queue_enable(struct mac_device_info *hw,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 24cd80490d19..dd58c21b53ee 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1198,17 +1198,6 @@ static int stmmac_init_phy(struct net_device *dev)
>  	return ret;
>  }
>  
> -static void stmmac_set_half_duplex(struct stmmac_priv *priv)
> -{
> -	/* Half-Duplex can only work with single tx queue */
> -	if (priv->plat->tx_queues_to_use > 1)
> -		priv->phylink_config.mac_capabilities &=
> -			~(MAC_10HD | MAC_100HD | MAC_1000HD);
> -	else
> -		priv->phylink_config.mac_capabilities |=
> -			(MAC_10HD | MAC_100HD | MAC_1000HD);
> -}
> -
>  static int stmmac_phy_setup(struct stmmac_priv *priv)
>  {
>  	struct stmmac_mdio_bus_data *mdio_bus_data;
> @@ -1237,10 +1226,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
>  				    priv->phylink_config.supported_interfaces);
>  
>  	priv->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> -						MAC_10FD | MAC_100FD |
> -						MAC_1000FD;
> -
> -	stmmac_set_half_duplex(priv);
> +						MAC_10 | MAC_100 | MAC_1000;
>  
>  	/* Get the MAC specific capabilities */
>  	stmmac_mac_phylink_get_caps(priv);
> @@ -7355,7 +7341,8 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
>  			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
>  									rx_cnt);
>  
> -	stmmac_set_half_duplex(priv);
> +	stmmac_mac_phylink_get_caps(priv);
> +
>  	stmmac_napi_add(dev);
>  
>  	if (netif_running(dev))
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
