Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 929EDA55858
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 22:09:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50723C78F83;
	Thu,  6 Mar 2025 21:09:11 +0000 (UTC)
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 446F2C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 21:09:09 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1741295347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2c81lklMsWoewbTrDLPjzFIwtetRMhEGhB4+GnHcqo=;
 b=WiSqWs276XwmL6ya8O18OlaDotyFuFbRKOpfqddTDFGjegQF7yrFJ/fjZqymvfCuHegLIW
 HidnrhNz9DXyySlOqdgziypXpdovMd53ofUUCHADRAqZkUQUPdGWCoT5QwgqyhForVQcaS
 SLy+g0SDLLq6eKdiqA6beA27hQuYi3YHLH8XpvNpLeVyKuDz15NKBPDyQJ8NRaObqvesP5
 H9nB8siyzS1lzqkqpfAsqgBKH871WqOw+loSNYZ1Nd6isC6x9WdSxTufdr7kj4JfcLX5Sy
 0zdnbY4+vqADaC/N/SxFzkqHCoQHzOeX6cJc7+IpxSPj0pC/0zQrSGWPz25dUg==
Date: Thu, 06 Mar 2025 22:09:06 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250306203858.1677595-2-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-2-jonas@kwiboo.se>
Message-ID: <427cbfc8c6b71bf70804a0d535ff9d18@manjaro.org>
X-Sender: dsimic@manjaro.org
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
Cc: Wadim Egorov <w.egorov@phytec.de>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] net: stmmac: dwmac-rk: Use
 DELAY_ENABLE macro for RK3328
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
> Support for Rockchip RK3328 GMAC and addition of the DELAY_ENABLE macro
> was merged in the same merge window. This resulted in RK3328 not being
> converted to use the new DELAY_ENABLE macro.
> 
> Change to use the DELAY_ENABLE macro to help disable MAC delay when
> RGMII_ID/RXID/TXID is used.
> 
> Fixes: eaf70ad14cbb ("net: stmmac: dwmac-rk: Add handling for
> RGMII_ID/RXID/TXID")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 003fa5cf42c3..297fa93e4a39 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -593,8 +593,7 @@ static void rk3328_set_to_rgmii(struct
> rk_priv_data *bsp_priv,
>  	regmap_write(bsp_priv->grf, RK3328_GRF_MAC_CON1,
>  		     RK3328_GMAC_PHY_INTF_SEL_RGMII |
>  		     RK3328_GMAC_RMII_MODE_CLR |
> -		     RK3328_GMAC_RXCLK_DLY_ENABLE |
> -		     RK3328_GMAC_TXCLK_DLY_ENABLE);
> +		     DELAY_ENABLE(RK3328, tx_delay, rx_delay));
> 
>  	regmap_write(bsp_priv->grf, RK3328_GRF_MAC_CON0,
>  		     RK3328_GMAC_CLK_RX_DL_CFG(rx_delay) |

Thanks for this patch...  It's looking good to me, and good job
spotting this issue!  Please, feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
