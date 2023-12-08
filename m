Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2D880A775
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 16:32:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2156C6A613;
	Fri,  8 Dec 2023 15:32:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5C15C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 15:32:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0F6B106F;
 Fri,  8 Dec 2023 07:32:59 -0800 (PST)
Received: from [192.168.1.3] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE3753F6C4;
 Fri,  8 Dec 2023 07:32:12 -0800 (PST)
Message-ID: <b7270822-efe5-da15-49ea-0028031e38ce@arm.com>
Date: Fri, 8 Dec 2023 15:32:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com
References: <20231208053939.42901-1-anshuman.khandual@arm.com>
From: James Clark <james.clark@arm.com>
In-Reply-To: <20231208053939.42901-1-anshuman.khandual@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V3 00/10] coresight: Move remaining AMBA
 ACPI devices into platform driver
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



On 08/12/2023 05:39, Anshuman Khandual wrote:
> This moves remaining AMBA ACPI devices into respective platform drivers for
> enabling ACPI based power management support. This series applies on latest
> coresight/next branch. This series has been built, and boot tested on a DT
> based coresight platform. Although this still requires some more testing on
> ACPI based coresight platforms.
> 
> https://git.gitlab.arm.com/linux-arm/linux-anshuman.git (amba_other_acpi_migration_v3)
> 

Reviewed-by: James Clark <james.clark@arm.com>

> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-acpi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: coresight@lists.linaro.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> 
> Changes in V3:
> 
> - Split coresight_init_driver/remove_driver() helpers into a separate patch
> - Added 'drvdata->pclk' comments in replicator, funnel, tpiu, tmc, and stm devices
> - Updated funnel, and replicator drivers to use these new helpers
> - Check for drvdata instead of drvdata->pclk in suspend and resume paths in catu,
>   tmc and debug devices
> - Added patch to extract device name from AMBA pid based table lookup for stm
> - Added patch to extract device properties from AMBA pid based table look for tmc
> - Dropped pm_runtime_put() from common __probe() functions
> - Handled pm_runtime_put() in AMBA driver in success path
> - Handled pm_runtime_put() in platform driver in both success and error paths
> 
> Changes in V2:
> 
> https://lore.kernel.org/all/20231201062053.1268492-1-anshuman.khandual@arm.com/
> 
> - Dropped redundant devm_ioremap_resource() hunk from tmc_platform_probe()
> - Defined coresight_[init|remove]_driver() for both AMBA/platform drivers
> - Changed catu, tmc, tpiu, stm and debug coresight drivers to use the new
>   helpers avoiding build issues arising from module_amba_driver(), and
>   module_platform_driver() being on the same file
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20231027072943.3418997-1-anshuman.khandual@arm.com/
> 
> - Replaced all IS_ERR() instances with IS_ERR_OR_NULL() as per Suzuki
> 
> Changes in RFC:
> 
> https://lore.kernel.org/all/20230921042040.1334641-1-anshuman.khandual@arm.com/
> 
> Anshuman Khandual (10):
>   coresight: stm: Extract device name from AMBA pid based table lookup
>   coresight: tmc: Extract device properties from AMBA pid based table lookup
>   coresight: Add helpers registering/removing both AMBA and platform drivers
>   coresight: replicator: Move ACPI support from AMBA driver to platform driver
>   coresight: funnel: Move ACPI support from AMBA driver to platform driver
>   coresight: catu: Move ACPI support from AMBA driver to platform driver
>   coresight: tpiu: Move ACPI support from AMBA driver to platform driver
>   coresight: tmc: Move ACPI support from AMBA driver to platform driver
>   coresight: stm: Move ACPI support from AMBA driver to platform driver
>   coresight: debug: Move ACPI support from AMBA driver to platform driver
> 
>  drivers/acpi/arm64/amba.c                     |   8 -
>  drivers/hwtracing/coresight/coresight-catu.c  | 140 +++++++++++++---
>  drivers/hwtracing/coresight/coresight-catu.h  |   1 +
>  drivers/hwtracing/coresight/coresight-core.c  |  29 ++++
>  .../hwtracing/coresight/coresight-cpu-debug.c | 141 ++++++++++++++--
>  .../hwtracing/coresight/coresight-funnel.c    |  87 +++++-----
>  drivers/hwtracing/coresight/coresight-priv.h  |  10 ++
>  .../coresight/coresight-replicator.c          |  81 ++++-----
>  drivers/hwtracing/coresight/coresight-stm.c   | 115 +++++++++++--
>  .../hwtracing/coresight/coresight-tmc-core.c  | 156 +++++++++++++++---
>  drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
>  drivers/hwtracing/coresight/coresight-tpiu.c  |  99 +++++++++--
>  include/linux/coresight.h                     |   7 +
>  13 files changed, 713 insertions(+), 163 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
