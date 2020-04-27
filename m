Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E731BAEE2
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 22:10:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E90C7C36B0C;
	Mon, 27 Apr 2020 20:10:40 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FD9DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 20:10:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 499wrG2wf8z1r57K;
 Mon, 27 Apr 2020 22:10:38 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 499wrG17wnz1r5QD;
 Mon, 27 Apr 2020 22:10:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id i4tqPQhTSciQ; Mon, 27 Apr 2020 22:10:36 +0200 (CEST)
X-Auth-Info: GUUzWNkr5v3OccBIirF+3V7nXhtOcUNOL4F87dnWiJo=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 27 Apr 2020 22:10:36 +0200 (CEST)
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
 <20200427194747.224a2402@xps13>
 <40a9bac7-9ed4-b781-f2c2-2d90b4e82749@denx.de>
 <20200427200848.722f4c56@xps13>
 <3527f3b8-225d-6e5a-dd8a-0421d475f70b@denx.de>
 <20200427220806.13741ec0@xps13>
From: Marek Vasut <marex@denx.de>
Message-ID: <456b04f5-4ed7-6f3f-b0e6-9276bea09b50@denx.de>
Date: Mon, 27 Apr 2020 22:10:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200427220806.13741ec0@xps13>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage
 all errors cases at probe time
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

On 4/27/20 10:08 PM, Miquel Raynal wrote:
> Hi Marek,
> 
> Marek Vasut <marex@denx.de> wrote on Mon, 27 Apr 2020 21:46:44 +0200:
> 
>> On 4/27/20 8:08 PM, Miquel Raynal wrote:
>> [...]
>>>>>>  	/* FMC2 init routine */
>>>>>>  	stm32_fmc2_init(fmc2);
>>>>>> @@ -1997,7 +2001,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>>>>>  	/* Scan to find existence of the device */
>>>>>>  	ret = nand_scan(chip, nand->ncs);
>>>>>>  	if (ret)
>>>>>> -		goto err_scan;
>>>>>> +		goto err_dma_setup;
>>>>>>  
>>>>>>  	ret = mtd_device_register(mtd, NULL, 0);
>>>>>>  	if (ret)
>>>>>> @@ -2010,7 +2014,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>>>>>  err_device_register:
>>>>>>  	nand_cleanup(chip);
>>>>>>  
>>>>>> -err_scan:
>>>>>> +err_dma_setup:
>>>>>>  	if (fmc2->dma_ecc_ch)
>>>>>>  		dma_release_channel(fmc2->dma_ecc_ch);
>>>>>>  	if (fmc2->dma_tx_ch)
>>>>>> @@ -2021,6 +2025,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
>>>>>>  	sg_free_table(&fmc2->dma_data_sg);
>>>>>>  	sg_free_table(&fmc2->dma_ecc_sg);
>>>>>>  
>>>>>> +err_clk_disable:
>>>>>>  	clk_disable_unprepare(fmc2->clk);
>>>>>>  
>>>>>>  	return ret;    
>>>>>
>>>>> I didn't spot it during my earlier reviews but I really prefer using
>>>>> labels explaining what you do than having the same name of the function
>>>>> which failed. This way you don't have to rework the error path when
>>>>> you handle an additional error.
>>>>>
>>>>> So, would you mind doing this in two steps:
>>>>>
>>>>> 1/
>>>>> Replace
>>>>>
>>>>>     err_scan:
>>>>>
>>>>> with, eg.
>>>>>
>>>>>     release_dma_objs:    
>>>>
>>>> The ^err_ prefix in failpath labels is useful, since it's easily
>>>> possible to match on it with regexes ; not so much on arbitrary label name.  
>>>
>>> I guess so, but is it actually useful to catch labels in a regex? (real
>>> question)  
>>
>> I find it useful to have a unified way to find those labels, e.g.
>> err_because_foo:
>> err_because_bar:
>> err_last_one:
>> is much nicer than:
>> foo_failed:
>> bar_also_failed:
>> its_total_randomness:
> 
> My point being, Christophe, you can use err_ as a prefix but I think
> it's better to use:
> 
>     err_do_this_cleanup
> 
> than
> 
>    err_this_failed

That's fine either way.

>>> Any way I suppose catching ":\n" is already a good approximation to
>>> find labels?  
>>
>> Not very practical with git grep (^err.*: works nicely though)
> 
> I suppose ^.*:$ would work the same ;)

Try and see how much other irrelevant stuff that sucks in ;-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
