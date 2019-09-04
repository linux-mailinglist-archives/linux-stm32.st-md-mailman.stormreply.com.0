Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6BAA958C
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 23:50:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B1BFC35E01;
	Wed,  4 Sep 2019 21:50:47 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 296DCC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 21:50:45 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id p3so148356pgb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2019 14:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8+W3OmsE39CBrAqbMD2zucygtqzvFfD25TTwncsech0=;
 b=GjpcQGU018si9YdNfH37M4Jo6uFHTdY0pqnKW1bI2T4aZO3/19Jl5FH8QdTr0Txf8r
 lbdktBIKjY2hxc0z7a5SHCBYbyQppUU8ZGyzcF8t2+flQ2Lwlaci+p+gktP+EW6EDqmr
 7s3ugo5oTSkkJtiu8ZB2vHh7nTcCkJZ54OVg2D6VObo1g+/f028Cz07rHoklB10LETyV
 dFLuT9gELB49hdOz0T2z4JW8dQv635Vj0nXxpecfeEsOaJpbIBJvSdsZWsjU0QjyIfUH
 6VYX5tAcR4yuR3xTSFjlWWV60la4AcfUIWbgbdwQcCg1cQrBM60/vQn9sZI9Ky7KMt6T
 2ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8+W3OmsE39CBrAqbMD2zucygtqzvFfD25TTwncsech0=;
 b=PoHh8uvFrsd7JLgdp8o9nPH9Op6sa2eFuJ3N2wKeg5V/E3FhCcjAuNr/yPsAZklN2G
 pcZWOGz+aRY9z3Bo2mrwXYVOhBZG9qFcd9+zM8NsSuCGaC+8aA7xxo2NMxo72bH0ODAQ
 oEWCOUkMTIln4OQJgfJeyO+XtQtizP3VJZ7tlTgVCDK4G1aO3JtEq+rOAaBa+R9MEbnx
 I6ThB/7C81hJwtJtulLHb2zNNVbndZxmfn2ClImpOWGwBHCUR3vHurU+CIKF+3CmXfcL
 HIING+Ml8e7gS10yAehzj0OpsyBeHfGE86Yn0JBaVeVtAX/RY5/iqTwSEGPz4wFDY6Yt
 uMXw==
X-Gm-Message-State: APjAAAX6DjExgc8+igBQuq0q5t8F3l9P3L4Du3m11/G6EGjxiuyS4FQl
 np/Vph4ymwKila+vQL3STbQtVg==
X-Google-Smtp-Source: APXvYqznFPRSJgh/JgdkRzej7oU2uH6AV2QPDQ8rDqB3T60xWU5jKILyc014vwXgwi8/8ui1HTj0dw==
X-Received: by 2002:a17:90a:cc0c:: with SMTP id
 b12mr375908pju.138.1567633843429; 
 Wed, 04 Sep 2019 14:50:43 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id w2sm88618pgc.32.2019.09.04.14.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 14:50:42 -0700 (PDT)
Date: Wed, 4 Sep 2019 14:50:39 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20190904215039.GG580@tuxbook-pro>
References: <20190904122939.23780-1-yuehaibing@huawei.com>
 <20190904122939.23780-9-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904122939.23780-9-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: mans@mansr.com, mmayer@broadcom.com, eric@anholt.net,
 miquel.raynal@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 heiko@sntech.de, amit.kucheria@verdurent.com, f.fainelli@gmail.com,
 daniel.lezcano@linaro.org, phil@raspberrypi.org,
 linux-rockchip@lists.infradead.org, agross@kernel.org,
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
Subject: Re: [Linux-stm32] [PATCH -next 08/15] thermal: tsens: use
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

On Wed 04 Sep 05:29 PDT 2019, YueHaibing wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/thermal/qcom/tsens-common.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> index 528df88..43ce4fb 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -155,7 +155,6 @@ int __init init_common(struct tsens_priv *priv)
>  {
>  	void __iomem *tm_base, *srot_base;
>  	struct device *dev = priv->dev;
> -	struct resource *res;
>  	u32 enabled;
>  	int ret, i, j;
>  	struct platform_device *op = of_find_device_by_node(priv->dev->of_node);
> @@ -166,8 +165,7 @@ int __init init_common(struct tsens_priv *priv)
>  	if (op->num_resources > 1) {
>  		/* DT with separate SROT and TM address space */
>  		priv->tm_offset = 0;
> -		res = platform_get_resource(op, IORESOURCE_MEM, 1);
> -		srot_base = devm_ioremap_resource(&op->dev, res);
> +		srot_base = devm_platform_ioremap_resource(op, 1);
>  		if (IS_ERR(srot_base)) {
>  			ret = PTR_ERR(srot_base);
>  			goto err_put_device;
> @@ -184,8 +182,7 @@ int __init init_common(struct tsens_priv *priv)
>  		priv->tm_offset = 0x1000;
>  	}
>  
> -	res = platform_get_resource(op, IORESOURCE_MEM, 0);
> -	tm_base = devm_ioremap_resource(&op->dev, res);
> +	tm_base = devm_platform_ioremap_resource(op, 0);
>  	if (IS_ERR(tm_base)) {
>  		ret = PTR_ERR(tm_base);
>  		goto err_put_device;
> -- 
> 2.7.4
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
