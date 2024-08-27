Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB80960802
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 12:57:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C1E5C78018;
	Tue, 27 Aug 2024 10:57:35 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58B3EC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 10:57:34 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtPXv0Ypyz6J6rX;
 Tue, 27 Aug 2024 18:53:35 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 05273140B39;
 Tue, 27 Aug 2024 18:57:33 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 11:57:32 +0100
Date: Tue, 27 Aug 2024 11:57:31 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240827115731.00007469@Huawei.com>
In-Reply-To: <20240827095712.2672820-7-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-7-frank.li@vivo.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, linus.walleij@linaro.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, sd@queasysnail.net, linux@armlinux.org.uk,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
 kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com,
 mcoquelin.stm32@gmail.com, ulli.kroll@googlemail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@kernel.org, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v3 6/9] net: ethernet: broadcom:
 bcm63xx_enet: Convert to devm_clk_get_enabled()
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

On Tue, 27 Aug 2024 03:57:09 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
Another one where this is mixing devm and not which makes care
hard to review and may introduce subtle bugs.

Use devm_alloc_etherdev() and devm_register_netdev()
and take all the cleanup handling managed.

Much simpler to review that way.

J
> ---
> v3:
> -Reduce the number of clk variables
> 
>  drivers/net/ethernet/broadcom/bcm63xx_enet.c | 47 ++++++--------------
>  drivers/net/ethernet/broadcom/bcm63xx_enet.h |  6 ---
>  2 files changed, 13 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> index 3c0e3b9828be..dcc741837d50 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> @@ -1718,6 +1718,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
>  	struct bcm63xx_enet_platform_data *pd;
>  	int irq, irq_rx, irq_tx;
>  	struct mii_bus *bus;
> +	struct clk *clk;
>  	int i, ret;
>  
>  	if (!bcm_enet_shared_base[0])
> @@ -1752,14 +1753,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
>  	priv->irq_rx = irq_rx;
>  	priv->irq_tx = irq_tx;
>  
> -	priv->mac_clk = devm_clk_get(&pdev->dev, "enet");
> -	if (IS_ERR(priv->mac_clk)) {
> -		ret = PTR_ERR(priv->mac_clk);
> +	clk = devm_clk_get_enabled(&pdev->dev, "enet");
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
>  		goto out;
>  	}
> -	ret = clk_prepare_enable(priv->mac_clk);
> -	if (ret)
> -		goto out;
>  
>  	/* initialize default and fetch platform data */
>  	priv->rx_ring_size = BCMENET_DEF_RX_DESC;
> @@ -1789,15 +1787,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
>  
>  	if (priv->has_phy && !priv->use_external_mii) {
>  		/* using internal PHY, enable clock */
> -		priv->phy_clk = devm_clk_get(&pdev->dev, "ephy");
> -		if (IS_ERR(priv->phy_clk)) {
> -			ret = PTR_ERR(priv->phy_clk);
> -			priv->phy_clk = NULL;
> -			goto out_disable_clk_mac;
> +		clk = devm_clk_get_enabled(&pdev->dev, "ephy");
> +		if (IS_ERR(clk)) {
> +			ret = PTR_ERR(clk);
> +			goto out;
>  		}
> -		ret = clk_prepare_enable(priv->phy_clk);
> -		if (ret)
> -			goto out_disable_clk_mac;
>  	}
>  
>  	/* do minimal hardware init to be able to probe mii bus */
> @@ -1889,10 +1883,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
>  out_uninit_hw:
>  	/* turn off mdc clock */
>  	enet_writel(priv, 0, ENET_MIISC_REG);
> -	clk_disable_unprepare(priv->phy_clk);
>  
> -out_disable_clk_mac:
> -	clk_disable_unprepare(priv->mac_clk);
>  out:
>  	free_netdev(dev);
>  	return ret;
> @@ -1927,10 +1918,6 @@ static void bcm_enet_remove(struct platform_device *pdev)
>  				       bcm_enet_mdio_write_mii);
>  	}
>  
> -	/* disable hw block clocks */
> -	clk_disable_unprepare(priv->phy_clk);
> -	clk_disable_unprepare(priv->mac_clk);
> -
>  	free_netdev(dev);
>  }
>  
> @@ -2648,6 +2635,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>  	struct bcm63xx_enetsw_platform_data *pd;
>  	struct resource *res_mem;
>  	int ret, irq_rx, irq_tx;
> +	struct clk *mac_clk;
>  
>  	if (!bcm_enet_shared_base[0])
>  		return -EPROBE_DEFER;
> @@ -2694,14 +2682,11 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>  		goto out;
>  	}
>  
> -	priv->mac_clk = devm_clk_get(&pdev->dev, "enetsw");
> -	if (IS_ERR(priv->mac_clk)) {
> -		ret = PTR_ERR(priv->mac_clk);
> +	mac_clk = devm_clk_get_enabled(&pdev->dev, "enetsw");
> +	if (IS_ERR(mac_clk)) {
> +		ret = PTR_ERR(mac_clk);
>  		goto out;
>  	}
> -	ret = clk_prepare_enable(priv->mac_clk);
> -	if (ret)
> -		goto out;
>  
>  	priv->rx_chan = 0;
>  	priv->tx_chan = 1;
> @@ -2720,7 +2705,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>  
>  	ret = register_netdev(dev);
>  	if (ret)
> -		goto out_disable_clk;
> +		goto out;
>  
>  	netif_carrier_off(dev);
>  	platform_set_drvdata(pdev, dev);
> @@ -2729,8 +2714,6 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> -out_disable_clk:
> -	clk_disable_unprepare(priv->mac_clk);
>  out:
>  	free_netdev(dev);
>  	return ret;
> @@ -2740,16 +2723,12 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>  /* exit func, stops hardware and unregisters netdevice */
>  static void bcm_enetsw_remove(struct platform_device *pdev)
>  {
> -	struct bcm_enet_priv *priv;
>  	struct net_device *dev;
>  
>  	/* stop netdevice */
>  	dev = platform_get_drvdata(pdev);
> -	priv = netdev_priv(dev);
>  	unregister_netdev(dev);
>  
> -	clk_disable_unprepare(priv->mac_clk);
> -
>  	free_netdev(dev);
>  }
>  
> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.h b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
> index 78f1830fb3cb..e98838b8b92f 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.h
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
> @@ -316,12 +316,6 @@ struct bcm_enet_priv {
>  	/* lock mib update between userspace request and workqueue */
>  	struct mutex mib_update_lock;
>  
> -	/* mac clock */
> -	struct clk *mac_clk;
> -
> -	/* phy clock if internal phy is used */
> -	struct clk *phy_clk;
> -
>  	/* network device reference */
>  	struct net_device *net_dev;
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
