Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B43C48EA
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2019 09:57:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CB23C36B0B;
	Wed,  2 Oct 2019 07:57:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D069EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2019 07:57:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x927oscW000750; Wed, 2 Oct 2019 09:56:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=EBAixOOqXoAYHZaizljPUim/vdoCPa3lNWiXx9YSRHU=;
 b=uEYG1a06avl8rJoHM54pb3ZIVAgl/cTVls5w7H/RwX+UKwOHmzwOXjXLLLE2fEoU3CLl
 AUbO8//6wTUqaRJ3ZUlMgLQyKQ00epnzeYEG/5CbRutUkld/ZyrDfA4ir00ZqgvokDur
 gyhbdcZ3Or6h7dFZ8pN323FlrsUnuo3Zf3YBmYigEqz6yeSSBb7ofpt0dXiwm8BRF2nY
 IxKVTasbb+oVn2Y/+p0rwgxhE+7LFYpkdgnYXKjEbICH1JXUXTN1UT1yJqyo0wHqlSc9
 8atlLuUUSw5xNPmEBXnflPd8R0K2u148Tw3vEPKel64Ug/ld9c4GwIJkt+y5+xV2FfAK UA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9vnadmk1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 02 Oct 2019 09:56:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 25BE34C;
 Wed,  2 Oct 2019 07:56:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1980F2AC6FE;
 Wed,  2 Oct 2019 09:56:30 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Oct
 2019 09:56:29 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 2 Oct 2019 09:56:29 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Jonathan Cameron <jic23@kernel.org>, Yizhuo <yzhai003@ucr.edu>
Thread-Topic: [PATCH] iio: trigger: stm32-timer: fix the usage of
 uninitialized variables
Thread-Index: AQHVd8/T1FmtbRWUT0qK58d/WXGWcadFV5CAgAGFFIA=
Date: Wed, 2 Oct 2019 07:56:29 +0000
Message-ID: <040e8500-0c32-97b1-8325-f299011033be@st.com>
References: <20190930204451.28614-1-yzhai003@ucr.edu>
 <20191001094355.65d873a3@archlinux>
In-Reply-To: <20191001094355.65d873a3@archlinux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <D0446124834DE342AF683861A83EF3A8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-02_04:2019-10-01,2019-10-02 signatures=0
Cc: "csong@cs.ucr.edu" <csong@cs.ucr.edu>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "zhiyunq@cs.ucr.edu" <zhiyunq@cs.ucr.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] iio: trigger: stm32-timer: fix the usage
 of uninitialized variables
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


On 10/1/19 10:43 AM, Jonathan Cameron wrote:
> On Mon, 30 Sep 2019 13:44:49 -0700
> Yizhuo <yzhai003@ucr.edu> wrote:
>
>> Several functions in this file are trying to use regmap_read() to
>> initialize the specific variable, however, if regmap_read() fails,
>> the variable could be uninitialized but used directly, which is
>> potentially unsafe. The return value of regmap_read() should be
>> checked and handled. This patch fixes most of the uninitialized
>> variables, but those in function stm32_tt_read_frequency() are
>> hard to handle and need extra effot.
>>
>> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> Hi Yizhuo,
>
> This is a slightly interesting case.
>
>  From an 'obviously' correct point of view, it makes sense to
> always handle the errors and avoid the potentially uninitialised
> cases.
>
>  From the point of view of a 'fix' we need to show if these can
> actually happen.  These calls are regmap-mmio so the error
> path is in clock enable / disable if there is a clock provided.
> Looking at mfd/stm-timers.c there is a clock called "int" provided.
> Now it's possible that clock enable can never fail, but that is
> getting too hard to chase down.
>
> As such, I think this fix is worthwhile, but I'm not going to
> mark it for stable without a report of it actually being
> possible to trigger it.
>
> I'll leave this on the list for a little longer though as I'd definitely
> like an ack from Benjamin or someone else more familiar with the driver
> than I am.
>
> Thanks,
>
> Jonathan

Hi Yizhuo,

The only reason that could lead a regmap_read to failed is an issue on 
the clock
but is this case we will be blocked in regmap_read() itself so the error 
will never
be displayed.
For me testing all regmap_read() return values only add code and not 
bring additional informations
so I NACK this patch.

Benjamin

