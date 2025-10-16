Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBD3BE1DCA
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 09:06:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C92EC57194;
	Thu, 16 Oct 2025 07:06:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D11B6C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 07:06:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4540C4E410F1;
 Thu, 16 Oct 2025 07:06:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 010036062C;
 Thu, 16 Oct 2025 07:06:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E3250102F229A; 
 Thu, 16 Oct 2025 09:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760598388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ON2SCtQiP5UISY9OlG9TMamQzrttCF5L3Gqd7rBZXq4=;
 b=SnN1ms9YDbQxlYIHv0+nQCh4k1vRIopL+ldN2EOvNg/qox1nb7+h8HSS1A/qQJGk9/ygQ7
 VIAM1M9BjOm2tYnGe82+HmTAOnsecvqmvkOFC5Fm0VNbUXMiyN4nWH6DDCi2FlqsKZIlIF
 4JCentfpIvDeohQY5cW0gn3jTanCLLpXXCtJfdwiFNecEdnkxv8bxHH86d6NymNsjSuGJN
 hXlrRr9j6NGkSTkJiB0ORYAYGE9jWqEjGbFRHd4WW9OTM45GDe9JdihKqo6GfEIHU4wJPC
 y+gyzNJVoABux5QGy8DNSTHGrJWsVwFact7d9h6WsDkIODhNEErsjM5Oigp+Vg==
Message-ID: <ae07b0b6-f5d2-416d-b861-412888fda229@bootlin.com>
Date: Thu, 16 Oct 2025 09:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945O-0000000AmeP-1k0t@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v945O-0000000AmeP-1k0t@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: place
 .mac_finish() method more appropriately
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



On 15/10/2025 18:10, Russell King (Oracle) wrote:
> Place the .mac_finish() initialiser and implementation after the
> .mac_config() initialiser and method which reflects the order that
> they appear in struct phylink_mac_ops, and the order in which they
> are called. This keeps logically similar code together.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 650d75b73e0b..3728afa701c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -859,6 +859,18 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
>  	/* Nothing to do, xpcs_config() handles everything */
>  }
>  
> +static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
> +			     phy_interface_t interface)
> +{
> +	struct net_device *ndev = to_net_dev(config->dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +
> +	if (priv->plat->mac_finish)
> +		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
> +
> +	return 0;
> +}
> +
>  static void stmmac_mac_link_down(struct phylink_config *config,
>  				 unsigned int mode, phy_interface_t interface)
>  {
> @@ -1053,27 +1065,15 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
>  	return 0;
>  }
>  
> -static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
> -			     phy_interface_t interface)
> -{
> -	struct net_device *ndev = to_net_dev(config->dev);
> -	struct stmmac_priv *priv = netdev_priv(ndev);
> -
> -	if (priv->plat->mac_finish)
> -		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
> -
> -	return 0;
> -}
> -
>  static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
>  	.mac_get_caps = stmmac_mac_get_caps,
>  	.mac_select_pcs = stmmac_mac_select_pcs,
>  	.mac_config = stmmac_mac_config,
> +	.mac_finish = stmmac_mac_finish,
>  	.mac_link_down = stmmac_mac_link_down,
>  	.mac_link_up = stmmac_mac_link_up,
>  	.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
>  	.mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
> -	.mac_finish = stmmac_mac_finish,
>  };
>  
>  /**

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
