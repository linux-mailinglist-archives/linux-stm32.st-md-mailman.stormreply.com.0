Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0225285604C
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 11:55:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BEBFC64102;
	Thu, 15 Feb 2024 10:55:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FB9AC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 10:55:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2108D1FB;
 Thu, 15 Feb 2024 02:56:16 -0800 (PST)
Received: from [10.57.49.250] (unknown [10.57.49.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AABD83F7B4;
 Thu, 15 Feb 2024 02:55:33 -0800 (PST)
Message-ID: <56d56f85-6172-4fb1-a002-fe82ffc8a66a@arm.com>
Date: Thu, 15 Feb 2024 10:55:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240123054608.1790189-1-anshuman.khandual@arm.com>
 <20240123054608.1790189-3-anshuman.khandual@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240123054608.1790189-3-anshuman.khandual@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V4 02/11] coresight: stm: Extract device
 name from AMBA pid based table lookup
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
> Instead of using AMBA private data field, extract the device name from AMBA
> pid based table lookup using new coresight_get_uci_data_from_amba() helper.
> 
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-priv.h | 10 ++++++++++
>   drivers/hwtracing/coresight/coresight-stm.c  | 14 +++++++++++++-
>   2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 767076e07970..68cbb036cec8 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -221,6 +221,16 @@ static inline void *coresight_get_uci_data(const struct amba_id *id)
>   	return uci_id->data;
>   }
>   
> +static inline void *coresight_get_uci_data_from_amba(const struct amba_id *table, u32 pid)
> +{
> +	while (table->mask) {
> +		if ((table->id & table->mask) == pid)

Why are we masking table->id ? table->id is a static value that the
driver wants to check for "variants" of a given device. The table->mask
is there to filter out the "irrelevant" bits of the PID that we read
from the device. So this should instead be:

		if ((table->mask & pid) == table->id)

> +			return coresight_get_uci_data(table);
> +		table++;
> +	};
> +	return NULL;
> +}
> +
>   void coresight_release_platform_data(struct coresight_device *csdev,
>   				     struct device *dev,
>   				     struct coresight_platform_data *pdata);
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index a1c27c901ad1..9cdca4f86cab 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -804,6 +804,18 @@ static void stm_init_generic_data(struct stm_drvdata *drvdata,
>   	drvdata->stm.set_options = stm_generic_set_options;
>   }
>   
> +#define STM_AMBA_MASK 0xfffff
> +
> +static const struct amba_id stm_ids[];
> +
> +static char *stm_csdev_name(struct coresight_device *csdev)
> +{
> +	u32 stm_pid = coresight_get_pid(&csdev->access) & STM_AMBA_MASK;

Similar to above:

Why do we apply a "custom" mask to the PID and later check the PID with
that of the table->pid.

The way it is supposed work is :

	(table->mask & dev_pid) == table->pid

the table->mask is there for a reason: i.e., to get the relevant bits 
from the device_pid and compare it against "the" expected value 
(table->pid).


Suzuki

> +	void *uci_data = coresight_get_uci_data_from_amba(stm_ids, stm_pid);
> +
> +	return uci_data ? (char *)uci_data : "STM";
> +}
> +
>   static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	int ret, trace_id;
> @@ -900,7 +912,7 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>   	pm_runtime_put(&adev->dev);
>   
>   	dev_info(&drvdata->csdev->dev, "%s initialized\n",
> -		 (char *)coresight_get_uci_data(id));
> +		 stm_csdev_name(drvdata->csdev));
>   	return 0;
>   
>   cs_unregister:

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
