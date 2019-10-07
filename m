Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C14CDC62
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 09:31:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 097C1C36B0C;
	Mon,  7 Oct 2019 07:31:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30447C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 07:31:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x977RFgY014524; Mon, 7 Oct 2019 09:31:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=m0wVzPPVZI5zTvNlb362SfLUY82UVnwf8TmB+ThZU2M=;
 b=qA1R/5kuWiNjTVm2AL6IlnTYnyJD3Jpq5RZNMd0yJMMachZ1XA10EeBMVtdcM/t2aI66
 Ou3lY80QKehIIsesQzTdbHF1WCMwSoTGX1wrsppreGXDtT2MroJpcDwGob75bEce9LAm
 HZFHCSyFuTprnfrqMSlhsKd4YYFIF1CC+dPM0X59g8LfSKuxwhj5+t17pyQpMnwQbsDB
 npQB7thmZeJBzSFn3zvSmX36l45BSC57YK7Re1JlWOdiTqfo9k7MYbpLLT4F94+Z5c0S
 qKlHIT0OICM4neM9QAUb1cOy4AdMq+EHg/kJvjxnx7icHimVFuMfpCIdNBPf/VbZiA94 yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2p0rsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 09:31:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D083100038;
 Mon,  7 Oct 2019 09:31:12 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4717C2AECA9;
 Mon,  7 Oct 2019 09:31:12 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019
 09:31:12 +0200
Received: from [10.48.0.192] (10.48.0.192) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 7 Oct 2019 09:31:11 +0200
To: William Breathitt Gray <vilhelm.gray@gmail.com>
References: <20190925095126.20219-1-colin.king@canonical.com>
 <20191005173004.GA7431@icarus>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <792dd11a-ae78-c4a3-834f-b1f67a750a14@st.com>
Date: Mon, 7 Oct 2019 09:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191005173004.GA7431@icarus>
Content-Language: en-US
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_01:2019-10-03,2019-10-07 signatures=0
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Colin King <colin.king@canonical.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] counter: stm32: clean up indentation issue
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

On 10/5/19 7:30 PM, William Breathitt Gray wrote:
> On Wed, Sep 25, 2019 at 10:51:26AM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is an if statement that is indented one level too deeply,
>> remove the extraneous tabs.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/counter/stm32-timer-cnt.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
>> index 644ba18a72ad..613dcccf79e1 100644
>> --- a/drivers/counter/stm32-timer-cnt.c
>> +++ b/drivers/counter/stm32-timer-cnt.c
>> @@ -219,8 +219,8 @@ static ssize_t stm32_count_enable_write(struct counter_device *counter,
>>  
>>  	if (enable) {
>>  		regmap_read(priv->regmap, TIM_CR1, &cr1);
>> -			if (!(cr1 & TIM_CR1_CEN))
>> -				clk_enable(priv->clk);
>> +		if (!(cr1 & TIM_CR1_CEN))
>> +			clk_enable(priv->clk);
>>  
>>  		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
>>  				   TIM_CR1_CEN);
>> -- 
>> 2.20.1
> 
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> 
> Fabrice,
> 
> I noticed the TIM_CR1_CEN check is happening before the
> regmap_update_bits call for the enable path, while the disable path does
> the check after. Is this logic is correct.

Hi  William,

In the disable path, things are done in the reverse order, purpose is to:
- enable the clock before enabling the counter (CEN)
- disable the clock after the counter has been disabled
Current code also takes care of balancing clock enable/disable calls.

BR,
Fabrice
> 
> William Breathitt Gray
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
