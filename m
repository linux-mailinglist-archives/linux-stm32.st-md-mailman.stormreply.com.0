Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1456D9162E4
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 11:40:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC717C71287;
	Tue, 25 Jun 2024 09:40:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06B24C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 09:40:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P8PQOr019884;
 Tue, 25 Jun 2024 11:39:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 GeKF0B4KkybIwEjranP7dZxhWP3U+JO4Jnkqjly78Wc=; b=AkL9TH5GukEU7FRz
 5iqHat65Hxllr/1pNBwW47r47c39k4aJb6PirnSvSPM+xMqTsg2G6HBPcMuNNX+E
 llW5Skv5/0uOuAsUGaeOBxtgmI4ybBxE32obnuifYHMopCcbyKlNOUd2AeEhenF+
 remIbvdwOe/QhLP7/qRp5DOmfAGriu0OKZJj7w9TMO6FWYHBE9iSpuTrntS/Y5PU
 p5kpa+iRyGFXCncxVaswLEC/ZwgUmQFHMHi3Nwb79CUTNzCrgDabd4hKh0ltRYf3
 O6+aiX7CGXHoDpbZw/B5nvs/ouVfeZXywmG1igyghFmElA8TmgRc7TQalawCfE8t
 DsKjhg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywngdarkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 11:39:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 21B0840045;
 Tue, 25 Jun 2024 11:39:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D17B214525;
 Tue, 25 Jun 2024 11:39:21 +0200 (CEST)
Received: from [10.252.26.63] (10.252.26.63) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 25 Jun
 2024 11:39:20 +0200
Message-ID: <0f34cbad-ae0e-40ce-a3e7-df33edc56256@foss.st.com>
Date: Tue, 25 Jun 2024 11:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Cameron <jic23@kernel.org>
References: <20240618160836.945242-1-olivier.moysan@foss.st.com>
 <20240618160836.945242-9-olivier.moysan@foss.st.com>
 <20240623162110.708032af@jic23-huawei>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20240623162110.708032af@jic23-huawei>
X-Originating-IP: [10.252.26.63]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_06,2024-06-24_01,2024-05-17_01
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 8/8] iio: adc: stm32-dfsdm: add scaling
	support to dfsdm
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Jonathan,

On 6/23/24 17:21, Jonathan Cameron wrote:
> On Tue, 18 Jun 2024 18:08:34 +0200
> Olivier Moysan <olivier.moysan@foss.st.com> wrote:
> 
>> Add scaling support to STM32 DFSDM.
> Perhaps a short description here of how this works?  Where does the scale come
> from, what assumptions are made etc.
>>

Sure. Requires more explanations. Done

