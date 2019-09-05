Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9024BAA10D
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2019 13:17:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1828C35E01;
	Thu,  5 Sep 2019 11:16:59 +0000 (UTC)
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD2B1C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2019 11:06:55 +0000 (UTC)
Received: by unicorn.mansr.com (Postfix, from userid 51770)
 id B3B4B17FE3; Thu,  5 Sep 2019 12:06:54 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: YueHaibing <yuehaibing@huawei.com>
References: <20190904122939.23780-1-yuehaibing@huawei.com>
 <20190904122939.23780-13-yuehaibing@huawei.com>
Date: Thu, 05 Sep 2019 12:06:54 +0100
In-Reply-To: <20190904122939.23780-13-yuehaibing@huawei.com>
 (yuehaibing@huawei.com's message of "Wed, 4 Sep 2019 20:29:36 +0800")
Message-ID: <yw1xmufj6lyp.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Sep 2019 11:16:58 +0000
Cc: mmayer@broadcom.com, eric@anholt.net, miquel.raynal@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
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
Subject: Re: [Linux-stm32] [PATCH -next 12/15] thermal: tango: use
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

YueHaibing <yuehaibing@huawei.com> writes:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Mans Rullgard <mans@mansr.com>

> ---
>  drivers/thermal/tango_thermal.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/thermal/tango_thermal.c b/drivers/thermal/tango_ther=
mal.c
> index 304b461..f44441b 100644
> --- a/drivers/thermal/tango_thermal.c
> +++ b/drivers/thermal/tango_thermal.c
> @@ -73,7 +73,6 @@ static void tango_thermal_init(struct tango_thermal_pri=
v *priv)
>
>  static int tango_thermal_probe(struct platform_device *pdev)
>  {
> -	struct resource *res;
>  	struct tango_thermal_priv *priv;
>  	struct thermal_zone_device *tzdev;
>
> @@ -81,8 +80,7 @@ static int tango_thermal_probe(struct platform_device *=
pdev)
>  	if (!priv)
>  		return -ENOMEM;
>
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>
> -- =

> 2.7.4
>

-- =

M=E5ns Rullg=E5rd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
