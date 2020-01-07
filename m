Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14424132C74
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 18:05:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA7FDC36B0B;
	Tue,  7 Jan 2020 17:05:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62FDDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 17:05:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007H3iei003491; Tue, 7 Jan 2020 18:04:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=k8Ykg5/Yo41lBC1coc/u/HSoyYnbdKASySt8c3gqmKA=;
 b=GrBVEeA5NA34R5VSWMl3O4ERGcHf2abU7Gi2f8Uo89Yn3uBxA4SdipU+KGxcmKIDyyUy
 kquhKIVr/y+2FkXO8vmDK+PCS8V4Lr2ydeUq5W3SH76nU9APrHnHwaNk325a7DlRox70
 WlEDTIV8IUTuye7wMMRgI/TiyFm6opkwVBuR/yz5DXgNyHqeWLNh+wvpXWUubl/mvFFH
 bUwqh/jP9rxYMxZc0vaV98aPx+LSgzPuK0qyvgdIYERz9diq03rJE+EYKi27CKLOK87G
 Rp3XdZz5edPzX39Jgzq9CwAF4JSkqjgbGtJ8Jf5xHxKnf4UlZ9+2id0c6cH5GLm7oUpd xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakm5fhc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 18:04:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA55B10002A;
 Tue,  7 Jan 2020 18:04:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8EAD21F704;
 Tue,  7 Jan 2020 18:04:53 +0100 (CET)
Received: from [10.48.0.71] (10.75.127.44) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 18:04:53 +0100
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, <lee.jones@linaro.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
References: <20200107105959.18920-1-peter.ujfalusi@ti.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <af1040f5-4377-1466-7d82-b62004fedab8@st.com>
Date: Tue, 7 Jan 2020 18:04:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200107105959.18920-1-peter.ujfalusi@ti.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-07_05:2020-01-07,
 2020-01-07 signatures=0
Cc: vkoul@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] mfd: stm32-timers: Use
 dma_request_chan() instead dma_request_slave_channel()
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

On 1/7/20 11:59 AM, Peter Ujfalusi wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
> 
> By using dma_request_chan() directly the driver can support deferred
> probing against DMA.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> Hi,
> 
> Changes since v1:
> - Fall back to PIO mode only in case of ENODEV and report all other errors
> 
> Regards,
> Peter

Hi Peter,

Thanks for the patch,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Best Regards,
Fabrice

> 
>  drivers/mfd/stm32-timers.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
> index efcd4b980c94..add603359124 100644
> --- a/drivers/mfd/stm32-timers.c
> +++ b/drivers/mfd/stm32-timers.c
> @@ -167,10 +167,11 @@ static void stm32_timers_get_arr_size(struct stm32_timers *ddata)
>  	regmap_write(ddata->regmap, TIM_ARR, 0x0);
>  }
>  
> -static void stm32_timers_dma_probe(struct device *dev,
> +static int stm32_timers_dma_probe(struct device *dev,
>  				   struct stm32_timers *ddata)
>  {
>  	int i;
> +	int ret = 0;
>  	char name[4];
>  
>  	init_completion(&ddata->dma.completion);
> @@ -179,14 +180,23 @@ static void stm32_timers_dma_probe(struct device *dev,
>  	/* Optional DMA support: get valid DMA channel(s) or NULL */
>  	for (i = STM32_TIMERS_DMA_CH1; i <= STM32_TIMERS_DMA_CH4; i++) {
>  		snprintf(name, ARRAY_SIZE(name), "ch%1d", i + 1);
> -		ddata->dma.chans[i] = dma_request_slave_channel(dev, name);
> +		ddata->dma.chans[i] = dma_request_chan(dev, name);
>  	}
> -	ddata->dma.chans[STM32_TIMERS_DMA_UP] =
> -		dma_request_slave_channel(dev, "up");
> -	ddata->dma.chans[STM32_TIMERS_DMA_TRIG] =
> -		dma_request_slave_channel(dev, "trig");
> -	ddata->dma.chans[STM32_TIMERS_DMA_COM] =
> -		dma_request_slave_channel(dev, "com");
> +	ddata->dma.chans[STM32_TIMERS_DMA_UP] = dma_request_chan(dev, "up");
> +	ddata->dma.chans[STM32_TIMERS_DMA_TRIG] = dma_request_chan(dev, "trig");
> +	ddata->dma.chans[STM32_TIMERS_DMA_COM] = dma_request_chan(dev, "com");
> +
> +	for (i = STM32_TIMERS_DMA_CH1; i < STM32_TIMERS_MAX_DMAS; i++) {
> +		if (IS_ERR(ddata->dma.chans[i])) {
> +			/* Save the first error code to return */
> +			if (PTR_ERR(ddata->dma.chans[i]) != -ENODEV && !ret)
> +				ret = PTR_ERR(ddata->dma.chans[i]);
> +
> +			ddata->dma.chans[i] = NULL;
> +		}
> +	}
> +
> +	return ret;
>  }
>  
>  static void stm32_timers_dma_remove(struct device *dev,
> @@ -230,7 +240,11 @@ static int stm32_timers_probe(struct platform_device *pdev)
>  
>  	stm32_timers_get_arr_size(ddata);
>  
> -	stm32_timers_dma_probe(dev, ddata);
> +	ret = stm32_timers_dma_probe(dev, ddata);
> +	if (ret) {
> +		stm32_timers_dma_remove(dev, ddata);
> +		return ret;
> +	}
>  
>  	platform_set_drvdata(pdev, ddata);
>  
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
