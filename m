Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A576C237
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Aug 2023 03:28:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 130C9C6A5E6;
	Wed,  2 Aug 2023 01:28:39 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 317D9C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Aug 2023 01:28:38 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RFvVG0kJnz1GDP2;
 Wed,  2 Aug 2023 09:27:34 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 09:28:35 +0800
Message-ID: <65f1d686-815c-b0c7-4e08-b97b764be0ca@huawei.com>
Date: Wed, 2 Aug 2023 09:28:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
 <20230801233603.iztyd2wqhcogr72r@intel.intel>
 <20230801235227.swouzgtcro4p4itv@intel.intel>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230801235227.swouzgtcro4p4itv@intel.intel>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Cc: linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] i2c: stm32: fix the return value
 handle for platform_get_irq()
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



On 2023/8/2 7:52, Andi Shyti wrote:
> Hi Ruan,
> 
> Just a nitpick here that does not affect my r-b...
> 
>> On Mon, Jul 31, 2023 at 07:27:55PM +0800, Ruan Jinjie wrote:
>>> There is no possible for platform_get_irq() to return 0,
>>> and the return value of platform_get_irq() is more sensible
>>> to show the error reason.
> 
> can we rephrase the whole commit to:
> 
>   i2c: stm32: Do not check for 0 return after calling platform_get_irq()
>   
>   It is not possible for platform_get_irq() to return 0. Use the
>   return value from platform_get_irq().
> 
> Two notes on the commit log:
> 
>  - Use capital letter after "i2c: stm32: Fix..."
>  - This is not a fix, so that we shouldn't use the word "fix" in
>    the title.
> 
> just little notes for future patches :)
Thank you for your valuable advice! I will keep an eye out for these in
future patches.

> 
> Thanks,
> Andi
> 
>>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>>> ---
>>>  drivers/i2c/busses/i2c-stm32f7.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>>> index e897d9101434..579b30581725 100644
>>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>>> @@ -2121,12 +2121,12 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>>>  	phy_addr = (dma_addr_t)res->start;
>>>  
>>>  	irq_event = platform_get_irq(pdev, 0);
>>> -	if (irq_event <= 0)
>>> -		return irq_event ? : -ENOENT;
>>> +	if (irq_event < 0)
>>> +		return irq_event;
>>>  
>>>  	irq_error = platform_get_irq(pdev, 1);
>>> -	if (irq_error <= 0)
>>> -		return irq_error ? : -ENOENT;
>>> +	if (irq_error < 0)
>>> +		return irq_error;
>>
>> Correct, from patch ce753ad1549cbe ("platform: finally disallow
>> IRQ0 in platform_get_irq() and its ilk") this check is already
>> done inside platform_get_irq();
>>
>> Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 
>>
>> Andi
>>
>>>  
>>>  	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
>>>  						    "wakeup-source");
>>> -- 
>>> 2.34.1
>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
