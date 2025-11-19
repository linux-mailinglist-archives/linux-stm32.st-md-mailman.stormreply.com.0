Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3FAC6F816
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 16:04:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 939D5C36B30;
	Wed, 19 Nov 2025 15:04:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50465C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 15:04:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 742BD1A1BB0;
 Wed, 19 Nov 2025 15:04:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44D3260699;
 Wed, 19 Nov 2025 15:04:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58FED10371A6A; Wed, 19 Nov 2025 16:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763564647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=3aEgWDsDGuopuAgW/OBEgYDsivtxg9pkCbCyJ6lVjT4=;
 b=FSX73f4mQogt4yz3xsyuJ20u8IbFWpHpSPDu0V9cFBqTlzIBBjWOUx5FMDbWa9JpkfG3su
 KGA6xnT127rbFZuzkAQXSA1vj834FxYsbfyjsCuI4ocj6xioctgcQgx0sY9/EuofoJCERw
 SV1vJ14jveniWXRYD8r1fByrmpxwPTz84CdA63Ut5uBKXNR0/OaKRqu1xJWzZpN7dNbE8V
 /B4py2mkZKq9GGl7wMpNrmXfo/VUzQfDpani+TD2DNVk4vzRIFqHxie7dcPAFet9XElszE
 4YKhqKoVO0EUBp0bm68KYupOH7zOBjJJS42dphQy9uot6fPmg5Z/7WKgyFI9ww==
Message-ID: <62213fae-1141-4361-90f9-b03b48c8abfc@bootlin.com>
Date: Wed, 19 Nov 2025 16:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
 <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Drew Fustini <fustini@kernel.org>, s32@nxp.com,
 Heiko Stuebner <heiko@sntech.de>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 linux-sunxi@lists.linux.dev, Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: pass struct
 device to init()/exit() methods
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



