Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 888026D58D0
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 08:37:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1423AC6A613;
	Tue,  4 Apr 2023 06:37:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E734C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 17:54:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28CDFD75;
 Mon,  3 Apr 2023 10:55:26 -0700 (PDT)
Received: from [10.57.57.146] (unknown [10.57.57.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7DB63F73F;
 Mon,  3 Apr 2023 10:54:39 -0700 (PDT)
Message-ID: <6af8c6b8-92b4-93af-409e-43c4b604f338@arm.com>
Date: Mon, 3 Apr 2023 18:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
 quic_jinlmao@quicinc.com, mike.leach@linaro.org
References: <20230329115329.2747724-1-james.clark@arm.com>
 <20230329115329.2747724-13-james.clark@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20230329115329.2747724-13-james.clark@arm.com>
X-Mailman-Approved-At: Tue, 04 Apr 2023 06:37:09 +0000
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Leo Yan <leo.yan@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 12/13] coresight: Enable and disable
 helper devices adjacent to the path
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

On 29/03/2023 12:53, James Clark wrote:
> Currently CATU is the only helper device, and its enable and disable
> calls are hard coded. To allow more helper devices to be added in a
> generic way, remove these hard coded calls and just enable and disable
> all helper devices.
> 
> This has to apply to helpers adjacent to the path, because they will
> never be in the path. CATU was already discovered in this way, so
> there is no change there.
> 
> One change that is needed is for CATU to call back into ETR to allocate
> the buffer. Because the enable call was previously hard coded, it was
> done at a point where the buffer was already allocated, but this is no
> longer the case.
> 
> Signed-off-by: James Clark <james.clark@arm.com>

Looks good to me. Some minor nits below.

> ---
>   drivers/hwtracing/coresight/coresight-catu.c  |  21 ++-
>   drivers/hwtracing/coresight/coresight-core.c  | 147 +++++++++++++++++-
>   .../hwtracing/coresight/coresight-etm-perf.c  |   4 +-
>   drivers/hwtracing/coresight/coresight-priv.h  |   3 +
>   .../hwtracing/coresight/coresight-tmc-etr.c   |  43 +----
>   include/linux/coresight.h                     |  11 +-
>   6 files changed, 177 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index bc90a03f478f..3949ded0d4fa 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -395,13 +395,18 @@ static inline int catu_wait_for_ready(struct catu_drvdata *drvdata)
>   	return coresight_timeout(csa, CATU_STATUS, CATU_STATUS_READY, 1);
>   }
>   
> -static int catu_enable_hw(struct catu_drvdata *drvdata, void *data)
> +static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
> +			  void *data) >   {
>   	int rc;
>   	u32 control, mode;
> -	struct etr_buf *etr_buf = data;
> +	struct etr_buf *etr_buf = NULL;
>   	struct device *dev = &drvdata->csdev->dev;
>   	struct coresight_device *csdev = drvdata->csdev;
> +	struct coresight_device *etrdev;
> +	union coresight_dev_subtype etr_subtype = {
> +		.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM
> +	};
>   
>   	if (catu_wait_for_ready(drvdata))
>   		dev_warn(dev, "Timeout while waiting for READY\n");
> @@ -416,6 +421,13 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, void *data)
>   	if (rc)
>   		return rc;
>   
> +	etrdev = coresight_find_input_type(
> +		csdev->pdata, CORESIGHT_DEV_TYPE_SINK, etr_subtype);
> +	if (etrdev) {
> +		etr_buf = tmc_etr_get_buffer(etrdev, cs_mode, data);
> +		if (IS_ERR(etr_buf))
> +			return PTR_ERR(etr_buf);
> +	}	
>   	control |= BIT(CATU_CONTROL_ENABLE);
>   
>   	if (etr_buf && etr_buf->mode == ETR_MODE_CATU) {
> @@ -441,13 +453,14 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, void *data)
>   	return 0;
>   }
>   
> -static int catu_enable(struct coresight_device *csdev, void *data)
> +static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
> +		       void *data)
>   {
>   	int rc;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
>   	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_enable_hw(catu_drvdata, data);
> +	rc = catu_enable_hw(catu_drvdata, mode, data);
>   	CS_LOCK(catu_drvdata->base);
>   	return rc;
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index baa23aa53971..65f5bd8516d8 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -421,8 +421,8 @@ static void coresight_disable_link(struct coresight_device *csdev,
>   	csdev->enable = false;
>   }
>   
> -static int coresight_enable_source(struct coresight_device *csdev,
> -				   enum cs_mode mode)
> +int coresight_enable_source(struct coresight_device *csdev, void *data,
> +			    enum cs_mode mode)

minor nit: The order of these parameters are inconsistent.

i.e., would prefer:

   enable_source(csdev, mode, data);

  and I very well understand that it is coming from the existing code 
(i.e., source_ops->enable). But, at least we could keep the order
for the wrapper, inline with other wrappers.

>   {
>   	int ret;
>   
> @@ -431,7 +431,7 @@ static int coresight_enable_source(struct coresight_device *csdev,
>   			ret = coresight_control_assoc_ectdev(csdev, true);
>   			if (ret)
>   				return ret;
> -			ret = source_ops(csdev)->enable(csdev, NULL, mode);
> +			ret = source_ops(csdev)->enable(csdev, data, mode);
>   			if (ret) {
>   				coresight_control_assoc_ectdev(csdev, false);
>   				return ret;
> @@ -444,6 +444,47 @@ static int coresight_enable_source(struct coresight_device *csdev,
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(coresight_enable_source);
> +
> +static int coresight_enable_helper(struct coresight_device *csdev,
> +				   enum cs_mode mode, void *data)
> +{
> +	int ret;
> +
> +	if (!helper_ops(csdev)->enable)
> +		return 0;
> +	ret = helper_ops(csdev)->enable(csdev, mode, data);
> +	if (ret)
> +		return ret;
> +
> +	csdev->enable = true;
> +	return 0;
> +}
> +
> +static void coresight_disable_helper(struct coresight_device *csdev)
> +{
> +	int ret;
> +
> +	if (!helper_ops(csdev)->disable)
> +		return;
> +
> +	ret = helper_ops(csdev)->disable(csdev, NULL);
> +	if (ret)
> +		return;
> +	csdev->enable = false;
> +}
> +
> +static void coresight_disable_helpers(struct coresight_device *csdev)
> +{
> +	int i;
> +	struct coresight_device *helper;
> +
> +	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
> +		helper = csdev->pdata->out_conns[i]->dest_dev;
> +		if (helper && helper->type == CORESIGHT_DEV_TYPE_HELPER)

minor nit: Do we need a wrapper ? is_coresight_helper(helper).
We need it in enable path too.

> +			coresight_disable_helper(helper);
> +	}
> +}
>   
>   /**
>    *  coresight_disable_source - Drop the reference count by 1 and disable
> @@ -453,16 +494,18 @@ static int coresight_enable_source(struct coresight_device *csdev,
>    *
>    *  Returns true if the device has been disabled.
>    */
> -static bool coresight_disable_source(struct coresight_device *csdev)
> +bool coresight_disable_source(struct coresight_device *csdev, void *data)
>   {
>   	if (atomic_dec_return(&csdev->refcnt) == 0) {
>   		if (source_ops(csdev)->disable)
> -			source_ops(csdev)->disable(csdev, NULL);
> +			source_ops(csdev)->disable(csdev, data);
>   		coresight_control_assoc_ectdev(csdev, false);
> +		coresight_disable_helpers(csdev);
>   		csdev->enable = false;
>   	}
>   	return !csdev->enable;
>   }
> +EXPORT_SYMBOL_GPL(coresight_disable_source);
>   
>   /*
>    * coresight_disable_path_from : Disable components in the given path beyond
> @@ -513,6 +556,9 @@ static void coresight_disable_path_from(struct list_head *path,
>   		default:
>   			break;
>   		}
> +
> +		/* Disable all helpers adjacent along the path last */
> +		coresight_disable_helpers(csdev);
>   	}
>   }
>   
> @@ -522,9 +568,28 @@ void coresight_disable_path(struct list_head *path)
>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>   
> -int coresight_enable_path(struct list_head *path, enum cs_mode mode, void *sink_data)
> +static int coresight_enable_helpers(struct coresight_device *csdev,
> +				    enum cs_mode mode, void *data)
>   {
> +	int i, ret = 0;
> +	struct coresight_device *helper;
> +
> +	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
> +		helper = csdev->pdata->out_conns[i]->dest_dev;
> +		if (!helper || helper->type != CORESIGHT_DEV_TYPE_HELPER)
> +			continue;
> +
> +		ret = coresight_enable_helper(helper, mode, data);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
>   
> +int coresight_enable_path(struct list_head *path, enum cs_mode mode,
> +			  void *sink_data)
> +{
>   	int ret = 0;
>   	u32 type;
>   	struct coresight_node *nd;
> @@ -534,6 +599,10 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode, void *sink_
>   		csdev = nd->csdev;
>   		type = csdev->type;
>   
> +		/* Enable all helpers adjacent to the path first */
> +		ret = coresight_enable_helpers(csdev, mode, sink_data);
> +		if (ret)
> +			goto err;
>   		/*
>   		 * ETF devices are tricky... They can be a link or a sink,
>   		 * depending on how they are configured.  If an ETF has been
> @@ -1120,7 +1189,7 @@ int coresight_enable(struct coresight_device *csdev)
>   	if (ret)
>   		goto err_path;
>   
> -	ret = coresight_enable_source(csdev, CS_MODE_SYSFS);
> +	ret = coresight_enable_source(csdev, NULL, CS_MODE_SYSFS);
>   	if (ret)
>   		goto err_source;
>   
> @@ -1177,7 +1246,7 @@ void coresight_disable(struct coresight_device *csdev)
>   	if (ret)
>   		goto out;
>   
> -	if (!csdev->enable || !coresight_disable_source(csdev))
> +	if (!csdev->enable || !coresight_disable_source(csdev, NULL))
>   		goto out;
>   
>   	switch (csdev->subtype.source_subtype) {
> @@ -1653,6 +1722,68 @@ static inline int coresight_search_device_idx(struct coresight_dev_list *dict,
>   	return -ENOENT;
>   }
>   
> +static bool coresight_compare_type(enum coresight_dev_type type_a,
> +				   union coresight_dev_subtype subtype_a,
> +				   enum coresight_dev_type type_b,
> +				   union coresight_dev_subtype subtype_b)
> +{
> +	if (type_a != type_b)
> +		return false;
> +
> +	switch (type_a) {
> +	case CORESIGHT_DEV_TYPE_SINK:
> +		return subtype_a.sink_subtype == subtype_b.sink_subtype;
> +	case CORESIGHT_DEV_TYPE_LINK:
> +		return subtype_a.link_subtype == subtype_b.link_subtype;
> +	case CORESIGHT_DEV_TYPE_LINKSINK:
> +		return subtype_a.link_subtype == subtype_b.link_subtype &&
> +		       subtype_a.sink_subtype == subtype_b.sink_subtype;
> +	case CORESIGHT_DEV_TYPE_SOURCE:
> +		return subtype_a.source_subtype == subtype_b.source_subtype;
> +	case CORESIGHT_DEV_TYPE_HELPER:
> +		return subtype_a.helper_subtype == subtype_b.helper_subtype;
> +	default:
> +		return false;
> +	}
> +}

minor nit: new line

> +struct coresight_device *
> +coresight_find_input_type(struct coresight_platform_data *pdata,
> +			  enum coresight_dev_type type,
> +			  union coresight_dev_subtype subtype)

Suzuki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
