Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29F80A773
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 16:31:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CB96C6A613;
	Fri,  8 Dec 2023 15:31:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FEF3C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 15:31:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CE9D106F;
 Fri,  8 Dec 2023 07:32:21 -0800 (PST)
Received: from [192.168.1.3] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 527983F6C4;
 Fri,  8 Dec 2023 07:31:34 -0800 (PST)
Message-ID: <22cfb197-b8bd-46c5-f3cb-ea04b95c0792@arm.com>
Date: Fri, 8 Dec 2023 15:31:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com
References: <20231208053939.42901-1-anshuman.khandual@arm.com>
 <20231208053939.42901-9-anshuman.khandual@arm.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <20231208053939.42901-9-anshuman.khandual@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V3 08/10] coresight: tmc: Move ACPI
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



On 08/12/2023 05:39, Anshuman Khandual wrote:
> Add support for the tmc devices in the platform driver, which can then be
> used on ACPI based platforms. This change would now allow runtime power
> management for ACPI based systems. The driver would try to enable the APB
> clock if available.
> 
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: linux-acpi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: coresight@lists.linaro.org
> Tested-by: Sudeep Holla <sudeep.holla@arm.com> # Boot and driver probe only
> Acked-by: Sudeep Holla <sudeep.holla@arm.com> # For ACPI related changes
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V3:
> 
> - Added commnets for 'drvdata->pclk'
> - Used coresight_init_driver()/coresight_remove_driver() helpers instead
> - Dropped pm_runtime_put() from __tmc_probe()
> - Added pm_runtime_put() on success path in tmc_probe()
> - Added pm_runtime_put() on success/error paths in tmc_platform_probe()
> - Check for drvdata instead of drvdata->pclk in suspend and resume paths
> 
>  drivers/acpi/arm64/amba.c                     |   2 -
>  .../hwtracing/coresight/coresight-tmc-core.c  | 137 ++++++++++++++++--
>  drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
>  3 files changed, 124 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
> index 6d24a8f7914b..d3c1defa7bc8 100644
> --- a/drivers/acpi/arm64/amba.c
> +++ b/drivers/acpi/arm64/amba.c
> @@ -22,10 +22,8 @@
>  static const struct acpi_device_id amba_id_list[] = {
>  	{"ARMH0061", 0}, /* PL061 GPIO Device */
>  	{"ARMH0330", 0}, /* ARM DMA Controller DMA-330 */
> -	{"ARMHC501", 0}, /* ARM CoreSight ETR */
>  	{"ARMHC502", 0}, /* ARM CoreSight STM */
>  	{"ARMHC503", 0}, /* ARM CoreSight Debug */
> -	{"ARMHC97C", 0}, /* ARM CoreSight SoC-400 TMC, SoC-600 ETF/ETB */
>  	{"", 0},
>  };
>  
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index ad61d02f5f75..8482830d73ef 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -23,6 +23,8 @@
>  #include <linux/of.h>
>  #include <linux/coresight.h>
>  #include <linux/amba/bus.h>
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
>  
>  #include "coresight-priv.h"
>  #include "coresight-tmc.h"
> @@ -437,24 +439,17 @@ static u32 tmc_etr_get_max_burst_size(struct device *dev)
>  	return burst_size;
>  }
>  
> -static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
> +static int __tmc_probe(struct device *dev, struct resource *res, void *dev_caps)

I don't think the dev_caps argument is used anymore since the v3 changes.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
