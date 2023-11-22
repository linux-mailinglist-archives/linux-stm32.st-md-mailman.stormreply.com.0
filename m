Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD4A7F3E85
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 08:02:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C0ABC6B475;
	Wed, 22 Nov 2023 07:02:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FDFDC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 07:02:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34E521595;
 Tue, 21 Nov 2023 23:03:27 -0800 (PST)
Received: from [10.162.41.8] (a077893.blr.arm.com [10.162.41.8])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6C223F73F;
 Tue, 21 Nov 2023 23:02:36 -0800 (PST)
Message-ID: <268e1605-fe3f-4aa0-92e3-36ddfc8aacb3@arm.com>
Date: Wed, 22 Nov 2023 12:32:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Clark <james.clark@arm.com>, linux-arm-kernel@lists.infradead.org,
 suzuki.poulose@arm.com
References: <20231027072943.3418997-1-anshuman.khandual@arm.com>
 <20231027072943.3418997-5-anshuman.khandual@arm.com>
 <92d6a66d-3270-3378-2ab9-9214c004d5c7@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <92d6a66d-3270-3378-2ab9-9214c004d5c7@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 4/7] coresight: tpiu: Move ACPI support
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



On 11/15/23 19:23, James Clark wrote:
> 
> 
> On 27/10/2023 08:29, Anshuman Khandual wrote:
>> Add support for the tpiu device in the platform driver, which can then be
>> used on ACPI based platforms. This change would now allow runtime power
>> management for ACPI based systems. The driver would try to enable the APB
>> clock if available.
>>
> [...]
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id tpiu_acpi_ids[] = {
>> +	{"ARMHC979", 0}, /* ARM CoreSight TPIU */
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(acpi, tpiu_acpi_ids);
>> +#endif
>> +
>> +static struct platform_driver tpiu_platform_driver = {
>> +	.probe	= tpiu_platform_probe,
>> +	.remove	= tpiu_platform_remove,
>> +	.driver = {
>> +		.name			= "coresight-tpiu-platform",
>> +		.acpi_match_table	= ACPI_PTR(tpiu_acpi_ids),
>> +		.suppress_bind_attrs	= true,
>> +		.pm			= &tpiu_dev_pm_ops,
>> +	},
>> +};
>> +module_platform_driver(tpiu_platform_driver);
>> +
> 
> Is there a special build config where this works? I get an error here

I have been testing this with a config known to work on RB5 board.

> because module_platform_driver() redefines things that are in
> module_amba_driver() which is defined above:
> 
>   module_amba_driver(tpiu_driver);
> 
> This isn't a W=1 build or anything, just a normal one. And it applies to
> most of the patches in this set.

You are right, I am able to recreate this problem with defconfig on
6.7-rc2 as well. The problem here seems to be caused by having both
module_amba_driver() and module_platform_driver() in the same file.

#define module_amba_driver(__amba_drv) \
        module_driver(__amba_drv, amba_driver_register, amba_driver_unregister)

#define module_platform_driver(__platform_driver) \
        module_driver(__platform_driver, platform_driver_register, \
                        platform_driver_unregister)

Although, AFAICT, have not seen these before - even on the defconfig.
Just to work around this problem, there can be a common module_init()
/module_exit() to register/unregister both AMBA and platform drivers,
similar to etm4x_init()/etm4x_exit() setup in coresight-etm4x-core.c.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
