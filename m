Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF87DA6BA54
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Mar 2025 13:10:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FB41C78034;
	Fri, 21 Mar 2025 12:10:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 024D8CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Mar 2025 12:10:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56E60106F;
 Fri, 21 Mar 2025 05:10:57 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0A813F694;
 Fri, 21 Mar 2025 05:10:48 -0700 (PDT)
Message-ID: <40e30ec8-a7ea-46b9-b687-aa7efa8cf0e1@arm.com>
Date: Fri, 21 Mar 2025 12:10:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, leo.yan@arm.com
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
 <20250320-james-coresight-claim-tags-v3-2-d3145c153820@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250320-james-coresight-claim-tags-v3-2-d3145c153820@linaro.org>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 2/7] coresight: Only check bottom two
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 20/03/2025 14:34, James Clark wrote:
> The use of the whole register and == could break the claim mechanism if
> any of the other bits are used in the future. The referenced doc "PSCI -
> ARM DEN 0022D" also says to only read and clear the bottom two bits.
> 
> Use FIELD_GET() to extract only the relevant part.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 3 ++-
>   drivers/hwtracing/coresight/coresight-priv.h | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 8471aefeac76..26d149a4c579 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -131,7 +131,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
>   
>   static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
>   {
> -	return csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR);
> +	return FIELD_GET(CORESIGHT_CLAIM_MASK,
> +			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
>   }
>   
>   static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 82644aff8d2b..38bb4e8b50ef 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -35,6 +35,7 @@ extern const struct device_type coresight_dev_type[];
>    * Coresight device CLAIM protocol.
>    * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
>    */
> +#define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
>   #define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)

I am checking with the Arm CoreSight architects on this. This is
problematic, if another agent is assigned, say BIT(2) and we wouldn't
forward compatible.

Suzuki


>   
>   #define TIMEOUT_US		100
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
