Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0545094531F
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Aug 2024 21:10:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6214C712A1;
	Thu,  1 Aug 2024 19:10:07 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AD83C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2024 19:10:00 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ef32fea28dso86083091fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Aug 2024 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722539400; x=1723144200;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qpZHoO/6hsX+nCMxJXNHxn39l7ARmddReK6PQZfmBS4=;
 b=bnfwfLN7ySCNfW8sWpbTTBlSjO5QMfRQCwFbCD6P2Cv5QUeHphDulmHJNgWecvhtyF
 8cKv/blf3UImY2LAePmQAqmfaTdDe5ki1yTqgzKvbhjWMeTe77eZvYOOs1IJz5vPZ7Zx
 RDM/r1cyDweBTmsGgw6KtQCDxURFwngRTieLB8Q4KSqKIDBp2uXbd+yGIbI0V4Ca8wdr
 Hm3WJD804YjUgkQAQF/AuSN5UFddPFKhp0fcUpA8NH2uV414H0ZEY1szxces0phCe61o
 oOJBN9LbKpiq29MLs3A2sRkUo0TbOej83jmDTmQwkoT5FmmBLLGLJ3zrDeKqkHF1rHSE
 oeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722539400; x=1723144200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qpZHoO/6hsX+nCMxJXNHxn39l7ARmddReK6PQZfmBS4=;
 b=qzudq4xZv1Q9gugz2rZm46ZsDcMLvhR8bIf2YbCv8i/XOQJEqdhq7xLRtz2mlWDAW0
 nZAX4eeGps8PDYUFbvGmxJ6j+LudH8QdoS//Movwu+Ki863myFYzgnkvjRxzSY0gWWm6
 2JquYcvckTkz4XYlh7hMJZ6jjwoc/xjNN/rDqgZyMXpPrhJUTUGn+2K/MUy7/f9DaOmn
 kpi6JZXkGPBSEuJgIg3NvqnAYEvgRtUsUENmI+fE54Qt3j1oxUUZupLfPmM+muXCJx/y
 jJvY5izCmJleuZ16KDPSDNhNujL3UfT6p5ALreYh45dXPd+T6SkK+Oym3PPT26QuHG+p
 arIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqeFVR+8FfP9fH1spePbGNbM8f8/He6Zg25TyWhHO8E82fjIVrH+TvCTkQ0nnogQAi7W8MiCUshs8Q7ZwmhFY3z8wfVRA2LWSTvQM9axLPrjp8gZT7lu7X
X-Gm-Message-State: AOJu0YxuX1rgsiMeu+SxDo4FKtiI9x8wKemIXj4BCSQZSe7zg6650uqY
 pWIvw3o+GPvimR6u0mAcSa+gvAO/9SSW4wVRWx5cU/0UFp088+QY
X-Google-Smtp-Source: AGHT+IHz23/0To/xP7PlNyRQ9bo8QpCLAnluXSSXqk43xJIqm7tExXUDfCkMhLZBWEYcH+OqqUb3+w==
X-Received: by 2002:a2e:8096:0:b0:2ef:3250:d0d4 with SMTP id
 38308e7fff4ca-2f15ab5c7c8mr7600511fa.48.1722539399214; 
 Thu, 01 Aug 2024 12:09:59 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15c1de3easm298551fa.33.2024.08.01.12.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 12:09:58 -0700 (PDT)
Date: Thu, 1 Aug 2024 22:09:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Swathi K S <swathi.ks@samsung.com>, Andrew Lunn <andrew@lunn.ch>
Message-ID: <yqih2sck5ayuhk5wcvgwahcndc4xb3gxthcjxgt4yqg33zfii5@ub25raxykxdp>
References: <20240730091648.72322-1-swathi.ks@samsung.com>
 <CGME20240730092902epcas5p1520f9cac624dad29f74a92ed4c559b25@epcas5p1.samsung.com>
 <20240730091648.72322-3-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240730091648.72322-3-swathi.ks@samsung.com>
Cc: jayati.sahu@samsung.com, edumazet@google.com, linux-fsd@tesla.com,
 alim.akhtar@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, linux-samsung-soc@vger.kernel.org, ssiddha@tesla.com,
 pankaj.dubey@samsung.com, krzk@kernel.org, joabreu@synopsys.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, ravi.patel@samsung.com, richardcochran@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 rcsekar@samsung.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v4 2/4] net: stmmac: dwc-qos: Add FSD EQoS
	support
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

Hi Swathi, Andrew

