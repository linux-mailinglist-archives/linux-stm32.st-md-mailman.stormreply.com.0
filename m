Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C68560A4
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 12:04:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C10AC6410C;
	Thu, 15 Feb 2024 11:04:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90074C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 11:04:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96E301FB;
 Thu, 15 Feb 2024 03:04:48 -0800 (PST)
Received: from [10.57.49.250] (unknown [10.57.49.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A86443F7B4;
 Thu, 15 Feb 2024 03:04:05 -0800 (PST)
Message-ID: <68eb9e4e-de77-4854-8212-816c66d5f657@arm.com>
Date: Thu, 15 Feb 2024 11:04:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240123054608.1790189-1-anshuman.khandual@arm.com>
 <20240123054608.1790189-2-anshuman.khandual@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240123054608.1790189-2-anshuman.khandual@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Leo Yan <leo.yan@linaro.org>, linux-acpi@vger.kernel.org,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Len Brown <lenb@kernel.org>,
 coresight@lists.linaro.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V4 01/11] coresight: etm4x: Fix unbalanced
 pm_runtime_enable()
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

On 23/01/2024 05:45, Anshuman Khandual wrote:
> There is an unbalanced pm_runtime_enable() in etm4_probe_platform_dev()
> when etm4_probe() fails. This problem can be observed via the coresight
> etm4 module's (load -> unload -> load) sequence when etm4_probe() fails
> in etm4_probe_platform_dev().
> 
> [   63.379943] coresight-etm4x 7040000.etm: Unbalanced pm_runtime_enable!
> [   63.393630] coresight-etm4x 7140000.etm: Unbalanced pm_runtime_enable!
> [   63.407455] coresight-etm4x 7240000.etm: Unbalanced pm_runtime_enable!
> [   63.420983] coresight-etm4x 7340000.etm: Unbalanced pm_runtime_enable!
> [   63.420999] coresight-etm4x 7440000.etm: Unbalanced pm_runtime_enable!
> [   63.441209] coresight-etm4x 7540000.etm: Unbalanced pm_runtime_enable!
> [   63.454689] coresight-etm4x 7640000.etm: Unbalanced pm_runtime_enable!
> [   63.474982] coresight-etm4x 7740000.etm: Unbalanced pm_runtime_enable!
> 
> This fixes the above problem - with an explicit pm_runtime_disable() call
> when etm4_probe() fails during etm4_probe_platform_dev().

Fixes: 5214b563588e ("coresight: etm4x: Add support for sysreg only devices"

> 
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: Leo Yan <leo.yan@linaro.org>
> Cc: linux-acpi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: coresight@lists.linaro.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V4:
> 
> - New patch in the series
> 
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index ce1995a2827f..7c693b45ac05 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2217,6 +2217,9 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
>   	ret = etm4_probe(&pdev->dev);
>   
>   	pm_runtime_put(&pdev->dev);
> +	if (ret)
> +		pm_runtime_disable(&pdev->dev);
> +
>   	return ret;
>   }
>   

Looks good to me. I have glanced through the other platform device 
driver code in coresight subsystem and they all seem to be safe, except
for Ultrasoc-smb, which doesn't do any power managment. It may be, 
because it is only supported on an ACPI system.

Suzuki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
