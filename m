Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD780319D
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 12:37:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 632EBC6B46B;
	Mon,  4 Dec 2023 11:37:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 120B1C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 11:37:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65BA0152B;
 Mon,  4 Dec 2023 03:38:26 -0800 (PST)
Received: from [10.163.35.18] (unknown [10.163.35.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCBD23F6C4;
 Mon,  4 Dec 2023 03:37:34 -0800 (PST)
Message-ID: <dbcd6fa5-1385-41d7-905e-d77b536c5d33@arm.com>
Date: Mon, 4 Dec 2023 17:07:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Clark <james.clark@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
References: <20231201062053.1268492-1-anshuman.khandual@arm.com>
 <20231201062053.1268492-2-anshuman.khandual@arm.com>
 <20231201123515.gntwvhsxd5nzojn7@bogus>
 <58882cab-89ce-4554-aee4-24e70d82fc09@arm.com>
 <b9f407c7-62af-47e1-bea9-c494cdfed1e9@arm.com>
 <2aec13e9-4ae3-676f-1ba8-c9e9a9241063@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <2aec13e9-4ae3-676f-1ba8-c9e9a9241063@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V2 1/7] coresight: replicator: Move ACPI
 support from AMBA driver to platform driver
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



On 12/4/23 15:27, James Clark wrote:
> 
> On 04/12/2023 04:48, Anshuman Khandual wrote:
>>
>> On 12/4/23 09:56, Anshuman Khandual wrote:
>>>
>>> On 12/1/23 18:05, Sudeep Holla wrote:
>>>> On Fri, Dec 01, 2023 at 11:50:47AM +0530, Anshuman Khandual wrote:
>>>>> Add support for the dynamic replicator device in the platform driver, which
>>>>> can then be used on ACPI based platforms. This change would now allow
>>>>> runtime power management for repliacator devices on ACPI based systems.
>>>>>
>>>>> The driver would try to enable the APB clock if available. Also, rename the
>>>>> code to reflect the fact that it now handles both static and dynamic
>>>>> replicators.
>>>>>
>>>>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>>>>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>>>> Except the minor nit below which may apply also for few other patches
>>>> in the series
>>>>
>>>> Acked-by: Sudeep Holla <sudeep.holla@arm.com> # For ACPI related changes
>>>> Tested-by: Sudeep Holla <sudeep.holla@arm.com> # Boot and driver probe only
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
>>>>> index b6be73034996..64de0bee02ec 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-replicator.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
>>>>> @@ -38,6 +38,7 @@ DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
>>>>>  struct replicator_drvdata {
>>>>>  	void __iomem		*base;
>>>>>  	struct clk		*atclk;
>>>>> +	struct clk		*pclk;
>>>> [minor nit] Perhaps can be documented as well ?
>>> Sure, will add the following comment above the structure.
>>>
>>> @pclk:    optional clock for the core parts of the replicator.
>> My bad, this will be the following instead.
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
>> index 64de0bee02ec..44b9a77ec8aa 100644
>> --- a/drivers/hwtracing/coresight/coresight-replicator.c
>> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
>> @@ -31,6 +31,7 @@ DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
>>   * @base:      memory mapped base address for this component. Also indicates
>>   *             whether this one is programmable or not.
>>   * @atclk:     optional clock for the core parts of the replicator.
>> + * @pclk:      APB clock if present, otherwise NULL
>>   * @csdev:     component vitals needed by the framework
>>   * @spinlock:  serialize enable/disable operations.
>>   * @check_idfilter_val: check if the context is lost upon clock removal.
>>
>> I will update replicator, tpiu, tmc, and stm devices.
>>
> funnel is missing it as well. If you build with W=1 it shows up.

Updated, done.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
