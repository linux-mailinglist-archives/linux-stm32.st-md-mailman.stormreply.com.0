Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CCE40C33D
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Sep 2021 12:03:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4B5AC5A4D4;
	Wed, 15 Sep 2021 10:03:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97E9BC5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Sep 2021 10:03:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F5iQXB017454; 
 Wed, 15 Sep 2021 12:02:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=n2VSlVzypMz7IXthyKFInZew+tHg8uno97878m2qfdg=;
 b=x/FGgguSmQURfP/Tehq8e8IYsvxTrF8mkNK+P/ZoIi85Uca5H3YMZMc7Z5OuxUljxqav
 gmHQb1bVHLnHnjiKRMzXxziIkktfUhlhvYJfSJD3/DruTqeHaIJfbJsW4GwCjDYJk8nY
 fZ6ubTmVA6gvOpCyY4rJ+f5EEGj6s0oqYtVvT3kJtdYPylRi1z3D1p6sBeJ4DVKWqTZP
 R0wogtpJAvlL0BQWwG3KqdT668RntFTsox6OmPwi2D/m4t6+PRkQ06B1u6r6QuqbpvIU
 o8Z5pzE5ZVoTbmtvA+JeSEDF+aJzgIEjN1GgRw8JFG9Wi8Ox9LLmZQGclNHaJIMVqStk zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b3axv9nk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 12:02:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9B5510002A;
 Wed, 15 Sep 2021 12:02:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 942E62291A0;
 Wed, 15 Sep 2021 12:02:47 +0200 (CEST)
Received: from lmecxl0577.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 15 Sep
 2021 12:02:47 +0200
To: Jonathan Cameron <jic23@kernel.org>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
 <20210908155452.25458-7-olivier.moysan@foss.st.com>
 <20210911172834.401cf4c8@jic23-huawei>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <865e35a2-47c1-336a-641a-365b7db8213a@foss.st.com>
Date: Wed, 15 Sep 2021 12:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210911172834.401cf4c8@jic23-huawei>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_02,2021-09-14_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 linux-iio@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/7] iio: adc: stm32-adc: add vrefint
	calibration support
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

