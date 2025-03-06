Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD04A558D5
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 22:33:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6070C78F83;
	Thu,  6 Mar 2025 21:33:25 +0000 (UTC)
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 877BCC78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 21:33:24 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1741296803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHwsh6TluptXdzXqvVPP4F+V7q9r/42AAgM1LmiztSc=;
 b=Es9lFAUDceJGTlL8uwJGkGhN6jng+5C9geSl/63qijoK8req07NEpWF2sjyhqA+CSA4yYb
 tKRSDYSkeqhLLNo89bQsXKhsbFuglD25mfvkKZREmCvLYhnSqnGQ7c7oSxdSlYvR+3CVn7
 vVbZxiegGV6EwG4RmqlNfixKp8yxuzMDb4J15DbwE0DI0v36iL57M3Deh8PSa74vmSD2m8
 8zpaRnjvCSZaMn6A6BjmJxi5v3p7f5v38VZd9KSbvAaP7sHjxcaav5LWMZ+Vug5alcjt5n
 XBZwvOj2sE5+SPtzfwD6BLRslXVIfKeicrSnPhP/ny2lVUQBpRxo+lAwemcGog==
Date: Thu, 06 Mar 2025 22:33:23 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250306203858.1677595-4-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-4-jonas@kwiboo.se>
Message-ID: <8323ba9aba1155004bcd201b4fd7b2fa@manjaro.org>
X-Sender: dsimic@manjaro.org
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] net: stmmac: dwmac-rk: Use
 DELAY_ENABLE macro for RK3588
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

Hello Jonas,

On 2025-03-06 21:38, Jonas Karlman wrote:
> Support for Rockchip RK3588 GMAC was added without use of the
> DELAY_ENABLE macro to assist with enable/disable use of MAC rx/tx 
> delay.
> 
> Change to use a variant of the DELAY_ENABLE macro to help disable MAC
> delay when RGMII_ID/RXID/TXID is used.
> 
> Fixes: 2f2b60a0ec28 ("net: ethernet: stmmac: dwmac-rk: Add gmac
> support for rk3588")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 37eb86e4e325..79db81d68afd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -91,6 +91,10 @@ struct rk_priv_data {
>  	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE : soc##_GMAC_TXCLK_DLY_DISABLE) 
> | \
>  	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE : soc##_GMAC_RXCLK_DLY_DISABLE))
> 
> +#define DELAY_ENABLE_BY_ID(soc, tx, rx, id) \
> +	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE(id) : 
> soc##_GMAC_TXCLK_DLY_DISABLE(id)) | \
> +	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE(id) : 
> soc##_GMAC_RXCLK_DLY_DISABLE(id)))
> +
>  #define PX30_GRF_GMAC_CON1		0x0904
> 
>  /* PX30_GRF_GMAC_CON1 */
> @@ -1322,8 +1326,7 @@ static void rk3588_set_to_rgmii(struct
> rk_priv_data *bsp_priv,
>  		     RK3588_GMAC_CLK_RGMII_MODE(id));
> 
>  	regmap_write(bsp_priv->grf, RK3588_GRF_GMAC_CON7,
> -		     RK3588_GMAC_RXCLK_DLY_ENABLE(id) |
> -		     RK3588_GMAC_TXCLK_DLY_ENABLE(id));
> +		     DELAY_ENABLE_BY_ID(RK3588, tx_delay, rx_delay, id));
> 
>  	regmap_write(bsp_priv->grf, offset_con,
>  		     RK3588_GMAC_CLK_RX_DL_CFG(rx_delay) |

Thanks for this patch...  It's looking good to me, and good job
spotting this issue!  Please, free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
