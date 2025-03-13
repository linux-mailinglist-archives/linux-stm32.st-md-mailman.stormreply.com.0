Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9CEA5FB19
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 17:17:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5801C78F83;
	Thu, 13 Mar 2025 16:17:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CFD0C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 16:17:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18D86150C;
 Thu, 13 Mar 2025 09:17:18 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DA353F673;
 Thu, 13 Mar 2025 09:17:07 -0700 (PDT)
Date: Thu, 13 Mar 2025 16:17:02 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250313161702.GT9682@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-8-james.clark@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250211103945.967495-8-james.clark@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 7/7] coresight: Remove extern from
	function declarations
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

On Tue, Feb 11, 2025 at 10:39:43AM +0000, James Clark wrote:
> 
> Function declarations are extern by default so remove the extra noise
> and inconsistency.

This change is consistent with the coding-style.rst:

  "Do not use the ``extern`` keyword with function declarations as
   this makes lines longer and isn't strictly necessary."

Reviewed-by: Leo Yan <leo.yan@arm.com>

> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-priv.h | 14 ++++-----
>  include/linux/coresight.h                    | 33 +++++++++-----------
>  2 files changed, 21 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index a83113225797..e09071a720f0 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -57,10 +57,8 @@ struct cs_off_attribute {
>         u32 off;
>  };
> 
> -extern ssize_t coresight_simple_show32(struct device *_dev,
> -                                    struct device_attribute *attr, char *buf);
> -extern ssize_t coresight_simple_show_pair(struct device *_dev,
> -                                    struct device_attribute *attr, char *buf);
> +ssize_t coresight_simple_show32(struct device *_dev, struct device_attribute *attr, char *buf);
> +ssize_t coresight_simple_show_pair(struct device *_dev, struct device_attribute *attr, char *buf);
> 
>  #define coresight_simple_reg32(name, offset)                           \
>         (&((struct cs_off_attribute[]) {                                \
> @@ -155,8 +153,8 @@ void coresight_remove_links(struct coresight_device *orig,
>  u32 coresight_get_sink_id(struct coresight_device *csdev);
> 
>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
> -extern int etm_readl_cp14(u32 off, unsigned int *val);
> -extern int etm_writel_cp14(u32 off, u32 val);
> +int etm_readl_cp14(u32 off, unsigned int *val);
> +int etm_writel_cp14(u32 off, u32 val);
>  #else
>  static inline int etm_readl_cp14(u32 off, unsigned int *val) { return 0; }
>  static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
> @@ -167,8 +165,8 @@ struct cti_assoc_op {
>         void (*remove)(struct coresight_device *csdev);
>  };
> 
> -extern void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
> -extern void coresight_remove_cti_ops(void);
> +void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
> +void coresight_remove_cti_ops(void);
> 
>  /*
>   * Macros and inline functions to handle CoreSight UCI data and driver
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 11808aee9d1d..2b43698c0b25 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -642,26 +642,23 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
>         local_set(&csdev->mode, new_mode);
>  }
> 
> -extern struct coresight_device *
> -coresight_register(struct coresight_desc *desc);
> -extern void coresight_unregister(struct coresight_device *csdev);
> -extern int coresight_enable_sysfs(struct coresight_device *csdev);
> -extern void coresight_disable_sysfs(struct coresight_device *csdev);
> -extern int coresight_timeout(struct csdev_access *csa, u32 offset,
> -                            int position, int value);
> -
> -extern int coresight_claim_device(struct coresight_device *csdev);
> -extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
> -
> -extern void coresight_disclaim_device(struct csdev_access *csa);
> -extern void coresight_disclaim_device_unlocked(struct csdev_access *csa);
> +struct coresight_device *coresight_register(struct coresight_desc *desc);
> +void coresight_unregister(struct coresight_device *csdev);
> +int coresight_enable_sysfs(struct coresight_device *csdev);
> +void coresight_disable_sysfs(struct coresight_device *csdev);
> +int coresight_timeout(struct csdev_access *csa, u32 offset, int position, int value);
> +
> +int coresight_claim_device(struct coresight_device *csdev);
> +int coresight_claim_device_unlocked(struct coresight_device *csdev);
> +
> +void coresight_disclaim_device(struct csdev_access *csa);
> +void coresight_disclaim_device_unlocked(struct csdev_access *csa);
>  int coresight_reset_claim_unlocked(struct csdev_access *csa);
>  int coresight_reset_claim(struct csdev_access *csa);
> 
> -extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
> -                                        struct device *dev);
> +char *coresight_alloc_device_name(struct coresight_dev_list *devs, struct device *dev);
> 
> -extern bool coresight_loses_context_with_cpu(struct device *dev);
> +bool coresight_loses_context_with_cpu(struct device *dev);
> 
>  u32 coresight_relaxed_read32(struct coresight_device *csdev, u32 offset);
>  u32 coresight_read32(struct coresight_device *csdev, u32 offset);
> @@ -674,8 +671,8 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
>                                u64 val, u32 offset);
>  void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
> 
> -extern int coresight_get_cpu(struct device *dev);
> -extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
> +int coresight_get_cpu(struct device *dev);
> +int coresight_get_static_trace_id(struct device *dev, u32 *id);
> 
>  struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
>  struct coresight_connection *
> --
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
