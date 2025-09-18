Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42389B37DB7
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 10:25:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D71F5C3F957;
	Wed, 27 Aug 2025 08:25:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 017B7C349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KGZ9fOwje4MlqtMCuczbLxb/Olo2qc1yHQaGkujfbWg=; b=0PEvmLKdfidIG6CQlBbJ38O/N6
 35bcf3xx776W1e4TOIvZSQ1ph3SkNL4KmOvzUsxl3WOTm3FPJhEC21oe/elTgB+K1ar2o40rqS3pb
 l4uc1hMPr+dT7TlvbY9TexsZXSRxN61QOcriD1wl2ckYcv6ae92U0oerZimP3HdoHPNEAV9B2lYVe
 eQtW9kz80lNScz26Qdhn8ssO3pmqStU/7nq3IRR07KV1+b16otoYYKktKYPjPzl0upNPIFAqO3uq5
 Je5W8yMySwD1lERtOW6Kq+GI/Ajrl7ievIhVgEZSBDj2CJ5DeWVic3Dv/YtsXkNJFupr4IGppXXYa
 StGQS9dA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33890)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1urBSi-000000000Cj-3ECE;
 Wed, 27 Aug 2025 09:24:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1urBSd-0000000022P-2QG2; Wed, 27 Aug 2025 09:24:51 +0100
Date: Wed, 27 Aug 2025 09:24:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: weishangjuan@eswincomputing.com
Message-ID: <aK7A0-nYxBQM03zq@shell.armlinux.org.uk>
References: <20250827081135.2243-1-weishangjuan@eswincomputing.com>
 <20250827081418.2347-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827081418.2347-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, faizal.abdul.rahim@linux.intel.com,
 edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, linmin@eswincomputing.com,
 inochiama@gmail.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, p.zabel@pengutronix.de, netdev@vger.kernel.org,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v4 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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