>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> Some minor stuff.
> 
>> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
>> index 69b4764d7cba..93bf6035bd6d 100644
>> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
>> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> urn 0;
>>   }
>>   
>> @@ -1060,7 +1072,7 @@ static int stm32_dfsdm_update_scan_mode(struct iio_dev *indio_dev,
>>   static int stm32_dfsdm_postenable(struct iio_dev *indio_dev)
>>   {
>>   	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
>> -	int ret;
>> +	int i = 0, ret;
> 
> Don't mix assigned and unassigned variable declarations. Just use a separate line
> as this can mean subtle assignment or lack of assignment issues sneak in.
> 

Ack

>>   
>>   	/* Reset adc buffer index */
>>   	adc->bufi = 0;
>> @@ -1071,6 +1083,15 @@ static int stm32_dfsdm_postenable(struct iio_dev *indio_dev)
>>   			return ret;
>>   	}
>>   
>> +	if (adc->backend) {
>> +		while (adc->backend[i]) {
> 
> Could do similar to the suggestion below.
> Mostly I don't like the index variable manipulation.
> 
>> +			ret = iio_backend_enable(&indio_dev->dev, adc->backend[i]);
>> +			if (ret < 0)
>> +				return ret;
>> +			i++;
>> +		}
>> +	}
>> +
>>   	ret = stm32_dfsdm_start_dfsdm(adc->dfsdm);
>>   	if (ret < 0)
>>   		goto err_stop_hwc;
>> @@ -1103,6 +1124,7 @@ static int stm32_dfsdm_postenable(struct iio_dev *indio_dev)
>>   static int stm32_dfsdm_predisable(struct iio_dev *indio_dev)
>>   {
>>   	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
>> +	int i = 0;
>>   
>>   	stm32_dfsdm_stop_conv(indio_dev);
>>   
>> @@ -1110,6 +1132,13 @@ static int stm32_dfsdm_predisable(struct iio_dev *indio_dev)
>>   
>>   	stm32_dfsdm_stop_dfsdm(adc->dfsdm);
>>   
>> +	if (adc->backend) {
>> +		while (adc->backend[i]) {
>> +			iio_backend_disable(&indio_dev->dev, adc->backend[i]);
>> +			i++;
>> +		}
> Something like
> 		struct iio_backend **be = &adc->backend[0];
> 		do {
> 			iio_backend_disable(&indio-dev->dev, be);
> 		} while (be++);
> 
> maybe. Up to you.
> 

If you don't mind, I will keep indexes. Pointers here looks more 
difficult to read, and pre/post incrementation in the loop condition can 
easily introduce bugs, imho.
		
> 
>> +	}
> 
>> @@ -1320,6 +1360,45 @@ static int stm32_dfsdm_read_raw(struct iio_dev *indio_dev,
>>   		*val = adc->sample_freq;
>>   
>>   		return IIO_VAL_INT;
>> +
>> +	case IIO_CHAN_INFO_SCALE:
>> +		/*
>> +		 * Scale is expressed in mV.
>> +		 * When fast mode is disabled, actual resolution may be lower
>> +		 * than 2^n, where n=realbits-1.
> 
> As below, use a few more spaces.
> 
>> +		 * This leads to underestimating input voltage. To
>> +		 * compensate this deviation, the voltage reference can be
>> +		 * corrected with a factor = realbits resolution / actual max
>> +		 */
>> +		if (adc->backend[idx]) {
>> +			iio_backend_read_raw(adc->backend[idx], val, val2, mask);
>> +
>> +			*val = div_u64((u64)*val * (u64)BIT(DFSDM_DATA_RES - 1), max);
>> +			*val2 = chan->scan_type.realbits;
>> +			if (chan->differential)
>> +				*val *= 2;
>> +		}
>> +		return IIO_VAL_FRACTIONAL_LOG2;
>> +
>> +	case IIO_CHAN_INFO_OFFSET:
>> +		/*
>> +		 * DFSDM output data are in the range [-2^n,2^n],
> Use a few more spaces. [-2^2, 2^n]
>> +		 * with n=realbits-1.
> n = realbits - 1
> 
> Just to keep it closer to the C coding style.
> 

Done

>> +		 * - Differential modulator:
>> +		 * Offset correspond to SD modulator offset.
>> +		 * - Single ended modulator:
>> +		 * Input is in [0V,Vref] range, where 0V corresponds to -2^n, and Vref to 2^n.
> 
> Avoid that long line with a suitable line break.
> 

Ack

>> +		 * Add 2^n to offset. (i.e. middle of input range)
>> +		 * offset = offset(sd) * vref / res(sd) * max / vref.
>> +		 */
>> +		if (adc->backend[idx]) {
>> +			iio_backend_read_raw(adc->backend[idx], val, val2, mask);
>> +
>> +			*val = div_u64((u64)max * *val, BIT(*val2 - 1));
>> +			if (!chan->differential)
>> +				*val += max;
>> +		}
>> +		return IIO_VAL_INT;
>>   	}
>>   
>>   	return -EINVAL;
>> @@ -1449,7 +1528,15 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev, struct iio_c
>>   	 * IIO_CHAN_INFO_RAW: used to compute regular conversion
>>   	 * IIO_CHAN_INFO_OVERSAMPLING_RATIO: used to set oversampling
>>   	 */
>> -	ch->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
>> +	if (child) {
>> +		ch->info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
>> +					BIT(IIO_CHAN_INFO_SCALE) |
>> +					BIT(IIO_CHAN_INFO_OFFSET);
> 
> Indent looks a little odd. Maybe one more space neede?
> 

Ack

>> +	} else {
>> +		/* Legacy. Scaling not supported */
>> +		ch->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
>> +	}
>> +
>>   	ch->info_mask_shared_by_all = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
>>   					BIT(IIO_CHAN_INFO_SAMP_FREQ);
>>   
>> @@ -1816,3 +1903,4 @@ module_platform_driver(stm32_dfsdm_adc_driver);
>>   MODULE_DESCRIPTION("STM32 sigma delta ADC");
>>   MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
>>   MODULE_LICENSE("GPL v2");
>> +MODULE_IMPORT_NS(IIO_BACKEND);
> 

BRs
Olivier
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
