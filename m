Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1871C15810B
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2020 18:14:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4237C36B0B;
	Mon, 10 Feb 2020 17:14:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C97BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 17:14:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AHCL24032561; Mon, 10 Feb 2020 18:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=feuW2yPS5ei8I742RMv4MDftOjP43l3feZEKO8JKWpw=;
 b=AvIh0EOE3aDFxOUiQ/ry4/xC4AH9ji+wZcsfwGPa7zbcfu/jiAJyHJJ5xRh4zQzCnoby
 CEL20YRclt0dYBHjtI53yigBJJR1ho0DhNQ6mvHrZIgJjzaCSzAs9MdhmkdHFVJOyRxL
 xsFcIBA9KAXgOLsnUPTfejo48YYU9x2TiIOcPEA9zbYRuhotj4Lzpz2hvuuu9xlgfKO9
 s1e92oTKCU13F4MZZI+UCS3QfAH8kjYeaxoXs6Dj1V+hDH3w6Yjzx+zrZNMrVHc7osY7
 v7bq2hzs6lf3vzo19iK06Qsj9ykMTEZtIndWi+gYvvgMYZOkD3x1Nb6NbJiUpDEtUSwi vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ud9cc5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 18:13:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E52210002A;
 Mon, 10 Feb 2020 18:13:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C2E12BA258;
 Mon, 10 Feb 2020 18:13:51 +0100 (CET)
Received: from [10.48.0.71] (10.75.127.45) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 18:13:50 +0100
To: Jonathan Cameron <jic23@kernel.org>
References: <1580899678-26393-1-git-send-email-fabrice.gasnier@st.com>
 <20200208153541.448a0df3@archlinux>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <dac6eb51-f13c-5369-d43e-77f21ed81172@st.com>
Date: Mon, 10 Feb 2020 18:13:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200208153541.448a0df3@archlinux>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_06:2020-02-10,
 2020-02-10 signatures=0
Cc: linux-iio@vger.kernel.org, vilhelm.gray@gmail.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: add power
	management support
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

On 2/8/20 4:35 PM, Jonathan Cameron wrote:
> On Wed, 5 Feb 2020 11:47:58 +0100
> Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
> 
>> Add suspend/resume PM sleep ops. When going to low power, enforce the
>> counter isn't active.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>> ---
>>  drivers/counter/stm32-timer-cnt.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
>> index 3eafcce..3b84503 100644
>> --- a/drivers/counter/stm32-timer-cnt.c
>> +++ b/drivers/counter/stm32-timer-cnt.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/iio/types.h>
>>  #include <linux/mfd/stm32-timers.h>
>>  #include <linux/module.h>
>> +#include <linux/pinctrl/consumer.h>
>>  #include <linux/platform_device.h>
>>  
>>  #define TIM_CCMR_CCXS	(BIT(8) | BIT(0))
>> @@ -358,10 +359,33 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
>>  	priv->counter.num_signals = ARRAY_SIZE(stm32_signals);
>>  	priv->counter.priv = priv;
>>  
>> +	platform_set_drvdata(pdev, priv);
>> +
>>  	/* Register Counter device */
>>  	return devm_counter_register(dev, &priv->counter);
>>  }
>>  
>> +static int __maybe_unused stm32_timer_cnt_suspend(struct device *dev)
>> +{
>> +	struct stm32_timer_cnt *priv = dev_get_drvdata(dev);
>> +	u32 cr1;
>> +
>> +	/* Check for active counter */
>> +	regmap_read(priv->regmap, TIM_CR1, &cr1);
>> +	if (cr1 & TIM_CR1_CEN)
>> +		return -EBUSY;
> 
> Runtime suspend is allowed to refuse to happen (and that is
> explicitly documented)
> Is that allowed for normal suspend?  I didn't think it was.
> This will stop a suspend, but it's doing it by signalling a failure.

Hi Jonathan,

I'll rework this patch, to avoid stopping the suspend. Another approach
is to properly save/backup the registers here, and to disable the
counter in low power mode.
I'll update this in V2.

Thanks for reviewing,
Fabrice

> I'm not sure for example that the system will resume everything that
> was suspended before this call.
> 
> Normally you are in the tough luck category if a system decides
> to suspend underneath you.   There are ways to prevent it
> from userspace (wakelocks etc).
> 
>> +
>> +	return pinctrl_pm_select_sleep_state(dev);
>> +}
>> +
>> +static int __maybe_unused stm32_timer_cnt_resume(struct device *dev)
>> +{
>> +	return pinctrl_pm_select_default_state(dev);
>> +}
>> +
>> +static SIMPLE_DEV_PM_OPS(stm32_timer_cnt_pm_ops, stm32_timer_cnt_suspend,
>> +			 stm32_timer_cnt_resume);
>> +
>>  static const struct of_device_id stm32_timer_cnt_of_match[] = {
>>  	{ .compatible = "st,stm32-timer-counter", },
>>  	{},
>> @@ -373,6 +397,7 @@ static struct platform_driver stm32_timer_cnt_driver = {
>>  	.driver = {
>>  		.name = "stm32-timer-counter",
>>  		.of_match_table = stm32_timer_cnt_of_match,
>> +		.pm = &stm32_timer_cnt_pm_ops,
>>  	},
>>  };
>>  module_platform_driver(stm32_timer_cnt_driver);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
