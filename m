Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23849A0B63B
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 13:02:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF098C78018;
	Mon, 13 Jan 2025 12:02:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECFBCC030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 12:02:02 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso29258825e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 04:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736769722; x=1737374522;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6I0GWWKQhHhV1l5rYz/zOI7iXiT12gQ7Wt8j2mlsmns=;
 b=ALY5jsyPlSQ1meB7OkqXgKWp2EGmU6NJd6OS6mYh3GoZSA6ZwLCAjPaX1YPGzk3w96
 heh631+BaLSqFHa3CVC+WWzhUvnsp+zTjG3oKdJ+RqPiUmvbXEVDvNkkMjHitAhV6V5I
 4c0fLZLVCC2yS79WLtp7I2Q6ish9gSz2z7sn64P9cCTCvr0KwmWZn+pLLDB4U5wSfVXJ
 fsWtEmH1ORodTzvmvcVoq8ZF8FeMDr2IBY+lrBMlPvrLpgc9+q6/DfQt5w4UCN1IH2FK
 fOInvVr4fgI7fbxKpKwWuHVJdx6Ddkhh5uR5bnex0n76UTjNYO5mrnBf2Mlh1ij0sXf3
 WsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736769722; x=1737374522;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6I0GWWKQhHhV1l5rYz/zOI7iXiT12gQ7Wt8j2mlsmns=;
 b=pU+XJ0KDKJPPnAq1uUni+4qA5lt9I6wioPT4ENMMubROiwZRu3fAKjWLf2iESDVIjd
 TQY1OcabGLxeknWEw7zCNDoE3NUmPu1E8A8yjJ1CfM9Hdo3s1j8BKON1COJa8vxtB7Dz
 2uuEnmHuvtVrkmR9+GzE50xD719Y4uY6GA986YGrDadHUkCK9r1vAW2yM60kGuyCd2Z9
 nCqjV5EzdDLcBOjgDsYwlymZHaNeanHGeFctorRSA3XTFppBZa0fp8Q6mg25UG9kfvTt
 k3FXYaY6gRXqohexkwKzk227wGarX69X71vhu0T3uCLrPHUHp5hGNWwfT5HzJYNn10xj
 fm/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMi/pUVyqUsMKzUp7c9zG0AhUC5/y5q4HpRorRH9h4/BzeDvrNMzc2LmNqjsYQWMJQX2tsgsV6t2lBwA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxoCcquBJ6RBUgklaBG/FJtSAYNZAyaUpFrydODVq1IjA2dK803
 kw9W1j3b8L4TSVTgsJYVrA8NIMSXcX+pm/IP/08ahVx8fMgHYUqhv7yM42NN4ow=
X-Gm-Gg: ASbGncvk5I2FlyE5kMk8820LLMxvYh8w91UhG3xolpHR5tY39SCqcr+UqzkTazAeJ7F
 L07mX5CHebJTBhpA20egax4agXre0ZZ2ATlm32WPgSzMBhwerhXApoBXD4a2pSJkPbpANNKZOyP
 PAhg5yJ1MSZ685tLqb8HkviieC8E5YFhySi7RWR4tAuXaatT0UXfTLQtdF80rqmOYdLwBRf035l
 uHt3zPadYr7s++gepRYsZDN4vwHDumXk3cwb8eKqnvepJ6ToGC7P2UUenyGNbY7V0X3
X-Google-Smtp-Source: AGHT+IHmrAgPzxlkbLuvJ37fvU/Sgw+Hc/6Fh4XGQaQkpq1jWzBlqtRWEaJuIlzd0zbBWC/uSPBoZA==
X-Received: by 2002:a05:600c:1384:b0:436:1c04:aa8e with SMTP id
 5b1f17b1804b1-436e26bdac1mr222373605e9.16.1736769722077; 
 Mon, 13 Jan 2025 04:02:02 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm140444195e9.20.2025.01.13.04.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 04:02:01 -0800 (PST)
Message-ID: <64731493-4bd1-4707-9452-5ca86744875b@linaro.org>
Date: Mon, 13 Jan 2025 12:02:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
 <20241226011022.1477160-3-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241226011022.1477160-3-quic_jiegan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v8 2/5] Coresight: Add trace_id function
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



