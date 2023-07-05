Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7777488A5
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jul 2023 17:58:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4C7DC6B45C;
	Wed,  5 Jul 2023 15:58:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49C85C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jul 2023 15:58:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365FaBba003086; Wed, 5 Jul 2023 17:57:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Rvvtdbovq9nKUuzzc9jIGSTyDPwofHWkIz4L048OpFc=;
 b=Y6okW6EnlPm8U5z2CHYTs+9OX8NleRmgY6gWWIRhXe78ZwA3UDCvZvYpqWeCYBu1TtOM
 MOoQbFz9Z3KaRWFhbbxKqAmnp7RfIcTZ0+OYqO9VRPXMbZm2Vjphe5WQYtii7PKZisOU
 OV17MCzaTTbImQTO5v8Ob5b/aAm4K+IQ7FlnJfyi+Pdi3U8HNK6QyKpFjddJ7GOAbvw3
 Y01WbRqVIp9UXfhQ6jdV1Ne7hDG7A02LMJn5DP3WTAaVCxvMqwVW0bFuh2+sdlhKuEJi
 A4qaWFLDVi54y6jvzXrf1p7K0+cZhSBDbCCBqrXZJ/35M/xWKCBNzNpWuTbFOULg1qv3 QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn8c9skjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 17:57:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FD2A100057;
 Wed,  5 Jul 2023 17:57:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7498D226FD1;
 Wed,  5 Jul 2023 17:57:57 +0200 (CEST)
Received: from [10.201.20.168] (10.201.20.168) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 17:57:56 +0200
Message-ID: <a5ed729a-55f8-f148-03b8-7952f94572dd@foss.st.com>
Date: Wed, 5 Jul 2023 17:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230615092753.323844-1-valentin.caron@foss.st.com>
 <20230615092753.323844-4-valentin.caron@foss.st.com>
 <20230625231454d53ad0e0@mail.local>
Content-Language: en-US
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <20230625231454d53ad0e0@mail.local>
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_07,2023-07-05_01,2023-05-22_02
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/7] rtc: stm32: improve rtc precision
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

Hi Alexandre,

Sorry for the delay

On 6/26/23 01:14, Alexandre Belloni wrote:
> On 15/06/2023 11:27:49+0200, Valentin Caron wrote:
>> From: Christophe Guibout <christophe.guibout@foss.st.com>
>>
>> The rtc is used to update the stgen counter on wake up from
>> low power modes, so it needs to be as much accurate as possible.
>>
>> The maximization of asynchronous divider leads to a 4ms rtc
>> precision clock.
>> By decreasing pred_a to 0, it will have pred_s=32767 (when
>> need_accuracy is true), so stgen clock becomes more accurate
>> with 30us precision.
>> Nevertheless this will leads to an increase of power consumption.
>>
>> Signed-off-by: Christophe Guibout <christophe.guibout@foss.st.com>
>> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
>> ---
>>   drivers/rtc/rtc-stm32.c | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
>> index bd7a59a07537..cad88668bcfb 100644
>> --- a/drivers/rtc/rtc-stm32.c
>> +++ b/drivers/rtc/rtc-stm32.c
>> @@ -114,6 +114,7 @@ struct stm32_rtc_data {
>>   	void (*clear_events)(struct stm32_rtc *rtc, unsigned int flags);
>>   	bool has_pclk;
>>   	bool need_dbp;
>> +	bool need_accuracy;
>>   };
>>   
>>   struct stm32_rtc {
>> @@ -545,6 +546,7 @@ static void stm32_rtc_clear_events(struct stm32_rtc *rtc,
>>   static const struct stm32_rtc_data stm32_rtc_data = {
>>   	.has_pclk = false,
>>   	.need_dbp = true,
>> +	.need_accuracy = false,
>>   	.regs = {
>>   		.tr = 0x00,
>>   		.dr = 0x04,
>> @@ -566,6 +568,7 @@ static const struct stm32_rtc_data stm32_rtc_data = {
>>   static const struct stm32_rtc_data stm32h7_rtc_data = {
>>   	.has_pclk = true,
>>   	.need_dbp = true,
>> +	.need_accuracy = false,
>>   	.regs = {
>>   		.tr = 0x00,
>>   		.dr = 0x04,
>> @@ -596,6 +599,7 @@ static void stm32mp1_rtc_clear_events(struct stm32_rtc *rtc,
>>   static const struct stm32_rtc_data stm32mp1_data = {
>>   	.has_pclk = true,
>>   	.need_dbp = false,
>> +	.need_accuracy = true,
>>   	.regs = {
>>   		.tr = 0x00,
>>   		.dr = 0x04,
>> @@ -636,11 +640,25 @@ static int stm32_rtc_init(struct platform_device *pdev,
>>   	pred_a_max = STM32_RTC_PRER_PRED_A >> STM32_RTC_PRER_PRED_A_SHIFT;
>>   	pred_s_max = STM32_RTC_PRER_PRED_S >> STM32_RTC_PRER_PRED_S_SHIFT;
>>   
>> -	for (pred_a = pred_a_max; pred_a + 1 > 0; pred_a--) {
>> -		pred_s = (rate / (pred_a + 1)) - 1;
>> +	if (rate > (pred_a_max + 1) * (pred_s_max + 1)) {
>> +		dev_err(&pdev->dev, "rtc_ck rate is too high: %dHz\n", rate);
> What is the expect user action after seeing this message?

User could change of source clock by a smaller one (in terms of 
frequency) or adjust the clock divider in amount of RTC.
e.g. on STM32MP1, RTC source clock could be:
- LSE clock
- LSI clock
- HSE clock * an adjustable divider.

>
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (rtc->data->need_accuracy) {
>> +		for (pred_a = 0; pred_a <= pred_a_max; pred_a++) {
>> +			pred_s = (rate / (pred_a + 1)) - 1;
>>   
>> -		if (((pred_s + 1) * (pred_a + 1)) == rate)
>> -			break;
>> +			if (pred_s <= pred_s_max && ((pred_s + 1) * (pred_a + 1)) == rate)
>> +				break;
>> +		}
>> +	} else {
>> +		for (pred_a = pred_a_max; pred_a + 1 > 0; pred_a--) {
>> +			pred_s = (rate / (pred_a + 1)) - 1;
>> +
>> +			if (((pred_s + 1) * (pred_a + 1)) == rate)
>> +				break;
>> +		}
>>   	}
>>   
>>   	/*
>> -- 
>> 2.25.1
>>

Regards,
Valentin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
