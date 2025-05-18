Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D77ABB246
	for <lists+linux-stm32@lfdr.de>; Mon, 19 May 2025 00:45:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 078FDC78F85;
	Sun, 18 May 2025 22:45:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CF1AC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 May 2025 22:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=2uaQXKeZrx7VfH/3dDY8LD5mrbSCPAo4RzuDLB/xMM0=; b=XTHzvlpHcAAYniK+TGI6Dqqb8f
 31BJBkgoHrGuN89wszLyuGW7D42kiPlfK5dQ2M0o9TsrXtaas+DYQxxxZcy/RzOLHuEwIVadF55ou
 89wbdxruVBtgwsxD6K+0BQyIWdPHiZkgYMrcd3YAhKDJIvYqh+U54rJo9g+IsRP2f1Fc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uGmkm-00Cx21-1J; Mon, 19 May 2025 00:45:08 +0200
Date: Mon, 19 May 2025 00:45:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Message-ID: <251dfe22-3050-4784-82d8-a1fd52243728@lunn.ch>
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
 <20250516011130.818-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250516011130.818-1-weishangjuan@eswincomputing.com>
Cc: edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 jan.petrous@oss.nxp.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, dfustini@tenstorrent.com,
 linux-arm-kernel@lists.infradead.org, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 p.zabel@pengutronix.de, inochiama@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v1 2/2] ethernet: eswin: Add eic7700
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

> +/* RTL8211F PHY Configurations for LEDs */
> +#define PHY_ADDR				0
> +#define PHY_PAGE_SWITCH_REG		31
> +#define PHY_LED_CFG_REG			16
> +#define PHY_LED_PAGE_CFG		0xd04

The PHY driver is responsible for the PHY LEDs, not the MAC driver.

> +static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
> +				   struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 burst_map = 0;
> +	u32 bit_index = 0;
> +	u32 a_index = 0;
> +
> +	if (!plat_dat->axi) {
> +		plat_dat->axi = kzalloc(sizeof(*plat_dat->axi), GFP_KERNEL);
> +
> +		if (!plat_dat->axi)
> +			return -ENOMEM;
> +	}
> +
> +	plat_dat->axi->axi_lpi_en = device_property_read_bool(dev,
> +							      "snps,en-lpi");

Please look at the work Russell King has been doing recently, and make
sure you are not adding stuff he has been busy cleaning up.

> +static void dwc_qos_fix_speed(void *priv, int speed, unsigned int mode)
> +{
> +	unsigned long rate = 125000000;
> +	int i, err, data = 0;
> +	struct dwc_qos_priv *dwc_priv = (struct dwc_qos_priv *)priv;
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		rate = 125000000;
> +
> +		for (i = 0; i < 3; i++)
> +			regmap_write(dwc_priv->hsp_regmap,
> +				     dwc_priv->dly_hsp_reg[i],
> +				     dwc_priv->dly_param_1000m[i]);
> +
> +		if (dwc_priv->stmpriv) {
> +			data = mdiobus_read(dwc_priv->stmpriv->mii, PHY_ADDR,
> +					    PHY_PAGE_SWITCH_REG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, PHY_LED_PAGE_CFG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_LED_CFG_REG, dwc_priv->phyled_cfgs[0]);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, data);

Please remove all this LED code.

> +	dwc_priv->dev = &pdev->dev;
> +	dwc_priv->phy_reset = devm_gpiod_get(&pdev->dev, "rst", GPIOD_OUT_LOW);
> +	if (IS_ERR(dwc_priv->phy_reset)) {
> +		dev_err(&pdev->dev, "Reset gpio not specified\n");
> +		return -EINVAL;
> +	}
> +
> +	gpiod_set_value(dwc_priv->phy_reset, 0);

Please allow phylib to control the PHY reset line.

> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "eswin,dly_hsp_reg",
> +						  &dwc_priv->dly_hsp_reg[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay hsp reg.ret(%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-1000m",
> +						  &dwc_priv->dly_param_1000m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 1Gbps mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-100m",
> +						  &dwc_priv->dly_param_100m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 100Mbps mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-10m",
> +						  &dwc_priv->dly_param_10m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 10Mbps mode (%d)\n", ret);
> +		return ret;
> +	}

What are these delay parameters?


    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
