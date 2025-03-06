Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D41A558BB
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 22:26:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 812A8C78F85;
	Thu,  6 Mar 2025 21:26:49 +0000 (UTC)
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28080C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 21:26:48 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1741296406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0cniJTIAMdIpdeQmR2BhsRWVUgh641WfBYMvCtapTXs=;
 b=WQFx1oxYMJEnrSFTAQ0UbkBpVyh0nQAgIwQEIXxuZrxgDTGBlVo43SGsVKMZ2CuuVaFS4I
 sKegnKlrteJk2c0RFwHqlW1CXBvObg64lnLfmmeOOavHBwgqmuknkFtzGQTLiFYomE2ul+
 Kcj+8Rrs9qPnuIHs5Zpx0ktxl2fRwxZ4ND/TLNIkFbiYdhsX/esaaBDyBNBRiimZ0RzF3a
 ukmnvwn1RF3g/pSw+jf8W+JrTM6BAYLrk+wjBRSdR/TmkctJHlNPwMM/TI/s4aAjRYAN6e
 CaqyoPGmG895fskrCqOIb4CwY1YC6gbpJg1UhXAefv9dcHPQH84Ou7Tegiln8g==
Date: Thu, 06 Mar 2025 22:26:45 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250306203858.1677595-3-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-3-jonas@kwiboo.se>
Message-ID: <73ac54350ee3e42dee2b886403f003de@manjaro.org>
X-Sender: dsimic@manjaro.org
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] net: stmmac: dwmac-rk: Use
 DELAY_ENABLE macro for RK3566/RK3568
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
> Support for Rockchip RK3566/RK3568 GMAC was added without use of the
> DELAY_ENABLE macro to assist with enable/disable use of MAC rx/tx 
> delay.
> 
> Change to use the DELAY_ENABLE macro to help disable MAC delay when
> RGMII_ID/RXID/TXID is used. This also re-order to enable/disable before

s/re-order/re-orders/

> the delay is written to match all other GMAC and vendor kernel.

s/GMAC/GMACs/

> Fixes: 3bb3d6b1c195 ("net: stmmac: Add RK3566/RK3568 SoC support")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 297fa93e4a39..37eb86e4e325 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1049,14 +1049,13 @@ static void rk3568_set_to_rgmii(struct
> rk_priv_data *bsp_priv,
>  	con1 = (bsp_priv->id == 1) ? RK3568_GRF_GMAC1_CON1 :
>  				     RK3568_GRF_GMAC0_CON1;
> 
> +	regmap_write(bsp_priv->grf, con1,
> +		     RK3568_GMAC_PHY_INTF_SEL_RGMII |
> +		     DELAY_ENABLE(RK3568, tx_delay, rx_delay));
> +
>  	regmap_write(bsp_priv->grf, con0,
>  		     RK3568_GMAC_CLK_RX_DL_CFG(rx_delay) |
>  		     RK3568_GMAC_CLK_TX_DL_CFG(tx_delay));
> -
> -	regmap_write(bsp_priv->grf, con1,
> -		     RK3568_GMAC_PHY_INTF_SEL_RGMII |
> -		     RK3568_GMAC_RXCLK_DLY_ENABLE |
> -		     RK3568_GMAC_TXCLK_DLY_ENABLE);
>  }
> 
>  static void rk3568_set_to_rmii(struct rk_priv_data *bsp_priv)

Thanks for this patch...  It's looking good to me, and good job
spotting this issue!  Please, free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
