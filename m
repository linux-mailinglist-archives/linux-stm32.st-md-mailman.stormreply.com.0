Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFA09F4BD2
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 14:19:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51ABEC78014;
	Tue, 17 Dec 2024 13:19:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56A6AC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 13:19:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A297C000C;
 Tue, 17 Dec 2024 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734441556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUvAF8nNh95eCP+DJf/kow70CTWmtALCQZrGVyhyTco=;
 b=DxdZ2zbbF9lT2rC9CkWB74l9vT5Dd/ap3ZVFqQhl+iuUntR7iTeWMeBIM9cgAynMsFp1QU
 6jerE5mJBZ3SgAXJ4nh//VZbyCfDGhp5j0QBWFWWZThca7x9uOKfWL0sKzzUg/D4qEo+oo
 VHci9RDcY7P08cW97PcYF+zzjjJATwEFYpMFojaWxvKf/Y2pkLGX3w4YB6vVy6XCyCp4GY
 zcW6PTtzazInS0ktppzzY4Ui5RsjY8Un0rexPzG/pZ8PMBSiJCaI6xzVEOUj5SKz9vbTsE
 xOMfvE1igIujLiMl5NHBzAsQ5IgUIt5/xMVqkt7nITzwNsxSzPOhs/qIqrHrow==
Date: Tue, 17 Dec 2024 14:19:12 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20241217141912.34cdd5ae@fedora.home>
In-Reply-To: <E1tMBRQ-006vat-7F@rmk-PC.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
 <E1tMBRQ-006vat-7F@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: use PCS
	supported_interfaces
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

Hi Russell,

On Fri, 13 Dec 2024 19:35:12 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Use the PCS' supported_interfaces member to build the MAC level
> supported_interfaces bitmap.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d45fd7a3acd5..0e45c4a48bb5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1206,6 +1206,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
>  	struct stmmac_mdio_bus_data *mdio_bus_data;
>  	int mode = priv->plat->phy_interface;
>  	struct fwnode_handle *fwnode;
> +	struct phylink_pcs *pcs;
>  	struct phylink *phylink;
>  
>  	priv->phylink_config.dev = &priv->dev->dev;
> @@ -1227,8 +1228,14 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
>  
>  	/* If we have an xpcs, it defines which PHY interfaces are supported. */
>  	if (priv->hw->xpcs)
> -		xpcs_get_interfaces(priv->hw->xpcs,
> -				    priv->phylink_config.supported_interfaces);
> +		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
> +	else
> +		pcs = priv->hw->phylink_pcs;
> +
> +	if (pcs)
> +		phy_interface_or(priv->phylink_config.supported_interfaces,
> +				 priv->phylink_config.supported_interfaces,
> +				 pcs->supported_interfaces);
>  
>  	fwnode = priv->plat->port_node;
>  	if (!fwnode)

I think that we could even make xpcs_get_interfaces a static
non-exported function now :) But this can be done in a subsequent patch.

Thanks for that work !

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
