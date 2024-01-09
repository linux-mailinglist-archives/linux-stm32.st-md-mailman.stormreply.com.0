Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D2828418
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jan 2024 11:38:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E98CC6DD73;
	Tue,  9 Jan 2024 10:38:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89F03C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 10:38:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E4B7C15;
 Tue,  9 Jan 2024 02:39:25 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E39A3F73F;
 Tue,  9 Jan 2024 02:38:38 -0800 (PST)
Message-ID: <01c15dbe-57d3-4aa1-9d68-81a01ec2a3a7@arm.com>
Date: Tue, 9 Jan 2024 10:38:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org
References: <20231212155407.1429121-1-james.clark@arm.com>
 <20231212155407.1429121-9-james.clark@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20231212155407.1429121-9-james.clark@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 8/8] coresight: Remove unused stubs
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

On 12/12/2023 15:54, James Clark wrote:
> These are a bit annoying to keep up to date when the function signatures
> change. But if CONFIG_CORESIGHT isn't enabled, then they're not used
> anyway so just delete them.
> 

Have you tried building an arm32 kernel with this change in ? Looks like
arch/arm/kernel/hw_breakpoint.c includes linux/coresight.h and a build 
with CONFIG_CORSIGHT=n might break the build ? So is 
drivers/accel/habanalabs/common/habanalabs.h. Now, I am not sure if they 
really need it (even if they do, we may be able to remove the dependency 
on the header file.

Suzuki

> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>   include/linux/coresight.h | 79 ---------------------------------------
>   1 file changed, 79 deletions(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 4400d554a16b..c5be46d7f85c 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -391,8 +391,6 @@ struct coresight_ops {
>   	const struct coresight_ops_helper *helper_ops;
>   };
>   
> -#if IS_ENABLED(CONFIG_CORESIGHT)
> -
>   static inline u32 csdev_access_relaxed_read32(struct csdev_access *csa,
>   					      u32 offset)
>   {
> @@ -611,83 +609,6 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
>   			       u64 val, u32 offset);
>   void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
>   
> -#else
> -static inline struct coresight_device *
> -coresight_register(struct coresight_desc *desc) { return NULL; }
> -static inline void coresight_unregister(struct coresight_device *csdev) {}
> -static inline int
> -coresight_enable_sysfs(struct coresight_device *csdev) { return -ENOSYS; }
> -static inline void coresight_disable_sysfs(struct coresight_device *csdev) {}
> -
> -static inline int coresight_timeout(struct csdev_access *csa, u32 offset,
> -				    int position, int value)
> -{
> -	return 1;
> -}
> -
> -static inline int coresight_claim_device_unlocked(struct coresight_device *csdev)
> -{
> -	return -EINVAL;
> -}
> -
> -static inline int coresight_claim_device(struct coresight_device *csdev)
> -{
> -	return -EINVAL;
> -}
> -
> -static inline void coresight_disclaim_device(struct coresight_device *csdev) {}
> -static inline void coresight_disclaim_device_unlocked(struct coresight_device *csdev) {}
> -
> -static inline bool coresight_loses_context_with_cpu(struct device *dev)
> -{
> -	return false;
> -}
> -
> -static inline u32 coresight_relaxed_read32(struct coresight_device *csdev, u32 offset)
> -{
> -	WARN_ON_ONCE(1);
> -	return 0;
> -}
> -
> -static inline u32 coresight_read32(struct coresight_device *csdev, u32 offset)
> -{
> -	WARN_ON_ONCE(1);
> -	return 0;
> -}
> -
> -static inline void coresight_write32(struct coresight_device *csdev, u32 val, u32 offset)
> -{
> -}
> -
> -static inline void coresight_relaxed_write32(struct coresight_device *csdev,
> -					     u32 val, u32 offset)
> -{
> -}
> -
> -static inline u64 coresight_relaxed_read64(struct coresight_device *csdev,
> -					   u32 offset)
> -{
> -	WARN_ON_ONCE(1);
> -	return 0;
> -}
> -
> -static inline u64 coresight_read64(struct coresight_device *csdev, u32 offset)
> -{
> -	WARN_ON_ONCE(1);
> -	return 0;
> -}
> -
> -static inline void coresight_relaxed_write64(struct coresight_device *csdev,
> -					     u64 val, u32 offset)
> -{
> -}
> -
> -static inline void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset)
> -{
> -}
> -
> -#endif		/* IS_ENABLED(CONFIG_CORESIGHT) */
> -
>   extern int coresight_get_cpu(struct device *dev);
>   
>   struct coresight_platform_data *coresight_get_platform_data(struct device *dev);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
