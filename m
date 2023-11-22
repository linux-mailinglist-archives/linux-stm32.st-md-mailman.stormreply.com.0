Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B17F4DFE
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 18:15:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A779C6B479;
	Wed, 22 Nov 2023 17:15:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC235C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 17:15:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 230001FB;
 Wed, 22 Nov 2023 09:16:01 -0800 (PST)
Received: from [10.57.42.32] (unknown [10.57.42.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABA273F73F;
 Wed, 22 Nov 2023 09:15:12 -0800 (PST)
Message-ID: <4de2b664-b7c8-4216-bb57-6f887bd751d2@arm.com>
Date: Wed, 22 Nov 2023 17:15:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Sudeep Holla <sudeep.holla@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20231027072943.3418997-1-anshuman.khandual@arm.com>
 <20231027072943.3418997-6-anshuman.khandual@arm.com> <ZV40itsgT5OSJmdC@bogus>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ZV40itsgT5OSJmdC@bogus>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 5/7] coresight: tmc: Move ACPI support
 from AMBA driver to platform driver
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

On 22/11/2023 17:04, Sudeep Holla wrote:
> On Fri, Oct 27, 2023 at 12:59:41PM +0530, Anshuman Khandual wrote:
>> Add support for the tmc devices in the platform driver, which can then be
>> used on ACPI based platforms. This change would now allow runtime power
>> management for ACPI based systems. The driver would try to enable the APB
>> clock if available.
>>
>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Cc: Mike Leach <mike.leach@linaro.org>
>> Cc: James Clark <james.clark@arm.com>
>> Cc: linux-acpi@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: coresight@lists.linaro.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   drivers/acpi/arm64/amba.c                     |   2 -
>>   .../hwtracing/coresight/coresight-tmc-core.c  | 127 +++++++++++++++---
>>   drivers/hwtracing/coresight/coresight-tmc.h   |   1 +
>>   3 files changed, 113 insertions(+), 17 deletions(-)
> 
> [...]
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 7ec5365e2b64..618bc0b7a1a5 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> 
> [...]
> 
>> @@ -573,9 +579,9 @@ static void tmc_shutdown(struct amba_device *adev)
>>   	spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>   }
>>   
>> -static void tmc_remove(struct amba_device *adev)
>> +static void __tmc_remove(struct device *dev)
>>   {
>> -	struct tmc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>> +	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
>>   
>>   	/*
>>   	 * Since misc_open() holds a refcount on the f_ops, which is
>> @@ -586,6 +592,11 @@ static void tmc_remove(struct amba_device *adev)
>>   	coresight_unregister(drvdata->csdev);
>>   }
>>   
>> +static void tmc_remove(struct amba_device *adev)
>> +{
>> +	__tmc_remove(&adev->dev);
>> +}
>> +
>>   static const struct amba_id tmc_ids[] = {
>>   	CS_AMBA_ID(0x000bb961),
>>   	/* Coresight SoC 600 TMC-ETR/ETS */
>> @@ -613,6 +624,92 @@ static struct amba_driver tmc_driver = {
>>   
>>   module_amba_driver(tmc_driver);
>>   
>> +static int tmc_platform_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	struct tmc_drvdata *drvdata;
>> +	int ret = 0;
>> +
>> +	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
>> +	if (!drvdata)
>> +		return -ENOMEM;
>> +
>> +	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
>> +	if (IS_ERR(drvdata->pclk))
>> +		return -ENODEV;
>> +
> 
> --->8
>> +	if (res) {
>> +		drvdata->base = devm_ioremap_resource(&pdev->dev, res);
>> +		if (IS_ERR(drvdata->base)) {
>> +			clk_put(drvdata->pclk);
>> +			return PTR_ERR(drvdata->base);
>> +		}
>> +	}
>> +
> ---
> 
> You need drop the above hunk as _tmc_probe() already takes care of that.
> This is the root cause for the issue I reported in the other thread. Also
> sorry for the confusion, I had to refer to coresight-tmc-core.c and post
> the patch to unify module_init/exit but completely mixed up the file/patch
> and referred coresight-tpiu-core.c instead as that patch was dealing with
> it.

Thank you Sudeep for getting to the bottom of the problem !

Suzuki
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