On 19/11/2025 11:03, Russell King (Oracle) wrote:
> As struct plat_stmmacenet_data is not platform_device specific, pass
> a struct device into the init() and exit() methods to allow them to
> become independent of the underlying device.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-anarion.c   |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 12 ++++----
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  4 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 14 +++++-----
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   |  4 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 10 +++----
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  4 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-thead.c |  2 +-
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 28 ++++++++++---------
>  include/linux/stmmac.h                        |  4 +--
>  12 files changed, 47 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> index 84072c8ed741..5e0fc31762d9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> @@ -34,7 +34,7 @@ static void gmac_write_reg(struct anarion_gmac *gmac, uint8_t reg, uint32_t val)
>  	writel(val, gmac->ctl_block + reg);
>  }
>  
> -static int anarion_gmac_init(struct platform_device *pdev, void *priv)
> +static int anarion_gmac_init(struct device *dev, void *priv)
>  {
>  	uint32_t sw_config;
>  	struct anarion_gmac *gmac = priv;
> @@ -52,7 +52,7 @@ static int anarion_gmac_init(struct platform_device *pdev, void *priv)
>  	return 0;
>  }
>  
> -static void anarion_gmac_exit(struct platform_device *pdev, void *priv)
> +static void anarion_gmac_exit(struct device *dev, void *priv)
>  {
>  	struct anarion_gmac *gmac = priv;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> index 1dcf2037001e..bcb8e000e720 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> @@ -58,14 +58,14 @@ static int eic7700_clks_config(void *priv, bool enabled)
>  	return ret;
>  }
>  
> -static int eic7700_dwmac_init(struct platform_device *pdev, void *priv)
> +static int eic7700_dwmac_init(struct device *dev, void *priv)
>  {
>  	struct eic7700_qos_priv *dwc = priv;
>  
>  	return eic7700_clks_config(dwc, true);
>  }
>  
> -static void eic7700_dwmac_exit(struct platform_device *pdev, void *priv)
> +static void eic7700_dwmac_exit(struct device *dev, void *priv)
>  {
>  	struct eic7700_qos_priv *dwc = priv;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 894ee66f5c9b..de9aba756aac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -48,7 +48,7 @@ struct ls1x_dwmac {
>  struct ls1x_data {
>  	int (*setup)(struct platform_device *pdev,
>  		     struct plat_stmmacenet_data *plat_dat);
> -	int (*init)(struct platform_device *pdev, void *bsp_priv);
> +	int (*init)(struct device *dev, void *bsp_priv);
>  };
>  
>  static int ls1b_dwmac_setup(struct platform_device *pdev,
> @@ -79,7 +79,7 @@ static int ls1b_dwmac_setup(struct platform_device *pdev,
>  	return 0;
>  }
>  
> -static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
> +static int ls1b_dwmac_syscon_init(struct device *dev, void *priv)
>  {
>  	struct ls1x_dwmac *dwmac = priv;
>  	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
> @@ -98,7 +98,7 @@ static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  					   GMAC0_USE_TXCLK | GMAC0_USE_PWM01);
>  			break;
>  		default:
> -			dev_err(&pdev->dev, "Unsupported PHY mode %u\n",
> +			dev_err(dev, "Unsupported PHY mode %u\n",
>  				plat->phy_interface);
>  			return -EOPNOTSUPP;
>  		}
> @@ -122,7 +122,7 @@ static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  					   GMAC1_USE_TXCLK | GMAC1_USE_PWM23);
>  			break;
>  		default:
> -			dev_err(&pdev->dev, "Unsupported PHY mode %u\n",
> +			dev_err(dev, "Unsupported PHY mode %u\n",
>  				plat->phy_interface);
>  			return -EOPNOTSUPP;
>  		}
> @@ -133,7 +133,7 @@ static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  	return 0;
>  }
>  
> -static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
> +static int ls1c_dwmac_syscon_init(struct device *dev, void *priv)
>  {
>  	struct ls1x_dwmac *dwmac = priv;
>  	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
> @@ -143,7 +143,7 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  	phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_interface);
>  	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
>  	    phy_intf_sel != PHY_INTF_SEL_RMII) {
> -		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
> +		dev_err(dev, "Unsupported PHY-mode %u\n",
>  			plat->phy_interface);
>  		return -EOPNOTSUPP;
>  	}
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> index bc7bb975803c..be7f5eb2cdcf 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -91,7 +91,7 @@ static struct phylink_pcs *renesas_gmac_select_pcs(struct stmmac_priv *priv,
>  	return priv->hw->phylink_pcs;
>  }
>  
> -static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
> +static int renesas_gbeth_init(struct device *dev, void *priv)
>  {
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct renesas_gbeth *gbeth = priv;
> @@ -113,7 +113,7 @@ static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
>  	return ret;
>  }
>  
> -static void renesas_gbeth_exit(struct platform_device *pdev, void *priv)
> +static void renesas_gbeth_exit(struct device *dev, void *priv)
>  {
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct renesas_gbeth *gbeth = priv;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index 2b7ad64bfdf7..5a485ee98fa7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -47,7 +47,7 @@ static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
>  	return 0;
>  }
>  
> -static int s32_gmac_init(struct platform_device *pdev, void *priv)
> +static int s32_gmac_init(struct device *dev, void *priv)
>  {
>  	struct s32_priv_data *gmac = priv;
>  	int ret;
> @@ -55,31 +55,31 @@ static int s32_gmac_init(struct platform_device *pdev, void *priv)
>  	/* Set initial TX interface clock */
>  	ret = clk_prepare_enable(gmac->tx_clk);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Can't enable tx clock\n");
> +		dev_err(dev, "Can't enable tx clock\n");
>  		return ret;
>  	}
>  	ret = clk_set_rate(gmac->tx_clk, GMAC_INTF_RATE_125M);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Can't set tx clock\n");
> +		dev_err(dev, "Can't set tx clock\n");
>  		goto err_tx_disable;
>  	}
>  
>  	/* Set initial RX interface clock */
>  	ret = clk_prepare_enable(gmac->rx_clk);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Can't enable rx clock\n");
> +		dev_err(dev, "Can't enable rx clock\n");
>  		goto err_tx_disable;
>  	}
>  	ret = clk_set_rate(gmac->rx_clk, GMAC_INTF_RATE_125M);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Can't set rx clock\n");
> +		dev_err(dev, "Can't set rx clock\n");
>  		goto err_txrx_disable;
>  	}
>  
>  	/* Set interface mode */
>  	ret = s32_gmac_write_phy_intf_select(gmac);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Can't set PHY interface mode\n");
> +		dev_err(dev, "Can't set PHY interface mode\n");
>  		goto err_txrx_disable;
>  	}
>  
> @@ -92,7 +92,7 @@ static int s32_gmac_init(struct platform_device *pdev, void *priv)
>  	return ret;
>  }
>  
> -static void s32_gmac_exit(struct platform_device *pdev, void *priv)
> +static void s32_gmac_exit(struct device *dev, void *priv)
>  {
>  	struct s32_priv_data *gmac = priv;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 49d651948e2b..a2b52d2c4eb6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -551,7 +551,7 @@ static struct phylink_pcs *socfpga_dwmac_select_pcs(struct stmmac_priv *priv,
>  	return priv->hw->phylink_pcs;
>  }
>  
> -static int socfpga_dwmac_init(struct platform_device *pdev, void *bsp_priv)
> +static int socfpga_dwmac_init(struct device *dev, void *bsp_priv)
>  {
>  	struct socfpga_dwmac *dwmac = bsp_priv;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> index b0509ab6b31c..f50547b67fbc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> @@ -229,14 +229,14 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
>  	return 0;
>  }
>  
> -static int sti_dwmac_init(struct platform_device *pdev, void *bsp_priv)
> +static int sti_dwmac_init(struct device *dev, void *bsp_priv)
>  {
>  	struct sti_dwmac *dwmac = bsp_priv;
>  
>  	return clk_prepare_enable(dwmac->clk);
>  }
>  
> -static void sti_dwmac_exit(struct platform_device *pdev, void *bsp_priv)
> +static void sti_dwmac_exit(struct device *dev, void *bsp_priv)
>  {
>  	struct sti_dwmac *dwmac = bsp_priv;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 7434d4bbb526..8aa496ac85cc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -571,16 +571,16 @@ static const struct stmmac_dma_ops sun8i_dwmac_dma_ops = {
>  
>  static int sun8i_dwmac_power_internal_phy(struct stmmac_priv *priv);
>  
> -static int sun8i_dwmac_init(struct platform_device *pdev, void *priv)
> +static int sun8i_dwmac_init(struct device *dev, void *priv)
>  {
> -	struct net_device *ndev = platform_get_drvdata(pdev);
> +	struct net_device *ndev = dev_get_drvdata(dev);
>  	struct sunxi_priv_data *gmac = priv;
>  	int ret;
>  
>  	if (gmac->regulator) {
>  		ret = regulator_enable(gmac->regulator);
>  		if (ret) {
> -			dev_err(&pdev->dev, "Fail to enable regulator\n");
> +			dev_err(dev, "Fail to enable regulator\n");
>  			return ret;
>  		}
>  	}
> @@ -1005,7 +1005,7 @@ static void sun8i_dwmac_unset_syscon(struct sunxi_priv_data *gmac)
>  				   (H3_EPHY_SHUTDOWN | H3_EPHY_SELECT));
>  }
>  
> -static void sun8i_dwmac_exit(struct platform_device *pdev, void *priv)
> +static void sun8i_dwmac_exit(struct device *dev, void *priv)
>  {
>  	struct sunxi_priv_data *gmac = priv;
>  
> @@ -1265,7 +1265,7 @@ static void sun8i_dwmac_shutdown(struct platform_device *pdev)
>  	struct stmmac_priv *priv = netdev_priv(ndev);
>  	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
>  
> -	sun8i_dwmac_exit(pdev, gmac);
> +	sun8i_dwmac_exit(&pdev->dev, gmac);
>  }
>  
>  static const struct of_device_id sun8i_dwmac_match[] = {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> index 7f560d78209d..52593ba3a3a3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> @@ -27,7 +27,7 @@ struct sunxi_priv_data {
>  #define SUN7I_GMAC_GMII_RGMII_RATE	125000000
>  #define SUN7I_GMAC_MII_RATE		25000000
>  
> -static int sun7i_gmac_init(struct platform_device *pdev, void *priv)
> +static int sun7i_gmac_init(struct device *dev, void *priv)
>  {
>  	struct sunxi_priv_data *gmac = priv;
>  	int ret = 0;
> @@ -58,7 +58,7 @@ static int sun7i_gmac_init(struct platform_device *pdev, void *priv)
>  	return ret;
>  }
>  
> -static void sun7i_gmac_exit(struct platform_device *pdev, void *priv)
> +static void sun7i_gmac_exit(struct device *dev, void *priv)
>  {
>  	struct sunxi_priv_data *gmac = priv;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> index a3378046b061..e291028ba56e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> @@ -186,7 +186,7 @@ static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
>  	return 0;
>  }
>  
> -static int thead_dwmac_init(struct platform_device *pdev, void *priv)
> +static int thead_dwmac_init(struct device *dev, void *priv)
>  {
>  	struct thead_dwmac *dwmac = priv;
>  	unsigned int reg;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 1fefa6c55db1..feccb8a3e7e8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -747,40 +747,40 @@ EXPORT_SYMBOL_GPL(stmmac_get_platform_resources);
>  
>  /**
>   * stmmac_pltfr_init
> - * @pdev: pointer to the platform device
> + * @dev: pointer to the device structure
>   * @plat: driver data platform structure
>   * Description: Call the platform's init callback (if any) and propagate
>   * the return value.
>   */
> -static int stmmac_pltfr_init(struct platform_device *pdev,
> +static int stmmac_pltfr_init(struct device *dev,
>  			     struct plat_stmmacenet_data *plat)
>  {
>  	int ret = 0;
>  
>  	if (plat->init)
> -		ret = plat->init(pdev, plat->bsp_priv);
> +		ret = plat->init(dev, plat->bsp_priv);
>  
>  	return ret;
>  }
>  
>  /**
>   * stmmac_pltfr_exit
> - * @pdev: pointer to the platform device
> + * @dev: pointer to the device structure
>   * @plat: driver data platform structure
>   * Description: Call the platform's exit callback (if any).
>   */
> -static void stmmac_pltfr_exit(struct platform_device *pdev,
> +static void stmmac_pltfr_exit(struct device *dev,
>  			      struct plat_stmmacenet_data *plat)
>  {
>  	if (plat->exit)
> -		plat->exit(pdev, plat->bsp_priv);
> +		plat->exit(dev, plat->bsp_priv);
>  }
>  
>  static int stmmac_plat_suspend(struct device *dev, void *bsp_priv)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dev));
>  
> -	stmmac_pltfr_exit(to_platform_device(dev), priv->plat);
> +	stmmac_pltfr_exit(dev, priv->plat);
>  
>  	return 0;
>  }
> @@ -789,7 +789,7 @@ static int stmmac_plat_resume(struct device *dev, void *bsp_priv)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dev));
>  
> -	return stmmac_pltfr_init(to_platform_device(dev), priv->plat);
> +	return stmmac_pltfr_init(dev, priv->plat);
>  }
>  
>  /**
> @@ -804,6 +804,7 @@ int stmmac_pltfr_probe(struct platform_device *pdev,
>  		       struct plat_stmmacenet_data *plat,
>  		       struct stmmac_resources *res)
>  {
> +	struct device *dev = &pdev->dev;
>  	int ret;
>  
>  	if (!plat->suspend && plat->exit)
> @@ -811,13 +812,13 @@ int stmmac_pltfr_probe(struct platform_device *pdev,
>  	if (!plat->resume && plat->init)
>  		plat->resume = stmmac_plat_resume;
>  
> -	ret = stmmac_pltfr_init(pdev, plat);
> +	ret = stmmac_pltfr_init(dev, plat);
>  	if (ret)
>  		return ret;
>  
> -	ret = stmmac_dvr_probe(&pdev->dev, plat, res);
> +	ret = stmmac_dvr_probe(dev, plat, res);
>  	if (ret) {
> -		stmmac_pltfr_exit(pdev, plat);
> +		stmmac_pltfr_exit(dev, plat);
>  		return ret;
>  	}
>  
> @@ -866,9 +867,10 @@ void stmmac_pltfr_remove(struct platform_device *pdev)
>  	struct net_device *ndev = platform_get_drvdata(pdev);
>  	struct stmmac_priv *priv = netdev_priv(ndev);
>  	struct plat_stmmacenet_data *plat = priv->plat;
> +	struct device *dev = &pdev->dev;
>  
> -	stmmac_dvr_remove(&pdev->dev);
> -	stmmac_pltfr_exit(pdev, plat);
> +	stmmac_dvr_remove(dev);
> +	stmmac_pltfr_exit(dev, plat);
>  }
>  EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
>  
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 4f70a6551e68..673b068fdadf 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -264,8 +264,8 @@ struct plat_stmmacenet_data {
>  			  unsigned int mode,
>  			  phy_interface_t interface);
>  	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
> -	int (*init)(struct platform_device *pdev, void *priv);
> -	void (*exit)(struct platform_device *pdev, void *priv);
> +	int (*init)(struct device *dev, void *priv);
> +	void (*exit)(struct device *dev, void *priv);
>  	int (*suspend)(struct device *dev, void *priv);
>  	int (*resume)(struct device *dev, void *priv);
>  	int (*mac_setup)(void *priv, struct mac_device_info *mac);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
