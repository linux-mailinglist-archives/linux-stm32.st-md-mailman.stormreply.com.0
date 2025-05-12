Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BB7AB3CAF
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 17:50:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A262C7A82D;
	Mon, 12 May 2025 15:50:44 +0000 (UTC)
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4C6DC78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 15:50:42 +0000 (UTC)
Message-ID: <2ca5f592-74d3-41ff-8282-4359cb5ec171@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1747065042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6MXrnT3gf4UCix4NRHlqZt6S+pEnfTMsanMdKfJUb8=;
 b=jky+qgtETsFb0biTW/1lR9LNg39rCYhPgORR6TnNYv4JuW/iyHLT3hSsmBwFCXNEYk+YPH
 wQ6Ense3mid4zlO4UAPyAPWAU6XKuNVFxljw6h5ZZTx5zj+HOHaSMWR+7l0Q1nN43lUoZr
 rthZf0zrQvIMq1CkLxUeovin6kWcx+k=
Date: Mon, 12 May 2025 16:50:35 +0100
MIME-Version: 1.0
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
References: <20250512143607.595490-1-vladimir.oltean@nxp.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250512143607.595490-1-vladimir.oltean@nxp.com>
X-Migadu-Flow: FLOW_OUT
Cc: Furong Xu <0x1207@gmail.com>, Simon Horman <horms@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: convert to
 ndo_hwtstamp_get() and ndo_hwtstamp_set()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/05/2025 15:36, Vladimir Oltean wrote:
