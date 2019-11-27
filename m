Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338710B2FE
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 17:13:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12D99C36B0B;
	Wed, 27 Nov 2019 16:13:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36795C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 16:13:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARGCIWn018959; Wed, 27 Nov 2019 17:13:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=bnOLWjqEKHzgFYDVOb+mcrObtgio5x+q0cUoT2iaBqE=;
 b=ZFDaW64eUKS8PnXO4HBVNtxeRNJnKNYBTofpmSf0FikD1Jz3TT/2zATXIyPUW0pb3oF4
 68XrWGQIY8rCawNmrKEYYfnI92y8U2sdcCiSTVDYKZ7h2WmCJs0+LsQUGVZmmhiG3Ra+
 g9Mk4pRo1hyZMSWX1jDAMVYql5gERaMvugxFg37X353n+Dq2oO/jkpHyzNKuJ3LtzuGM
 u3FCNcVFlPS6YZUjPmnmUqiK8hUZhM5avetxF5xQjli6fTPcBIcKMDQFbwDsTfEt7jFj
 MqsVKuof6TtYcUGi9aY8Q0JQmHSNQc8lxJAfuukkI9V4NEbB/H4SVnwlyNTeW31wQPk4 bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxkmkyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 17:13:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB81A100034;
 Wed, 27 Nov 2019 17:13:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D37B2C38D8;
 Wed, 27 Nov 2019 17:13:29 +0100 (CET)
Received: from [10.48.0.192] (10.75.127.44) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov
 2019 17:13:28 +0100
To: Olivier Moysan <olivier.moysan@st.com>, <jic23@kernel.org>,
 <knaack.h@gmx.de>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <linux-iio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>
References: <20191127131008.18896-1-olivier.moysan@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <c2c2a902-c16b-e85e-7fa7-a86d88f7a159@st.com>
Date: Wed, 27 Nov 2019 17:13:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127131008.18896-1-olivier.moysan@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_04:2019-11-27,2019-11-27 signatures=0
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-dfsdm: adapt sampling
 rate to oversampling ratio
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

On 11/27/19 2:10 PM, Olivier Moysan wrote:
> Update sampling rate when oversampling ratio is changed
> through the IIO ABI.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>

Hi Olivier,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice
> ---
> changes in version 2:
> - correct title
> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 32 ++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 0339ecdd06bd..87a842507509 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1221,14 +1221,32 @@ static int stm32_dfsdm_write_raw(struct iio_dev *indio_dev,
>  	unsigned int spi_freq;
>  	int ret = -EINVAL;
>  
> +	switch (ch->src) {
> +	case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL:
> +		spi_freq = adc->dfsdm->spi_master_freq;
> +		break;
> +	case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_FALLING:
> +	case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_RISING:
> +		spi_freq = adc->dfsdm->spi_master_freq / 2;
> +		break;
> +	default:
> +		spi_freq = adc->spi_freq;
> +	}
> +
>  	switch (mask) {
>  	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
>  		ret = iio_device_claim_direct_mode(indio_dev);
>  		if (ret)
>  			return ret;
> +
>  		ret = stm32_dfsdm_compute_all_osrs(indio_dev, val);
> -		if (!ret)
> +		if (!ret) {
> +			dev_dbg(&indio_dev->dev,
> +				"Sampling rate changed from (%u) to (%u)\n",
> +				adc->sample_freq, spi_freq / val);
>  			adc->oversamp = val;
> +			adc->sample_freq = spi_freq / val;
> +		}
>  		iio_device_release_direct_mode(indio_dev);
>  		return ret;
>  
> @@ -1240,18 +1258,6 @@ static int stm32_dfsdm_write_raw(struct iio_dev *indio_dev,
>  		if (ret)
>  			return ret;
>  
> -		switch (ch->src) {
> -		case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL:
> -			spi_freq = adc->dfsdm->spi_master_freq;
> -			break;
> -		case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_FALLING:
> -		case DFSDM_CHANNEL_SPI_CLOCK_INTERNAL_DIV2_RISING:
> -			spi_freq = adc->dfsdm->spi_master_freq / 2;
> -			break;
> -		default:
> -			spi_freq = adc->spi_freq;
> -		}
> -
>  		ret = dfsdm_adc_set_samp_freq(indio_dev, val, spi_freq);
>  		iio_device_release_direct_mode(indio_dev);
>  		return ret;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
