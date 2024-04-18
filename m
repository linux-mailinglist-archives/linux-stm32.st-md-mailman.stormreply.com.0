Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B18A989D
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 13:33:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30229C6C859;
	Thu, 18 Apr 2024 11:33:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6603C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 11:33:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 920941BF206;
 Thu, 18 Apr 2024 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713440011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k2t0MvM3jxvWGhN7eeYzckVy+rZfzBeuSxhEQgyjStA=;
 b=T2l9eKaEQOh/hyimKIEDxMZ3Pn2pDXPAXRc6Qs194CynWl621S9CfaOzn6J8yWwAChl1jW
 6Gb+U3xdQ2nN+H+Ysdo6Qx09jkQwPkQTnr6LFj7rJId12SmbDAjXcoJPII3SRN2jP1f2B+
 /dVv8tiIq2ipOXEoZzZqlVcqNnEkqRvNhaWFlN5crMPdIQBVSvUTYWNwmJFFTGMVzAar2y
 I1TVf87X3GglcePbiTlFkxGZ47pD+scs1RDbffKxXfn7A4dYhcKjcCG22uXUu9t8cEi/UZ
 n0yxF39bBWUQb+89HQW7W3WSfvdJNqlMQy/aycd3D3XMtuoTe2fKuZ4xRMlYiQ==
Date: Thu, 18 Apr 2024 13:34:06 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <20240417140013.12575-3-fancer.lancer@gmail.com>
Message-ID: <c441691f-906d-4f44-10c8-3d8437cd3833@bootlin.com>
References: <20240417140013.12575-1-fancer.lancer@gmail.com>
 <20240417140013.12575-3-fancer.lancer@gmail.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Samuel Holland <samuel@sholland.org>, Yanteng Si <siyanteng@loongson.cn>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: Move MAC
 caps init to phylink MAC caps getter
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

On Wed, 17 Apr 2024, Serge Semin wrote:

> After a set of recent fixes the stmmac_phy_setup() and
> stmmac_reinit_queues() methods have turned to having some duplicated code.
> Let's get rid from the duplication by moving the MAC-capabilities
> initialization to the PHYLINK MAC-capabilities getter. The getter is
> called during each network device interface open/close cycle. So the
> MAC-capabilities will be initialized in generic device open procedure and
> in case of the Tx/Rx queues re-initialization as the original code
> semantics implies.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> 
> ---
> 
> Link: https://lore.kernel.org/netdev/20240412180340.7965-5-fancer.lancer@gmail.com/
> Changelog v2:
> - Resubmit the patch to net-next separately from the main patchset (Paolo)
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 +++++++++----------
>  1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b810f6b69bf5..0d6cd1704e6a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -936,6 +936,22 @@ static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex)
>  			priv->pause, tx_cnt);
>  }
>  
> +static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
> +					 phy_interface_t interface)
> +{
> +	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> +
> +	/* Refresh the MAC-specific capabilities */
> +	stmmac_mac_update_caps(priv);
> +
> +	config->mac_capabilities = priv->hw->link.caps;
> +
> +	if (priv->plat->max_speed)
> +		phylink_limit_mac_speed(config, priv->plat->max_speed);
> +
> +	return config->mac_capabilities;
> +}
> +
>  static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
>  						 phy_interface_t interface)
>  {
> @@ -1105,6 +1121,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  }
>  
>  static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
> +	.mac_get_caps = stmmac_mac_get_caps,
>  	.mac_select_pcs = stmmac_mac_select_pcs,
>  	.mac_config = stmmac_mac_config,
>  	.mac_link_down = stmmac_mac_link_down,
> @@ -1204,7 +1221,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
>  	int mode = priv->plat->phy_interface;
>  	struct fwnode_handle *fwnode;
>  	struct phylink *phylink;
> -	int max_speed;
>  
>  	priv->phylink_config.dev = &priv->dev->dev;
>  	priv->phylink_config.type = PHYLINK_NETDEV;
> @@ -1225,15 +1241,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
>  		xpcs_get_interfaces(priv->hw->xpcs,
>  				    priv->phylink_config.supported_interfaces);
>  
> -	/* Refresh the MAC-specific capabilities */
> -	stmmac_mac_update_caps(priv);
> -
> -	priv->phylink_config.mac_capabilities = priv->hw->link.caps;
> -
> -	max_speed = priv->plat->max_speed;
> -	if (max_speed)
> -		phylink_limit_mac_speed(&priv->phylink_config, max_speed);
> -
>  	fwnode = priv->plat->port_node;
>  	if (!fwnode)
>  		fwnode = dev_fwnode(priv->device);
> @@ -7327,7 +7334,6 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	int ret = 0, i;
> -	int max_speed;
>  
>  	if (netif_running(dev))
>  		stmmac_release(dev);
> @@ -7341,14 +7347,6 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
>  			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
>  									rx_cnt);
>  
> -	stmmac_mac_update_caps(priv);
> -
> -	priv->phylink_config.mac_capabilities = priv->hw->link.caps;
> -
> -	max_speed = priv->plat->max_speed;
> -	if (max_speed)
> -		phylink_limit_mac_speed(&priv->phylink_config, max_speed);
> -
>  	stmmac_napi_add(dev);
>  
>  	if (netif_running(dev))
> -- 
> 2.43.0
> 
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
