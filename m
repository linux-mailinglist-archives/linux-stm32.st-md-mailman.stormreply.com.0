Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD27A3F218
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2025 11:30:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05BC4C7A838;
	Fri, 21 Feb 2025 10:30:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE566C7A836
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 10:30:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB97B169C;
 Fri, 21 Feb 2025 02:31:07 -0800 (PST)
Received: from [10.57.36.38] (unknown [10.57.36.38])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E2053F5A1;
 Fri, 21 Feb 2025 02:30:46 -0800 (PST)
Message-ID: <a27b7fdb-fc86-4f84-a536-0a70477221cb@arm.com>
Date: Fri, 21 Feb 2025 10:30:46 +0000
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
 <20250217093024.1133096-5-quic_jiegan@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250217093024.1133096-5-quic_jiegan@quicinc.com>
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v12 4/7] Coresight: Introduce a new struct
	coresight_path
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
> Add 'struct coresight_path' to store the data that is needed by
> coresight_enable_path/coresight_disable_path. The structure will be
> transmitted to any required devices to enable related funcationalities.
> 
> The trace_id will be allocated after the path is built. Consequently,
> The ETM3x and ETM4x devices will directly read the trace_id from path
> which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id
> being deleted.
> 
> Co-developed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

Personally, I find this patch doing 3 things in one shot, which is 
complicated TBH for the patch review.

1. Introduce coresight_path
2. Move trace-id to coresight_path and allocate it after building the path.
3. Change enable/disable to accept the "coresight_path"

Please do not repeat this in the future, split them accordingly. At the
least we could split this patch into 1 and 2+3


