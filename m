Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E7E8B08DB
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 14:03:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2A95C7128C;
	Wed, 24 Apr 2024 12:03:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B0CC7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 12:03:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 613FA2F;
 Wed, 24 Apr 2024 05:03:44 -0700 (PDT)
Received: from [10.57.83.211] (unknown [10.57.83.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E2B33F73F;
 Wed, 24 Apr 2024 05:03:14 -0700 (PDT)
Message-ID: <97a016d3-5398-48cc-a0cc-571bf50d2b11@arm.com>
Date: Wed, 24 Apr 2024 13:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, suzuki.poulose@arm.com
References: <20240424023605.90489-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <20240424023605.90489-1-jiapeng.chong@linux.alibaba.com>
Cc: alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Subject: Re: [Linux-stm32] [PATCH] coresight: stm: Remove duplicate
	linux/acpi.h header
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



On 24/04/2024 03:36, Jiapeng Chong wrote:
> ./drivers/hwtracing/coresight/coresight-stm.c: linux/acpi.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8871
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/hwtracing/coresight/coresight-stm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index cbf7f17556f8..9ca04fac53fa 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -30,7 +30,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/stm.h>
>  #include <linux/platform_device.h>
> -#include <linux/acpi.h>
>  
>  #include "coresight-priv.h"
>  #include "coresight-trace-id.h"

Reviewed-by: James Clark <james.clark@arm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
