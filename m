Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F00947DB4
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 17:08:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45BF9C71289;
	Mon,  5 Aug 2024 15:08:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F11BFC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GKfjloD6oa4JOXSe00nlirkRPmxpIJuJ9zLXTqSQAPI=; b=ViGl2BkL5r4BIMOR6jnI4uLV52
 VePlXnOarDVS1Nx3+Pes61PGKOmZNyyrQz4PxJrNzDyum7mAwZyrOEREG4J/zrFnA7BP4dDRBCI04
 vVXWyHRvdlFKnPFIMZggeKkRwdxGKYYU++s25DqQb6jNFr7CJI7tMM/PlLO+zEBQmXZirY/8I/pEG
 qB1SGx8OXmgLlX7G1i+9ubCGs1XS7Sg8bh5/k9bmHKEgaLn8OzqO04FCKMETecwKjB+zqSvgf8edQ
 80dQZXD3t6uZSkyFrBnE3UF/GSXGvFSQMon3rakHzukhg3h0tJ7F45Iuwk1C9L+l440iOt5FQZsRO
 2n6SCCcg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39576)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sazK3-0003Fw-2D;
 Mon, 05 Aug 2024 16:08:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sazK6-0002S7-0D; Mon, 05 Aug 2024 16:08:34 +0100
Date: Mon, 5 Aug 2024 16:08:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Message-ID: <ZrDq8aZh4LY5Q0UY@shell.armlinux.org.uk>
References: <AM9PR04MB85064D7EDF618DB5C34FB83BE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM9PR04MB85064D7EDF618DB5C34FB83BE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
Cc: dl-S32 <S32@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 4/6] net: stmmac: dwmac-s32cc: add basic
 NXP S32G/S32R glue
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

On Sun, Aug 04, 2024 at 08:50:10PM +0000, Jan Petrous (OSS) wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 05cc07b8f48c..31628c363d71 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -153,6 +153,17 @@ config DWMAC_RZN1
>  	  This selects the Renesas RZ/N1 SoC glue layer support for
>  	  the stmmac device driver. This support can make use of a custom MII
>  	  converter PCS device.

There should be a blank line here.

> +config DWMAC_S32CC
> +	tristate "NXP S32G/S32R GMAC support"
> +	default ARCH_S32
> +	depends on OF && (ARCH_S32 || COMPILE_TEST)
...

> +static void s32cc_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> +{
> +	struct s32cc_priv_data *gmac = priv;
> +	int ret;
> +
> +	if (!gmac->rx_clk_enabled) {
> +		ret = clk_prepare_enable(gmac->rx_clk);
> +		if (ret) {
> +			dev_err(gmac->dev, "Can't set rx clock\n");
> +			return;
> +		}
> +		dev_dbg(gmac->dev, "rx clock enabled\n");
> +		gmac->rx_clk_enabled = true;
> +	}
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		dev_dbg(gmac->dev, "Set tx clock to 125M\n");
> +		ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
> +		break;
> +	case SPEED_100:
> +		dev_dbg(gmac->dev, "Set tx clock to 25M\n");
> +		ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_25M);
> +		break;
> +	case SPEED_10:
> +		dev_dbg(gmac->dev, "Set tx clock to 2.5M\n");
> +		ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_2M5);
> +		break;
> +	default:
> +		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> +		return;
> +	}
> +

We seem to have multiple cases of very similar logic in lots of stmmac
platform drivers, and I think it's about time we said no more to this.
So, what I think we should do is as follows:

add the following helper - either in stmmac, or more generically
(phylib? - in which case its name will need changing.)

static long stmmac_get_rgmii_clock(int speed)
{
	switch (speed) {
	case SPEED_10:
		return 2500000;

	case SPEED_100:
		return 25000000;

	case SPEED_1000:
		return 125000000;

	default:
		return -ENVAL;
	}
}

Then, this can become:

	long tx_clk_rate;

	...

	tx_clk_rate = stmmac_get_rgmii_clock(speed);
	if (tx_clk_rate < 0) {
		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
		return;
	}

	ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);

> +	if (ret)
> +		dev_err(gmac->dev, "Can't set tx clock\n");
> +}
> +
> +static int s32cc_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct plat_stmmacenet_data *plat;
> +	struct s32cc_priv_data *gmac;
> +	struct stmmac_resources res;
> +	int ret;
> +
> +	gmac = devm_kzalloc(&pdev->dev, sizeof(*gmac), GFP_KERNEL);
> +	if (!gmac)
> +		return PTR_ERR(gmac);
> +
> +	gmac->dev = &pdev->dev;
> +
> +	ret = stmmac_get_platform_resources(pdev, &res);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get platform resources\n");
> +
> +	plat = devm_stmmac_probe_config_dt(pdev, res.mac);
> +	if (IS_ERR(plat))
> +		return dev_err_probe(dev, PTR_ERR(plat),
> +				     "dt configuration failed\n");
> +
> +	/* PHY interface mode control reg */
> +	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
> +	if (IS_ERR_OR_NULL(gmac->ctrl_sts))
> +		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
> +				     "S32CC config region is missing\n");

Testing with IS_ERR() is all that's required here.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
