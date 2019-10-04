Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC99ACC535
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 23:50:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78E8AC36B0B;
	Fri,  4 Oct 2019 21:50:21 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF880C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 21:50:20 +0000 (UTC)
Received: from 94.112.246.102.static.b2b.upcbusiness.cz ([94.112.246.102]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iGVSP-0006tk-DS; Fri, 04 Oct 2019 23:49:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 04 Oct 2019 23:49:47 +0200
Message-ID: <6308452.QoXZFhLlpT@phil>
In-Reply-To: <20190904122939.23780-10-yuehaibing@huawei.com>
References: <20190904122939.23780-1-yuehaibing@huawei.com>
 <20190904122939.23780-10-yuehaibing@huawei.com>
MIME-Version: 1.0
Cc: mans@mansr.com, mmayer@broadcom.com, eric@anholt.net,
 miquel.raynal@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 amit.kucheria@verdurent.com, f.fainelli@gmail.com, daniel.lezcano@linaro.org,
 phil@raspberrypi.org, linux-rockchip@lists.infradead.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-msm@vger.kernel.org,
 rui.zhang@intel.com, marc.w.gonzalez@free.fr, rjui@broadcom.com,
 edubezval@gmail.com, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, gregory.0xf0@gmail.com,
 matthias.bgg@gmail.com, horms+renesas@verge.net.au, talel@amazon.com,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, wahrenst@gmx.net,
 mcoquelin.stm32@gmail.com, jun.nie@linaro.org, computersforpeace@gmail.com,
 shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next 09/15] thermal: rockchip: use
	devm_platform_ioremap_resource() to simplify code
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

Am Mittwoch, 4. September 2019, 14:29:33 CEST schrieb YueHaibing:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/thermal/rockchip_thermal.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
> index 343c2f5..044e6eb 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -1219,7 +1219,6 @@ static int rockchip_thermal_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct rockchip_thermal_data *thermal;
>  	const struct of_device_id *match;
> -	struct resource *res;
>  	int irq;
>  	int i;
>  	int error;
> @@ -1245,8 +1244,7 @@ static int rockchip_thermal_probe(struct platform_device *pdev)
>  	if (!thermal->chip)
>  		return -EINVAL;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	thermal->regs = devm_ioremap_resource(&pdev->dev, res);
> +	thermal->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(thermal->regs))
>  		return PTR_ERR(thermal->regs);
>  
> 




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