On Wed, Aug 27, 2025 at 04:14:17PM +0800, weishangjuan@eswincomputing.com wrote:
> +struct eic7700_qos_priv {
> +	struct device *dev;
> +	struct regmap *hsp_regmap;
> +	struct clk *clk_tx;

Consider putting a pointer to the plat_dat here instead of clk_tx.

> +	struct clk *clk_axi;
> +	struct clk *clk_cfg;

Consider moving these into plat_dat->clks.

> +	u32 tx_delay_ps;
> +	u32 rx_delay_ps;
> +};
> +
> +/**
> + * eic7700_apply_delay - Update TX or RX delay bits in delay parameter value.
> + * @delay_ps: Delay in picoseconds (capped at 12.7ns).
> + * @reg:      Pointer to register value to modify.
> + * @is_rx:    True for RX delay (bits 30:24), false for TX delay (bits 14:8).
> + *
> + * Converts delay to 0.1ns units, caps at 0x7F, and sets appropriate bits.
> + * Only RX or TX bits are updated; other bits remain unchanged.
> + */
> +static inline void eic7700_apply_delay(u32 delay_ps, u32 *reg, bool is_rx)
> +{
> +	if (!reg)
> +		return;
> +
> +	u32 val = min(delay_ps / 100, EIC7700_MAX_DELAY_UNIT);
> +
> +	if (is_rx) {
> +		*reg &= ~EIC7700_ETH_RX_ADJ_DELAY;
> +		*reg |= (val << 24) & EIC7700_ETH_RX_ADJ_DELAY;
> +	} else {
> +		*reg &= ~EIC7700_ETH_TX_ADJ_DELAY;
> +		*reg |= (val << 8) & EIC7700_ETH_TX_ADJ_DELAY;
> +	}
> +}
> +
> +static int eic7700_clks_config(void *priv, bool enabled)
> +{
> +	struct eic7700_qos_priv *dwc = (struct eic7700_qos_priv *)priv;
> +	int ret = 0;
> +
> +	if (enabled) {
> +		ret = clk_prepare_enable(dwc->clk_tx);
> +		if (ret < 0) {
> +			dev_err(dwc->dev, "Failed to enable tx clock: %d\n",
> +				ret);
> +			goto err;
> +		}
> +
> +		ret = clk_prepare_enable(dwc->clk_axi);
> +		if (ret < 0) {
> +			dev_err(dwc->dev, "Failed to enable axi clock: %d\n",
> +				ret);
> +			goto err_tx;
> +		}
> +
> +		ret = clk_prepare_enable(dwc->clk_cfg);
> +		if (ret < 0) {
> +			dev_err(dwc->dev, "Failed to enable cfg clock: %d\n",
> +				ret);
> +			goto err_axi;
> +		}

You can then use clk_bulk_prepare_enable() here without the complex
unwinding if one enable fails.

> +	} else {
> +		clk_disable_unprepare(dwc->clk_tx);
> +		clk_disable_unprepare(dwc->clk_axi);
> +		clk_disable_unprepare(dwc->clk_cfg);

and clk_bulk_disable_unprepare() here.

> +	}
> +	return ret;
> +
> +err_axi:
> +	clk_disable_unprepare(dwc->clk_axi);
> +err_tx:
> +	clk_disable_unprepare(dwc->clk_tx);
> +err:
> +	return ret;
> +}
> +
> +static int eic7700_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct eic7700_qos_priv *dwc_priv;
> +	u32 eth_axi_lp_ctrl_offset;
> +	u32 eth_phy_ctrl_offset;
> +	u32 eth_phy_ctrl_regset;
> +	u32 eth_rxd_dly_offset;
> +	u32 eth_dly_param = 0;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				"failed to get resources\n");
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
> +				"dt configuration failed\n");
> +
> +	dwc_priv = devm_kzalloc(&pdev->dev, sizeof(*dwc_priv), GFP_KERNEL);
> +	if (!dwc_priv)
> +		return -ENOMEM;
> +
> +	dwc_priv->dev = &pdev->dev;
> +
> +	/* Read rx-internal-delay-ps and update rx_clk delay */
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "rx-internal-delay-ps",
> +				  &dwc_priv->rx_delay_ps)) {
> +		eic7700_apply_delay(dwc_priv->rx_delay_ps,
> +				    &eth_dly_param, true);
> +	} else {
> +		dev_warn(&pdev->dev, "can't get rx-internal-delay-ps\n");
> +	}
> +
> +	/* Read tx-internal-delay-ps and update tx_clk delay */
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "tx-internal-delay-ps",
> +				  &dwc_priv->tx_delay_ps)) {
> +		eic7700_apply_delay(dwc_priv->tx_delay_ps,
> +				    &eth_dly_param, false);
> +	} else {
> +		dev_warn(&pdev->dev, "can't get tx-internal-delay-ps\n");
> +	}
> +
> +	dwc_priv->hsp_regmap =
> +		syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +						"eswin,hsp-sp-csr");
> +	if (IS_ERR(dwc_priv->hsp_regmap))
> +		return dev_err_probe(&pdev->dev,
> +				PTR_ERR(dwc_priv->hsp_regmap),
> +				"Failed to get hsp-sp-csr regmap\n");
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node,
> +					 "eswin,hsp-sp-csr",
> +					 1, &eth_phy_ctrl_offset);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				ret,
> +				"can't get eth_phy_ctrl_offset\n");
> +
> +	regmap_read(dwc_priv->hsp_regmap, eth_phy_ctrl_offset,
> +		    &eth_phy_ctrl_regset);
> +	eth_phy_ctrl_regset |=
> +		(EIC7700_ETH_TX_CLK_SEL | EIC7700_ETH_PHY_INTF_SELI);
> +	regmap_write(dwc_priv->hsp_regmap, eth_phy_ctrl_offset,
> +		     eth_phy_ctrl_regset);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node,
> +					 "eswin,hsp-sp-csr",
> +					 2, &eth_axi_lp_ctrl_offset);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				ret,
> +				"can't get eth_axi_lp_ctrl_offset\n");
> +
> +	regmap_write(dwc_priv->hsp_regmap, eth_axi_lp_ctrl_offset,
> +		     EIC7700_ETH_CSYSREQ_VAL);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node,
> +					 "eswin,hsp-sp-csr",
> +					 3, &eth_rxd_dly_offset);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				ret,
> +				"can't get eth_rxd_dly_offset\n");
> +
> +	regmap_write(dwc_priv->hsp_regmap, eth_rxd_dly_offset,
> +		     eth_dly_param);
> +
> +	dwc_priv->clk_tx = devm_clk_get(&pdev->dev, "tx");
> +	if (IS_ERR(dwc_priv->clk_tx))
> +		return dev_err_probe(&pdev->dev,
> +				PTR_ERR(dwc_priv->clk_tx),
> +				"error getting tx clock\n");
> +
> +	dwc_priv->clk_axi = devm_clk_get(&pdev->dev, "axi");
> +	if (IS_ERR(dwc_priv->clk_axi))
> +		return dev_err_probe(&pdev->dev,
> +				PTR_ERR(dwc_priv->clk_axi),
> +				"error getting axi clock\n");
> +
> +	dwc_priv->clk_cfg = devm_clk_get(&pdev->dev, "cfg");
> +	if (IS_ERR(dwc_priv->clk_cfg))
> +		return dev_err_probe(&pdev->dev,
> +				PTR_ERR(dwc_priv->clk_cfg),
> +				"error getting cfg clock\n");

These then become devm_clk_bulk_get_all().

> +
> +	ret = eic7700_clks_config(dwc_priv, true);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				ret,
> +				"error enable clock\n");

Maybe even devm_clk_bulk_get_all_enabled() which will omit this
step...

> +
> +	plat_dat->clk_tx_i = dwc_priv->clk_tx;
> +	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> +	plat_dat->bsp_priv = dwc_priv;
> +	plat_dat->clks_config = eic7700_clks_config;
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> +	if (ret) {
> +		eic7700_clks_config(dwc_priv, false);

... and means you don't need this call...

> +		return dev_err_probe(&pdev->dev,
> +				ret,
> +				"Failed to driver probe\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static void eic7700_dwmac_remove(struct platform_device *pdev)
> +{
> +	struct eic7700_qos_priv *dwc_priv = get_stmmac_bsp_priv(&pdev->dev);
> +
> +	stmmac_pltfr_remove(pdev);
> +	eic7700_clks_config(dwc_priv, false);
> +}

... and you can remove this function entirely ...

> +
> +static const struct of_device_id eic7700_dwmac_match[] = {
> +	{ .compatible = "eswin,eic7700-qos-eth" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, eic7700_dwmac_match);
> +
> +static struct platform_driver eic7700_dwmac_driver = {
> +	.probe  = eic7700_dwmac_probe,
> +	.remove = eic7700_dwmac_remove,

... replacing this with stmmac_pltfr_remove().

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
