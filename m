Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EBC276292
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 22:54:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 292E5C3FAD8;
	Wed, 23 Sep 2020 20:54:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44D64C32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 20:54:18 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FEFE214F1;
 Wed, 23 Sep 2020 20:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600894456;
 bh=4W8tkVEnVbxByODEUPomYSterl2xwqTlOxfLZTbwLt0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bpKhHnhjyQreXsGYfaJ5ArX8UDxNgxTCpzvBIGlT6fcSULxC+13epxTa19yMiz7dk
 KoTinHrYH2aztpNLmskjxsSYucKSLpvVRmGbw9HXCOhoyq35Pr1kgGa2eMPtIzpIgn
 LpoX4sLVR15oFiAlxSdXYzEQ8OVgc7xarT8UHqD8=
Date: Wed, 23 Sep 2020 21:54:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Wang ShaoBo <bobo.shaobowang@huawei.com>
Message-ID: <20200923215357.26f8959d@archlinux>
In-Reply-To: <20200918083142.32816-1-bobo.shaobowang@huawei.com>
References: <20200918083142.32816-1-bobo.shaobowang@huawei.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: cj.chengjian@huawei.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, huawei.libin@huawei.com,
 Jonathan.Cameron@huawei.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] iio: adc: stm32-dfsdm: Use
 devm_platform_get_and_ioremap_resource()
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

On Fri, 18 Sep 2020 16:31:42 +0800
Wang ShaoBo <bobo.shaobowang@huawei.com> wrote:

> Make use of devm_platform_get_and_ioremap_resource() provided by
> driver core platform instead of duplicated analogue, dev_err() is
> removed because it has been done in devm_ioremap_resource().
> 
> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to see if they can find any problems.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-dfsdm-core.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-core.c b/drivers/iio/adc/stm32-dfsdm-core.c
> index 0b8bea88b011..42a7377704a4 100644
> --- a/drivers/iio/adc/stm32-dfsdm-core.c
> +++ b/drivers/iio/adc/stm32-dfsdm-core.c
> @@ -226,16 +226,13 @@ static int stm32_dfsdm_parse_of(struct platform_device *pdev,
>  	if (!node)
>  		return -EINVAL;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "Failed to get memory resource\n");
> -		return -ENODEV;
> -	}
> -	priv->dfsdm.phys_base = res->start;
> -	priv->dfsdm.base = devm_ioremap_resource(&pdev->dev, res);
> +	priv->dfsdm.base = devm_platform_get_and_ioremap_resource(pdev, 0,
> +							&res);
>  	if (IS_ERR(priv->dfsdm.base))
>  		return PTR_ERR(priv->dfsdm.base);
>  
> +	priv->dfsdm.phys_base = res->start;
> +
>  	/*
>  	 * "dfsdm" clock is mandatory for DFSDM peripheral clocking.
>  	 * "dfsdm" or "audio" clocks can be used as source clock for

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
