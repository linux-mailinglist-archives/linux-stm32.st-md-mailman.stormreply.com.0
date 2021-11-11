Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A644D732
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 14:27:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95F34C5EC72;
	Thu, 11 Nov 2021 13:27:43 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 504FCC5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 13:27:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DFB9F1F45B7A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636637261; bh=v3jNwU3svQR6Lr7BTf8BYgD2MW9QjuxGXOskm/lyYXY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Y6ziKRm36l0zHh0H4YQ33UupfOluTs+DQiEwvC5QTfF31BXyVi6GHvQ9XdRG+BLwR
 q3Qi2aXCV1MkKOaK7VN0uOe0fYV6fM8OIVj3iNIgw1JFGS9Xv5RkGPT1FrFwcvRW1F
 ywzl+a9+PQOZVUW81z0f4spRlPrdVaf9yMw2bgaAfCQgYolXnQpg6ORpM61DeukP2A
 Pgtv1EIF94XlH4JZxqBlM/bW3GU/d1KPBIbxG4e93MAivv4OtZwiVwKYDplPHaeXR7
 UVMsW9q/IoaaY6ltJQAbI3tCYaj3cBl9Cw7Y8gy0Md+Cm4KtLABnqAlYZ+7Lhvw7r2
 PyvUxuK/gxYMw==
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-4-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <5ba1bcd8-ec41-5899-bcab-b95e0df90bc1@collabora.com>
Date: Thu, 11 Nov 2021 14:27:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111071214.21027-4-biao.huang@mediatek.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] net: stmmac: dwmac-mediatek: add
 support for mt8195
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

Il 11/11/21 08:12, Biao Huang ha scritto:
> Add Ethernet support for MediaTek SoCs from the mt8195 family.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 261 +++++++++++++++++-
>   1 file changed, 260 insertions(+), 1 deletion(-)
> 

Hello Biao,

thanks for the patch!


> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 6ea972e96665..b1266b68e21f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -40,6 +40,33 @@
>   #define ETH_FINE_DLY_GTXC	BIT(1)
>   #define ETH_FINE_DLY_RXC	BIT(0)
>   
> +/* Peri Configuration register for mt8195 */
> +#define MT8195_PERI_ETH_CTRL0		0xFD0
> +#define MT8195_RMII_CLK_SRC_INTERNAL	BIT(28)
> +#define MT8195_RMII_CLK_SRC_RXC		BIT(27)
> +#define MT8195_ETH_INTF_SEL		GENMASK(26, 24)
> +#define MT8195_RGMII_TXC_PHASE_CTRL	BIT(22)
> +#define MT8195_EXT_PHY_MODE		BIT(21)
> +#define MT8195_DLY_GTXC_INV		BIT(12)
> +#define MT8195_DLY_GTXC_ENABLE		BIT(5)
> +#define MT8195_DLY_GTXC_STAGES		GENMASK(4, 0)
> +
> +#define MT8195_PERI_ETH_CTRL1		0xFD4
> +#define MT8195_DLY_RXC_INV		BIT(25)
> +#define MT8195_DLY_RXC_ENABLE		BIT(18)
> +#define MT8195_DLY_RXC_STAGES		GENMASK(17, 13)
> +#define MT8195_DLY_TXC_INV		BIT(12)
> +#define MT8195_DLY_TXC_ENABLE		BIT(5)
> +#define MT8195_DLY_TXC_STAGES		GENMASK(4, 0)
> +
> +#define MT8195_PERI_ETH_CTRL2		0xFD8
> +#define MT8195_DLY_RMII_RXC_INV		BIT(25)
> +#define MT8195_DLY_RMII_RXC_ENABLE	BIT(18)
> +#define MT8195_DLY_RMII_RXC_STAGES	GENMASK(17, 13)
> +#define MT8195_DLY_RMII_TXC_INV		BIT(12)
> +#define MT8195_DLY_RMII_TXC_ENABLE	BIT(5)
> +#define MT8195_DLY_RMII_TXC_STAGES	GENMASK(4, 0)
> +
>   struct mac_delay_struct {
>   	u32 tx_delay;
>   	u32 rx_delay;
> @@ -58,11 +85,13 @@ struct mediatek_dwmac_plat_data {
>   	int num_clks_to_config;
>   	bool rmii_clk_from_mac;
>   	bool rmii_rxc;
> +	bool mac_wol;
>   };
>   
>   struct mediatek_dwmac_variant {
>   	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat);
>   	int (*dwmac_set_delay)(struct mediatek_dwmac_plat_data *plat);
> +	void (*dwmac_fix_mac_speed)(void *priv, unsigned int speed);
>   
>   	/* clock ids to be requested */
>   	const char * const *clk_list;
> @@ -78,6 +107,10 @@ static const char * const mt2712_dwmac_clk_l[] = {
>   	"axi", "apb", "mac_main", "ptp_ref", "rmii_internal"
>   };
>   
> +static const char * const mt8195_dwmac_clk_l[] = {
> +	"axi", "apb", "mac_cg", "mac_main", "ptp_ref", "rmii_internal"
> +};
> +
>   static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
>   {
>   	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
> @@ -268,6 +301,204 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
>   		.tx_delay_max = 17600,
>   };
>   
> +static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
> +{
> +	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
> +	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
> +	u32 intf_val = 0;
> +
> +	/* The clock labeled as "rmii_internal" in mt8195_dwmac_clk_l is needed
> +	 * only in RMII(when MAC provides the reference clock), and useless for
> +	 * RGMII/MII/RMII(when PHY provides the reference clock).
> +	 * num_clks_to_config indicates the real number of clocks should be
> +	 * configured, equals to (plat->variant->num_clks - 1) in default for all the case,
> +	 * then +1 for rmii_clk_from_mac case.
> +	 */
> +	plat->num_clks_to_config = plat->variant->num_clks - 1;
> +
> +	/* select phy interface in top control domain */
> +	switch (plat->phy_mode) {
> +	case PHY_INTERFACE_MODE_MII:
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_MII);
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		if (plat->rmii_clk_from_mac)
> +			plat->num_clks_to_config++;
> +		intf_val |= (rmii_rxc | rmii_clk_from_mac);
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RMII);
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RGMII);
> +		break;
> +	default:
> +		dev_err(plat->dev, "phy interface not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	/* MT8195 only support external PHY */
> +	intf_val |= MT8195_EXT_PHY_MODE;
> +
> +	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL0, intf_val);
> +
> +	return 0;
> +}
> +
> +static void mt8195_delay_ps2stage(struct mediatek_dwmac_plat_data *plat)
> +{
> +	struct mac_delay_struct *mac_delay = &plat->mac_delay;
> +
> +	/* 290ps per stage */
> +	mac_delay->tx_delay /= 290;
> +	mac_delay->rx_delay /= 290;
> +}
> +
> +static void mt8195_delay_stage2ps(struct mediatek_dwmac_plat_data *plat)
> +{
> +	struct mac_delay_struct *mac_delay = &plat->mac_delay;
> +
> +	/* 290ps per stage */
> +	mac_delay->tx_delay *= 290;
> +	mac_delay->rx_delay *= 290;
> +}
> +
> +static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
> +{
> +	struct mac_delay_struct *mac_delay = &plat->mac_delay;
> +	u32 gtxc_delay_val, delay_val = 0, rmii_delay_val = 0;
> +
> +	mt8195_delay_ps2stage(plat);
> +
> +	switch (plat->phy_mode) {
> +	case PHY_INTERFACE_MODE_MII:
> +		delay_val |= FIELD_PREP(MT8195_DLY_TXC_ENABLE, !!mac_delay->tx_delay);
> +		delay_val |= FIELD_PREP(MT8195_DLY_TXC_STAGES, mac_delay->tx_delay);
> +		delay_val |= FIELD_PREP(MT8195_DLY_TXC_INV, mac_delay->tx_inv);
> +
> +		delay_val |= FIELD_PREP(MT8195_DLY_RXC_ENABLE, !!mac_delay->rx_delay);
> +		delay_val |= FIELD_PREP(MT8195_DLY_RXC_STAGES, mac_delay->rx_delay);
> +		delay_val |= FIELD_PREP(MT8195_DLY_RXC_INV, mac_delay->rx_inv);
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		if (plat->rmii_clk_from_mac) {
> +			/* case 1: mac provides the rmii reference clock,
> +			 * and the clock output to TXC pin.
> +			 * The egress timing can be adjusted by RMII_TXC delay macro circuit.
> +			 * The ingress timing can be adjusted by RMII_RXC delay macro circuit.
> +			 */
> +			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_TXC_ENABLE,
> +						     !!mac_delay->tx_delay);
> +			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_TXC_STAGES,
> +						     mac_delay->tx_delay);
> +			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_TXC_INV,
> +						     mac_delay->tx_inv);
> +
> +			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_RXC_ENABLE,
> +						     !!mac_delay->rx_delay);
> +			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_RXC_STAGES,
> +						     mac_delay->rx_delay);
> +			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_RXC_INV,
> +						     mac_delay->rx_inv);
> +		} else {
> +			/* case 2: the rmii reference clock is from external phy,
> +			 * and the property "rmii_rxc" indicates which pin(TXC/RXC)
> +			 * the reference clk is connected to. The reference clock is a
> +			 * received signal, so rx_delay/rx_inv are used to indicate
> +			 * the reference clock timing adjustment
> +			 */
> +			if (plat->rmii_rxc) {
> +				/* the rmii reference clock from outside is connected
> +				 * to RXC pin, the reference clock will be adjusted
> +				 * by RXC delay macro circuit.
> +				 */
> +				delay_val |= FIELD_PREP(MT8195_DLY_RXC_ENABLE,
> +							!!mac_delay->rx_delay);
> +				delay_val |= FIELD_PREP(MT8195_DLY_RXC_STAGES,
> +							mac_delay->rx_delay);
> +				delay_val |= FIELD_PREP(MT8195_DLY_RXC_INV,
> +							mac_delay->rx_inv);
> +			} else {
> +				/* the rmii reference clock from outside is connected
> +				 * to TXC pin, the reference clock will be adjusted
> +				 * by TXC delay macro circuit.
> +				 */
> +				delay_val |= FIELD_PREP(MT8195_DLY_TXC_ENABLE,
> +							!!mac_delay->rx_delay);
> +				delay_val |= FIELD_PREP(MT8195_DLY_TXC_STAGES,
> +							mac_delay->rx_delay);
> +				delay_val |= FIELD_PREP(MT8195_DLY_TXC_INV,
> +							mac_delay->rx_inv);
> +			}
> +		}
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE, !!mac_delay->tx_delay);
> +		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_STAGES, mac_delay->tx_delay);
> +		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_INV, mac_delay->tx_inv);
> +
> +		delay_val |= FIELD_PREP(MT8195_DLY_RXC_ENABLE, !!mac_delay->rx_delay);
> +		delay_val |= FIELD_PREP(MT8195_DLY_RXC_STAGES, mac_delay->rx_delay);
> +		delay_val |= FIELD_PREP(MT8195_DLY_RXC_INV, mac_delay->rx_inv);
> +
> +		break;
> +	default:
> +		dev_err(plat->dev, "phy interface not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(plat->peri_regmap,
> +			   MT8195_PERI_ETH_CTRL0,
> +			   MT8195_RGMII_TXC_PHASE_CTRL |
> +			   MT8195_DLY_GTXC_INV |
> +			   MT8195_DLY_GTXC_ENABLE |
> +			   MT8195_DLY_GTXC_STAGES,
> +			   gtxc_delay_val);
> +	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL1, delay_val);
> +	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL2, rmii_delay_val);
> +
> +	mt8195_delay_stage2ps(plat);
> +
> +	return 0;
> +}
> +
> +static void mt8195_fix_mac_speed(void *priv, unsigned int speed)
> +{
> +	struct mediatek_dwmac_plat_data *priv_plat = priv;
> +
> +	if ((phy_interface_mode_is_rgmii(priv_plat->phy_mode))) {
> +		/* prefer 2ns fixed delay which is controlled by TXC_PHASE_CTRL,
> +		 * when link speed is 1Gbps with RGMII interface,
> +		 * Fall back to delay macro circuit for 10/100Mbps link speed.
> +		 */
> +		if (speed == SPEED_1000)
> +			regmap_update_bits(priv_plat->peri_regmap,
> +					   MT8195_PERI_ETH_CTRL0,
> +					   MT8195_RGMII_TXC_PHASE_CTRL |
> +					   MT8195_DLY_GTXC_ENABLE |
> +					   MT8195_DLY_GTXC_INV |
> +					   MT8195_DLY_GTXC_STAGES,
> +					   MT8195_RGMII_TXC_PHASE_CTRL);
> +		else
> +			mt8195_set_delay(priv_plat);
> +	}
> +}
> +
> +static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
> +	.dwmac_set_phy_interface = mt8195_set_interface,
> +	.dwmac_set_delay = mt8195_set_delay,
> +	.dwmac_fix_mac_speed = mt8195_fix_mac_speed,
> +	.clk_list = mt8195_dwmac_clk_l,
> +	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
> +	.dma_bit_mask = 35,
> +	.rx_delay_max = 9280,
> +	.tx_delay_max = 9280,
> +};
> +
>   static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
>   {
>   	struct mac_delay_struct *mac_delay = &plat->mac_delay;
> @@ -308,6 +539,7 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
>   	mac_delay->rx_inv = of_property_read_bool(plat->np, "mediatek,rxc-inverse");
>   	plat->rmii_rxc = of_property_read_bool(plat->np, "mediatek,rmii-rxc");
>   	plat->rmii_clk_from_mac = of_property_read_bool(plat->np, "mediatek,rmii-clk-from-mac");
> +	plat->mac_wol = of_property_read_bool(plat->np, "mediatek,mac-wol");
>   
>   	return 0;
>   }
> @@ -384,6 +616,16 @@ static int mediatek_dwmac_clks_config(void *priv, bool enabled)
>   
>   	return ret;
>   }
> +
> +static void mediatek_fix_mac_speed(void *priv, unsigned int speed)
> +{
> +	struct mediatek_dwmac_plat_data *plat = priv;
> +	const struct mediatek_dwmac_variant *variant = plat->variant;
> +
> +	if (variant->dwmac_fix_mac_speed)
> +		variant->dwmac_fix_mac_speed(priv, speed);

This function serves only as a wrapper to call variant->dwmac_fix_mac_speed, which

also happens to have the same function signature as the one in plat_stmmacenet_data

...so, why are you introducing this?



Is this function expected to do more than just wrap the call?

> +}
> +
>   static int mediatek_dwmac_probe(struct platform_device *pdev)
>   {
>   	struct mediatek_dwmac_plat_data *priv_plat;
> @@ -421,7 +663,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>   		return PTR_ERR(plat_dat);
>   
>   	plat_dat->interface = priv_plat->phy_mode;
> -	plat_dat->use_phy_wol = 1;
> +	plat_dat->use_phy_wol = priv_plat->mac_wol ? 0 : 1;
>   	plat_dat->riwt_off = 1;
>   	plat_dat->maxmtu = ETH_DATA_LEN;
>   	plat_dat->addr64 = priv_plat->variant->dma_bit_mask;
> @@ -429,7 +671,22 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>   	plat_dat->init = mediatek_dwmac_init;
>   	plat_dat->exit = mediatek_dwmac_exit;
>   	plat_dat->clks_config = mediatek_dwmac_clks_config;
> +	plat_dat->fix_mac_speed = mediatek_fix_mac_speed;

So, since that function serves as a wrapper only....



	if (priv_plat->variant->dwmac_fix_mac_speed)

		lat_dat->fix_mac_speed = priv_plat->variant->dwmac_fix_mac_speed;



seems to be a good option :)





Regards,

- Angelo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
