Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A12DE413
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Dec 2020 15:33:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05E8DC5717E;
	Fri, 18 Dec 2020 14:33:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3160C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 14:33:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BIEUkXn002175; Fri, 18 Dec 2020 15:32:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/ud/00DY5s40YvQUkhpV/s7XY//GtKRccKTjMzEOYxE=;
 b=FH3XPISPuebkFCcbr2Vd5KtKB7JTgVfkIm0yVEfmPBReAWsQv2C+fe9G144KN2gRxGu+
 7Ru400y2IFOlrlGT9W16AGTPMvk+dMoilL7rLpmlwdzHusqSlp+dTS+aYTQRA37Y7MX4
 w1cfWAoUJTLl6Yj8wacji9RMVt/R9bC43Ws0uV58nF3ba6+jKNrR0yp8EjpjbbYaBcuT
 szxbKgyUDFij550KKo33Zzd22Lxl341fQYfcRd5N6UZ0dS+JDxwmehsBbadUYOdg1mwz
 n28w8VrRNO+LhJGEezomQt9UzzB2oAHSm33osIt2vYpAozivFu0dF4b4R7yNjPsAYKTr HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpt9tb22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 15:32:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DBDCF100034;
 Fri, 18 Dec 2020 15:32:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BAA8225F3F6;
 Fri, 18 Dec 2020 15:32:34 +0100 (CET)
Received: from [10.211.14.33] (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec
 2020 15:32:33 +0100
To: Xu Wang <vulab@iscas.ac.cn>, <jic23@kernel.org>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <krzk@kernel.org>,
 <andy.shevchenko@gmail.com>, <olivier.moysan@st.com>,
 <etienne.carriere@st.com>, <alexandru.ardelean@analog.com>,
 <peter.ujfalusi@ti.com>, <linux-iio@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20201218093512.871-1-vulab@iscas.ac.cn>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ccf4d36d-dbb0-aea0-5625-4aaf6850c73d@foss.st.com>
Date: Fri, 18 Dec 2020 15:32:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218093512.871-1-vulab@iscas.ac.cn>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_09:2020-12-18,
 2020-12-18 signatures=0
Cc: linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: Remove redundant
 null check before clk_prepare_enable/clk_disable_unprepare
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

On 12/18/20 10:35 AM, Xu Wang wrote:
> Because clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter, so the additional checks are unnecessary, just
> remove them.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/iio/adc/stm32-adc-core.c | 29 +++++++++++------------------
>  drivers/iio/adc/stm32-adc.c      | 14 +++++---------
>  2 files changed, 16 insertions(+), 27 deletions(-)

Hi Xu,

Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks for your patch,
Best Regards,
Fabrice

> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 9d1ad6e38e85..c088cb990193 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -535,20 +535,16 @@ static int stm32_adc_core_hw_start(struct device *dev)
>  		goto err_switches_dis;
>  	}
>  
> -	if (priv->bclk) {
> -		ret = clk_prepare_enable(priv->bclk);
> -		if (ret < 0) {
> -			dev_err(dev, "bus clk enable failed\n");
> -			goto err_regulator_disable;
> -		}
> +	ret = clk_prepare_enable(priv->bclk);
> +	if (ret < 0) {
> +		dev_err(dev, "bus clk enable failed\n");
> +		goto err_regulator_disable;
>  	}
>  
> -	if (priv->aclk) {
> -		ret = clk_prepare_enable(priv->aclk);
> -		if (ret < 0) {
> -			dev_err(dev, "adc clk enable failed\n");
> -			goto err_bclk_disable;
> -		}
> +	ret = clk_prepare_enable(priv->aclk);
> +	if (ret < 0) {
> +		dev_err(dev, "adc clk enable failed\n");
> +		goto err_bclk_disable;
>  	}
>  
>  	writel_relaxed(priv->ccr_bak, priv->common.base + priv->cfg->regs->ccr);
> @@ -556,8 +552,7 @@ static int stm32_adc_core_hw_start(struct device *dev)
>  	return 0;
>  
>  err_bclk_disable:
> -	if (priv->bclk)
> -		clk_disable_unprepare(priv->bclk);
> +	clk_disable_unprepare(priv->bclk);
>  err_regulator_disable:
>  	regulator_disable(priv->vref);
>  err_switches_dis:
> @@ -575,10 +570,8 @@ static void stm32_adc_core_hw_stop(struct device *dev)
>  
>  	/* Backup CCR that may be lost (depends on power state to achieve) */
>  	priv->ccr_bak = readl_relaxed(priv->common.base + priv->cfg->regs->ccr);
> -	if (priv->aclk)
> -		clk_disable_unprepare(priv->aclk);
> -	if (priv->bclk)
> -		clk_disable_unprepare(priv->bclk);
> +	clk_disable_unprepare(priv->aclk);
> +	clk_disable_unprepare(priv->bclk);
>  	regulator_disable(priv->vref);
>  	stm32_adc_core_switches_supply_dis(priv);
>  	regulator_disable(priv->vdda);
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index c067c994dae2..f7c53cea509a 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -546,8 +546,7 @@ static int stm32_adc_hw_stop(struct device *dev)
>  	if (adc->cfg->unprepare)
>  		adc->cfg->unprepare(indio_dev);
>  
> -	if (adc->clk)
> -		clk_disable_unprepare(adc->clk);
> +	clk_disable_unprepare(adc->clk);
>  
>  	return 0;
>  }
> @@ -558,11 +557,9 @@ static int stm32_adc_hw_start(struct device *dev)
>  	struct stm32_adc *adc = iio_priv(indio_dev);
>  	int ret;
>  
> -	if (adc->clk) {
> -		ret = clk_prepare_enable(adc->clk);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = clk_prepare_enable(adc->clk);
> +	if (ret)
> +		return ret;
>  
>  	stm32_adc_set_res(adc);
>  
> @@ -575,8 +572,7 @@ static int stm32_adc_hw_start(struct device *dev)
>  	return 0;
>  
>  err_clk_dis:
> -	if (adc->clk)
> -		clk_disable_unprepare(adc->clk);
> +	clk_disable_unprepare(adc->clk);
>  
>  	return ret;
>  }
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