> New timestamping API was introduced in commit 66f7223039c0 ("net: add
> NDOs for configuring hardware timestamping") from kernel v6.6. It is
> time to convert the stmmac driver to the new API, so that the
> ndo_eth_ioctl() path can be removed completely.

The conversion to the new API looks good, but stmmac_ioctl() isn't
removed keeping ndo_eth_ioctl() path in place. Did I miss something in
the patch?

> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 +-
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 80 +++++++++----------
>   2 files changed, 37 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 1686e559f66e..cda09cf5dcca 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -301,7 +301,7 @@ struct stmmac_priv {
>   	unsigned int mode;
>   	unsigned int chain_mode;
>   	int extend_desc;
> -	struct hwtstamp_config tstamp_config;
> +	struct kernel_hwtstamp_config tstamp_config;
>   	struct ptp_clock *ptp_clock;
>   	struct ptp_clock_info ptp_clock_ops;
>   	unsigned int default_addend;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a19b6f940bf3..c090247d2a29 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -568,18 +568,19 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
>   /**
>    *  stmmac_hwtstamp_set - control hardware timestamping.
>    *  @dev: device pointer.
> - *  @ifr: An IOCTL specific structure, that can contain a pointer to
> - *  a proprietary structure used to pass information to the driver.
> + *  @config: the timestamping configuration.
> + *  @extack: netlink extended ack structure for error reporting.
>    *  Description:
>    *  This function configures the MAC to enable/disable both outgoing(TX)
>    *  and incoming(RX) packets time stamping based on user input.
>    *  Return Value:
>    *  0 on success and an appropriate -ve integer on failure.
>    */
> -static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
> +static int stmmac_hwtstamp_set(struct net_device *dev,
> +			       struct kernel_hwtstamp_config *config,
> +			       struct netlink_ext_ack *extack)
>   {
>   	struct stmmac_priv *priv = netdev_priv(dev);
> -	struct hwtstamp_config config;
>   	u32 ptp_v2 = 0;
>   	u32 tstamp_all = 0;
>   	u32 ptp_over_ipv4_udp = 0;
> @@ -590,34 +591,30 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   	u32 ts_event_en = 0;
>   
>   	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
> -		netdev_alert(priv->dev, "No support for HW time stamping\n");
> +		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping\n");
>   		priv->hwts_tx_en = 0;
>   		priv->hwts_rx_en = 0;
>   
>   		return -EOPNOTSUPP;
>   	}
>   
> -	if (copy_from_user(&config, ifr->ifr_data,
> -			   sizeof(config)))
> -		return -EFAULT;
> -
>   	netdev_dbg(priv->dev, "%s config flags:0x%x, tx_type:0x%x, rx_filter:0x%x\n",
> -		   __func__, config.flags, config.tx_type, config.rx_filter);
> +		   __func__, config->flags, config->tx_type, config->rx_filter);
>   
> -	if (config.tx_type != HWTSTAMP_TX_OFF &&
> -	    config.tx_type != HWTSTAMP_TX_ON)
> +	if (config->tx_type != HWTSTAMP_TX_OFF &&
> +	    config->tx_type != HWTSTAMP_TX_ON)
>   		return -ERANGE;
>   
>   	if (priv->adv_ts) {
> -		switch (config.rx_filter) {
> +		switch (config->rx_filter) {
>   		case HWTSTAMP_FILTER_NONE:
>   			/* time stamp no incoming packet at all */
> -			config.rx_filter = HWTSTAMP_FILTER_NONE;
> +			config->rx_filter = HWTSTAMP_FILTER_NONE;
>   			break;
>   
>   		case HWTSTAMP_FILTER_PTP_V1_L4_EVENT:
>   			/* PTP v1, UDP, any kind of event packet */
> -			config.rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
> +			config->rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
>   			/* 'xmac' hardware can support Sync, Pdelay_Req and
>   			 * Pdelay_resp by setting bit14 and bits17/16 to 01
>   			 * This leaves Delay_Req timestamps out.
> @@ -631,7 +628,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   
>   		case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
>   			/* PTP v1, UDP, Sync packet */
> -			config.rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_SYNC;
> +			config->rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_SYNC;
>   			/* take time stamp for SYNC messages only */
>   			ts_event_en = PTP_TCR_TSEVNTENA;
>   
> @@ -641,7 +638,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   
>   		case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
>   			/* PTP v1, UDP, Delay_req packet */
> -			config.rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ;
> +			config->rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ;
>   			/* take time stamp for Delay_Req messages only */
>   			ts_master_en = PTP_TCR_TSMSTRENA;
>   			ts_event_en = PTP_TCR_TSEVNTENA;
> @@ -652,7 +649,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   
>   		case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
>   			/* PTP v2, UDP, any kind of event packet */
> -			config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_EVENT;
> +			config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_EVENT;
>   			ptp_v2 = PTP_TCR_TSVER2ENA;
>   			/* take time stamp for all event messages */
>   			snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
> @@ -663,7 +660,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   
>   		case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
>   			/* PTP v2, UDP, Sync packet */
> -			config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_SYNC;
> +			config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_SYNC;
>   			ptp_v2 = PTP_TCR_TSVER2ENA;
>   			/* take time stamp for SYNC messages only */
>   			ts_event_en = PTP_TCR_TSEVNTENA;
> @@ -674,7 +671,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   
>   		case HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ:
>   			/* PTP v2, UDP, Delay_req packet */
> -			config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ;
> +			config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ;
>   			ptp_v2 = PTP_TCR_TSVER2ENA;
>   			/* take time stamp for Delay_Req messages only */
>   			ts_master_en = PTP_TCR_TSMSTRENA;
> @@ -686,7 +683,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   
>   		case HWTSTAMP_FILTER_PTP_V2_EVENT:
>   			/* PTP v2/802.AS1 any layer, any kind of event packet */
> -			config.rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
> +			config->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
>   			ptp_v2 = PTP_TCR_TSVER2ENA;
>   			snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
>   			if (priv->synopsys_id < DWMAC_CORE_4_10)
> @@ -698,7 +695,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   
>   		case HWTSTAMP_FILTER_PTP_V2_SYNC:
>   			/* PTP v2/802.AS1, any layer, Sync packet */
> -			config.rx_filter = HWTSTAMP_FILTER_PTP_V2_SYNC;
> +			config->rx_filter = HWTSTAMP_FILTER_PTP_V2_SYNC;
>   			ptp_v2 = PTP_TCR_TSVER2ENA;
>   			/* take time stamp for SYNC messages only */
>   			ts_event_en = PTP_TCR_TSEVNTENA;
> @@ -710,7 +707,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   
>   		case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
>   			/* PTP v2/802.AS1, any layer, Delay_req packet */
> -			config.rx_filter = HWTSTAMP_FILTER_PTP_V2_DELAY_REQ;
> +			config->rx_filter = HWTSTAMP_FILTER_PTP_V2_DELAY_REQ;
>   			ptp_v2 = PTP_TCR_TSVER2ENA;
>   			/* take time stamp for Delay_Req messages only */
>   			ts_master_en = PTP_TCR_TSMSTRENA;
> @@ -724,7 +721,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   		case HWTSTAMP_FILTER_NTP_ALL:
>   		case HWTSTAMP_FILTER_ALL:
>   			/* time stamp any incoming packet */
> -			config.rx_filter = HWTSTAMP_FILTER_ALL;
> +			config->rx_filter = HWTSTAMP_FILTER_ALL;
>   			tstamp_all = PTP_TCR_TSENALL;
>   			break;
>   
> @@ -732,18 +729,18 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   			return -ERANGE;
>   		}
>   	} else {
> -		switch (config.rx_filter) {
> +		switch (config->rx_filter) {
>   		case HWTSTAMP_FILTER_NONE:
> -			config.rx_filter = HWTSTAMP_FILTER_NONE;
> +			config->rx_filter = HWTSTAMP_FILTER_NONE;
>   			break;
>   		default:
>   			/* PTP v1, UDP, any kind of event packet */
> -			config.rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
> +			config->rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
>   			break;
>   		}
>   	}
> -	priv->hwts_rx_en = ((config.rx_filter == HWTSTAMP_FILTER_NONE) ? 0 : 1);
> -	priv->hwts_tx_en = config.tx_type == HWTSTAMP_TX_ON;
> +	priv->hwts_rx_en = config->rx_filter != HWTSTAMP_FILTER_NONE;
> +	priv->hwts_tx_en = config->tx_type == HWTSTAMP_TX_ON;
>   
>   	priv->systime_flags = STMMAC_HWTS_ACTIVE;
>   
> @@ -756,31 +753,30 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   
>   	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
>   
> -	memcpy(&priv->tstamp_config, &config, sizeof(config));
> +	priv->tstamp_config = *config;
>   
> -	return copy_to_user(ifr->ifr_data, &config,
> -			    sizeof(config)) ? -EFAULT : 0;
> +	return 0;
>   }
>   
>   /**
>    *  stmmac_hwtstamp_get - read hardware timestamping.
>    *  @dev: device pointer.
> - *  @ifr: An IOCTL specific structure, that can contain a pointer to
> - *  a proprietary structure used to pass information to the driver.
> + *  @config: the timestamping configuration.
>    *  Description:
>    *  This function obtain the current hardware timestamping settings
>    *  as requested.
>    */
> -static int stmmac_hwtstamp_get(struct net_device *dev, struct ifreq *ifr)
> +static int stmmac_hwtstamp_get(struct net_device *dev,
> +			       struct kernel_hwtstamp_config *config)
>   {
>   	struct stmmac_priv *priv = netdev_priv(dev);
> -	struct hwtstamp_config *config = &priv->tstamp_config;
>   
>   	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
>   		return -EOPNOTSUPP;
>   
> -	return copy_to_user(ifr->ifr_data, config,
> -			    sizeof(*config)) ? -EFAULT : 0;
> +	*config = priv->tstamp_config;
> +
> +	return 0;
>   }
>   
>   /**
> @@ -6228,12 +6224,6 @@ static int stmmac_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
>   	case SIOCSMIIREG:
>   		ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
>   		break;
> -	case SIOCSHWTSTAMP:
> -		ret = stmmac_hwtstamp_set(dev, rq);
> -		break;
> -	case SIOCGHWTSTAMP:
> -		ret = stmmac_hwtstamp_get(dev, rq);
> -		break;
>   	default:
>   		break;
>   	}
> @@ -7172,6 +7162,8 @@ static const struct net_device_ops stmmac_netdev_ops = {
>   	.ndo_bpf = stmmac_bpf,
>   	.ndo_xdp_xmit = stmmac_xdp_xmit,
>   	.ndo_xsk_wakeup = stmmac_xsk_wakeup,
> +	.ndo_hwtstamp_get = stmmac_hwtstamp_get,
> +	.ndo_hwtstamp_set = stmmac_hwtstamp_set,
>   };
>   
>   static void stmmac_reset_subtask(struct stmmac_priv *priv)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
