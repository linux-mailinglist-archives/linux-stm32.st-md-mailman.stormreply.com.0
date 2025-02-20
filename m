Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AED56A3E298
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 18:34:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 519A7C7A824;
	Thu, 20 Feb 2025 17:34:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 278DAC7A822
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 17:34:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4642716F3;
 Thu, 20 Feb 2025 09:35:10 -0800 (PST)
Received: from [10.57.36.38] (unknown [10.57.36.38])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AF4D3F5A1;
 Thu, 20 Feb 2025 09:34:49 -0800 (PST)
Message-ID: <168c214a-38a5-45d4-a776-d7819cbab9f3@arm.com>
Date: Thu, 20 Feb 2025 17:34:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-3-quic_jiegan@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250217093024.1133096-3-quic_jiegan@quicinc.com>
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v12 2/7] Coresight: Add trace_id function
 to retrieving the trace ID
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

On 17/02/2025 09:30, Jie Gan wrote:
> Add 'trace_id' function pointer in ops. It's responsible for
> retrieving the device's trace ID.
> 
> Co-developed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>


minor nit: Given this is an optional callback, we could as well make
this a generic ops and avoid checking if it is a link/source etc. We
anyway check if the op is available before calling it.

i.e.:

struct coresight_ops {
+	int (*trace_id)(struct coresight *csdev,...);

	...
};


Suzuki



> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 27 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-dummy.c | 11 ++++++++
>   .../coresight/coresight-etm3x-core.c          |  1 +
>   .../coresight/coresight-etm4x-core.c          |  1 +
>   drivers/hwtracing/coresight/coresight-stm.c   | 11 ++++++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 11 ++++++++
>   include/linux/coresight.h                     |  8 ++++++
>   7 files changed, 70 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 0a9380350fb5..6cad777757f3 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -23,6 +23,7 @@
>   #include "coresight-etm-perf.h"
>   #include "coresight-priv.h"
>   #include "coresight-syscfg.h"
> +#include "coresight-trace-id.h"
>   
>   /*
>    * Mutex used to lock all sysfs enable and disable actions and loading and
> @@ -1515,6 +1516,32 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
>   }
>   EXPORT_SYMBOL_GPL(coresight_remove_driver);
>   
> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> +			       struct coresight_device *sink)
> +{
> +	int trace_id;
> +	int cpu = source_ops(csdev)->cpu_id(csdev);
> +
> +	switch (mode) {
> +	case CS_MODE_SYSFS:
> +		trace_id = coresight_trace_id_get_cpu_id(cpu);
> +		break;
> +	case CS_MODE_PERF:
> +		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> +		break;
> +	default:
> +		trace_id = -EINVAL;
> +		break;
> +	}
> +
> +	if (!IS_VALID_CS_TRACE_ID(trace_id))
> +		dev_err(&csdev->dev,
> +			"Failed to allocate trace ID on CPU%d\n", cpu);
> +
> +	return trace_id;
> +}
> +EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
> +
>   MODULE_LICENSE("GPL v2");
>   MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
>   MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index 9be53be8964b..c47f0382b943 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
>   	dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
>   }
>   
> +static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +				 __maybe_unused struct coresight_device *sink)
> +{
> +	struct dummy_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	return drvdata->traceid;
> +}
> +
>   static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
>   				void *data)
>   {
> @@ -59,6 +69,7 @@ static int dummy_sink_disable(struct coresight_device *csdev)
>   static const struct coresight_ops_source dummy_source_ops = {
>   	.enable	= dummy_source_enable,
>   	.disable = dummy_source_disable,
> +	.trace_id = dummy_source_trace_id,
>   };
>   
>   static const struct coresight_ops dummy_source_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index c103f4c70f5d..a38e72ef8e79 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -701,6 +701,7 @@ static const struct coresight_ops_source etm_source_ops = {
>   	.cpu_id		= etm_cpu_id,
>   	.enable		= etm_enable,
>   	.disable	= etm_disable,
> +	.trace_id	= coresight_etm_get_trace_id,
>   };
>   
>   static const struct coresight_ops etm_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2c1a60577728..1a993d5380e7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1064,6 +1064,7 @@ static const struct coresight_ops_source etm4_source_ops = {
>   	.cpu_id		= etm4_cpu_id,
>   	.enable		= etm4_enable,
>   	.disable	= etm4_disable,
> +	.trace_id	= coresight_etm_get_trace_id,
>   };
>   
>   static const struct coresight_ops etm4_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index b581a30a1cd9..64fcfa916562 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -281,9 +281,20 @@ static void stm_disable(struct coresight_device *csdev,
>   	}
>   }
>   
> +static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +			__maybe_unused struct coresight_device *sink)
> +{
> +	struct stm_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	return drvdata->traceid;
> +}
> +
>   static const struct coresight_ops_source stm_source_ops = {
>   	.enable		= stm_enable,
>   	.disable	= stm_disable,
> +	.trace_id	= stm_trace_id,
>   };
>   
>   static const struct coresight_ops stm_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 189a4abc2561..d80b6427e5a6 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -241,9 +241,20 @@ static void tpda_disable(struct coresight_device *csdev,
>   	dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
>   }
>   
> +static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +			 __maybe_unused struct coresight_device *sink)
> +{
> +	struct tpda_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	return drvdata->atid;
> +}
> +
>   static const struct coresight_ops_link tpda_link_ops = {
>   	.enable		= tpda_enable,
>   	.disable	= tpda_disable,
> +	.trace_id	= tpda_trace_id,
>   };
>   
>   static const struct coresight_ops tpda_cs_ops = {
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 157c4bd009a1..70407d61262e 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -368,6 +368,7 @@ struct coresight_ops_sink {
>    * Operations available for links.
>    * @enable:	enables flow between iport and oport.
>    * @disable:	disables flow between iport and oport.
> + * @trace_id:	alloc or read the traceid.
>    */
>   struct coresight_ops_link {
>   	int (*enable)(struct coresight_device *csdev,
> @@ -376,6 +377,8 @@ struct coresight_ops_link {
>   	void (*disable)(struct coresight_device *csdev,
>   			struct coresight_connection *in,
>   			struct coresight_connection *out);
> +	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
> +			struct coresight_device *sink);
>   };
>   
>   /**
> @@ -385,6 +388,7 @@ struct coresight_ops_link {
>    *		is associated to.
>    * @enable:	enables tracing for a source.
>    * @disable:	disables tracing for a source.
> + * @trace_id:	alloc or read the traceid.
>    */
>   struct coresight_ops_source {
>   	int (*cpu_id)(struct coresight_device *csdev);
> @@ -392,6 +396,8 @@ struct coresight_ops_source {
>   		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
>   	void (*disable)(struct coresight_device *csdev,
>   			struct perf_event *event);
> +	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
> +			struct coresight_device *sink);
>   };
>   
>   /**
> @@ -697,4 +703,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>   
>   void coresight_remove_driver(struct amba_driver *amba_drv,
>   			     struct platform_driver *pdev_drv);
> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> +			       struct coresight_device *sink);
>   #endif		/* _LINUX_COREISGHT_H */

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
