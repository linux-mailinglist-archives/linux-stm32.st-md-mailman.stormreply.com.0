Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BF51D73DF
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2020 11:23:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25292C36B22;
	Mon, 18 May 2020 09:23:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20EF4C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 09:23:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04I9H17F018541; Mon, 18 May 2020 11:22:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ed8LSXnQG+tlux2FuhY3S6F1qF+O17NCCBESiZMzfGE=;
 b=khcA87sH9LWjScV6dovE2U6oev5OAExticOqX0cSt+p4QiY4ex87jHH3HhgebjiAOIsA
 FRyFF9cZUrrwiTkpk+ZC1F6h8z1HnannGbiQSmeF14JsINshSkROZPAWCZsuhBo+qj5M
 r2ZJwKCsEkS1UBDDZMRmxO1CNcakFxYd0YidEtnzSuHArvVuZmSBPhrbAemzbpo5dcXd
 V+c1hnIPSsL5yobGjEalTXk/RTBIAmvfmSB2WsrkCeA/eDDrsj7G8yVLoL7wW5MYtHaa
 0ap/LGgI3KIfH+TS9FQTsLhZeurf8R4++OxC1ZvvAVJGwHskkWuSxtU3uiyS7AtECIHq 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3125xxjta7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 11:22:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0E3E10002A;
 Mon, 18 May 2020 11:22:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5CB42AE6BD;
 Mon, 18 May 2020 11:22:42 +0200 (CEST)
Received: from [10.211.8.57] (10.75.127.46) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 May
 2020 11:22:41 +0200
To: Jonathan Cameron <jic23@kernel.org>, Sergiu Cuciurean
 <sergiu.cuciurean@analog.com>
References: <20200514085018.79948-1-sergiu.cuciurean@analog.com>
 <20200516163521.2812cf86@archlinux>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <9f271d8d-4ee9-1633-fb90-faca53072716@st.com>
Date: Mon, 18 May 2020 11:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200516163521.2812cf86@archlinux>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG5NODE1.st.com
 (10.75.127.13)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-18_03:2020-05-15,
 2020-05-18 signatures=0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: stm32-dac: Replace indio_dev->mlock
 with own device lock
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

On 5/16/20 5:35 PM, Jonathan Cameron wrote:
> On Thu, 14 May 2020 11:50:12 +0300
> Sergiu Cuciurean <sergiu.cuciurean@analog.com> wrote:
> 
>> As part of the general cleanup of indio_dev->mlock, this change replaces
>> it with a local lock on the device's state structure.
>>
>> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
>> ---
>>  drivers/iio/dac/stm32-dac.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
>> index f22c1d9129b2..74b9474c8590 100644
>> --- a/drivers/iio/dac/stm32-dac.c
>> +++ b/drivers/iio/dac/stm32-dac.c
>> @@ -26,9 +26,11 @@
>>  /**
>>   * struct stm32_dac - private data of DAC driver
>>   * @common:		reference to DAC common data
>> + * @lock: lock to protect the data buffer during regmap ops
> 
> In this particular case I'm not sure that's what mlock was being used for.
> I think it's about avoiding races around checking if powered down and
> actually doing it.

Hi Sergiu,

Indeed, purpose is to protect against a race here when reading CR, and
updating it via regmap (this also makes the subsequent pm_runtime calls
to be balanced based on this).
(Side note: there is no data buffer involved for the DAC.)
Could you please update the comment ?

Thanks,
Fabrice

> 
> 
>>   */
>>  struct stm32_dac {
>>  	struct stm32_dac_common *common;
>> +	struct mutex		lock;
>>  };
>>  
>>  static int stm32_dac_is_enabled(struct iio_dev *indio_dev, int channel)
>> @@ -58,10 +60,10 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
>>  	int ret;
>>  
>>  	/* already enabled / disabled ? */
>> -	mutex_lock(&indio_dev->mlock);
>> +	mutex_lock(&dac->lock);
>>  	ret = stm32_dac_is_enabled(indio_dev, ch);
>>  	if (ret < 0 || enable == !!ret) {
>> -		mutex_unlock(&indio_dev->mlock);
>> +		mutex_unlock(&dac->lock);
>>  		return ret < 0 ? ret : 0;
>>  	}
>>  
>> @@ -69,13 +71,13 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
>>  		ret = pm_runtime_get_sync(dev);
>>  		if (ret < 0) {
>>  			pm_runtime_put_noidle(dev);
>> -			mutex_unlock(&indio_dev->mlock);
>> +			mutex_unlock(&dac->lock);
>>  			return ret;
>>  		}
>>  	}
>>  
>>  	ret = regmap_update_bits(dac->common->regmap, STM32_DAC_CR, msk, en);
>> -	mutex_unlock(&indio_dev->mlock);
>> +	mutex_unlock(&dac->lock);
>>  	if (ret < 0) {
>>  		dev_err(&indio_dev->dev, "%s failed\n", en ?
>>  			"Enable" : "Disable");
>> @@ -328,6 +330,8 @@ static int stm32_dac_probe(struct platform_device *pdev)
>>  	indio_dev->info = &stm32_dac_iio_info;
>>  	indio_dev->modes = INDIO_DIRECT_MODE;
>>  
>> +	mutex_init(&dac->lock);
>> +
>>  	ret = stm32_dac_chan_of_init(indio_dev);
>>  	if (ret < 0)
>>  		return ret;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