On 9/11/21 6:28 PM, Jonathan Cameron wrote:
> On Wed, 8 Sep 2021 17:54:51 +0200
> Olivier Moysan <olivier.moysan@foss.st.com> wrote:
> 
>> Add support of vrefint calibration.
>> If a channel is labeled as vrefint, get vrefint calibration
>> from non volatile memory for this channel.
>> A conversion on vrefint channel allows to update scale
>> factor according to vrefint deviation, compared to vrefint
>> calibration value.
> 
> As I mention inline, whilst technically the ABI doesn't demand it
> the expectation of much of userspace software is that _scale is
> pseudo constant - that is it doesn't tend to change very often and when
> it does it's normally because someone deliberately made it change.
> As such most software reads it just once.
> 
> Normally we work around this by applying the maths in kernel and
> not exposing the scale at all. Is this something that could be done here?
> 
> Jonathan
> 
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>> ---
>>   drivers/iio/adc/stm32-adc.c | 88 ++++++++++++++++++++++++++++++++++---
>>   1 file changed, 82 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
>> index ef3d2af98025..9e52a7de9b16 100644
>> --- a/drivers/iio/adc/stm32-adc.c
>> +++ b/drivers/iio/adc/stm32-adc.c
>> @@ -21,6 +21,7 @@
>>   #include <linux/io.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/module.h>
>> +#include <linux/nvmem-consumer.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/of.h>
>> @@ -42,6 +43,7 @@
>>   #define STM32_ADC_TIMEOUT	(msecs_to_jiffies(STM32_ADC_TIMEOUT_US / 1000))
>>   #define STM32_ADC_HW_STOP_DELAY_MS	100
>>   #define STM32_ADC_CHAN_NONE		-1
>> +#define STM32_ADC_VREFINT_VOLTAGE	3300
>>   
>>   #define STM32_DMA_BUFFER_SIZE		PAGE_SIZE
>>   
>> @@ -79,6 +81,7 @@ enum stm32_adc_extsel {
>>   };
>>   
>>   enum stm32_adc_int_ch {
>> +	STM32_ADC_INT_CH_NONE = -1,
>>   	STM32_ADC_INT_CH_VDDCORE,
>>   	STM32_ADC_INT_CH_VREFINT,
>>   	STM32_ADC_INT_CH_VBAT,
>> @@ -137,6 +140,16 @@ struct stm32_adc_regs {
>>   	int shift;
>>   };
>>   
>> +/**
>> + * struct stm32_adc_vrefint - stm32 ADC internal reference voltage data
>> + * @vrefint_cal:	vrefint calibration value from nvmem
>> + * @vrefint_data:	vrefint actual value
>> + */
>> +struct stm32_adc_vrefint {
>> +	u32 vrefint_cal;
>> +	u32 vrefint_data;
>> +};
>> +
>>   /**
>>    * struct stm32_adc_regspec - stm32 registers definition
>>    * @dr:			data register offset
>> @@ -186,6 +199,7 @@ struct stm32_adc;
>>    * @unprepare:		optional unprepare routine (disable, power-down)
>>    * @irq_clear:		routine to clear irqs
>>    * @smp_cycles:		programmable sampling time (ADC clock cycles)
>> + * @ts_vrefint_ns:	vrefint minimum sampling time in ns
>>    */
>>   struct stm32_adc_cfg {
>>   	const struct stm32_adc_regspec	*regs;
>> @@ -199,6 +213,7 @@ struct stm32_adc_cfg {
>>   	void (*unprepare)(struct iio_dev *);
>>   	void (*irq_clear)(struct iio_dev *indio_dev, u32 msk);
>>   	const unsigned int *smp_cycles;
>> +	const unsigned int ts_vrefint_ns;
>>   };
>>   
>>   /**
>> @@ -223,6 +238,7 @@ struct stm32_adc_cfg {
>>    * @pcsel:		bitmask to preselect channels on some devices
>>    * @smpr_val:		sampling time settings (e.g. smpr1 / smpr2)
>>    * @cal:		optional calibration data on some devices
>> + * @vrefint:		internal reference voltage data
>>    * @chan_name:		channel name array
>>    * @num_diff:		number of differential channels
>>    * @int_ch:		internal channel indexes array
>> @@ -248,6 +264,7 @@ struct stm32_adc {
>>   	u32			pcsel;
>>   	u32			smpr_val[2];
>>   	struct stm32_adc_calib	cal;
>> +	struct stm32_adc_vrefint vrefint;
>>   	char			chan_name[STM32_ADC_CH_MAX][STM32_ADC_CH_SZ];
>>   	u32			num_diff;
>>   	int			int_ch[STM32_ADC_INT_CH_NB];
>> @@ -1331,15 +1348,35 @@ static int stm32_adc_read_raw(struct iio_dev *indio_dev,
>>   			ret = stm32_adc_single_conv(indio_dev, chan, val);
>>   		else
>>   			ret = -EINVAL;
>> +
>> +		/* If channel mask corresponds to vrefint, store data */
>> +		if (adc->int_ch[STM32_ADC_INT_CH_VREFINT] == chan->channel)
>> +			adc->vrefint.vrefint_data = *val;
>> +
>>   		iio_device_release_direct_mode(indio_dev);
>>   		return ret;
>>   
>>   	case IIO_CHAN_INFO_SCALE:
>>   		if (chan->differential) {
>> -			*val = adc->common->vref_mv * 2;
>> +			if (adc->vrefint.vrefint_data &&
>> +			    adc->vrefint.vrefint_cal) {
>> +				*val = STM32_ADC_VREFINT_VOLTAGE * 2 *
>> +				       adc->vrefint.vrefint_cal /
>> +				       adc->vrefint.vrefint_data;
> 
> Ah.. Dynamic scale.  This is always awkward when it occurs.
> Given most / possibly all userspace software assumes a pseudo static scale
> (not data dependent) we normally hide this by doing the maths internal to the
> driver - sometimes meaning we need to present the particular channel as processed
> not raw.
> 
> Is the expectation here that vrefint_data is actually very nearly constant? If
> so then what you have here may be fine as anyone not aware the scale might change
> will get very nearly the right value anyway.
> 

The need here is to compare the measured value of vrefint with the 
calibrated value saved in non volatile memory. The ratio between these 
two values can be used as a correction factor for the acquisitions on 
all other channels.

The vrefint data is expected to be close to the saved vrefint 
calibration value, and it should not vary strongly over time.
So, yes, we can indeed consider the scale as a pseudo constant. If the 
scale is not updated, the deviation with actual value should remain 
limited, as well.

You suggest above to hide scale tuning through processed channels.
If I follow this logic, when vrefint channel is available, all channels 
should be defined as processed channels (excepted vrefint channel)
In this case no scale is exposed for these channels, and the vrefint 
calibration ratio can be used to provide converted data directly.
Do you prefer this implementation ?

In this case I wonder how buffered data have to be managed. These data 
are still provided as raw data, but the scale factor is not more 
available to convert them. I guess that these data have to be converted 
internally also, either in dma callback or irq handler.
Is this correct ?

Regards
Olivier

>> +			} else {
>> +				*val = adc->common->vref_mv * 2;
>> +			}
>>   			*val2 = chan->scan_type.realbits;
>>   		} else {
>> -			*val = adc->common->vref_mv;
>> +			/* Use vrefint data if available */
>> +			if (adc->vrefint.vrefint_data &&
>> +			    adc->vrefint.vrefint_cal) {
>> +				*val = STM32_ADC_VREFINT_VOLTAGE *
>> +				       adc->vrefint.vrefint_cal /
>> +				       adc->vrefint.vrefint_data;
>> +			} else {
>> +				*val = adc->common->vref_mv;
>> +			}
>>   			*val2 = chan->scan_type.realbits;
>>   		}
>>   		return IIO_VAL_FRACTIONAL_LOG2;
>> @@ -1907,6 +1944,35 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
>>   	return scan_index;
>>   }
>>   
>> +static int stm32_adc_get_int_ch(struct iio_dev *indio_dev, const char *ch_name,
>> +				int chan)
> 
> Naming would suggest to me that it would return a channel rather than setting it
> inside adc->int_ch[i]  Perhaps something like st32_adc_populate_int_ch() ?
> 
> 
>> +{
>> +	struct stm32_adc *adc = iio_priv(indio_dev);
>> +	u16 vrefint;
>> +	int i, ret;
>> +
>> +	for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
>> +		if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
>> +			adc->int_ch[i] = chan;
>> +			/* If channel is vrefint get calibration data. */
>> +			if (stm32_adc_ic[i].idx == STM32_ADC_INT_CH_VREFINT) {
> 
> I would reduce indentation by reversing the logic.
> 
> 			if (stm32_adc_ic[i].idx != STM32_ADC_INT_CH_VREFINT)
> 				continue;
> 
> 			ret =
>> +				ret = nvmem_cell_read_u16(&indio_dev->dev, "vrefint", &vrefint);
>> +				if (ret && ret != -ENOENT && ret != -EOPNOTSUPP) {
>> +					dev_err(&indio_dev->dev, "nvmem access error %d\n", ret);
>> +					return ret;
>> +				}
>> +				if (ret == -ENOENT)
>> +					dev_dbg(&indio_dev->dev,
>> +						"vrefint calibration not found\n");
>> +				else
>> +					adc->vrefint.vrefint_cal = vrefint;
>> +			}
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>>   				       struct stm32_adc *adc,
>>   				       struct iio_chan_spec *channels)
>> @@ -1938,10 +2004,9 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>>   				return -EINVAL;
>>   			}
>>   			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
>> -			for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
>> -				if (!strncmp(stm32_adc_ic[i].name, name, STM32_ADC_CH_SZ))
>> -					adc->int_ch[i] = val;
>> -			}
>> +			ret = stm32_adc_get_int_ch(indio_dev, name, val);
>> +			if (ret)
>> +				goto err;
>>   		} else if (ret != -EINVAL) {
>>   			dev_err(&indio_dev->dev, "Invalid label %d\n", ret);
>>   			goto err;
>> @@ -2044,6 +2109,16 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev, bool timestamping)
>>   		 */
>>   		of_property_read_u32_index(node, "st,min-sample-time-nsecs",
>>   					   i, &smp);
>> +
>> +		/*
>> +		 * For vrefint channel, ensure that the sampling time cannot
>> +		 * be lower than the one specified in the datasheet
>> +		 */
>> +		if (channels[i].channel == adc->int_ch[STM32_ADC_INT_CH_VREFINT] &&
>> +		    smp < adc->cfg->ts_vrefint_ns) {
>> +			smp = adc->cfg->ts_vrefint_ns;
>> +		}
> 
> 		if (channels[i].channel == adc->int_ch[STM32_ADC_INT_CH_VREFINT])
> 			smp = max(smp, adc->cfg->ts_vrefint_ns);
> 
>> +
>>   		/* Prepare sampling time settings */
>>   		stm32_adc_smpr_init(adc, channels[i].channel, smp);
>>   	}
>> @@ -2350,6 +2425,7 @@ static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
>>   	.unprepare = stm32h7_adc_unprepare,
>>   	.smp_cycles = stm32h7_adc_smp_cycles,
>>   	.irq_clear = stm32h7_adc_irq_clear,
>> +	.ts_vrefint_ns = 4300,
>>   };
>>   
>>   static const struct of_device_id stm32_adc_of_match[] = {
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
