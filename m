Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2C415C3D
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Sep 2021 12:49:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 201CEC5A4D1;
	Thu, 23 Sep 2021 10:49:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38631C5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Sep 2021 10:48:57 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18N8xkvd005755; 
 Thu, 23 Sep 2021 12:48:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=erpy7pilbQAUCgWWy8Jc10rf1wN9rih1xMYpuf1nGrI=;
 b=tiZAK1KMKWbl0wv8ajSNPtaih5vem5xRVDdfw/gEsp1KOQhT65E4FePgQC4tC8ZEWVLj
 WTimxHuwywMw2a+AbWEQAwktZFZxL5mi3Omq1ewnTPRGgvaJbKXs2MB9p4TH2yZ+ET2U
 49X0nyNZb6Q7NeRbkZA7Sk1SF/uBaPGv2hpqPb5Rn/hLFukSRn7+WIlPOtWSxhHAPAb9
 TRVaTGclQKkpzsMCqmPzCM3xYDUi1JPQELJQ6bcPL9ebHUh4oR+TZmM2Kky+gIcqEY+U
 m2OIAwQQ25E0RFhIf8HJ0yvnc1dhA5NbfgwWuS8wBKVsjhIb9F4HXn8xxuBZk9NOw3F/ wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b8hngaj78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 12:48:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F837100034;
 Thu, 23 Sep 2021 12:48:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7578822FE39;
 Thu, 23 Sep 2021 12:48:32 +0200 (CEST)
Received: from [10.48.0.126] (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 23 Sep
 2021 12:48:30 +0200
To: Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron
 <jic23@kernel.org>
References: <20210922153418.21033-1-olivier.moysan@foss.st.com>
 <20210922153418.21033-8-olivier.moysan@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <6adf5b4d-8315-7311-8754-9c9ad5d6513a@foss.st.com>
Date: Thu, 23 Sep 2021 12:48:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210922153418.21033-8-olivier.moysan@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_03,2021-09-23_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 linux-iio@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 7/7] iio: adc: stm32-adc: use generic
 binding for sample-time
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

On 9/22/21 5:34 PM, Olivier Moysan wrote:
> Add st,min-sample-time-nsecs to channel generic binding.
> Sample time can be defined par channel node. If a channel
> is configured as differential, the same sample time applies
> for both inputs.
> Keep support of legacy st,min-sample-time-nsecs property
> for backward compatibility.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  drivers/iio/adc/stm32-adc.c | 70 +++++++++++++++++++++----------------
>  1 file changed, 39 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index c427e439bf4a..cfd11ff0cf36 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1809,6 +1809,11 @@ static void stm32_adc_smpr_init(struct stm32_adc *adc, int channel, u32 smp_ns)
>  	u32 period_ns, shift = smpr->shift, mask = smpr->mask;
>  	unsigned int smp, r = smpr->reg;
>  
> +	/*
> +	 * For vrefint channel, ensure that the sampling time cannot
> +	 * be lower than the one specified in the datasheet
> +	 */
> +

Hi Olivier,

I had a quick look at this series. It looks like some code is missing
here, e.g. to check "ts_vrefint_ns".

Thanks & BR,
Fabrice

>  	/* Determine sampling time (ADC clock cycles) */
>  	period_ns = NSEC_PER_SEC / adc->common->rate;
>  	for (smp = 0; smp <= STM32_ADC_MAX_SMP; smp++)
> @@ -1885,6 +1890,13 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
>  		num_channels += ret;
>  	}
>  
> +	/* Optional sample time is provided either for each, or all channels */
> +	ret = of_property_count_u32_elems(node, "st,min-sample-time-nsecs");
> +	if (ret > 1 && ret != num_channels) {
> +		dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs\n");
> +		return -EINVAL;
> +	}
> +
>  	return num_channels;
>  }
>  
> @@ -1900,6 +1912,7 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
>  	int scan_index = 0, val, ret, i;
>  	struct property *prop;
>  	const __be32 *cur;
> +	u32 smp = 0;
>  
>  	if (num_diff) {
>  		ret = of_property_read_u32_array(node, "st,adc-diff-channels",
> @@ -1942,6 +1955,19 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
>  		scan_index++;
>  	}
>  
> +	for (i = 0; i < scan_index; i++) {
> +		/*
> +		 * Using of_property_read_u32_index(), smp value will only be
> +		 * modified if valid u32 value can be decoded. This allows to
> +		 * get either no value, 1 shared value for all indexes, or one
> +		 * value per channel.
> +		 */
> +		of_property_read_u32_index(node, "st,min-sample-time-nsecs", i, &smp);
> +
> +		/* Prepare sampling time settings */
> +		stm32_adc_smpr_init(adc, channels[i].channel, smp);
> +	}
> +
>  	return scan_index;
>  }
>  
> @@ -2034,6 +2060,19 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>  
>  		stm32_adc_chan_init_one(indio_dev, &channels[scan_index], val,
>  					vin[1], scan_index, differential);
> +
> +		ret = of_property_read_u32(child, "st,min-sample-time-nsecs", &val);
> +		/* st,min-sample-time-nsecs is optional */
> +		if (!ret) {
> +			stm32_adc_smpr_init(adc, channels[scan_index].channel, val);
> +			if (differential)
> +				stm32_adc_smpr_init(adc, vin[1], val);
> +		} else if (ret != -EINVAL) {
> +			dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs property %d\n",
> +				ret);
> +			goto err;
> +		}
> +
>  		scan_index++;
>  	}
>  
> @@ -2052,7 +2091,6 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
>  	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
>  	struct iio_chan_spec *channels;
>  	int scan_index = 0, num_channels = 0, ret, i;
> -	u32 smp = 0;
>  	bool legacy = false;
>  
>  	for (i = 0; i < STM32_ADC_INT_CH_NB; i++)
> @@ -2080,13 +2118,6 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
>  		return -EINVAL;
>  	}
>  
> -	/* Optional sample time is provided either for each, or all channels */
> -	ret = of_property_count_u32_elems(node, "st,min-sample-time-nsecs");
> -	if (ret > 1 && ret != num_channels) {
> -		dev_err(&indio_dev->dev, "Invalid st,min-sample-time-nsecs\n");
> -		return -EINVAL;
> -	}
> -
>  	if (timestamping)
>  		num_channels++;
>  
> @@ -2103,29 +2134,6 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
>  		return ret;
>  	scan_index = ret;
>  
> -	for (i = 0; i < scan_index; i++) {
> -		/*
> -		 * Using of_property_read_u32_index(), smp value will only be
> -		 * modified if valid u32 value can be decoded. This allows to
> -		 * get either no value, 1 shared value for all indexes, or one
> -		 * value per channel.
> -		 */
> -		of_property_read_u32_index(node, "st,min-sample-time-nsecs",
> -					   i, &smp);
> -
> -		/*
> -		 * For vrefint channel, ensure that the sampling time cannot
> -		 * be lower than the one specified in the datasheet
> -		 */
> -		if (channels[i].channel == adc->int_ch[STM32_ADC_INT_CH_VREFINT] &&
> -		    smp < adc->cfg->ts_vrefint_ns) {
> -			smp = adc->cfg->ts_vrefint_ns;
> -		}
> -
> -		/* Prepare sampling time settings */
> -		stm32_adc_smpr_init(adc, channels[i].channel, smp);
> -	}
> -
>  	if (timestamping) {
>  		struct iio_chan_spec *timestamp = &channels[scan_index];
>  
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
