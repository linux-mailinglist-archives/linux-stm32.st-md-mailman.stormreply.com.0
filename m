Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6E9627A9
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 14:48:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE6CBC6C855;
	Wed, 28 Aug 2024 12:48:24 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B2B2C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 12:48:17 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wv3z01DSdz6H7Wv;
 Wed, 28 Aug 2024 20:45:00 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 665B814038F;
 Wed, 28 Aug 2024 20:48:16 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 13:48:15 +0100
Date: Wed, 28 Aug 2024 13:48:14 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Message-ID: <20240828134814.0000569d@Huawei.com>
In-Reply-To: <20240828032343.1218749-9-ruanjinjie@huawei.com>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
 <20240828032343.1218749-9-ruanjinjie@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Cc: andrew@lunn.ch, linus.walleij@linaro.org, justin.chen@broadcom.com,
 edumazet@google.com, krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, samuel@sholland.org, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 ansuelsmth@gmail.com, sebastian.hesselbarth@gmail.com,
 woojung.huh@microchip.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com, alsi@bang-olufsen.dk,
 olteanv@gmail.com, linux-sunxi@lists.linux.dev, davem@davemloft.net,
 jic23@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 08/13] net: mdio: mux-mmioreg:
 Simplified with dev_err_probe()
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

On Wed, 28 Aug 2024 11:23:38 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> Use the dev_err_probe() helper to simplify code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Ah. I should have read next patch. Sorry!

Might be worth breaking from rule of aligning parameters
after brackets to keep the longest line lengths down.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> v2:
> - Split into 2 patches.
> ---
>  drivers/net/mdio/mdio-mux-mmioreg.c | 45 ++++++++++++-----------------
>  1 file changed, 19 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/mdio/mdio-mux-mmioreg.c b/drivers/net/mdio/mdio-mux-mmioreg.c
> index 4d87e61fec7b..08c484ccdcbe 100644
> --- a/drivers/net/mdio/mdio-mux-mmioreg.c
> +++ b/drivers/net/mdio/mdio-mux-mmioreg.c
> @@ -109,30 +109,26 @@ static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	ret = of_address_to_resource(np, 0, &res);
> -	if (ret) {
> -		dev_err(&pdev->dev, "could not obtain memory map for node %pOF\n",
> -			np);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "could not obtain memory map for node %pOF\n", np);
>  	s->phys = res.start;
>  
>  	s->iosize = resource_size(&res);
>  	if (s->iosize != sizeof(uint8_t) &&
>  	    s->iosize != sizeof(uint16_t) &&
>  	    s->iosize != sizeof(uint32_t)) {
> -		dev_err(&pdev->dev, "only 8/16/32-bit registers are supported\n");
> -		return -EINVAL;
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "only 8/16/32-bit registers are supported\n");
>  	}
>  
>  	iprop = of_get_property(np, "mux-mask", &len);
> -	if (!iprop || len != sizeof(uint32_t)) {
> -		dev_err(&pdev->dev, "missing or invalid mux-mask property\n");
> -		return -ENODEV;
> -	}
> -	if (be32_to_cpup(iprop) >= BIT(s->iosize * 8)) {
> -		dev_err(&pdev->dev, "only 8/16/32-bit registers are supported\n");
> -		return -EINVAL;
> -	}
> +	if (!iprop || len != sizeof(uint32_t))
> +		return dev_err_probe(&pdev->dev, -ENODEV,
> +				     "missing or invalid mux-mask property\n");
> +	if (be32_to_cpup(iprop) >= BIT(s->iosize * 8))
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "only 8/16/32-bit registers are supported\n");
>  	s->mask = be32_to_cpup(iprop);
>  
>  	/*
> @@ -142,17 +138,14 @@ static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
>  	for_each_available_child_of_node_scoped(np, np2) {
>  		u64 reg;
>  
> -		if (of_property_read_reg(np2, 0, &reg, NULL)) {
> -			dev_err(&pdev->dev, "mdio-mux child node %pOF is "
> -				"missing a 'reg' property\n", np2);
> -			return -ENODEV;
> -		}
> -		if ((u32)reg & ~s->mask) {
> -			dev_err(&pdev->dev, "mdio-mux child node %pOF has "
> -				"a 'reg' value with unmasked bits\n",
> -				np2);
> -			return -ENODEV;
> -		}
> +		if (of_property_read_reg(np2, 0, &reg, NULL))
> +			return dev_err_probe(&pdev->dev, -ENODEV,
> +					     "mdio-mux child node %pOF is missing a 'reg' property\n",
> +					     np2);
> +		if ((u32)reg & ~s->mask)
> +			return dev_err_probe(&pdev->dev, -ENODEV,
> +					     "mdio-mux child node %pOF has a 'reg' value with unmasked bits\n",
I'd align these super long ones as. 
			     "mdio-mux child node %pOF has a 'reg' value with unmasked bits\n",
It is ugly but then so are > 100 char lines.
> +					     np2);
>  	}
>  
>  	ret = mdio_mux_init(&pdev->dev, pdev->dev.of_node,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
