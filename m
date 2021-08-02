Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8753DDC4B
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 17:23:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11B6CC597BE;
	Mon,  2 Aug 2021 15:23:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3E74C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Aug 2021 15:23:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172F770J031883
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 2 Aug 2021 17:23:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ZC4N8gWD1MbBOJx0IEJplCU4hcpf4JtH16KdjSRNeKo=;
 b=RcjIW+JPWnLBHKbWlFGptOMXDJwB7wxKbzCDAWGmBTfAFbtVjJ+ZX2lKxn7kxYccquLv
 Czj7j4yUccL3bA7n/QXROcJEcn3qWvS/YGxQ27ATCOx0a9iDwOPh6IrCg8Nu6DUIgoRs
 DuTimP4Ct/EMGeadH3/ajXV59NnUW0Dx//nL8rjBou2zbpcaA7NjDtaPybQd+NhYkaau
 GOTS6wxMO5BMSOC0ZRYHNvvibuKgb3lM+WR/bUmMPwRhaA09GB3fU3ADGvGge2UKxD5+
 YU99LTDti2KV3CnXRtf8wbE13HLaCbWmNkNefSv2Y4yOp7dv93MvMkLTvhxi9y97jEKv ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a6fc8h68t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 02 Aug 2021 17:23:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0655D10002A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Aug 2021 17:23:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE53D2309D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Aug 2021 17:23:33 +0200 (CEST)
Received: from lmecxl0577.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 2 Aug
 2021 17:23:33 +0200
To: <linux-stm32@st-md-mailman.stormreply.com>
References: <20210719195313.40341-1-yzhai003@ucr.edu>
 <20210724164840.7381053b@jic23-huawei>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <9c4aa20f-d594-a120-450c-05c1e9cdde30@foss.st.com>
Date: Mon, 2 Aug 2021 17:23:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210724164840.7381053b@jic23-huawei>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_05:2021-08-02,
 2021-08-02 signatures=0
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: Fix the
 uninitialized use if regmap_read() fails
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

Hi,

On 7/24/21 5:48 PM, Jonathan Cameron wrote:
> On Mon, 19 Jul 2021 19:53:11 +0000
> Yizhuo <yzhai003@ucr.edu> wrote:
> 
>> Inside function stm32_dfsdm_irq(), the variable "status", "int_en"
>> could be uninitialized if the regmap_read() fails and returns an error
>> code.  However, they are directly used in the later context to decide
>> the control flow, which is potentially unsafe.
>>
>> Fixes: e2e6771c64625 ("IIO: ADC: add STM32 DFSDM sigma delta ADC support")
>>
>> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> 
> Hi Yizhou
> 
> I want to get some review of this from people familiar with the
> hardware as there is a small possibility your reordering might have
> introduced a problem.
> 

I cannot see side effects with reordering itself.
However, if we get an error with the read access, just leaving with
irq_handled status is probably not enough.
In such case we are facing a serious issue and it would make sense to 
also mask dfsdm interrupts and log a trace.
There are three regmap_read() calls in the irq handler. I think that 
checking the first call is enough. This would also avoid to re-order the 
following regmap_read.

BRs
Olivier

>> ---
>>   drivers/iio/adc/stm32-dfsdm-adc.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
>> index 1cfefb3b5e56..d8b78aead942 100644
>> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
>> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
>> @@ -1292,9 +1292,11 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
>>   	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
>>   	struct regmap *regmap = adc->dfsdm->regmap;
>>   	unsigned int status, int_en;
>> +	int ret;
>>   
>> -	regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
>> -	regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
> 
> Moving this later is only valid if there aren't any side effects.
> The current ordering is strange enough it makes me wonder if there might be!
> 
> Jonathan
> 
>> +	ret = regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
>> +	if (ret)
>> +		return IRQ_HANDLED;
>>   
>>   	if (status & DFSDM_ISR_REOCF_MASK) {
>>   		/* Read the data register clean the IRQ status */
>> @@ -1303,6 +1305,9 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
>>   	}
>>   
>>   	if (status & DFSDM_ISR_ROVRF_MASK) {
>> +		ret = regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
>> +		if (ret)
>> +			return IRQ_HANDLED;
>>   		if (int_en & DFSDM_CR2_ROVRIE_MASK)
>>   			dev_warn(&indio_dev->dev, "Overrun detected\n");
>>   		regmap_update_bits(regmap, DFSDM_ICR(adc->fl_id),
> 
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