On Tue, Jul 30, 2024 at 02:46:46PM +0530, Swathi K S wrote:
> The FSD SoC contains two instance of the Synopsys DWC ethernet QOS IP core.
> The binding that it uses is slightly different from existing ones because
> of the integration (clocks, resets).
> 

> For FSD SoC, a mux switch is needed between internal and external clocks.
> By default after reset internal clock is used but for receiving packets
> properly, external clock is needed. Mux switch to external clock happens
> only when the external clock is present.
> 
> Signed-off-by: Chandrasekar R <rcsekar@samsung.com>
> Signed-off-by: Suresh Siddha <ssiddha@tesla.com>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> ---
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 90 +++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 +++++-
>  include/linux/stmmac.h                        |  1 +
>  3 files changed, 117 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index ec924c6c76c6..bc97b3b573b7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/stmmac.h>
> +#include <linux/regmap.h>
>  
>  #include "stmmac_platform.h"
>  #include "dwmac4.h"
> @@ -37,6 +38,13 @@ struct tegra_eqos {
>  	struct gpio_desc *reset;
>  };
>  
> +struct fsd_eqos_plat_data {
> +	const struct fsd_eqos_variant *fsd_eqos_inst_var;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	struct device *dev;
> +};
> +
>  static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
>  				   struct plat_stmmacenet_data *plat_dat)
>  {
> @@ -265,6 +273,82 @@ static int tegra_eqos_init(struct platform_device *pdev, void *priv)
>  	return 0;
>  }
>  
> +static int dwc_eqos_rxmux_setup(void *priv, bool external)
> +{
> +	int i = 0;
> +	struct fsd_eqos_plat_data *plat = priv;
> +	struct clk *rx1 = NULL;
> +	struct clk *rx2 = NULL;
> +	struct clk *rx3 = NULL;
> +
> +	for (i = 0; i < plat->num_clks; i++) {
> +		if (strcmp(plat->clks[i].id, "eqos_rxclk_mux") == 0)
> +			rx1 = plat->clks[i].clk;
> +		else if (strcmp(plat->clks[i].id, "eqos_phyrxclk") == 0)
> +			rx2 = plat->clks[i].clk;
> +		else if (strcmp(plat->clks[i].id, "dout_peric_rgmii_clk") == 0)
> +			rx3 = plat->clks[i].clk;
> +	}
> +
> +	/* doesn't support RX clock mux */
> +	if (!rx1)
> +		return 0;
> +
> +	if (external)
> +		return clk_set_parent(rx1, rx2);
> +	else
> +		return clk_set_parent(rx1, rx3);
> +}

Andrew is right asking about this implementation. It does seem
questionable:

1. AFAIR RGMII Rx clock is supposed to be retrieved the PHY. So the
eqos_phyrxclk and dout_peric_rgmii_clk are the PHY clocks. Do you have
a PHY integrated in the SoC? If so you should have defined it as a
separate DT-node and moved the clocks definition in there.

2. Do you really need to perform the "eqos_rxclk_mux" clock
re-parenting on each interface open/close? Based on the commit log you
don't. So the re-parenting can be done in the glue driver or even in
the device tree by means of the "assigned-clock-parents" property.

-Serge(y)

