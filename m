Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B98422087
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Oct 2021 10:19:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 673A2C5AB7F;
	Tue,  5 Oct 2021 08:19:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58466C5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 08:19:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1952IMrp032013; 
 Tue, 5 Oct 2021 10:18:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rvTXK7UCH3kxOfjWH75rXK7MS8enLLD50wSRBR+Rn4M=;
 b=2kxAcWWdKJiFZsAdkoe7e75BBNxOq9UfAJSML32VlRP+YVrVM782zAFlR5SuA1DdVBQP
 4zd2pQ4a8NmWoP7uL/GMV5z6dzLZtzrvXyXWPcYi1QRWGPjX/17WaVoMWWC1Wey66Hy2
 FCUXWhCg8P0clVPx8UZ66kD3pKJ+3D/TWyam9x3kVmCADLRqqU+W5CPMwUi0dknSJeCr
 UZPiMUj6pNjQ8zLH18Hx42ZooVF3KxRifqseT1SWvPLzQATuSZJa5oNLFx3HuPdAOTro
 DmIXdSXRtcHdvcDaVG+92betXVgYmwZyHElb42w4UxEsaj4hgfu1AdQUHgsETv2VgB6N +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bgdt9sjtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 10:18:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B2B110002A;
 Tue,  5 Oct 2021 10:18:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 018E9222C86;
 Tue,  5 Oct 2021 10:18:36 +0200 (CEST)
Received: from lmecxl0577.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 5 Oct
 2021 10:18:34 +0200
To: Jonathan Cameron <jic23@kernel.org>, Yizhuo <yzhai003@ucr.edu>, "Mugilraj
 Dhavachelvan" <dmugil2000@gmail.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Arnaud Pouliquen
 <arnaud.pouliquen@st.com>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20210719195313.40341-1-yzhai003@ucr.edu>
 <20210724164840.7381053b@jic23-huawei> <20210808183243.70619aa8@jic23-huawei>
 <20211003164726.42e20526@jic23-huawei>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <9d8d6633-deba-bcf8-f717-68def3ef798e@foss.st.com>
Date: Tue, 5 Oct 2021 10:18:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003164726.42e20526@jic23-huawei>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

On 10/3/21 5:47 PM, Jonathan Cameron wrote:
> On Sun, 8 Aug 2021 18:32:43 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
>> On Sat, 24 Jul 2021 16:48:40 +0100
>> Jonathan Cameron <jic23@kernel.org> wrote:
>>
>>> On Mon, 19 Jul 2021 19:53:11 +0000
>>> Yizhuo <yzhai003@ucr.edu> wrote:
>>>    
>>>> Inside function stm32_dfsdm_irq(), the variable "status", "int_en"
>>>> could be uninitialized if the regmap_read() fails and returns an error
>>>> code.  However, they are directly used in the later context to decide
>>>> the control flow, which is potentially unsafe.
>>>>
>>>> Fixes: e2e6771c64625 ("IIO: ADC: add STM32 DFSDM sigma delta ADC support")
>>>>
>>>> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
>>>
>>> Hi Yizhou
>>>
>>> I want to get some review of this from people familiar with the
>>> hardware as there is a small possibility your reordering might have
>>> introduced a problem.
>>
>> To stm32 people, can someone take a look at this?
> 
> This one is still outstanding.  If anyone from stm32 side of things could take a look
> that would be great,
> 
> Jonathan
> 

I cannot see side effects with reordering itself.
However, if we get an error with the read access, just leaving with
irq_handled status is probably not enough.
In such case we are facing a serious issue and it would make sense to 
return irq_none instead, as the interrupt will probably never be 
acknowledged.

BRs

>>
>> Thanks,
>>
>> Jonathan
>>
>>>    
>>>> ---
>>>>   drivers/iio/adc/stm32-dfsdm-adc.c | 9 +++++++--
>>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
>>>> index 1cfefb3b5e56..d8b78aead942 100644
>>>> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
>>>> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
>>>> @@ -1292,9 +1292,11 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
>>>>   	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
>>>>   	struct regmap *regmap = adc->dfsdm->regmap;
>>>>   	unsigned int status, int_en;
>>>> +	int ret;
>>>>   
>>>> -	regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
>>>> -	regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
>>>
>>> Moving this later is only valid if there aren't any side effects.
>>> The current ordering is strange enough it makes me wonder if there might be!
>>>
>>> Jonathan
>>>    
>>>> +	ret = regmap_read(regmap, DFSDM_ISR(adc->fl_id), &status);
>>>> +	if (ret)
>>>> +		return IRQ_HANDLED;
>>>>   
>>>>   	if (status & DFSDM_ISR_REOCF_MASK) {
>>>>   		/* Read the data register clean the IRQ status */
>>>> @@ -1303,6 +1305,9 @@ static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
>>>>   	}
>>>>   
>>>>   	if (status & DFSDM_ISR_ROVRF_MASK) {
>>>> +		ret = regmap_read(regmap, DFSDM_CR2(adc->fl_id), &int_en);
>>>> +		if (ret)
>>>> +			return IRQ_HANDLED;
>>>>   		if (int_en & DFSDM_CR2_ROVRIE_MASK)
>>>>   			dev_warn(&indio_dev->dev, "Overrun detected\n");
>>>>   		regmap_update_bits(regmap, DFSDM_ICR(adc->fl_id),
>>>    
>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
