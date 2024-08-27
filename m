Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0729607E9
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 12:53:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4488C6DD9A;
	Tue, 27 Aug 2024 10:53:58 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13AA4C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 10:53:52 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtPSd1cR5z6J7LP;
 Tue, 27 Aug 2024 18:49:53 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 265CA140A71;
 Tue, 27 Aug 2024 18:53:51 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 11:53:50 +0100
Date: Tue, 27 Aug 2024 11:53:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240827115349.00002f77@Huawei.com>
In-Reply-To: <20240827095712.2672820-4-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-4-frank.li@vivo.com>
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
Subject: Re: [Linux-stm32] [net-next v3 3/9] net: ethernet: cortina: Convert
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

On Tue, 27 Aug 2024 03:57:06 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I don't like the mixing of devm and non devm here.
Maybe better to use a devm_add_action_or_reset()
for geth_cleanup_freeq() as well.


> ---
> v3:
> -move the local clock variables, keep lines longest to shortest
> 
>  drivers/net/ethernet/cortina/gemini.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 73e1c71c5092..5c86987c6fdf 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -109,7 +109,6 @@ struct gemini_ethernet_port {
>  	struct device *dev;
>  	void __iomem *dma_base;
>  	void __iomem *gmac_base;
> -	struct clk *pclk;
>  	struct reset_control *reset;
>  	int irq;
>  	__le32 mac_addr[3];
> @@ -2326,7 +2325,6 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
>  		phy_disconnect(port->netdev->phydev);
>  		unregister_netdev(port->netdev);
>  	}
> -	clk_disable_unprepare(port->pclk);
>  	geth_cleanup_freeq(port->geth);
>  }
>  
> @@ -2401,6 +2399,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  	struct gemini_ethernet *geth;
>  	struct net_device *netdev;
>  	struct device *parent;
> +	struct clk *pclk;
>  	u8 mac[ETH_ALEN];
>  	unsigned int id;
>  	int irq;
> @@ -2453,14 +2452,11 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  	port->irq = irq;
>  
>  	/* Clock the port */
> -	port->pclk = devm_clk_get(dev, "PCLK");
> -	if (IS_ERR(port->pclk)) {
> +	pclk = devm_clk_get_enabled(dev, "PCLK");
> +	if (IS_ERR(pclk)) {
>  		dev_err(dev, "no PCLK\n");
> -		return PTR_ERR(port->pclk);
> +		return PTR_ERR(pclk);
>  	}
> -	ret = clk_prepare_enable(port->pclk);
> -	if (ret)
> -		return ret;
>  
>  	/* Maybe there is a nice ethernet address we should use */
>  	gemini_port_save_mac_addr(port);
> @@ -2469,8 +2465,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  	port->reset = devm_reset_control_get_exclusive(dev, NULL);
>  	if (IS_ERR(port->reset)) {
>  		dev_err(dev, "no reset\n");
> -		ret = PTR_ERR(port->reset);
> -		goto unprepare;
> +		return PTR_ERR(port->reset);
>  	}
>  	reset_control_reset(port->reset);
>  	usleep_range(100, 500);
> @@ -2532,24 +2527,20 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  					port_names[port->id],
>  					port);
>  	if (ret)
> -		goto unprepare;
> +		return ret;
>  
>  	ret = gmac_setup_phy(netdev);
>  	if (ret) {
>  		netdev_err(netdev,
>  			   "PHY init failed\n");
> -		goto unprepare;
> +		return ret;
>  	}
>  
>  	ret = register_netdev(netdev);
>  	if (ret)
> -		goto unprepare;
> +		return ret;
>  
>  	return 0;
> -
> -unprepare:
> -	clk_disable_unprepare(port->pclk);
> -	return ret;
>  }
>  
>  static void gemini_ethernet_port_remove(struct platform_device *pdev)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
