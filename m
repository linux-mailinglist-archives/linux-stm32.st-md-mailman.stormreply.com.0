Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABC732A6E4
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Mar 2021 18:04:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41A9DC56638;
	Tue,  2 Mar 2021 17:04:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B737C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 17:04:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122H1sYa016196; Tue, 2 Mar 2021 18:03:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MPuDgAI8bly3BZ6l6If7B5CFn09WiiZifHi7p1VUgfM=;
 b=hRHRtutXrKv510SgyVvetOCL3HRxze1NoX5YPPb0qyvX/3dbvcBY2GT79kpPY8IKXfUJ
 fPnXHH4Kc7tUvmzVAcr07orC1L4+vGm6vNUJKQWPcBxz/HY46YqrMyhcK0EJO+puRYX5
 WZoj1W5jYEayMKhHLRCxNFEJHPeL18hDHxY4iO2ww/imgUVpSWdBdfwWVjWJ/m/sygRj
 Spn7wpWcRR7Ydvb4s+QybY5vfsFP4uCOophKl13NftkCSYNc8VhVHF6GWcRHTHps69xg
 J+9WFb00mfwbIAXWPXXAUA6SL3TeYeFkjUf+KD4vS8553zwD5agCAmj0Fj+CNQpN9Y9r MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfc3uh6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 18:03:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 858D810002A;
 Tue,  2 Mar 2021 18:03:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 735CA2160F0;
 Tue,  2 Mar 2021 18:03:42 +0100 (CET)
Received: from [10.211.13.170] (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Mar
 2021 18:03:41 +0100
To: William Breathitt Gray <vilhelm.gray@gmail.com>
References: <1614696235-24088-1-git-send-email-fabrice.gasnier@foss.st.com>
 <YD5SLrdttn+95M7N@shinobu>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <e54d1446-b583-9625-1ab3-09e54d6a7456@foss.st.com>
Date: Tue, 2 Mar 2021 18:03:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YD5SLrdttn+95M7N@shinobu>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
Cc: linux-iio@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, david@lechnology.com
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix ceiling
	write max value
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

On 3/2/21 3:56 PM, William Breathitt Gray wrote:
> On Tue, Mar 02, 2021 at 03:43:55PM +0100, Fabrice Gasnier wrote:
>> The ceiling value isn't checked before writing it into registers. The user
>> could write a value higher than the counter resolution (e.g. 16 or 32 bits
>> indicated by max_arr). This makes most significant bits to be truncated.
>> Fix it by checking the max_arr to report a range error [1] to the user.
>>
>> Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
>>
>> [1] https://lkml.org/lkml/2021/2/12/358
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> 
> Side question: if priv->ceiling is tracking the current ceiling
> configuration, would it make sense to change stm32_count_ceiling_read()
> to print the value of priv->ceiling instead of doing a regmap_read()
> call?

Hi William,

Thanks for reviewing.

I'd be fine either way. So no objection to move to the priv->ceiling
(cached) value. It could also here here.
By looking at this, I figured out there's probably another thing to fix
here, for initial conditions.

At probe time priv->ceiling is initialized to max value (ex 65535 for a
16 bits counter). But the register content is 0 (clear by mfd driver at
probe time).

- So, reading ceiling from sysfs currently reports 0 (regmap_read())
after booting and probing.

I see two cases at this point:
- In case the counter gets enabled without any prior configuration, it
won't count: ceiling value (e.g. 65535) should be written to register
before it is enabled, so the counter will actually count. So there's
room for a fix here.

- In case function gets set (ex: quadrature x4), priv->ceiling (e.g.
65535) gets written to the register (although it's been read earlier as
0 from sysfs).
This could be fixed by reading the priv->ceiling in
stm32_count_ceiling_read() as you're asking (provided 1st case has been
fixed as well)

I'll probably prepare one or two patches for the above cases, if you agree ?

Best Regards,
Fabrice

> 
>> ---
>>  drivers/counter/stm32-timer-cnt.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
>> index ef2a974..2cf0c05 100644
>> --- a/drivers/counter/stm32-timer-cnt.c
>> +++ b/drivers/counter/stm32-timer-cnt.c
>> @@ -32,6 +32,7 @@ struct stm32_timer_cnt {
>>  	struct regmap *regmap;
>>  	struct clk *clk;
>>  	u32 ceiling;
>> +	u32 max_arr;
>>  	bool enabled;
>>  	struct stm32_timer_regs bak;
>>  };
>> @@ -185,6 +186,9 @@ static ssize_t stm32_count_ceiling_write(struct counter_device *counter,
>>  	if (ret)
>>  		return ret;
>>  
>> +	if (ceiling > priv->max_arr)
>> +		return -ERANGE;
>> +
>>  	/* TIMx_ARR register shouldn't be buffered (ARPE=0) */
>>  	regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_ARPE, 0);
>>  	regmap_write(priv->regmap, TIM_ARR, ceiling);
>> @@ -360,6 +364,7 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
>>  	priv->regmap = ddata->regmap;
>>  	priv->clk = ddata->clk;
>>  	priv->ceiling = ddata->max_arr;
>> +	priv->max_arr = ddata->max_arr;
>>  
>>  	priv->counter.name = dev_name(dev);
>>  	priv->counter.parent = dev;
>> -- 
>> 2.7.4
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
