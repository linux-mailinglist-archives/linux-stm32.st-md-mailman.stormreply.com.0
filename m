Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB1C94D101
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 15:17:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7575EC7801E;
	Fri,  9 Aug 2024 13:17:10 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52574CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 13:17:03 +0000 (UTC)
Received: from i53875b02.versanet.de ([83.135.91.2] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1scPU5-00076L-DZ; Fri, 09 Aug 2024 15:16:45 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 09 Aug 2024 15:16:44 +0200
Message-ID: <3724132.9z1YWOviru@diego>
In-Reply-To: <20240808170113.82775-3-detlev.casanova@collabora.com>
References: <20240808170113.82775-1-detlev.casanova@collabora.com>
 <20240808170113.82775-3-detlev.casanova@collabora.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH v2 2/2] ethernet: stmmac: dwmac-rk: Add
	GMAC support for RK3576
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

Hi Detlev,

Am Donnerstag, 8. August 2024, 19:00:18 CEST schrieb Detlev Casanova:
> From: David Wu <david.wu@rock-chips.com>
> 
> Add constants and callback functions for the dwmac on RK3576 soc.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> [rebase, extracted bindings]
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 7ae04d8d291c8..e1fa8fc9f4012 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1116,6 +1116,161 @@ static const struct rk_gmac_ops rk3568_ops = {
>  	},
>  };
>  
> +/* VCCIO0_1_3_IOC */
> +#define RK3576_VCCIO0_1_3_IOC_CON2		0X6408
> +#define RK3576_VCCIO0_1_3_IOC_CON3		0X640c
> +#define RK3576_VCCIO0_1_3_IOC_CON4		0X6410
> +#define RK3576_VCCIO0_1_3_IOC_CON5		0X6414
> +
> +#define RK3576_GMAC_RXCLK_DLY_ENABLE		GRF_BIT(15)
> +#define RK3576_GMAC_RXCLK_DLY_DISABLE		GRF_CLR_BIT(15)
> +#define RK3576_GMAC_TXCLK_DLY_ENABLE		GRF_BIT(7)
> +#define RK3576_GMAC_TXCLK_DLY_DISABLE		GRF_CLR_BIT(7)
> +
> +#define RK3576_GMAC_CLK_RX_DL_CFG(val)		HIWORD_UPDATE(val, 0x7F, 8)
> +#define RK3576_GMAC_CLK_TX_DL_CFG(val)		HIWORD_UPDATE(val, 0x7F, 0)
> +
> +/* SDGMAC_GRF */
> +#define RK3576_GRF_GMAC_CON0			0X0020
> +#define RK3576_GRF_GMAC_CON1			0X0024
> +
> +#define RK3576_GMAC_RMII_MODE			GRF_BIT(3)
> +#define RK3576_GMAC_RGMII_MODE			GRF_CLR_BIT(3)
> +
> +#define RK3576_GMAC_CLK_SELET_IO		GRF_BIT(7)
> +#define RK3576_GMAC_CLK_SELET_CRU		GRF_CLR_BIT(7)

nit: typos _CLK_SELECT_ ... missing the C in select

> +
> +#define RK3576_GMAC_CLK_RMII_DIV2		GRF_BIT(5)
> +#define RK3576_GMAC_CLK_RMII_DIV20		GRF_CLR_BIT(5)

I think those are backwards
The TRM says bit[5]=0: 25MHz (DIV2) and bit[5]=1: 2.5MHz (DIV20)

I guess nobody also on Rockchip's side tested a RMII phy on those controllrs


> +
> +#define RK3576_GMAC_CLK_RGMII_DIV1		\
> +			(GRF_CLR_BIT(6) | GRF_CLR_BIT(5))
> +#define RK3576_GMAC_CLK_RGMII_DIV5		\
> +			(GRF_BIT(6) | GRF_BIT(5))
> +#define RK3576_GMAC_CLK_RGMII_DIV50		\
> +			(GRF_BIT(6) | GRF_CLR_BIT(5))
> +

in contrast, these are correct and match the TRM


