Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60173A5F2E9
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 12:46:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C180C78F85;
	Thu, 13 Mar 2025 11:46:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54B59C78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 11:46:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3DE01C00;
 Thu, 13 Mar 2025 04:47:04 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 041C33F673;
 Thu, 13 Mar 2025 04:46:53 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:46:49 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Message-ID: <20250313114649.GP9682@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-4-james.clark@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250211103945.967495-4-james.clark@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 3/7] coresight: Only check bottom two
	claim bits
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

On Tue, Feb 11, 2025 at 10:39:39AM +0000, James Clark wrote:
> 
> The use of the whole register and == could break the claim mechanism if
> any of the other bits are used in the future. The referenced doc "PSCI -
> ARM DEN 0022D" also says to only read and clear the bottom two bits.
> 
> Use FIELD_GET() to extract only the relevant part.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

I checked the latest PSCI spec DEN0022F.b, which has no change for
for only using lowest two bits in claim register.

Reviewed-by: Leo Yan <leo.yan@arm.com>


> ---
>  drivers/hwtracing/coresight/coresight-core.c | 3 ++-
>  drivers/hwtracing/coresight/coresight-priv.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index a669872b4118..7b53165c93af 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -129,7 +129,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
> 
>  static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
>  {
> -       return csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR);
> +       return FIELD_GET(CORESIGHT_CLAIM_MASK,
> +                        csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR));
>  }
> 
>  static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 05f891ca6b5c..cc7ff1e36ef4 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -35,6 +35,7 @@ extern const struct device_type coresight_dev_type[];
>   * Coresight device CLAIM protocol.
>   * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
>   */
> +#define CORESIGHT_CLAIM_MASK           GENMASK(1, 0)
>  #define CORESIGHT_CLAIM_SELF_HOSTED    BIT(1)
> 
>  #define TIMEOUT_US             100
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
