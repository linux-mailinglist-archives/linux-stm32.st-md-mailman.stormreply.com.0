Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F42209607D5
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 12:50:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98FF2C6DD9A;
	Tue, 27 Aug 2024 10:50:49 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ED15C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 10:50:43 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtPPp5lG1z6K98Q;
 Tue, 27 Aug 2024 18:47:26 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 05E8F140447;
 Tue, 27 Aug 2024 18:50:42 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 11:50:41 +0100
Date: Tue, 27 Aug 2024 11:50:40 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240827115040.000017b0@Huawei.com>
In-Reply-To: <20240827095712.2672820-5-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-5-frank.li@vivo.com>
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
Subject: Re: [Linux-stm32] [net-next v3 4/9] net: mdio: hisi-femac: Convert
 to devm_clk_get_enabled()
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

On Tue, 27 Aug 2024 03:57:07 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Mixing an matching devm and otherwise can lead to subtle bugs
and generally makes the code harder to review

I'd also use devm_mdiobus_alloc_size() and devm_mdiobus_register()
and drop the remove() callback entirely.

I would not take this patch on its own as it causes a reordering
of cleanup we probably don't want.

As a general rule, single action devm cleanup series (so only using
one new type) fall into this trap. Much better to look at all the
improvements in each driver that are enabled by new infrastructure
rather than doing a single type change series like this one.

Thanks,

Jonathan


> ---
>  drivers/net/mdio/mdio-hisi-femac.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/mdio/mdio-hisi-femac.c b/drivers/net/mdio/mdio-hisi-femac.c
> index 6703f626ee83..f6fcb9e11624 100644
> --- a/drivers/net/mdio/mdio-hisi-femac.c
> +++ b/drivers/net/mdio/mdio-hisi-femac.c
> @@ -21,7 +21,6 @@
>  #define BIT_WR_DATA_OFFSET	16
>  
>  struct hisi_femac_mdio_data {
> -	struct clk *clk;
>  	void __iomem *membase;
>  };
>  
> @@ -74,6 +73,7 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct mii_bus *bus;
>  	struct hisi_femac_mdio_data *data;
> +	struct clk *clk;
>  	int ret;
>  
>  	bus = mdiobus_alloc_size(sizeof(*data));
> @@ -93,26 +93,20 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
>  		goto err_out_free_mdiobus;
>  	}
>  
> -	data->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(data->clk)) {
> -		ret = PTR_ERR(data->clk);
> +	clk = devm_clk_get_prepared(&pdev->dev, NULL);
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
>  		goto err_out_free_mdiobus;
>  	}
>  
> -	ret = clk_prepare_enable(data->clk);
> -	if (ret)
> -		goto err_out_free_mdiobus;
> -
>  	ret = of_mdiobus_register(bus, np);
>  	if (ret)
> -		goto err_out_disable_clk;
> +		goto err_out_free_mdiobus;
>  
>  	platform_set_drvdata(pdev, bus);
>  
>  	return 0;
>  
> -err_out_disable_clk:
> -	clk_disable_unprepare(data->clk);
>  err_out_free_mdiobus:
>  	mdiobus_free(bus);
>  	return ret;
> @@ -121,10 +115,8 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
>  static void hisi_femac_mdio_remove(struct platform_device *pdev)
>  {
>  	struct mii_bus *bus = platform_get_drvdata(pdev);
> -	struct hisi_femac_mdio_data *data = bus->priv;
>  
>  	mdiobus_unregister(bus);
> -	clk_disable_unprepare(data->clk);
>  	mdiobus_free(bus);
>  }
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
