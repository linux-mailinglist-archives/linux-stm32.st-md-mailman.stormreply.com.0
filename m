Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD7C39E58
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 10:50:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A8CCC349C4;
	Thu,  6 Nov 2025 09:50:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38D09C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 09:50:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0E3231A18F0;
 Thu,  6 Nov 2025 09:50:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D256D6068C;
 Thu,  6 Nov 2025 09:50:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 74FAF1185082B; Thu,  6 Nov 2025 10:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762422600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=mm64gM8EXxiCL6h3Shnl5SuMXJZ/nOwqbkGzDPWYn9E=;
 b=L1a3WepOX0khJ/Ur85az6tTXBpWZEK6J3cxK9BR4VanbsnRCJAPCgMjbP9n1/cQAqS9W/y
 80NmkjLcdsCoDMu3nR4a2wIJXck4IgFqHKldChNWb8dq4vQGYb6KXAjOLzUIki1xazaQvu
 5CRQeViz8SsJILlwtGKgWP+0CYKkOp3K7cL9BtJiE1joAtQUKdnj0bZK6e3qvfYXe5lwRT
 ic2C2OTTNCUcYZU/MHwD2IC1EGDbdN7UYu/OivteDmiujRxBszMrGplq/wQxRIMU3atPo0
 h3/JvgD9im0KBT3bqnum8wMp5G617rq5Rmi82aByxxrZYMeef8Sh8SyRi7V1GQ==
Message-ID: <a51db9ea-a6e9-476d-915a-2aa532fa3392@bootlin.com>
Date: Thu, 6 Nov 2025 10:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
 <E1vGdWf-0000000ClnO-03pS@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGdWf-0000000ClnO-03pS@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 01/11] net: stmmac: ingenic: move
 ingenic_mac_init()
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


On 05/11/2025 14:26, Russell King (Oracle) wrote:
> Move ingenic_mac_init() to between variant specific set_mode()
> implementations and ingenic_mac_probe(). No code changes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index c1670f6bae14..8d0627055799 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -71,20 +71,6 @@ struct ingenic_soc_info {
>  	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
>  };
>  
> -static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
> -{
> -	struct ingenic_mac *mac = bsp_priv;
> -	int ret;
> -
> -	if (mac->soc_info->set_mode) {
> -		ret = mac->soc_info->set_mode(mac->plat_dat);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
> @@ -234,6 +220,20 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> +static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
> +{
> +	struct ingenic_mac *mac = bsp_priv;
> +	int ret;
> +
> +	if (mac->soc_info->set_mode) {
> +		ret = mac->soc_info->set_mode(mac->plat_dat);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ingenic_mac_probe(struct platform_device *pdev)
>  {
>  	struct plat_stmmacenet_data *plat_dat;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