>> ---
>>   drivers/iio/trigger/stm32-timer-trigger.c | 98 ++++++++++++++++++++---
>>   1 file changed, 85 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
>> index a5dfe65cd9b9..f8ea7bcbb739 100644
>> --- a/drivers/iio/trigger/stm32-timer-trigger.c
>> +++ b/drivers/iio/trigger/stm32-timer-trigger.c
>> @@ -107,6 +107,7 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>>   	unsigned long long prd, div;
>>   	int prescaler = 0;
>>   	u32 ccer, cr1;
>> +	int ret;
>>   
>>   	/* Period and prescaler values depends of clock rate */
>>   	div = (unsigned long long)clk_get_rate(priv->clk);
>> @@ -132,11 +133,21 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>>   	}
>>   
>>   	/* Check if nobody else use the timer */
>> -	regmap_read(priv->regmap, TIM_CCER, &ccer);
>> +	ret = regmap_read(priv->regmap, TIM_CCER, &ccer);
>> +	if (ret) {
>> +		dev_err(priv->dev, "fail to read TIM_CCER.\n");
>> +		return ret;
>> +	}
>> +
>>   	if (ccer & TIM_CCER_CCXE)
>>   		return -EBUSY;
>>   
>> -	regmap_read(priv->regmap, TIM_CR1, &cr1);
>> +	ret = regmap_read(priv->regmap, TIM_CR1, &cr1);
>> +	if (ret) {
>> +		dev_err(priv->dev, "fail to read TIM_CR1.\n");
>> +		return ret;
>> +	}
>> +
>>   	if (!(cr1 & TIM_CR1_CEN))
>>   		clk_enable(priv->clk);
>>   
>> @@ -164,12 +175,23 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
>>   static void stm32_timer_stop(struct stm32_timer_trigger *priv)
>>   {
>>   	u32 ccer, cr1;
>> +	int ret;
>> +
>> +	ret = regmap_read(priv->regmap, TIM_CCER, &ccer);
>> +	if (ret) {
>> +		dev_err(priv->dev, "Fail to read TIM_CCER.\n");
>> +		return;
>> +	}
>>   
>> -	regmap_read(priv->regmap, TIM_CCER, &ccer);
>>   	if (ccer & TIM_CCER_CCXE)
>>   		return;
>>   
>> -	regmap_read(priv->regmap, TIM_CR1, &cr1);
>> +	ret = regmap_read(priv->regmap, TIM_CR1, &cr1);
>> +	if (ret) {
>> +		dev_err(priv->dev, "Fail to read TIM_CR1.\n");
>> +		return;
>> +	}
>> +
>>   	if (cr1 & TIM_CR1_CEN)
>>   		clk_disable(priv->clk);
>>   
>> @@ -403,20 +425,36 @@ static int stm32_counter_read_raw(struct iio_dev *indio_dev,
>>   {
>>   	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
>>   	u32 dat;
>> +	int ret;
>>   
>>   	switch (mask) {
>>   	case IIO_CHAN_INFO_RAW:
>> -		regmap_read(priv->regmap, TIM_CNT, &dat);
>> +		ret = regmap_read(priv->regmap, TIM_CNT, &dat);
>> +		if (ret) {
>> +			dev_err(priv->dev, "fail to read TIM_CNT.\n");
>> +			return ret;
>> +		}
>> +
>>   		*val = dat;
>>   		return IIO_VAL_INT;
>>   
>>   	case IIO_CHAN_INFO_ENABLE:
>> -		regmap_read(priv->regmap, TIM_CR1, &dat);
>> +		ret = regmap_read(priv->regmap, TIM_CR1, &dat);
>> +		if (ret) {
>> +			dev_err(priv->dev, "fail to read TIM_CR1.\n");
>> +			return ret;
>> +		}
>> +
>>   		*val = (dat & TIM_CR1_CEN) ? 1 : 0;
>>   		return IIO_VAL_INT;
>>   
>>   	case IIO_CHAN_INFO_SCALE:
>> -		regmap_read(priv->regmap, TIM_SMCR, &dat);
>> +		ret = regmap_read(priv->regmap, TIM_SMCR, &dat);
>> +		if (ret) {
>> +			dev_err(priv->dev, "fail to read TIM_SMCR.\n");
>> +			return ret;
>> +		}
>> +
>>   		dat &= TIM_SMCR_SMS;
>>   
>>   		*val = 1;
>> @@ -438,6 +476,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>>   {
>>   	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
>>   	u32 dat;
>> +	int ret;
>>   
>>   	switch (mask) {
>>   	case IIO_CHAN_INFO_RAW:
>> @@ -449,13 +488,23 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
>>   
>>   	case IIO_CHAN_INFO_ENABLE:
>>   		if (val) {
>> -			regmap_read(priv->regmap, TIM_CR1, &dat);
>> +			ret = regmap_read(priv->regmap, TIM_CR1, &dat);
>> +			if (ret) {
>> +				dev_err(priv->dev, "fail to read TIM_CR1.\n");
>> +				return ret;
>> +			}
>> +
>>   			if (!(dat & TIM_CR1_CEN))
>>   				clk_enable(priv->clk);
>>   			regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
>>   					   TIM_CR1_CEN);
>>   		} else {
>> -			regmap_read(priv->regmap, TIM_CR1, &dat);
>> +			ret = regmap_read(priv->regmap, TIM_CR1, &dat);
>> +			if (ret) {
>> +				dev_err(priv->dev, "fail to read TIM_CR1.\n");
>> +				return ret;
>> +			}
>> +
>>   			regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
>>   					   0);
>>   			if (dat & TIM_CR1_CEN)
>> @@ -517,8 +566,13 @@ static int stm32_get_trigger_mode(struct iio_dev *indio_dev,
>>   {
>>   	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
>>   	u32 smcr;
>> +	int ret;
>>   
>> -	regmap_read(priv->regmap, TIM_SMCR, &smcr);
>> +	ret = regmap_read(priv->regmap, TIM_SMCR, &smcr);
>> +	if (ret) {
>> +		dev_err(priv->dev, "fail to read TIM_SMCR.\n");
>> +		return ret;
>> +	}
>>   
>>   	return (smcr & TIM_SMCR_SMS) == TIM_SMCR_SMS ? 0 : -EINVAL;
>>   }
>> @@ -557,6 +611,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
>>   	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
>>   	int sms = stm32_enable_mode2sms(mode);
>>   	u32 val;
>> +	int ret;
>>   
>>   	if (sms < 0)
>>   		return sms;
>> @@ -565,7 +620,12 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
>>   	 * enable counter clock, so it can use it. Keeps it in sync with CEN.
>>   	 */
>>   	if (sms == 6) {
>> -		regmap_read(priv->regmap, TIM_CR1, &val);
>> +		ret = regmap_read(priv->regmap, TIM_CR1, &val);
>> +		if (ret) {
>> +			dev_err(priv->dev, "fail to read TIM_CR1.\n");
>> +			return ret;
>> +		}
>> +
>>   		if (!(val & TIM_CR1_CEN))
>>   			clk_enable(priv->clk);
>>   	}
>> @@ -594,8 +654,14 @@ static int stm32_get_enable_mode(struct iio_dev *indio_dev,
>>   {
>>   	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
>>   	u32 smcr;
>> +	int ret;
>> +
>> +	ret = regmap_read(priv->regmap, TIM_SMCR, &smcr);
>> +	if (ret) {
>> +		dev_err(priv->dev, "fail to read TIM_SMCR.\n");
>> +		return ret;
>> +	}
>>   
>> -	regmap_read(priv->regmap, TIM_SMCR, &smcr);
>>   	smcr &= TIM_SMCR_SMS;
>>   
>>   	return stm32_sms2enable_mode(smcr);
>> @@ -706,13 +772,19 @@ EXPORT_SYMBOL(is_stm32_timer_trigger);
>>   static void stm32_timer_detect_trgo2(struct stm32_timer_trigger *priv)
>>   {
>>   	u32 val;
>> +	int ret;
>>   
>>   	/*
>>   	 * Master mode selection 2 bits can only be written and read back when
>>   	 * timer supports it.
>>   	 */
>>   	regmap_update_bits(priv->regmap, TIM_CR2, TIM_CR2_MMS2, TIM_CR2_MMS2);
>> -	regmap_read(priv->regmap, TIM_CR2, &val);
>> +	ret = regmap_read(priv->regmap, TIM_CR2, &val);
>> +	if (ret) {
>> +		dev_err(priv->dev, "fail to read TIM_CR2.\n");
>> +		return;
>> +	}
>> +
>>   	regmap_update_bits(priv->regmap, TIM_CR2, TIM_CR2_MMS2, 0);
>>   	priv->has_trgo2 = !!val;
>>   }
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