> +
> +static int fsd_clks_endisable(void *priv, bool enabled)
> +{
> +	struct fsd_eqos_plat_data *plat = priv;
> +
> +	if (enabled) {
> +		return clk_bulk_prepare_enable(plat->num_clks, plat->clks);
> +	} else {
> +		clk_bulk_disable_unprepare(plat->num_clks, plat->clks);
> +		return 0;
> +	}
> +}
> +
> +static int fsd_eqos_probe(struct platform_device *pdev,
> +			  struct plat_stmmacenet_data *data,
> +			  struct stmmac_resources *res)
> +{
> +	struct fsd_eqos_plat_data *priv_plat;
> +	int ret = 0;
> +
> +	priv_plat = devm_kzalloc(&pdev->dev, sizeof(*priv_plat), GFP_KERNEL);
> +	if (!priv_plat)
> +		return -ENOMEM;
> +
> +	priv_plat->dev = &pdev->dev;
> +
> +	ret = devm_clk_bulk_get_all(&pdev->dev, &priv_plat->clks);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "No clocks available\n");
> +
> +	priv_plat->num_clks = ret;
> +
> +	data->bsp_priv = priv_plat;
> +	data->clks_config = fsd_clks_endisable;
> +	data->rxmux_setup = dwc_eqos_rxmux_setup;
> +
> +	ret = fsd_clks_endisable(priv_plat, true);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Unable to enable fsd clock\n");
> +
> +	return 0;
> +}
> +
> +static void fsd_eqos_remove(struct platform_device *pdev)
> +{
> +	struct fsd_eqos_plat_data *priv_plat = get_stmmac_bsp_priv(&pdev->dev);
> +
> +	fsd_clks_endisable(priv_plat, false);
> +}
> +
>  static int tegra_eqos_probe(struct platform_device *pdev,
>  			    struct plat_stmmacenet_data *data,
>  			    struct stmmac_resources *res)
> @@ -411,6 +495,11 @@ static const struct dwc_eth_dwmac_data tegra_eqos_data = {
>  	.remove = tegra_eqos_remove,
>  };
>  
> +static const struct dwc_eth_dwmac_data fsd_eqos_data = {
> +	.probe = fsd_eqos_probe,
> +	.remove = fsd_eqos_remove,
> +};
> +
>  static int dwc_eth_dwmac_probe(struct platform_device *pdev)
>  {
>  	const struct dwc_eth_dwmac_data *data;
> @@ -473,6 +562,7 @@ static void dwc_eth_dwmac_remove(struct platform_device *pdev)
>  static const struct of_device_id dwc_eth_dwmac_match[] = {
>  	{ .compatible = "snps,dwc-qos-ethernet-4.10", .data = &dwc_qos_data },
>  	{ .compatible = "nvidia,tegra186-eqos", .data = &tegra_eqos_data },
> +	{ .compatible = "tesla,fsd-ethqos", .data = &fsd_eqos_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, dwc_eth_dwmac_match);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 12689774d755..2ef82edec522 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4001,6 +4001,12 @@ static int __stmmac_open(struct net_device *dev,
>  	netif_tx_start_all_queues(priv->dev);
>  	stmmac_enable_all_dma_irq(priv);
>  
> +	if (priv->plat->rxmux_setup) {
> +		ret = priv->plat->rxmux_setup(priv->plat->bsp_priv, true);
> +		if (ret)
> +			netdev_err(priv->dev, "Rxmux setup failed\n");
> +	}
> +
>  	return 0;
>  
>  irq_error:
> @@ -4056,7 +4062,13 @@ static void stmmac_fpe_stop_wq(struct stmmac_priv *priv)
>  static int stmmac_release(struct net_device *dev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
> -	u32 chan;
> +	u32 chan, ret;
> +
> +	if (priv->plat->rxmux_setup) {
> +		ret = priv->plat->rxmux_setup(priv->plat->bsp_priv, false);
> +		if (ret)
> +			netdev_err(priv->dev, "Rxmux setup failed\n");
> +	}
>  
>  	if (device_may_wakeup(priv->device))
>  		phylink_speed_down(priv->phylink, false);
> @@ -7848,11 +7860,17 @@ int stmmac_suspend(struct device *dev)
>  {
>  	struct net_device *ndev = dev_get_drvdata(dev);
>  	struct stmmac_priv *priv = netdev_priv(ndev);
> -	u32 chan;
> +	u32 chan, ret;
>  
>  	if (!ndev || !netif_running(ndev))
>  		return 0;
>  
> +	if (priv->plat->rxmux_setup) {
> +		ret = priv->plat->rxmux_setup(priv->plat->bsp_priv, false);
> +		if (ret)
> +			netdev_err(priv->dev, "Rxmux setup failed\n");
> +	}
> +
>  	mutex_lock(&priv->lock);
>  
>  	netif_device_detach(ndev);
> @@ -8018,6 +8036,12 @@ int stmmac_resume(struct device *dev)
>  	mutex_unlock(&priv->lock);
>  	rtnl_unlock();
>  
> +	if (priv->plat->rxmux_setup) {
> +		ret = priv->plat->rxmux_setup(priv->plat->bsp_priv, true);
> +		if (ret)
> +			netdev_err(priv->dev, "Rxmux setup failed\n");
> +	}
> +
>  	netif_device_attach(ndev);
>  
>  	return 0;
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 84e13bd5df28..f017b818d421 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -264,6 +264,7 @@ struct plat_stmmacenet_data {
>  	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
>  	int (*init)(struct platform_device *pdev, void *priv);
>  	void (*exit)(struct platform_device *pdev, void *priv);
> +	int (*rxmux_setup)(void *priv, bool external);
>  	struct mac_device_info *(*setup)(void *priv);
>  	int (*clks_config)(void *priv, bool enabled);
>  	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
