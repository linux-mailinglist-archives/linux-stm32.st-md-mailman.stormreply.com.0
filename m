Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACF5BE1E53
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 09:22:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 243BFC57194;
	Thu, 16 Oct 2025 07:22:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D764DC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 07:22:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 740D11A1410;
 Thu, 16 Oct 2025 07:22:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3F1A56062C;
 Thu, 16 Oct 2025 07:22:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 90A44102F22EB; 
 Thu, 16 Oct 2025 09:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760599373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=7zOUzik5MyvROjRAqeUBJc8fQpkR6r5Z9zOCmYjzSrI=;
 b=vpGWNdROx4mJa+kYUKCWf/ZKPABe5NrTWaC34G6w96sxkDyFCDXq6sg5uKoVPB7Djx8+Bv
 eZgWrS6i7SEr26izkqJKdZEgm6kJ7yeGzl07WTlAlhYdB/GpuvNWdURxhefN2t2s8pEG/U
 vhSdK+mePRkg12GEg3pgX/Iywy1BQhOW1wF3atE8/Lr51xWIRTsnyWksUrRaUbNJufoP1x
 9ixcsKgT/u6qgRmcmAHAxNIrdDTdsWkW1usH+Od3ORZMb2lvl7nh68Jy3F1s/SAcjW999C
 bTO3HzVg9oK0na+KnHrtjsH9Zk4UOzRnGYAimcwJ+mR2esioHsRLRKgq5YAY+Q==
Message-ID: <c1b019e6-1463-400f-b421-91ae8fa63c3b@bootlin.com>
Date: Thu, 16 Oct 2025 09:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945T-0000000AmeV-2BvU@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v945T-0000000AmeV-2BvU@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/5] net: stmmac: avoid PHY speed
 change when configuring MTU
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
> There is no need to do the speed-down, speed-up dance when changing
> the MTU as there is little power saving that can be gained from such
> a brief interval between these, and the autonegotiation they cause
> takes much longer.
> 
> Move the calls to phylink_speed_up() and phylink_speed_down() into
> stmmac_open() and stmmac_release() respectively, reducing the work
> done in the __-variants of these functions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3728afa701c6..500cfd19e6b5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3963,8 +3963,6 @@ static int __stmmac_open(struct net_device *dev,
>  	stmmac_init_coalesce(priv);
>  
>  	phylink_start(priv->phylink);
> -	/* We may have called phylink_speed_down before */
> -	phylink_speed_up(priv->phylink);
>  
>  	ret = stmmac_request_irq(dev);
>  	if (ret)
> @@ -4015,6 +4013,9 @@ static int stmmac_open(struct net_device *dev)
>  
>  	kfree(dma_conf);
>  
> +	/* We may have called phylink_speed_down before */
> +	phylink_speed_up(priv->phylink);
> +
>  	return ret;
>  
>  err_disconnect_phy:
> @@ -4032,13 +4033,6 @@ static void __stmmac_release(struct net_device *dev)
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	u32 chan;
>  
> -	/* If the PHY or MAC has WoL enabled, then the PHY will not be
> -	 * suspended when phylink_stop() is called below. Set the PHY
> -	 * to its slowest speed to save power.
> -	 */
> -	if (device_may_wakeup(priv->device))
> -		phylink_speed_down(priv->phylink, false);
> -
>  	/* Stop and disconnect the PHY */
>  	phylink_stop(priv->phylink);
>  
> @@ -4078,6 +4072,13 @@ static int stmmac_release(struct net_device *dev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> +	/* If the PHY or MAC has WoL enabled, then the PHY will not be
> +	 * suspended when phylink_stop() is called below. Set the PHY
> +	 * to its slowest speed to save power.
> +	 */
> +	if (device_may_wakeup(priv->device))
> +		phylink_speed_down(priv->phylink, false);
> +
>  	__stmmac_release(dev);
>  
>  	phylink_disconnect_phy(priv->phylink);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
