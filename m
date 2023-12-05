Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D3A804858
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 04:56:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50E0FC6C855;
	Tue,  5 Dec 2023 03:56:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE99BC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 03:56:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C30B31474;
 Mon,  4 Dec 2023 19:57:27 -0800 (PST)
Received: from [10.163.35.139] (unknown [10.163.35.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 890513F5A1;
 Mon,  4 Dec 2023 19:56:35 -0800 (PST)
Message-ID: <604b5b56-9f48-434e-b328-0b9616b47ec8@arm.com>
Date: Tue, 5 Dec 2023 09:26:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: James Clark <james.clark@arm.com>, linux-arm-kernel@lists.infradead.org,
 suzuki.poulose@arm.com
References: <20231201062053.1268492-1-anshuman.khandual@arm.com>
 <20231201062053.1268492-6-anshuman.khandual@arm.com>
 <fe5c82d1-8b7d-6701-4e19-9019f23d9c7b@arm.com>
Content-Language: en-US
In-Reply-To: <fe5c82d1-8b7d-6701-4e19-9019f23d9c7b@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V2 5/7] coresight: tmc: Move ACPI support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/4/23 16:24, James Clark wrote:
> 
> 
> On 01/12/2023 06:20, Anshuman Khandual wrote:
>> Add support for the tmc devices in the platform driver, which can then be
>> used on ACPI based platforms. This change would now allow runtime power
>> management for ACPI based systems. The driver would try to enable the APB
>> clock if available.
>>
> [...]
>> -module_amba_driver(tmc_driver);
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
>> +	dev_set_drvdata(&pdev->dev, drvdata);
>> +	pm_runtime_get_noresume(&pdev->dev);
>> +	pm_runtime_set_active(&pdev->dev);
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	ret = __tmc_probe(&pdev->dev, res, NULL);
>> +	if (ret) {
>> +		pm_runtime_put_noidle(&pdev->dev);
>> +		pm_runtime_disable(&pdev->dev);
>> +	}
> 
> I'm not sure if these pm_runtime()s are right because there is already a
> put inside of __tmc_probe() if it fails. If you unload and then reload

Actually there is a pm_runtime_put() on the success path, not when it
fails. So pm_runtime_put() gets called when __tmc_probe() returns 0.

__tmc_probe()
{
	....
        ret = misc_register(&drvdata->miscdev);
        if (ret)
                coresight_unregister(drvdata->csdev);
        else
                pm_runtime_put(dev);
out:
        return ret;
}

tmc_platform_probe()
{
	....
        pm_runtime_get_noresume(&pdev->dev);
        pm_runtime_set_active(&pdev->dev);
        pm_runtime_enable(&pdev->dev);

        ret = __tmc_probe(&pdev->dev, res, NULL);
        if (ret) {
                pm_runtime_put_noidle(&pdev->dev);
                pm_runtime_disable(&pdev->dev);
        }
        return ret;
}

tmc_probe()
{
	....
	return __tmc_probe(&adev->dev, &adev->res, coresight_get_uci_data(id));
}

Currently pm_runtime_put() gets called

- In success path both for AMBA and platform drivers
- In error path only for platform driver

Although the problem might be with pm_runtime_disable() instead

- pm_runtime_disable() is not required in the platform driver probe() path
- But might be required in tmc_platform_remove() along with a clk_put()

> all the coresight modules with these patches you get these errors which
> are new:
> 
>   coresight-tpiu-platform ARMHC979:00: Unbalanced pm_runtime_enable!

The code is similar in TPIU platform driver as well.

>   CSCFG registered etm0
>   coresight etm0: CPU0: etm v4.2 initialized
>   CSCFG registered etm1
>   coresight etm1: CPU1: etm v4.2 initialized
>   CSCFG registered etm2
>   coresight etm2: CPU2: etm v4.2 initialized
>   CSCFG registered etm3
>   coresight etm3: CPU3: etm v4.2 initialized
>   coresight-tmc-platform ARMHC97C:00: Unbalanced pm_runtime_enable!
>   coresight-tmc-platform ARMHC97C:01: Unbalanced pm_runtime_enable!
>   coresight-tmc-platform ARMHC97C:02: Unbalanced pm_runtime_enable!
>   coresight-tmc-platform ARMHC97C:03: Unbalanced pm_runtime_enable!
> 
> It might be worth testing all of these pm_runtime()s, including the
> error case ones, because loading and unloading the modules doesn't even
> include the error scenarios, so there are probably more bad ones in
> there too.
The code is very similar in CATU, STM as well but debug_platform_remove()
seems to be doing this right.

I am not very familiar with all the power management aspects in coresight,
please do let me know if I missing something here.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
