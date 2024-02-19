Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3FF859AD4
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 03:52:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AC83C6B460;
	Mon, 19 Feb 2024 02:52:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75B4DC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 02:52:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81CE4FEC;
 Sun, 18 Feb 2024 18:53:20 -0800 (PST)
Received: from [10.162.43.127] (a077893.blr.arm.com [10.162.43.127])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B10943F766;
 Sun, 18 Feb 2024 18:52:36 -0800 (PST)
Message-ID: <ff8cbe8c-c56e-4e04-8d89-040d2ba2fd0e@arm.com>
Date: Mon, 19 Feb 2024 08:22:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240123054608.1790189-1-anshuman.khandual@arm.com>
 <20240123054608.1790189-6-anshuman.khandual@arm.com>
 <b72c54bf-17a8-453c-8fbb-fbc90abdb45a@arm.com>
 <b0c8b92e-53bc-4232-a748-ff3e6b94b112@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <b0c8b92e-53bc-4232-a748-ff3e6b94b112@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V4 05/11] coresight: replicator: Move ACPI
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



On 2/15/24 16:55, Suzuki K Poulose wrote:
> On 15/02/2024 11:23, Suzuki K Poulose wrote:
>> Hi Anshuman
>>
>> On 23/01/2024 05:46, Anshuman Khandual wrote:
>>> Add support for the dynamic replicator device in the platform driver, which
>>> can then be used on ACPI based platforms. This change would now allow
>>> runtime power management for repliacator devices on ACPI based systems.
>>>
>>> The driver would try to enable the APB clock if available. Also, rename the
>>> code to reflect the fact that it now handles both static and dynamic
>>> replicators.
>>>
>>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Cc: Mike Leach <mike.leach@linaro.org>
>>> Cc: James Clark <james.clark@arm.com>
>>> Cc: linux-acpi@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Cc: coresight@lists.linaro.org
>>> Tested-by: Sudeep Holla <sudeep.holla@arm.com> # Boot and driver probe only
>>> Acked-by: Sudeep Holla <sudeep.holla@arm.com> # For ACPI related changes
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>
>> I think the patch is doing three different things:
>>
>> 1) Use new helper to register/remove AMBA/Platform drivers
>> 2) Refactor replicator_probe() to make sure it can be reused for platform/amba driver, by moving the pm_runtime_put() to the callers.
>> 3) Actually moving the ACPI driver to Platform driver
>>
>> While (1) and (3) are obvious, (2) gave me hard time to review this
>> patch, without proper description. If you don't mind, are you able to
>> split the patch and add proper description of the 3 changes mentioned
>> above.
>>
> 
> You could even move (1) for all the existing drivers into a single patch
> or even fold it with the patch that introduces the helpers. That way it

There are only two existing coresight devices with both AMBA and platform
drivers available i.e replicator and funnel. Such devices could use these
new helpers right from the beginning. As you mentioned earlier such changes
might be folded back into the patch adding the helpers.

But coresight devices such as catu, tpiu, tmc, stm and debug don't have
platform drivers to begin with. Hence the helpers could only be used in
their respective patches adding platform drivers.

> is cleaner and easier to review. And (2) & (3) could be in the same patch for each driver, but please add something in the description for (2).

Please find the updated commit message here, does this look okay ?

    coresight: replicator: Move ACPI support from AMBA driver to platform driver

    Add support for the dynamic replicator device in the platform driver, which
    can then be used on ACPI based platforms. This change would now allow
    runtime power management for replicator devices on ACPI based systems.

    The driver would try to enable the APB clock if available. Also, rename the
    code to reflect the fact that it now handles both static and dynamic
    replicators. But first this refactors replicator_probe() making sure it can
    be used both for platform and AMBA drivers, by moving the pm_runtime_put()
    to the callers.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
