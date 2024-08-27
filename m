Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B84C960838
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 13:11:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B614C6DD9A;
	Tue, 27 Aug 2024 11:11:57 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DF47C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 11:11:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtPt96lPLz6K9X1;
 Tue, 27 Aug 2024 19:08:33 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 355301400D4;
 Tue, 27 Aug 2024 19:11:49 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 12:11:48 +0100
Date: Tue, 27 Aug 2024 12:11:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240827121147.00006444@Huawei.com>
In-Reply-To: <20240827095712.2672820-10-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-10-frank.li@vivo.com>
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
Subject: Re: [Linux-stm32] [net-next v3 9/9] net: marvell: pxa168_eth:
 Convert to devm_clk_get_enabled()
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

On Tue, 27 Aug 2024 03:57:12 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
Ordering in here is already 'interesting' but I'd still look
at more devm_ calls for the mdio and netdev parts.

> ---
>  drivers/net/ethernet/marvell/pxa168_eth.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
> index 1a59c952aa01..bad91cc705e8 100644
> --- a/drivers/net/ethernet/marvell/pxa168_eth.c
> +++ b/drivers/net/ethernet/marvell/pxa168_eth.c
> @@ -237,8 +237,6 @@ struct pxa168_eth_private {
>  	struct timer_list timeout;
>  	struct mii_bus *smi_bus;
>  
> -	/* clock */
> -	struct clk *clk;
>  	struct pxa168_eth_platform_data *pd;
>  	/*
>  	 * Ethernet controller base address.
> @@ -1394,23 +1392,19 @@ static int pxa168_eth_probe(struct platform_device *pdev)
>  
>  	printk(KERN_NOTICE "PXA168 10/100 Ethernet Driver\n");
>  
> -	clk = devm_clk_get(&pdev->dev, NULL);
> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(clk)) {
>  		dev_err(&pdev->dev, "Fast Ethernet failed to get clock\n");
> -		return -ENODEV;
> +		return PTR_ERR(clk);
>  	}
> -	clk_prepare_enable(clk);
>  
>  	dev = alloc_etherdev(sizeof(struct pxa168_eth_private));
> -	if (!dev) {
> -		err = -ENOMEM;
> -		goto err_clk;
> -	}
> +	if (!dev)
> +		return -ENOMEM;
>  
>  	platform_set_drvdata(pdev, dev);
>  	pep = netdev_priv(dev);
>  	pep->dev = dev;
> -	pep->clk = clk;
>  
>  	pep->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(pep->base)) {
> @@ -1523,8 +1517,6 @@ static int pxa168_eth_probe(struct platform_device *pdev)
>  	mdiobus_free(pep->smi_bus);
>  err_netdev:
>  	free_netdev(dev);
> -err_clk:
> -	clk_disable_unprepare(clk);
>  	return err;
>  }
>  
> @@ -1542,7 +1534,6 @@ static void pxa168_eth_remove(struct platform_device *pdev)
>  	if (dev->phydev)
>  		phy_disconnect(dev->phydev);
>  
> -	clk_disable_unprepare(pep->clk);
>  	mdiobus_unregister(pep->smi_bus);
>  	mdiobus_free(pep->smi_bus);
>  	unregister_netdev(dev);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