>   drivers/hwtracing/coresight/coresight-core.c  | 106 +++++++++++++-----
>   drivers/hwtracing/coresight/coresight-dummy.c |   5 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  |  24 ++--
>   .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
>   drivers/hwtracing/coresight/coresight-etm.h   |   1 -
>   .../coresight/coresight-etm3x-core.c          |  54 ++-------
>   .../coresight/coresight-etm4x-core.c          |  54 ++-------
>   drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
>   drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>   drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c |  17 ++-
>   drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
>   include/linux/coresight.h                     |  12 +-
>   13 files changed, 140 insertions(+), 154 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 6cad777757f3..182bfa2420cc 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -76,14 +76,14 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
>   
> -static struct coresight_device *coresight_get_source(struct list_head *path)
> +static struct coresight_device *coresight_get_source(struct coresight_path *path)
>   {
>   	struct coresight_device *csdev;
>   
>   	if (!path)
>   		return NULL;
>   
> -	csdev = list_first_entry(path, struct coresight_node, link)->csdev;
> +	csdev = list_first_entry(path->path_list, struct coresight_node, link)->csdev;
>   	if (!coresight_is_device_source(csdev))
>   		return NULL;
>   
> @@ -332,12 +332,12 @@ static int coresight_enable_helper(struct coresight_device *csdev,
>   	return helper_ops(csdev)->enable(csdev, mode, data);
>   }
>   
> -static void coresight_disable_helper(struct coresight_device *csdev)
> +static void coresight_disable_helper(struct coresight_device *csdev, void *data)
>   {
> -	helper_ops(csdev)->disable(csdev, NULL);
> +	helper_ops(csdev)->disable(csdev, data);
>   }
>   
> -static void coresight_disable_helpers(struct coresight_device *csdev)
> +static void coresight_disable_helpers(struct coresight_device *csdev, void *data)
>   {
>   	int i;
>   	struct coresight_device *helper;
> @@ -345,7 +345,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
>   	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>   		helper = csdev->pdata->out_conns[i]->dest_dev;
>   		if (helper && coresight_is_helper(helper))
> -			coresight_disable_helper(helper);
> +			coresight_disable_helper(helper, data);
>   	}
>   }
>   
> @@ -362,7 +362,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
>   void coresight_disable_source(struct coresight_device *csdev, void *data)
>   {
>   	source_ops(csdev)->disable(csdev, data);
> -	coresight_disable_helpers(csdev);
> +	coresight_disable_helpers(csdev, NULL);
>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_source);
>   
> @@ -371,16 +371,16 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
>    * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
>    * disabled.
>    */
> -static void coresight_disable_path_from(struct list_head *path,
> +static void coresight_disable_path_from(struct coresight_path *path,
>   					struct coresight_node *nd)
>   {
>   	u32 type;
>   	struct coresight_device *csdev, *parent, *child;
>   
>   	if (!nd)
> -		nd = list_first_entry(path, struct coresight_node, link);
> +		nd = list_first_entry(path->path_list, struct coresight_node, link);
>   
> -	list_for_each_entry_continue(nd, path, link) {
> +	list_for_each_entry_continue(nd, path->path_list, link) {
>   		csdev = nd->csdev;
>   		type = csdev->type;
>   
> @@ -418,11 +418,11 @@ static void coresight_disable_path_from(struct list_head *path,
>   		}
>   
>   		/* Disable all helpers adjacent along the path last */
> -		coresight_disable_helpers(csdev);
> +		coresight_disable_helpers(csdev, path);
>   	}
>   }
>   
> -void coresight_disable_path(struct list_head *path)
> +void coresight_disable_path(struct coresight_path *path)
>   {
>   	coresight_disable_path_from(path, NULL);
>   }
> @@ -447,7 +447,7 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
>   	return 0;
>   }
>   
> -int coresight_enable_path(struct list_head *path, enum cs_mode mode,
> +int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   			  void *sink_data)
>   {
>   	int ret = 0;
> @@ -457,12 +457,12 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
>   	struct coresight_device *source;
>   
>   	source = coresight_get_source(path);
> -	list_for_each_entry_reverse(nd, path, link) {
> +	list_for_each_entry_reverse(nd, path->path_list, link) {
>   		csdev = nd->csdev;
>   		type = csdev->type;
>   
>   		/* Enable all helpers adjacent to the path first */
> -		ret = coresight_enable_helpers(csdev, mode, sink_data);
> +		ret = coresight_enable_helpers(csdev, mode, path);
>   		if (ret)
>   			goto err;
>   		/*
> @@ -510,20 +510,21 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
>   	goto out;
>   }
>   
> -struct coresight_device *coresight_get_sink(struct list_head *path)
> +struct coresight_device *coresight_get_sink(struct coresight_path *path)
>   {
>   	struct coresight_device *csdev;
>   
>   	if (!path)
>   		return NULL;
>   
> -	csdev = list_last_entry(path, struct coresight_node, link)->csdev;
> +	csdev = list_last_entry(path->path_list, struct coresight_node, link)->csdev;
>   	if (csdev->type != CORESIGHT_DEV_TYPE_SINK &&
>   	    csdev->type != CORESIGHT_DEV_TYPE_LINKSINK)
>   		return NULL;
>   
>   	return csdev;
>   }
> +EXPORT_SYMBOL_GPL(coresight_get_sink);
>   
>   u32 coresight_get_sink_id(struct coresight_device *csdev)
>   {
> @@ -654,6 +655,51 @@ static void coresight_drop_device(struct coresight_device *csdev)
>   	}
>   }
>   
> +/*
> + * Links or sources will read their existing or alloc a trace ID, if their ID
> + * callback is set.
> + */

Please could we document the return value conditions here ?

> +static int coresight_get_trace_id(struct coresight_device *csdev,
> +				  enum cs_mode mode,
> +				  struct coresight_device *sink)
> +{
> +	if (csdev->type == CORESIGHT_DEV_TYPE_LINK && link_ops(csdev)->trace_id)
> +		return link_ops(csdev)->trace_id(csdev, mode, sink);
> +
> +	if (csdev->type == CORESIGHT_DEV_TYPE_SOURCE && source_ops(csdev)->trace_id)
> +		return source_ops(csdev)->trace_id(csdev, mode, sink);
> +
> +	return 0;
> +}
> +
> +/*
> + * Call this after creating the path and before enabling it. This leaves
> + * the trace ID set on the path and returns the ID, or an error if it
> + * couldn't be assigned.
> + */
> +int coresight_path_assign_trace_id(struct coresight_path *path,
> +				   enum cs_mode mode)
> +{
> +	struct coresight_device *sink = coresight_get_sink(path);
> +	struct coresight_node *nd;
> +	int ret;

Might be better to rename this as "trace_id" ? As we return the trace id 
not a status of whether it was allocated or not. Or drop it completely
and return path->trace_id, below when we succeed. Or it could even
be a void, as the caller can check IS_VALID(path->trace_id)


> +
> +	list_for_each_entry(nd, path->path_list, link) {
> +		/* Assign a trace ID to the path for the first device that wants to do it */
> +		ret = coresight_get_trace_id(nd->csdev, mode, sink);
> +
> +		/*
> +		 * 0 in this context is that it didn't want to assign so keep searching.
> +		 * Non 0 is either success or fail, return it either way.
> +		 */
> +		if (ret != 0) {
> +			path->trace_id = ret;
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +
>   /**
>    * _coresight_build_path - recursively build a path from a @csdev to a sink.
>    * @csdev:	The device to start from.
> @@ -669,7 +715,7 @@ static void coresight_drop_device(struct coresight_device *csdev)
>   static int _coresight_build_path(struct coresight_device *csdev,
>   				 struct coresight_device *source,
>   				 struct coresight_device *sink,
> -				 struct list_head *path)
> +				 struct coresight_path *path)
>   {
>   	int i, ret;
>   	bool found = false;
> @@ -722,28 +768,37 @@ static int _coresight_build_path(struct coresight_device *csdev,
>   		return -ENOMEM;
>   
>   	node->csdev = csdev;
> -	list_add(&node->link, path);
> +	list_add(&node->link, path->path_list);
>   
>   	return 0;
>   }
>   
> -struct list_head *coresight_build_path(struct coresight_device *source,
> +struct coresight_path *coresight_build_path(struct coresight_device *source,
>   				       struct coresight_device *sink)
>   {
> -	struct list_head *path;
> +	struct coresight_path *path;
> +	struct list_head *path_list;
>   	int rc;
>   
>   	if (!sink)
>   		return ERR_PTR(-EINVAL);
>   
> -	path = kzalloc(sizeof(struct list_head), GFP_KERNEL);
> +	path = kzalloc(sizeof(struct coresight_path), GFP_KERNEL);
>   	if (!path)
>   		return ERR_PTR(-ENOMEM);
>   
> -	INIT_LIST_HEAD(path);
> +	path_list = kzalloc(sizeof(struct list_head), GFP_KERNEL);
> +	if (!path_list) {
> +		kfree(path);
> +		return ERR_PTR(-ENOMEM);
> +	}



> +
> +	INIT_LIST_HEAD(path_list);
> +	path->path_list = path_list;
>   
>   	rc = _coresight_build_path(source, source, sink, path);
>   	if (rc) {
> +		kfree(path_list);
>   		kfree(path);
>   		return ERR_PTR(rc);
>   	}
> @@ -758,12 +813,12 @@ struct list_head *coresight_build_path(struct coresight_device *source,
>    * Go through all the elements of a path and 1) removed it from the list and
>    * 2) free the memory allocated for each node.
>    */
> -void coresight_release_path(struct list_head *path)
> +void coresight_release_path(struct coresight_path *path)
>   {
>   	struct coresight_device *csdev;
>   	struct coresight_node *nd, *next;
>   
> -	list_for_each_entry_safe(nd, next, path, link) {
> +	list_for_each_entry_safe(nd, next, path->path_list, link) {
>   		csdev = nd->csdev;
>   
>   		coresight_drop_device(csdev);
> @@ -771,6 +826,7 @@ void coresight_release_path(struct list_head *path)
>   		kfree(nd);
>   	}
>   
> +	kfree(path->path_list);
>   	kfree(path);
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index c47f0382b943..d9a811d44885 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -22,9 +22,8 @@ struct dummy_drvdata {
>   DEFINE_CORESIGHT_DEVLIST(source_devs, "dummy_source");
>   DEFINE_CORESIGHT_DEVLIST(sink_devs, "dummy_sink");
>   
> -static int dummy_source_enable(struct coresight_device *csdev,
> -			       struct perf_event *event, enum cs_mode mode,
> -			       __maybe_unused struct coresight_trace_id_map *id_map)
> +static int dummy_source_enable(struct coresight_device *csdev, struct perf_event *event,
> +			       enum cs_mode mode, struct coresight_path *path)
>   {
>   	if (!coresight_take_mode(csdev, mode))
>   		return -EBUSY;
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index ad6a8f4b70b6..ebdcf56b7463 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -136,13 +136,13 @@ static const struct attribute_group *etm_pmu_attr_groups[] = {
>   	NULL,
>   };
>   
> -static inline struct list_head **
> +static inline struct coresight_path **
>   etm_event_cpu_path_ptr(struct etm_event_data *data, int cpu)
>   {
>   	return per_cpu_ptr(data->path, cpu);
>   }
>   
> -static inline struct list_head *
> +static inline struct coresight_path *
>   etm_event_cpu_path(struct etm_event_data *data, int cpu)
>   {
>   	return *etm_event_cpu_path_ptr(data, cpu);
> @@ -226,7 +226,7 @@ static void free_event_data(struct work_struct *work)
>   		cscfg_deactivate_config(event_data->cfg_hash);
>   
>   	for_each_cpu(cpu, mask) {
> -		struct list_head **ppath;
> +		struct coresight_path **ppath;
>   
>   		ppath = etm_event_cpu_path_ptr(event_data, cpu);
>   		if (!(IS_ERR_OR_NULL(*ppath))) {
> @@ -276,7 +276,7 @@ static void *alloc_event_data(int cpu)
>   	 * unused memory when dealing with single CPU trace scenarios is small
>   	 * compared to the cost of searching through an optimized array.
>   	 */
> -	event_data->path = alloc_percpu(struct list_head *);
> +	event_data->path = alloc_percpu(struct coresight_path *);
>   
>   	if (!event_data->path) {
>   		kfree(event_data);
> @@ -352,7 +352,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	 * CPUs, we can handle it and fail the session.
>   	 */
>   	for_each_cpu(cpu, mask) {
> -		struct list_head *path;
> +		struct coresight_path *path;
>   		struct coresight_device *csdev;
>   
>   		csdev = per_cpu(csdev_src, cpu);
> @@ -407,7 +407,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   		}
>   
>   		/* ensure we can allocate a trace ID for this CPU */
> -		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> +		trace_id = coresight_path_assign_trace_id(path, CS_MODE_PERF);
>   		if (!IS_VALID_CS_TRACE_ID(trace_id)) {
>   			cpumask_clear_cpu(cpu, mask);
>   			coresight_release_path(path);
> @@ -458,9 +458,8 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
> -	struct list_head *path;
> +	struct coresight_path *path;
>   	u64 hw_id;
> -	u8 trace_id;
>   
>   	if (!csdev)
>   		goto fail;
> @@ -503,8 +502,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   		goto fail_end_stop;
>   
>   	/* Finally enable the tracer */
> -	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF,
> -				      &sink->perf_sink_id_map))
> +	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, path))
>   		goto fail_disable_path;
>   
>   	/*
> @@ -514,13 +512,11 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
>   		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
>   
> -		trace_id = coresight_trace_id_read_cpu_id_map(cpu, &sink->perf_sink_id_map);
> -
>   		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
>   				CS_AUX_HW_ID_MAJOR_VERSION);
>   		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
>   				CS_AUX_HW_ID_MINOR_VERSION);
> -		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, trace_id);
> +		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
>   		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
>   
>   		perf_report_aux_output_id(event, hw_id);
> @@ -558,7 +554,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct etm_event_data *event_data;
> -	struct list_head *path;
> +	struct coresight_path *path;
>   
>   	/*
>   	 * If we still have access to the event_data via handle,
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 744531158d6b..5febbcdb8696 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -59,7 +59,7 @@ struct etm_event_data {
>   	cpumask_t aux_hwid_done;
>   	void *snk_config;
>   	u32 cfg_hash;
> -	struct list_head * __percpu *path;
> +	struct coresight_path * __percpu *path;
>   };
>   
>   int etm_perf_symlink(struct coresight_device *csdev, bool link);
> diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
> index e02c3ea972c9..171f1384f7c0 100644
> --- a/drivers/hwtracing/coresight/coresight-etm.h
> +++ b/drivers/hwtracing/coresight/coresight-etm.h
> @@ -284,6 +284,5 @@ extern const struct attribute_group *coresight_etm_groups[];
>   void etm_set_default(struct etm_config *config);
>   void etm_config_trace_mode(struct etm_config *config);
>   struct etm_config *get_etm_config(struct etm_drvdata *drvdata);
> -int etm_read_alloc_trace_id(struct etm_drvdata *drvdata);
>   void etm_release_trace_id(struct etm_drvdata *drvdata);
>   #endif
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index a38e72ef8e79..cb8a30a3b48e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -455,26 +455,6 @@ static int etm_cpu_id(struct coresight_device *csdev)
>   	return drvdata->cpu;
>   }
>   
> -int etm_read_alloc_trace_id(struct etm_drvdata *drvdata)
> -{
> -	int trace_id;
> -
> -	/*
> -	 * This will allocate a trace ID to the cpu,
> -	 * or return the one currently allocated.
> -	 *
> -	 * trace id function has its own lock
> -	 */
> -	trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
> -	if (IS_VALID_CS_TRACE_ID(trace_id))
> -		drvdata->traceid = (u8)trace_id;
> -	else
> -		dev_err(&drvdata->csdev->dev,
> -			"Failed to allocate trace ID for %s on CPU%d\n",
> -			dev_name(&drvdata->csdev->dev), drvdata->cpu);
> -	return trace_id;
> -}
> -
>   void etm_release_trace_id(struct etm_drvdata *drvdata)
>   {
>   	coresight_trace_id_put_cpu_id(drvdata->cpu);
> @@ -482,38 +462,22 @@ void etm_release_trace_id(struct etm_drvdata *drvdata)
>   
>   static int etm_enable_perf(struct coresight_device *csdev,
>   			   struct perf_event *event,
> -			   struct coresight_trace_id_map *id_map)
> +			   struct coresight_path *path)
>   {
>   	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	int trace_id;
>   
>   	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
>   		return -EINVAL;
>   
>   	/* Configure the tracer based on the session's specifics */
>   	etm_parse_event_config(drvdata, event);
> -
> -	/*
> -	 * perf allocates cpu ids as part of _setup_aux() - device needs to use
> -	 * the allocated ID. This reads the current version without allocation.
> -	 *
> -	 * This does not use the trace id lock to prevent lock_dep issues
> -	 * with perf locks - we know the ID cannot change until perf shuts down
> -	 * the session
> -	 */
> -	trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
> -	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
> -		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
> -			dev_name(&drvdata->csdev->dev), drvdata->cpu);
> -		return -EINVAL;
> -	}
> -	drvdata->traceid = (u8)trace_id;
> +	drvdata->traceid = path->trace_id;
>   
>   	/* And enable it */
>   	return etm_enable_hw(drvdata);
>   }
>   
> -static int etm_enable_sysfs(struct coresight_device *csdev)
> +static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
>   {
>   	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct etm_enable_arg arg = { };
> @@ -521,10 +485,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
>   
>   	spin_lock(&drvdata->spinlock);
>   
> -	/* sysfs needs to allocate and set a trace ID */
> -	ret = etm_read_alloc_trace_id(drvdata);
> -	if (ret < 0)
> -		goto unlock_enable_sysfs;
> +	drvdata->traceid = path->trace_id;
>   
>   	/*
>   	 * Configure the ETM only if the CPU is online.  If it isn't online
> @@ -545,7 +506,6 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
>   	if (ret)
>   		etm_release_trace_id(drvdata);
>   
> -unlock_enable_sysfs:
>   	spin_unlock(&drvdata->spinlock);
>   
>   	if (!ret)
> @@ -554,7 +514,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
>   }
>   
>   static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
> -		      enum cs_mode mode, struct coresight_trace_id_map *id_map)
> +		      enum cs_mode mode, struct coresight_path *path)
>   {
>   	int ret;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> @@ -566,10 +526,10 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
>   
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
> -		ret = etm_enable_sysfs(csdev);
> +		ret = etm_enable_sysfs(csdev, path);
>   		break;
>   	case CS_MODE_PERF:
> -		ret = etm_enable_perf(csdev, event, id_map);
> +		ret = etm_enable_perf(csdev, event, path);
>   		break;
>   	default:
>   		ret = -EINVAL;
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 1a993d5380e7..3d0fc25085ea 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -233,25 +233,6 @@ static int etm4_cpu_id(struct coresight_device *csdev)
>   	return drvdata->cpu;
>   }
>   
> -int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata)
> -{
> -	int trace_id;
> -
> -	/*
> -	 * This will allocate a trace ID to the cpu,
> -	 * or return the one currently allocated.
> -	 * The trace id function has its own lock
> -	 */
> -	trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
> -	if (IS_VALID_CS_TRACE_ID(trace_id))
> -		drvdata->trcid = (u8)trace_id;
> -	else
> -		dev_err(&drvdata->csdev->dev,
> -			"Failed to allocate trace ID for %s on CPU%d\n",
> -			dev_name(&drvdata->csdev->dev), drvdata->cpu);
> -	return trace_id;
> -}
> -
>   void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
>   {
>   	coresight_trace_id_put_cpu_id(drvdata->cpu);
> @@ -788,9 +769,9 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   
>   static int etm4_enable_perf(struct coresight_device *csdev,
>   			    struct perf_event *event,
> -			    struct coresight_trace_id_map *id_map)
> +			    struct coresight_path *path)
>   {
> -	int ret = 0, trace_id;
> +	int ret = 0;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
>   	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
> @@ -803,22 +784,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>   	if (ret)
>   		goto out;
>   
> -	/*
> -	 * perf allocates cpu ids as part of _setup_aux() - device needs to use
> -	 * the allocated ID. This reads the current version without allocation.
> -	 *
> -	 * This does not use the trace id lock to prevent lock_dep issues
> -	 * with perf locks - we know the ID cannot change until perf shuts down
> -	 * the session
> -	 */
> -	trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
> -	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
> -		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
> -			dev_name(&drvdata->csdev->dev), drvdata->cpu);
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -	drvdata->trcid = (u8)trace_id;
> +	drvdata->trcid = path->trace_id;
>   
>   	/* And enable it */
>   	ret = etm4_enable_hw(drvdata);
> @@ -827,7 +793,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>   	return ret;
>   }
>   
> -static int etm4_enable_sysfs(struct coresight_device *csdev)
> +static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
>   {
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct etm4_enable_arg arg = { };
> @@ -844,10 +810,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
>   
>   	spin_lock(&drvdata->spinlock);
>   
> -	/* sysfs needs to read and allocate a trace ID */
> -	ret = etm4_read_alloc_trace_id(drvdata);
> -	if (ret < 0)
> -		goto unlock_sysfs_enable;
> +	drvdata->trcid = path->trace_id;
>   
>   	/*
>   	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
> @@ -864,7 +827,6 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
>   	if (ret)
>   		etm4_release_trace_id(drvdata);
>   
> -unlock_sysfs_enable:
>   	spin_unlock(&drvdata->spinlock);
>   
>   	if (!ret)
> @@ -873,7 +835,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
>   }
>   
>   static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
> -		       enum cs_mode mode, struct coresight_trace_id_map *id_map)
> +		      enum cs_mode mode, struct coresight_path *path)
>   {
>   	int ret;
>   
> @@ -884,10 +846,10 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>   
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
> -		ret = etm4_enable_sysfs(csdev);
> +		ret = etm4_enable_sysfs(csdev, path);
>   		break;
>   	case CS_MODE_PERF:
> -		ret = etm4_enable_perf(csdev, event, id_map);
> +		ret = etm4_enable_perf(csdev, event, path);
>   		break;
>   	default:
>   		ret = -EINVAL;
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 1119762b5cec..2b92de17b5a2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -1066,6 +1066,5 @@ static inline bool etm4x_is_ete(struct etmv4_drvdata *drvdata)
>   	return drvdata->arch >= ETM_ARCH_ETE;
>   }
>   
> -int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata);
>   void etm4_release_trace_id(struct etmv4_drvdata *drvdata);
>   #endif
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 76403530f33e..c10dd3643854 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -132,16 +132,16 @@ static inline void CS_UNLOCK(void __iomem *addr)
>   	} while (0);
>   }
>   
> -void coresight_disable_path(struct list_head *path);
> -int coresight_enable_path(struct list_head *path, enum cs_mode mode,
> +void coresight_disable_path(struct coresight_path *path);
> +int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   			  void *sink_data);
> -struct coresight_device *coresight_get_sink(struct list_head *path);
> +struct coresight_device *coresight_get_sink(struct coresight_path *path);
>   struct coresight_device *coresight_get_sink_by_id(u32 id);
>   struct coresight_device *
>   coresight_find_default_sink(struct coresight_device *csdev);
> -struct list_head *coresight_build_path(struct coresight_device *csdev,
> +struct coresight_path *coresight_build_path(struct coresight_device *csdev,
>   				       struct coresight_device *sink);
> -void coresight_release_path(struct list_head *path);
> +void coresight_release_path(struct coresight_path *path);
>   int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
>   void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
>   int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
> @@ -152,6 +152,8 @@ int coresight_make_links(struct coresight_device *orig,
>   void coresight_remove_links(struct coresight_device *orig,
>   			    struct coresight_connection *conn);
>   u32 coresight_get_sink_id(struct coresight_device *csdev);
> +int coresight_path_assign_trace_id(struct coresight_path *path,
> +				  enum cs_mode mode);
>   
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>   extern int etm_readl_cp14(u32 off, unsigned int *val);
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 64fcfa916562..0d4a9d325df4 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -194,8 +194,7 @@ static void stm_enable_hw(struct stm_drvdata *drvdata)
>   }
>   
>   static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
> -		      enum cs_mode mode,
> -		      __maybe_unused struct coresight_trace_id_map *trace_id)
> +		      enum cs_mode mode, struct coresight_path *path)
>   {
>   	struct stm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index a01c9e54e2ed..c2b0a1f59d1a 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -22,7 +22,7 @@ static DEFINE_IDR(path_idr);
>    * When operating Coresight drivers from the sysFS interface, only a single
>    * path can exist from a tracer (associated to a CPU) to a sink.
>    */
> -static DEFINE_PER_CPU(struct list_head *, tracer_path);
> +static DEFINE_PER_CPU(struct coresight_path *, tracer_path);
>   
>   ssize_t coresight_simple_show_pair(struct device *_dev,
>   			      struct device_attribute *attr, char *buf)
> @@ -53,7 +53,8 @@ ssize_t coresight_simple_show32(struct device *_dev,
>   EXPORT_SYMBOL_GPL(coresight_simple_show32);
>   
>   static int coresight_enable_source_sysfs(struct coresight_device *csdev,
> -					 enum cs_mode mode, void *data)
> +					 enum cs_mode mode,
> +					 struct coresight_path *path)
>   {
>   	int ret;
>   
> @@ -64,7 +65,7 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
>   	 */
>   	lockdep_assert_held(&coresight_mutex);
>   	if (coresight_get_mode(csdev) != CS_MODE_SYSFS) {
> -		ret = source_ops(csdev)->enable(csdev, data, mode, NULL);
> +		ret = source_ops(csdev)->enable(csdev, NULL, mode, path);
>   		if (ret)
>   			return ret;
>   	}
> @@ -167,7 +168,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   {
>   	int cpu, ret = 0;
>   	struct coresight_device *sink;
> -	struct list_head *path;
> +	struct coresight_path *path;
>   	enum coresight_dev_subtype_source subtype;
>   	u32 hash;
>   
> @@ -209,11 +210,15 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   		goto out;
>   	}
>   
> +	ret = coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> +	if (ret < 0)
> +		goto err_path;
> +
>   	ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
>   	if (ret)
>   		goto err_path;
>   
> -	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, NULL);
> +	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, path);
>   	if (ret)
>   		goto err_source;
>   
> @@ -262,7 +267,7 @@ EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
>   void coresight_disable_sysfs(struct coresight_device *csdev)
>   {
>   	int cpu, ret;
> -	struct list_head *path = NULL;
> +	struct coresight_path *path = NULL;
>   	u32 hash;
>   
>   	mutex_lock(&coresight_mutex);
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index c38f9701665e..f0880a62028f 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -439,8 +439,7 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
>   }
>   
>   static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
> -		       enum cs_mode mode,
> -		       __maybe_unused struct coresight_trace_id_map *id_map)
> +		      enum cs_mode mode, struct coresight_path *path)
>   {
>   	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 70407d61262e..03d833a15726 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -329,6 +329,16 @@ static struct coresight_dev_list (var) = {				\
>   
>   #define to_coresight_device(d) container_of(d, struct coresight_device, dev)
>   
> +/**
> + * struct coresight_path - data needed by enable/disable path
> + * @path:		path from source to sink.
> + * @trace_id:		trace_id of the whole path.
> + */
> +struct coresight_path {
> +	struct list_head		*path_list;

Minor nit: We could do

	struct list_head		path_list;

to avoid allocating/freeing the head node without multiple
kzalloc/kfree


Suzuki



> +	u8				trace_id;
> +};
> +
>   enum cs_mode {
>   	CS_MODE_DISABLED,
>   	CS_MODE_SYSFS,
> @@ -393,7 +403,7 @@ struct coresight_ops_link {
>   struct coresight_ops_source {
>   	int (*cpu_id)(struct coresight_device *csdev);
>   	int (*enable)(struct coresight_device *csdev, struct perf_event *event,
> -		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
> +		      enum cs_mode mode, struct coresight_path *path);
>   	void (*disable)(struct coresight_device *csdev,
>   			struct perf_event *event);
>   	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