On 26/12/2024 1:10 am, Jie Gan wrote:
> Add 'trace_id' function pointer in ops. It's responsible for
> retrieving the device's trace ID.
> 
> Add 'struct cs_sink_data' to store the data that is needed by
> coresight_enable_path/coresight_disable_path. The structure
> will be transmitted to the helper and sink device to enable
> related funcationalities.
> 

The new cs_sink_data struct is quite specific to this change. Can we 
start passing the path around to enable/disable functions, that will 
allow devices to gather anything they want in the future. Because we 
already have coresight_get_sink(path), coresight_get_source(path) etc.

And see below, but for this case we can also change the path struct to 
contain the trace ID. Then all the new functions, allocations and 
searches for the trace ID are unecessary. The CTCU will have access to 
the path, and by the time its enable function is called the trace ID is 
already assigned.

It's also easier to understand at which point a trace ID is allocated, 
rather than adding the trace_id() callbacks from everywhere which could 
potentially either read or allocate. I suppose that's "safer" because 
maybe it's not allocated, but I can't see what case it would happen in 
reverse.

> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 59 +++++++++++++++----
>   drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
>   .../hwtracing/coresight/coresight-etm-perf.c  | 37 ++++++++++--
>   .../coresight/coresight-etm3x-core.c          | 30 ++++++++++
>   .../coresight/coresight-etm4x-core.c          | 29 +++++++++
>   drivers/hwtracing/coresight/coresight-priv.h  | 13 +++-
>   drivers/hwtracing/coresight/coresight-stm.c   | 22 +++++++
>   drivers/hwtracing/coresight/coresight-sysfs.c | 24 +++++++-
>   .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
>   .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
>   drivers/hwtracing/coresight/coresight-tpda.c  | 20 +++++++
>   drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
>   drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
>   include/linux/coresight.h                     |  6 ++
>   14 files changed, 234 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 0a9380350fb5..2e560b425fd4 100644
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
> @@ -331,12 +332,12 @@ static int coresight_enable_helper(struct coresight_device *csdev,
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
> @@ -344,7 +345,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
>   	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>   		helper = csdev->pdata->out_conns[i]->dest_dev;
>   		if (helper && coresight_is_helper(helper))
> -			coresight_disable_helper(helper);
> +			coresight_disable_helper(helper, data);
>   	}
>   }
>   
> @@ -361,7 +362,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
>   void coresight_disable_source(struct coresight_device *csdev, void *data)
>   {
>   	source_ops(csdev)->disable(csdev, data);
> -	coresight_disable_helpers(csdev);
> +	coresight_disable_helpers(csdev, NULL);
>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_source);
>   
> @@ -371,7 +372,8 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
>    * disabled.
>    */
>   static void coresight_disable_path_from(struct list_head *path,
> -					struct coresight_node *nd)
> +					struct coresight_node *nd,
> +					void *sink_data)
>   {
>   	u32 type;
>   	struct coresight_device *csdev, *parent, *child;
> @@ -417,13 +419,13 @@ static void coresight_disable_path_from(struct list_head *path,
>   		}
>   
>   		/* Disable all helpers adjacent along the path last */
> -		coresight_disable_helpers(csdev);
> +		coresight_disable_helpers(csdev, sink_data);
>   	}
>   }
>   
> -void coresight_disable_path(struct list_head *path)
> +void coresight_disable_path(struct list_head *path, void *sink_data)
>   {
> -	coresight_disable_path_from(path, NULL);
> +	coresight_disable_path_from(path, NULL, sink_data);
>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>   
> @@ -505,10 +507,47 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
>   out:
>   	return ret;
>   err:
> -	coresight_disable_path_from(path, nd);
> +	coresight_disable_path_from(path, nd, sink_data);
>   	goto out;
>   }
>   
> +int coresight_read_traceid(struct list_head *path, enum cs_mode mode,
> +			   struct coresight_trace_id_map *id_map)
> +{
> +	int trace_id, type;
> +	struct coresight_device *csdev;
> +	struct coresight_node *nd;
> +
> +	list_for_each_entry(nd, path, link) {

What do you think about also changing the path to this:

  struct coresight_path {
    struct list_head *path,
    u8 trace_id
  };

That would avoid having to traverse the path on every enable and would 
remove this function. You could also cache the trace ID in the CTCU for 
a similar benefit, but it wouldn't remove the need to call this at least 
once.

The expensive part should be the create path part, after that enable and 
disable should be cheap because they happen on schedule for Perf mode. 
We should be avoiding allocations and searches.

> +		csdev = nd->csdev;
> +		type = csdev->type;
> +
> +		switch (type) {
> +		case CORESIGHT_DEV_TYPE_SOURCE:
> +			if (source_ops(csdev)->trace_id != NULL) {
> +				trace_id = source_ops(csdev)->trace_id(csdev,
> +								       mode,
> +								       id_map);
> +				if (IS_VALID_CS_TRACE_ID(trace_id))
> +					goto out;
> +			}
> +			break;
> +		case CORESIGHT_DEV_TYPE_LINK:
> +			if (link_ops(csdev)->trace_id != NULL) {
> +				trace_id = link_ops(csdev)->trace_id(csdev);
> +				if (IS_VALID_CS_TRACE_ID(trace_id))
> +					goto out;
> +			}
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +	return -EINVAL;
> +out:
> +	return trace_id;
> +}
> +
>   struct coresight_device *coresight_get_sink(struct list_head *path)
>   {
>   	struct coresight_device *csdev;
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index aea9ac9c4bd0..904b5531c256 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -173,7 +173,8 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
>   	pid_t pid;
>   	unsigned long flags;
>   	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct perf_output_handle *handle = data;
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +	struct perf_output_handle *handle = sink_data->handle;
>   	struct cs_buffers *buf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index ad6a8f4b70b6..e676edd42ddc 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -459,6 +459,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
>   	struct list_head *path;
> +	struct cs_sink_data *sink_data = NULL;
>   	u64 hw_id;
>   	u8 trace_id;
>   
> @@ -498,9 +499,20 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	if (WARN_ON_ONCE(!sink))
>   		goto fail_end_stop;
>   
> +	sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);

kzalloc can't be called from here. Check dmesg for the warning. That's 
another reason to do this change on the path. Because the path is 
allocated on etm_setup_aux() where allocations are allowed.

> +	if (!sink_data)
> +		goto fail_end_stop;
> +
> +	sink_data->sink = sink;
> +	sink_data->traceid = coresight_read_traceid(path, CS_MODE_PERF,
> +						    &sink->perf_sink_id_map);
> +	sink_data->handle = handle;
> +
>   	/* Nothing will happen without a path */
> -	if (coresight_enable_path(path, CS_MODE_PERF, handle))
> +	if (coresight_enable_path(path, CS_MODE_PERF, sink_data)) {
> +		kfree(sink_data);
>   		goto fail_end_stop;
> +	}
>   
>   	/* Finally enable the tracer */
>   	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF,
> @@ -526,6 +538,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   		perf_report_aux_output_id(event, hw_id);
>   	}
>   
> +	kfree(sink_data);
>   out:
>   	/* Tell the perf core the event is alive */
>   	event->hw.state = 0;
> @@ -534,7 +547,8 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	return;
>   
>   fail_disable_path:
> -	coresight_disable_path(path);
> +	coresight_disable_path(path, sink_data);
> +	kfree(sink_data);
>   fail_end_stop:
>   	/*
>   	 * Check if the handle is still associated with the event,
> @@ -559,6 +573,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct etm_event_data *event_data;
>   	struct list_head *path;
> +	struct cs_sink_data *sink_data = NULL;
>   
>   	/*
>   	 * If we still have access to the event_data via handle,
> @@ -603,6 +618,10 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (!sink)
>   		return;
>   
> +	sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);

Same problem as above.

> +	if (!sink_data)
> +		return;
> +
>   	/* stop tracer */
>   	coresight_disable_source(csdev, event);
>   
> @@ -616,12 +635,16 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	 * have to do anything here.
>   	 */
>   	if (handle->event && (mode & PERF_EF_UPDATE)) {
> -		if (WARN_ON_ONCE(handle->event != event))
> +		if (WARN_ON_ONCE(handle->event != event)) {
> +			kfree(sink_data);
>   			return;
> +		}
>   
>   		/* update trace information */
> -		if (!sink_ops(sink)->update_buffer)
> +		if (!sink_ops(sink)->update_buffer) {
> +			kfree(sink_data);
>   			return;
> +		}
>   
>   		size = sink_ops(sink)->update_buffer(sink, handle,
>   					      event_data->snk_config);
> @@ -642,8 +665,12 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   			WARN_ON(size);
>   	}
>   
> +	sink_data->sink = sink;
> +	sink_data->traceid = coresight_read_traceid(path, CS_MODE_PERF,
> +						    &sink->perf_sink_id_map);
>   	/* Disabling the path make its elements available to other sessions */
> -	coresight_disable_path(path);
> +	coresight_disable_path(path, sink_data);
> +	kfree(sink_data);
>   }
>   
>   static int etm_event_add(struct perf_event *event, int mode)
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index c103f4c70f5d..0f095fab7e0a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -697,10 +697,40 @@ static void etm_disable(struct coresight_device *csdev,
>   		coresight_set_mode(csdev, CS_MODE_DISABLED);
>   }
>   
> +static int etm_trace_id(struct coresight_device *csdev,
> +			enum cs_mode mode,
> +			struct coresight_trace_id_map *id_map)
> +{
> +	int trace_id;
> +	struct etm_drvdata *drvdata;
> +
> +	if (csdev == NULL)
> +		return -EINVAL;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	switch (mode) {
> +	case CS_MODE_SYSFS:
> +		trace_id = etm_read_alloc_trace_id(drvdata);
> +		break;
> +	case CS_MODE_PERF:
> +		trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
> +		if (IS_VALID_CS_TRACE_ID(trace_id))
> +			drvdata->traceid = (u8)trace_id;
> +		break;
> +	default:
> +		trace_id = -EINVAL;
> +		break;
> +	}
> +
> +	return trace_id;
> +}
> +
> +
>   static const struct coresight_ops_source etm_source_ops = {
>   	.cpu_id		= etm_cpu_id,
>   	.enable		= etm_enable,
>   	.disable	= etm_disable,
> +	.trace_id	= etm_trace_id,
>   };
>   
>   static const struct coresight_ops etm_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index dd8c74f893db..bac9ea371688 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1025,10 +1025,39 @@ static void etm4_disable(struct coresight_device *csdev,
>   		coresight_set_mode(csdev, CS_MODE_DISABLED);
>   }
>   
> +static int etm4_trace_id(struct coresight_device *csdev,
> +			 enum cs_mode mode,
> +			 struct coresight_trace_id_map *id_map)
> +{
> +	int trace_id;
> +	struct etmv4_drvdata *drvdata;
> +
> +	if (csdev == NULL)
> +		return -EINVAL;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	switch (mode) {
> +	case CS_MODE_SYSFS:
> +		trace_id = etm4_read_alloc_trace_id(drvdata);
> +		break;
> +	case CS_MODE_PERF:
> +		trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
> +		if (IS_VALID_CS_TRACE_ID(trace_id))
> +			drvdata->trcid = (u8)trace_id;
> +		break;
> +	default:
> +		trace_id = -EINVAL;
> +		break;
> +	}
> +
> +	return trace_id;
> +}
> +
>   static const struct coresight_ops_source etm4_source_ops = {
>   	.cpu_id		= etm4_cpu_id,
>   	.enable		= etm4_enable,
>   	.disable	= etm4_disable,
> +	.trace_id	= etm4_trace_id,
>   };
>   
>   static const struct coresight_ops etm4_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 05f891ca6b5c..6a95a3ba9339 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -105,6 +105,15 @@ struct cs_buffers {
>   	void			**data_pages;
>   };
>   
> +/**
> + * struct cs_sink_data - data used by coresight_enable_path/coresight_disable_path
> + */
> +struct cs_sink_data {
> +	struct perf_output_handle	*handle;
> +	struct coresight_device		*sink;
> +	u8				traceid;
> +};
> +
>   static inline void coresight_insert_barrier_packet(void *buf)
>   {
>   	if (buf)
> @@ -129,9 +138,11 @@ static inline void CS_UNLOCK(void __iomem *addr)
>   	} while (0);
>   }
>   
> -void coresight_disable_path(struct list_head *path);
> +void coresight_disable_path(struct list_head *path, void *sink_data);
>   int coresight_enable_path(struct list_head *path, enum cs_mode mode,
>   			  void *sink_data);
> +int coresight_read_traceid(struct list_head *path, enum cs_mode mode,
> +			   struct coresight_trace_id_map *id_map);
>   struct coresight_device *coresight_get_sink(struct list_head *path);
>   struct coresight_device *coresight_get_sink_by_id(u32 id);
>   struct coresight_device *
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index b581a30a1cd9..5709eda77d9b 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -281,9 +281,31 @@ static void stm_disable(struct coresight_device *csdev,
>   	}
>   }
>   
> +static int stm_trace_id(struct coresight_device *csdev,
> +			enum cs_mode mode,
> +			struct coresight_trace_id_map *id_map)
> +{
> +	int trace_id;
> +	struct stm_drvdata *drvdata;
> +
> +	if (csdev == NULL)
> +		return -EINVAL;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	trace_id = drvdata->traceid;
> +	if (!IS_VALID_CS_TRACE_ID(trace_id)) {

Trace ID is static and always set for STM so this isn't necessary, just 
return drvdata->traceid which would already be valid otherwise the 
device wouldn't be registered.

> +		trace_id = coresight_trace_id_get_system_id();
> +		if (IS_VALID_CS_TRACE_ID(trace_id))
> +			drvdata->traceid = (u8)trace_id;
> +	}
> +
> +	return trace_id;
> +}
> +
>   static const struct coresight_ops_source stm_source_ops = {
>   	.enable		= stm_enable,
>   	.disable	= stm_disable,
> +	.trace_id	= stm_trace_id,
>   };
>   
>   static const struct coresight_ops stm_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index a01c9e54e2ed..8816bccba374 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -168,6 +168,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   	int cpu, ret = 0;
>   	struct coresight_device *sink;
>   	struct list_head *path;
> +	struct cs_sink_data *sink_data;
>   	enum coresight_dev_subtype_source subtype;
>   	u32 hash;
>   
> @@ -209,7 +210,14 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   		goto out;
>   	}
>   
> -	ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
> +	sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
> +	if (!sink_data) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +	sink_data->traceid = coresight_read_traceid(path, CS_MODE_SYSFS, NULL);
> +	sink_data->sink = sink;
> +	ret = coresight_enable_path(path, CS_MODE_SYSFS, sink_data);
>   	if (ret)
>   		goto err_path;
>   
> @@ -246,15 +254,17 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   		break;
>   	}
>   
> +	kfree(sink_data);
>   out:
>   	mutex_unlock(&coresight_mutex);
>   	return ret;
>   
>   err_source:
> -	coresight_disable_path(path);
> +	coresight_disable_path(path, sink_data);
>   
>   err_path:
>   	coresight_release_path(path);
> +	kfree(sink_data);
>   	goto out;
>   }
>   EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
> @@ -263,6 +273,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
>   {
>   	int cpu, ret;
>   	struct list_head *path = NULL;
> +	struct cs_sink_data *sink_data = NULL;
>   	u32 hash;
>   
>   	mutex_lock(&coresight_mutex);
> @@ -274,6 +285,10 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
>   	if (!coresight_disable_source_sysfs(csdev, NULL))
>   		goto out;
>   
> +	sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
> +	if (!sink_data)
> +		goto out;
> +
>   	switch (csdev->subtype.source_subtype) {
>   	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
>   		cpu = source_ops(csdev)->cpu_id(csdev);
> @@ -297,8 +312,11 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
>   		break;
>   	}
>   
> -	coresight_disable_path(path);
> +	sink_data->sink = coresight_find_activated_sysfs_sink(csdev);
> +	sink_data->traceid = coresight_read_traceid(path, CS_MODE_SYSFS, NULL);
> +	coresight_disable_path(path, sink_data);
>   	coresight_release_path(path);
> +	kfree(sink_data);
>   
>   out:
>   	mutex_unlock(&coresight_mutex);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d4f641cd9de6..7dc536eba3e2 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -250,7 +250,8 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
>   	pid_t pid;
>   	unsigned long flags;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct perf_output_handle *handle = data;
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +	struct perf_output_handle *handle = sink_data->handle;
>   	struct cs_buffers *buf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index a48bb85d0e7f..90a4058c9959 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1254,7 +1254,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>   				   enum cs_mode mode, void *data)
>   {
> -	struct perf_output_handle *handle = data;
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +	struct perf_output_handle *handle = sink_data->handle;
>   	struct etr_perf_buffer *etr_perf;
>   
>   	switch (mode) {
> @@ -1648,7 +1649,8 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	pid_t pid;
>   	unsigned long flags;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct perf_output_handle *handle = data;
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +	struct perf_output_handle *handle = sink_data->handle;
>   	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>   
>   	spin_lock_irqsave(&drvdata->spinlock, flags);
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 189a4abc2561..05622333f2d2 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -241,9 +241,29 @@ static void tpda_disable(struct coresight_device *csdev,
>   	dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
>   }
>   
> +static int tpda_trace_id(struct coresight_device *csdev)
> +{
> +	int trace_id;
> +	struct tpda_drvdata *drvdata;
> +
> +	if (csdev == NULL)
> +		return -EINVAL;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	trace_id = drvdata->atid;
> +	if (!IS_VALID_CS_TRACE_ID(trace_id)) {

Same comment as STM. This is always set so no ned to try to assign 
another one.

> +		trace_id = coresight_trace_id_get_system_id();
> +		if (IS_VALID_CS_TRACE_ID(trace_id))
> +			drvdata->atid = (u8)trace_id;
> +	}
> +
> +	return trace_id;
> +}
> +
>   static const struct coresight_ops_link tpda_link_ops = {
>   	.enable		= tpda_enable,
>   	.disable	= tpda_disable,
> +	.trace_id	= tpda_trace_id,
>   };
>   
>   static const struct coresight_ops tpda_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 919804b12a67..6680d3c69906 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -21,6 +21,7 @@
>   
>   #include "coresight-self-hosted-trace.h"
>   #include "coresight-trbe.h"
> +#include "coresight-priv.h"
>   
>   #define PERF_IDX2OFF(idx, buf) ((idx) % ((buf)->nr_pages << PAGE_SHIFT))
>   
> @@ -1012,7 +1013,8 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   {
>   	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> -	struct perf_output_handle *handle = data;
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +	struct perf_output_handle *handle = sink_data->handle;
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   
>   	WARN_ON(cpudata->cpu != smp_processor_id());
> diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
> index dc3c9504dd7c..99e0eb33c01f 100644
> --- a/drivers/hwtracing/coresight/ultrasoc-smb.c
> +++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
> @@ -216,7 +216,8 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
>   static int smb_enable_perf(struct coresight_device *csdev, void *data)
>   {
>   	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct perf_output_handle *handle = data;
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +	struct perf_output_handle *handle = sink_data->handle;
>   	struct cs_buffers *buf = etm_perf_sink_config(handle);
>   	pid_t pid;
>   
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 157c4bd009a1..1929f0088c0f 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -368,6 +368,7 @@ struct coresight_ops_sink {
>    * Operations available for links.
>    * @enable:	enables flow between iport and oport.
>    * @disable:	disables flow between iport and oport.
> + * @trace_id:	Collect the traceid.
>    */
>   struct coresight_ops_link {
>   	int (*enable)(struct coresight_device *csdev,
> @@ -376,6 +377,7 @@ struct coresight_ops_link {
>   	void (*disable)(struct coresight_device *csdev,
>   			struct coresight_connection *in,
>   			struct coresight_connection *out);
> +	int (*trace_id)(struct coresight_device *csdev);
>   };
>   
>   /**
> @@ -385,6 +387,7 @@ struct coresight_ops_link {
>    *		is associated to.
>    * @enable:	enables tracing for a source.
>    * @disable:	disables tracing for a source.
> + * @trace_id:	collect the traceid.
>    */
>   struct coresight_ops_source {
>   	int (*cpu_id)(struct coresight_device *csdev);
> @@ -392,6 +395,9 @@ struct coresight_ops_source {
>   		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
>   	void (*disable)(struct coresight_device *csdev,
>   			struct perf_event *event);
> +	int (*trace_id)(struct coresight_device *csdev,
> +			enum cs_mode mode,
> +			struct coresight_trace_id_map *id_map);
>   };
>   
>   /**

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
