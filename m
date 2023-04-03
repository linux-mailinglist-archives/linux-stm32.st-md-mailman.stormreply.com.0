Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7A46D43CB
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 13:47:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6982C65E70;
	Mon,  3 Apr 2023 11:47:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B446C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 11:47:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A222F1063;
 Mon,  3 Apr 2023 04:48:26 -0700 (PDT)
Received: from [10.57.54.53] (unknown [10.57.54.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FF373F6C4;
 Mon,  3 Apr 2023 04:47:40 -0700 (PDT)
Message-ID: <3f090ce3-618d-56d1-1ab6-b38de5c86393@arm.com>
Date: Mon, 3 Apr 2023 12:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
 quic_jinlmao@quicinc.com, mike.leach@linaro.org
References: <20230329115329.2747724-1-james.clark@arm.com>
 <20230329115329.2747724-11-james.clark@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20230329115329.2747724-11-james.clark@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Leo Yan <leo.yan@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 10/13] coresight: Make refcount a
 property of the connection
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
> This removes the need to do an additional lookup for the total number
> of ports used and also removes the need to allocate an array of
> refcounts which is just another representation of a connection array.
> 
> This was only used for link type devices, for regular devices a single
> refcount on the coresight device is used.
> 
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  |  96 +++++++--------
>   drivers/hwtracing/coresight/coresight-etb10.c |  10 +-
>   .../hwtracing/coresight/coresight-funnel.c    |  26 +++--
>   .../hwtracing/coresight/coresight-platform.c  | 109 +-----------------
>   .../coresight/coresight-replicator.c          |  23 ++--
>   .../hwtracing/coresight/coresight-tmc-etf.c   |  24 ++--
>   .../hwtracing/coresight/coresight-tmc-etr.c   |  12 +-
>   drivers/hwtracing/coresight/coresight-tpda.c  |  23 ++--
>   drivers/hwtracing/coresight/coresight-tpiu.c  |   4 +-
>   drivers/hwtracing/coresight/ultrasoc-smb.c    |   8 +-
>   include/linux/coresight.h                     |  13 ++-
>   11 files changed, 124 insertions(+), 224 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index be1e8be2459f..baa23aa53971 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -112,8 +112,9 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
>   
> -static int coresight_find_link_inport(struct coresight_device *csdev,
> -				      struct coresight_device *parent)
> +static struct coresight_connection *
> +coresight_find_link_inport(struct coresight_device *csdev,
> +			   struct coresight_device *parent)
>   {
>   	int i;
>   	struct coresight_connection *conn;
> @@ -121,17 +122,18 @@ static int coresight_find_link_inport(struct coresight_device *csdev,
>   	for (i = 0; i < parent->pdata->nr_outconns; i++) {
>   		conn = parent->pdata->out_conns[i];
>   		if (conn->dest_dev == csdev)
> -			return conn->dest_port;
> +			return conn;
>   	}
>   
>   	dev_err(&csdev->dev, "couldn't find inport, parent: %s, child: %s\n",
>   		dev_name(&parent->dev), dev_name(&csdev->dev));
>   
> -	return -ENODEV;
> +	return ERR_PTR(-ENODEV);
>   }
>   
> -static int coresight_find_link_outport(struct coresight_device *csdev,
> -				       struct coresight_device *child)
> +static struct coresight_connection *
> +coresight_find_link_outport(struct coresight_device *csdev,
> +			    struct coresight_device *child)
>   {
>   	int i;
>   	struct coresight_connection *conn;
> @@ -139,13 +141,13 @@ static int coresight_find_link_outport(struct coresight_device *csdev,
>   	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>   		conn = csdev->pdata->out_conns[i];
>   		if (conn->dest_dev == child)
> -			return conn->src_port;
> +			return conn;
>   	}
>   
>   	dev_err(&csdev->dev, "couldn't find outport, parent: %s, child: %s\n",
>   		dev_name(&csdev->dev), dev_name(&child->dev));
>   
> -	return -ENODEV;
> +	return ERR_PTR(-ENODEV);
>   }

minor nit: I think the above two functions are exactly similar except 
for the error message ? And could be unified by fixing the caller ?

coresight_find_connection(src_dev, dst_dev)



>   
>   static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
> @@ -352,24 +354,24 @@ static int coresight_enable_link(struct coresight_device *csdev,
>   {
>   	int ret = 0;
>   	int link_subtype;
> -	int inport, outport;
> +	struct coresight_connection *inconn, *outconn;
>   
>   	if (!parent || !child)
>   		return -EINVAL;
>   
> -	inport = coresight_find_link_inport(csdev, parent);
> -	outport = coresight_find_link_outport(csdev, child);
> +	inconn = coresight_find_link_inport(csdev, parent);
> +	outconn = coresight_find_link_outport(csdev, child);

here :

	
         outconn = coresight_find_connection(csdev, child);
	inconn = coresight_find_connection(parent, csdev);

>   	link_subtype = csdev->subtype.link_subtype;
>   
> -	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG && inport < 0)
> -		return inport;
> -	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT && outport < 0)
> -		return outport;
> +	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG && IS_ERR(inconn))
> +		return PTR_ERR(inconn);
> +	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT && IS_ERR(outconn))
> +		return PTR_ERR(outconn);
>   
>   	if (link_ops(csdev)->enable) {
>   		ret = coresight_control_assoc_ectdev(csdev, true);
>   		if (!ret) {
> -			ret = link_ops(csdev)->enable(csdev, inport, outport);
> +			ret = link_ops(csdev)->enable(csdev, inconn, outconn);
>   			if (ret)
>   				coresight_control_assoc_ectdev(csdev, false);
>   		}
> @@ -385,33 +387,36 @@ static void coresight_disable_link(struct coresight_device *csdev,
>   				   struct coresight_device *parent,
>   				   struct coresight_device *child)
>   {
> -	int i, nr_conns;
> +	int i;
>   	int link_subtype;
> -	int inport, outport;
> +	struct coresight_connection *inconn, *outconn;
>   
>   	if (!parent || !child)
>   		return;
>   
> -	inport = coresight_find_link_inport(csdev, parent);
> -	outport = coresight_find_link_outport(csdev, child);
> +	inconn = coresight_find_link_inport(csdev, parent);
> +	outconn = coresight_find_link_outport(csdev, child);

similarly here

>   	link_subtype = csdev->subtype.link_subtype;
>   
> -	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG) {
> -		nr_conns = csdev->pdata->high_inport;
> -	} else if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT) {
> -		nr_conns = csdev->pdata->high_outport;
> -	} else {
> -		nr_conns = 1;
> -	}
> -
>   	if (link_ops(csdev)->disable) {
> -		link_ops(csdev)->disable(csdev, inport, outport);
> +		link_ops(csdev)->disable(csdev, inconn, outconn);
>   		coresight_control_assoc_ectdev(csdev, false);
>   	}
>   
> -	for (i = 0; i < nr_conns; i++)
> -		if (atomic_read(&csdev->refcnt[i]) != 0)
> +	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG) {
> +		for (i = 0; i < csdev->pdata->nr_inconns; i++)
> +			if (atomic_read(&csdev->pdata->in_conns[i]->refcnt) !=
> +			    0)
> +				return;
> +	} else if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT) {
> +		for (i = 0; i < csdev->pdata->nr_outconns; i++)
> +			if (atomic_read(&csdev->pdata->out_conns[i]->refcnt) !=
> +			    0)
> +				return;
> +	} else {
> +		if (atomic_read(&csdev->refcnt) != 0)
>   			return;
> +	}

I am slightly concerned about a case where a (practically a corner case,
but not impossible) replicator-out could be connected to a funnel-in. In
which case, we might be operating on the same "connection" and could
mess up with the refcounting and may not do the right thing (e.g, enable
the funnel - depends on in_conn ref, when the Replicator was enabled -
touches out_conn ref)

Suzuki


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
