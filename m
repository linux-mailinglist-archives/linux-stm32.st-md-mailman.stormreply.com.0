Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D71B1544B7C
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jun 2022 14:14:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A69C5EC6B;
	Thu,  9 Jun 2022 12:14:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F505C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jun 2022 12:14:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2598eb83003698;
 Thu, 9 Jun 2022 14:14:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dihmS9b4+ZD15BfhGqktp7iB3RHiJWGEWYwAh8uOGfQ=;
 b=Gabn07qE8OwQ5z7NE3OhIVdNPVDZEO7iRmwlDpdQolnbI3JsOec3Bp3dFBE88w4SO/W4
 Hj2mvq4vSHwaT/hGS4y8vbPKJIqi4MsVsWI9oom00z7wLFL3VtAOmvwJafOlj81Wx0Tq
 AthLjVxxJnLu6ROl/YSL8dLeWQTg7riuMMHb3Ag9gjOccVqeeFpsZivxTVKMw74RGtY/
 L/xhgI3rTG9jNkLX95/y1Fs8Naxtj/eV5j3an7WfMcsLUNtoy9O/hj+3tKiJ6ZDNJNSK
 02le+f9BlXiVbZ4CJHnCxml9SsS0YGz7Mx4qOZH2qurqr0qGLNR180vwjtfBIzbC55Pt qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gjqqw1kee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 14:14:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42BAE10002A;
 Thu,  9 Jun 2022 14:14:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36B522171EC;
 Thu,  9 Jun 2022 14:14:23 +0200 (CEST)
Received: from [10.48.1.102] (10.75.127.47) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 9 Jun
 2022 14:14:21 +0200
Message-ID: <d84b3d7f-50fd-90d9-9ac8-281c035b20fb@foss.st.com>
Date: Thu, 9 Jun 2022 14:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Wan
 Jiabing <wanjiabing@vivo.com>
References: <20220609095856.376961-1-olivier.moysan@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220609095856.376961-1-olivier.moysan@foss.st.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_09,2022-06-09_01,2022-02-23_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32: fix vrefint wrong
 calibration value handling
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

On 6/9/22 11:58, Olivier Moysan wrote:
> If the vrefint calibration is zero, the vrefint channel output value
> cannot be computed. Currently, in such case, the raw conversion value
> is returned, which is not relevant.
> Do not expose the vrefint channel when the output value cannot be
> computed, instead.
> 
> Fixes: 0e346b2cfa85 ("iio: adc: stm32-adc: add vrefint calibration support")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>

Hi Olivier,

You can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice
> ---
>  drivers/iio/adc/stm32-adc.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index a68ecbda6480..f13c112f540f 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1365,7 +1365,7 @@ static int stm32_adc_read_raw(struct iio_dev *indio_dev,
>  		else
>  			ret = -EINVAL;
>  
> -		if (mask == IIO_CHAN_INFO_PROCESSED && adc->vrefint.vrefint_cal)
> +		if (mask == IIO_CHAN_INFO_PROCESSED)
>  			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;
>  
>  		iio_device_release_direct_mode(indio_dev);
> @@ -1979,10 +1979,10 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
>  
>  	for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
>  		if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
> -			adc->int_ch[i] = chan;
> -
> -			if (stm32_adc_ic[i].idx != STM32_ADC_INT_CH_VREFINT)
> -				continue;
> +			if (stm32_adc_ic[i].idx != STM32_ADC_INT_CH_VREFINT) {
> +				adc->int_ch[i] = chan;
> +				break;
> +			}
>  
>  			/* Get calibration data for vrefint channel */
>  			ret = nvmem_cell_read_u16(&indio_dev->dev, "vrefint", &vrefint);
> @@ -1990,10 +1990,15 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
>  				return dev_err_probe(indio_dev->dev.parent, ret,
>  						     "nvmem access error\n");
>  			}
> -			if (ret == -ENOENT)
> -				dev_dbg(&indio_dev->dev, "vrefint calibration not found\n");
> -			else
> -				adc->vrefint.vrefint_cal = vrefint;
> +			if (ret == -ENOENT) {
> +				dev_dbg(&indio_dev->dev, "vrefint calibration not found. Skip vrefint channel\n");
> +				return ret;
> +			} else if (!vrefint) {
> +				dev_dbg(&indio_dev->dev, "Null vrefint calibration value. Skip vrefint channel\n");
> +				return -ENOENT;
> +			}
> +			adc->int_ch[i] = chan;
> +			adc->vrefint.vrefint_cal = vrefint;
>  		}
>  	}
>  
> @@ -2030,7 +2035,9 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>  			}
>  			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
>  			ret = stm32_adc_populate_int_ch(indio_dev, name, val);
> -			if (ret)
> +			if (ret == -ENOENT)
> +				continue;
> +			else if (ret)
>  				goto err;
>  		} else if (ret != -EINVAL) {
>  			dev_err(&indio_dev->dev, "Invalid label %d\n", ret);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
