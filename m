Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3849810B56
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Dec 2023 08:17:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC32CC6C85F;
	Wed, 13 Dec 2023 07:17:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57563C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 17:44:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 938D9FEC;
 Tue, 12 Dec 2023 09:45:03 -0800 (PST)
Received: from [10.57.41.249] (unknown [10.57.41.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0313F762;
 Tue, 12 Dec 2023 09:44:15 -0800 (PST)
Message-ID: <a1ab2481-0ec0-4e29-b6af-bcce4cf0b57d@arm.com>
Date: Tue, 12 Dec 2023 17:44:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org
References: <20231212155407.1429121-1-james.clark@arm.com>
 <20231212155407.1429121-2-james.clark@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20231212155407.1429121-2-james.clark@arm.com>
X-Mailman-Approved-At: Wed, 13 Dec 2023 07:17:48 +0000
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/8] coresight: Fix issue where a source
 device's helpers aren't disabled
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

Hi James

On 12/12/2023 15:53, James Clark wrote:
> The linked commit reverts the change that accidentally used some sysfs
> enable/disable functions from Perf which broke the refcounting, but it
> also removes the fact that the sysfs disable function disabled the
> helpers.


> 
> Add a new wrapper function that does both which is used by both Perf and
> sysfs, and label the sysfs disable function appropriately. The naming of
> all of the functions will be tidied up later to avoid this happening
> again.
> 
> Fixes: 287e82cf69aa ("coresight: Fix crash when Perf and sysfs modes are used concurrently")

But we still don't "enable" the helpers from perf mode with this patch.
i.e., we use source_ops()->enable directly. So, I guess this patch
doesn't fix a bug as such. But that said, it would be good to
enable/disable helpers for sources, in perf mode.

Suzuki


> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 30 ++++++++++++++-----
>   .../hwtracing/coresight/coresight-etm-perf.c  |  2 +-
>   drivers/hwtracing/coresight/coresight-priv.h  |  2 +-
>   3 files changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index d7f0e231feb9..965bb6d4e1bf 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -441,8 +441,26 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
>   	}
>   }
>   
> +/*
> + * Helper function to call source_ops(csdev)->disable and also disable the
> + * helpers.
> + *
> + * There is an imbalance between coresight_enable_path() and
> + * coresight_disable_path(). Enabling also enables the source's helpers as part
> + * of the path, but disabling always skips the first item in the path (which is
> + * the source), so sources and their helpers don't get disabled as part of that
> + * function and we need the extra step here.
> + */
> +void coresight_disable_source(struct coresight_device *csdev, void *data)
> +{
> +	if (source_ops(csdev)->disable)
> +		source_ops(csdev)->disable(csdev, data);
> +	coresight_disable_helpers(csdev);
> +}
> +EXPORT_SYMBOL_GPL(coresight_disable_source);
> +
>   /**
> - *  coresight_disable_source - Drop the reference count by 1 and disable
> + *  coresight_disable_source_sysfs - Drop the reference count by 1 and disable
>    *  the device if there are no users left.
>    *
>    *  @csdev: The coresight device to disable
> @@ -451,17 +469,15 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
>    *
>    *  Returns true if the device has been disabled.
>    */
> -bool coresight_disable_source(struct coresight_device *csdev, void *data)
> +static bool coresight_disable_source_sysfs(struct coresight_device *csdev,
> +					   void *data)
>   {
>   	if (atomic_dec_return(&csdev->refcnt) == 0) {
> -		if (source_ops(csdev)->disable)
> -			source_ops(csdev)->disable(csdev, data);
> -		coresight_disable_helpers(csdev);
> +		coresight_disable_source(csdev, data);
>   		csdev->enable = false;
>   	}
>   	return !csdev->enable;
>   }
> -EXPORT_SYMBOL_GPL(coresight_disable_source);
>   
>   /*
>    * coresight_disable_path_from : Disable components in the given path beyond
> @@ -1204,7 +1220,7 @@ void coresight_disable(struct coresight_device *csdev)
>   	if (ret)
>   		goto out;
>   
> -	if (!csdev->enable || !coresight_disable_source(csdev, NULL))
> +	if (!csdev->enable || !coresight_disable_source_sysfs(csdev, NULL))
>   		goto out;
>   
>   	switch (csdev->subtype.source_subtype) {
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index a52cfcce25d6..c0c60e6a1703 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -589,7 +589,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   		return;
>   
>   	/* stop tracer */
> -	source_ops(csdev)->disable(csdev, event);
> +	coresight_disable_source(csdev, event);

Does this result i
>   
>   	/* tell the core */
>   	event->hw.state = PERF_HES_STOPPED;
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 767076e07970..30c051055e54 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -233,6 +233,6 @@ void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
>   struct coresight_device *coresight_get_percpu_sink(int cpu);
>   int coresight_enable_source(struct coresight_device *csdev, enum cs_mode mode,
>   			    void *data);
> -bool coresight_disable_source(struct coresight_device *csdev, void *data);
> +void coresight_disable_source(struct coresight_device *csdev, void *data);
>   
>   #endif

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