> +#define RK3576_GMAC_CLK_RMII_GATE		GRF_BIT(4)
> +#define RK3576_GMAC_CLK_RMII_NOGATE		GRF_CLR_BIT(4)
> +
> +static void rk3576_set_to_rgmii(struct rk_priv_data *bsp_priv,
> +				int tx_delay, int rx_delay)
> +{
> +	struct device *dev = &bsp_priv->pdev->dev;
> +	unsigned int offset_con;
> +
> +	if (IS_ERR(bsp_priv->grf) || IS_ERR(bsp_priv->php_grf)) {
> +		dev_err(dev, "Missing rockchip,grf or rockchip,php_grf property\n");
> +		return;
> +	}
> +
> +	offset_con = bsp_priv->id == 1 ? RK3576_GRF_GMAC_CON1 :
> +					 RK3576_GRF_GMAC_CON0;
> +
> +	regmap_write(bsp_priv->grf, offset_con, RK3576_GMAC_RGMII_MODE);
> +
> +	offset_con = bsp_priv->id == 1 ? RK3576_VCCIO0_1_3_IOC_CON4 :
> +					 RK3576_VCCIO0_1_3_IOC_CON2;
> +
> +	/* m0 && m1 delay enabled */
> +	regmap_write(bsp_priv->php_grf, offset_con,
> +		     DELAY_ENABLE(RK3576, tx_delay, rx_delay));
> +	regmap_write(bsp_priv->php_grf, offset_con + 0x4,
> +		     DELAY_ENABLE(RK3576, tx_delay, rx_delay));
> +
> +	/* m0 && m1 delay value */
> +	regmap_write(bsp_priv->php_grf, offset_con,
> +		     RK3576_GMAC_CLK_TX_DL_CFG(tx_delay) |
> +		     RK3576_GMAC_CLK_RX_DL_CFG(rx_delay));
> +	regmap_write(bsp_priv->php_grf, offset_con + 0x4,
> +		     RK3576_GMAC_CLK_TX_DL_CFG(tx_delay) |
> +		     RK3576_GMAC_CLK_RX_DL_CFG(rx_delay));
> +}
> +
> +static void rk3576_set_to_rmii(struct rk_priv_data *bsp_priv)
> +{
> +	struct device *dev = &bsp_priv->pdev->dev;
> +	unsigned int offset_con;
> +
> +	if (IS_ERR(bsp_priv->php_grf)) {
> +		dev_err(dev, "%s: Missing rockchip,php_grf property\n", __func__);
> +		return;
> +	}
> +
> +	offset_con = bsp_priv->id == 1 ? RK3576_GRF_GMAC_CON1 :
> +					 RK3576_GRF_GMAC_CON0;
> +
> +	regmap_write(bsp_priv->grf, offset_con, RK3576_GMAC_RMII_MODE);
> +}
> +
> +static void rk3576_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
> +{
> +	struct device *dev = &bsp_priv->pdev->dev;
> +	unsigned int val = 0, offset_con;
> +
> +	switch (speed) {
> +	case 10:
> +		if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RMII)
> +			val = RK3576_GMAC_CLK_RMII_DIV20;
> +		else
> +			val = RK3576_GMAC_CLK_RGMII_DIV50;

		val = bsp_priv->phy_iface == PHY_INTERFACE_MODE_RMII ?
				RK3576_GMAC_CLK_RMII_DIV20 :
				RK3576_GMAC_CLK_RGMII_DIV50;
perhaps?

> +		break;
> +	case 100:
> +		if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RMII)
> +			val = RK3576_GMAC_CLK_RMII_DIV2;
> +		else
> +			val = RK3576_GMAC_CLK_RGMII_DIV5;

same as above?

> +		break;
> +	case 1000:
> +		if (bsp_priv->phy_iface != PHY_INTERFACE_MODE_RMII)
> +			val = RK3576_GMAC_CLK_RGMII_DIV1;
> +		else
> +			goto err;

		if (bsp_priv->phy_iface == PHY_INTERFACE_MODE_RMII)
			goto err;

		val = RK3576_GMAC_CLK_RGMII_DIV1;


> +		break;
> +	default:
> +		goto err;
> +	}
> +
> +	offset_con = bsp_priv->id == 1 ? RK3576_GRF_GMAC_CON1 :
> +					 RK3576_GRF_GMAC_CON0;
> +
> +	regmap_write(bsp_priv->grf, offset_con, val);
> +
> +	return;
> +err:
> +	dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
> +}
> +
> +static void rk3576_set_clock_selection(struct rk_priv_data *bsp_priv, bool input,
> +				       bool enable)
> +{
> +	unsigned int val = input ? RK3576_GMAC_CLK_SELET_IO :
> +				   RK3576_GMAC_CLK_SELET_CRU;
> +	unsigned int offset_con;
> +
> +	val |= enable ? RK3576_GMAC_CLK_RMII_NOGATE :
> +			RK3576_GMAC_CLK_RMII_GATE;
> +
> +	offset_con = bsp_priv->id == 1 ? RK3576_GRF_GMAC_CON1 :
> +					 RK3576_GRF_GMAC_CON0;

nit: alignment of both looks like it could be nicer

Heiko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
