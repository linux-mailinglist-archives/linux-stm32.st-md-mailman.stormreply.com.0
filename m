Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0BA6D3F5D
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 10:46:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C61DC65E70;
	Mon,  3 Apr 2023 08:46:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B78AC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 08:46:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9EB41063;
 Mon,  3 Apr 2023 01:47:17 -0700 (PDT)
Received: from [10.57.54.53] (unknown [10.57.54.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6831B3F840;
 Mon,  3 Apr 2023 01:46:31 -0700 (PDT)
Message-ID: <c25f0d12-e820-58b0-b139-b2ca322b6b80@arm.com>
Date: Mon, 3 Apr 2023 09:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
 quic_jinlmao@quicinc.com, mike.leach@linaro.org
References: <20230329115329.2747724-1-james.clark@arm.com>
 <20230329115329.2747724-8-james.clark@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20230329115329.2747724-8-james.clark@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Leo Yan <leo.yan@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 07/13] coresight: Store pointers to
 connections rather than an array of them
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
> This will allow the same connection object to be referenced via the
> input connection list in a later commit rather than duplicating them.
> 
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 45 ++++++++++---------
>   .../hwtracing/coresight/coresight-platform.c  |  8 ++--
>   drivers/hwtracing/coresight/coresight-priv.h  |  1 +
>   .../hwtracing/coresight/coresight-tmc-etr.c   |  2 +-
>   include/linux/coresight.h                     |  2 +-
>   5 files changed, 31 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 12cbb68e8e1c..389f6203c8f0 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -119,7 +119,7 @@ static int coresight_find_link_inport(struct coresight_device *csdev,
>   	struct coresight_connection *conn;
>   
>   	for (i = 0; i < parent->pdata->nr_outconns; i++) {
> -		conn = &parent->pdata->out_conns[i];
> +		conn = parent->pdata->out_conns[i];
>   		if (conn->dest_dev == csdev)
>   			return conn->dest_port;
>   	}
> @@ -137,7 +137,7 @@ static int coresight_find_link_outport(struct coresight_device *csdev,
>   	struct coresight_connection *conn;
>   
>   	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
> -		conn = &csdev->pdata->out_conns[i];
> +		conn = csdev->pdata->out_conns[i];
>   		if (conn->dest_dev == child)
>   			return conn->src_port;
>   	}
> @@ -606,7 +606,7 @@ coresight_find_enabled_sink(struct coresight_device *csdev)
>   	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>   		struct coresight_device *child_dev;
>   
> -		child_dev = csdev->pdata->out_conns[i].dest_dev;
> +		child_dev = csdev->pdata->out_conns[i]->dest_dev;
>   		if (child_dev)
>   			sink = coresight_find_enabled_sink(child_dev);
>   		if (sink)
> @@ -722,7 +722,7 @@ static int coresight_grab_device(struct coresight_device *csdev)
>   	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>   		struct coresight_device *child;
>   
> -		child = csdev->pdata->out_conns[i].dest_dev;
> +		child = csdev->pdata->out_conns[i]->dest_dev;
>   		if (child && child->type == CORESIGHT_DEV_TYPE_HELPER)
>   			if (!coresight_get_ref(child))
>   				goto err;
> @@ -733,7 +733,7 @@ static int coresight_grab_device(struct coresight_device *csdev)
>   	for (i--; i >= 0; i--) {
>   		struct coresight_device *child;
>   
> -		child = csdev->pdata->out_conns[i].dest_dev;
> +		child = csdev->pdata->out_conns[i]->dest_dev;
>   		if (child && child->type == CORESIGHT_DEV_TYPE_HELPER)
>   			coresight_put_ref(child);
>   	}
> @@ -752,7 +752,7 @@ static void coresight_drop_device(struct coresight_device *csdev)
>   	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>   		struct coresight_device *child;
>   
> -		child = csdev->pdata->out_conns[i].dest_dev;
> +		child = csdev->pdata->out_conns[i]->dest_dev;
>   		if (child && child->type == CORESIGHT_DEV_TYPE_HELPER)
>   			coresight_put_ref(child);
>   	}
> @@ -794,7 +794,7 @@ static int _coresight_build_path(struct coresight_device *csdev,
>   	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>   		struct coresight_device *child_dev;
>   
> -		child_dev = csdev->pdata->out_conns[i].dest_dev;
> +		child_dev = csdev->pdata->out_conns[i]->dest_dev;
>   		if (child_dev &&
>   		    _coresight_build_path(child_dev, sink, path) == 0) {
>   			found = true;
> @@ -964,7 +964,7 @@ coresight_find_sink(struct coresight_device *csdev, int *depth)
>   		struct coresight_device *child_dev, *sink = NULL;
>   		int child_depth = curr_depth;
>   
> -		child_dev = csdev->pdata->out_conns[i].dest_dev;
> +		child_dev = csdev->pdata->out_conns[i]->dest_dev;
>   		if (child_dev)
>   			sink = coresight_find_sink(child_dev, &child_depth);
>   
> @@ -1334,7 +1334,7 @@ static int coresight_orphan_match(struct device *dev, void *data)
>   	 * an orphan connection whose name matches @csdev, link it.
>   	 */
>   	for (i = 0; i < i_csdev->pdata->nr_outconns; i++) {
> -		conn = &i_csdev->pdata->out_conns[i];
> +		conn = i_csdev->pdata->out_conns[i];
>   
>   		/* We have found at least one orphan connection */
>   		if (conn->dest_dev == NULL) {
> @@ -1372,7 +1372,7 @@ static int coresight_fixup_device_conns(struct coresight_device *csdev)
>   	int i, ret = 0;
>   
>   	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
> -		struct coresight_connection *conn = &csdev->pdata->out_conns[i];
> +		struct coresight_connection *conn = csdev->pdata->out_conns[i];
>   
>   		conn->dest_dev =
>   			coresight_find_csdev_by_fwnode(conn->dest_fwnode);
> @@ -1406,15 +1406,12 @@ static int coresight_remove_match(struct device *dev, void *data)
>   	 * a connection whose name matches @csdev, remove it.
>   	 */
>   	for (i = 0; i < iterator->pdata->nr_outconns; i++) {
> -		conn = &iterator->pdata->out_conns[i];
> +		conn = iterator->pdata->out_conns[i];
>   
> -		if (conn->dest_dev == NULL)
> -			continue;
> -
> -		if (csdev->dev.fwnode == conn->dest_fwnode) {
> +		/* Child_dev being set signifies that the links were made */
> +		if (csdev->dev.fwnode == conn->dest_fwnode && conn->dest_dev) {
>   			iterator->orphan = true;
>   			coresight_remove_links(iterator, conn);
> -
>   			conn->dest_dev = NULL;
>   			/* No need to continue */
>   			break;
> @@ -1534,21 +1531,25 @@ void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset)
>    * to the output port of this device.
>    */
>   void coresight_release_platform_data(struct coresight_device *csdev,
> +				     struct device *dev,
>   				     struct coresight_platform_data *pdata)
>   {
>   	int i;
> -	struct coresight_connection *conns = pdata->out_conns;
> +	struct coresight_connection **conns = pdata->out_conns;
>   
>   	for (i = 0; i < pdata->nr_outconns; i++) {
>   		/* If we have made the links, remove them now */
> -		if (csdev && conns[i].dest_dev)
> -			coresight_remove_links(csdev, &conns[i]);
> +		if (csdev && conns[i]->dest_dev)
> +			coresight_remove_links(csdev, conns[i]);
>   		/*
>   		 * Drop the refcount and clear the handle as this device
>   		 * is going away
>   		 */
> -		fwnode_handle_put(conns[i].dest_fwnode);
> +		fwnode_handle_put(conns[i]->dest_fwnode);
> +		devm_kfree(dev, conns[i]);
>   	}
> +	devm_kfree(dev, pdata->out_conns);
> +	devm_kfree(dev, pdata);

Is there any particular reason, why we need to do this ? This should
be done automatically at device teardown, which is bound to happen
right after this call ?


>   	if (csdev)
>   		coresight_remove_conns_sysfs_group(csdev);
>   }
> @@ -1665,7 +1666,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   
>   err_out:
>   	/* Cleanup the connection information */
> -	coresight_release_platform_data(NULL, desc->pdata);
> +	coresight_release_platform_data(NULL, desc->dev, desc->pdata);
>   	return ERR_PTR(ret);
>   }
>   EXPORT_SYMBOL_GPL(coresight_register);
> @@ -1678,7 +1679,7 @@ void coresight_unregister(struct coresight_device *csdev)
>   		cti_assoc_ops->remove(csdev);
>   	coresight_remove_conns(csdev);
>   	coresight_clear_default_sink(csdev);
> -	coresight_release_platform_data(csdev, csdev->pdata);
> +	coresight_release_platform_data(csdev, csdev->dev.parent, csdev->pdata);
>   	device_unregister(&csdev->dev);
>   }
>   EXPORT_SYMBOL_GPL(coresight_unregister);
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 80ed2e74620b..bea8f1ba309a 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -36,7 +36,7 @@ int coresight_add_out_conn(struct device *dev,
>   	 * Warn on any existing duplicate output port.
>   	 */
>   	for (i = 0; i < pdata->nr_outconns; ++i) {
> -		conn = &pdata->out_conns[i];
> +		conn = pdata->out_conns[i];
>   		/* Output == -1 means ignore the port for example for helpers */
>   		if (conn->src_port != -1 &&
>   		    conn->src_port == new_conn->src_port) {
> @@ -53,7 +53,9 @@ int coresight_add_out_conn(struct device *dev,
>   	if (!pdata->out_conns)
>   		return -ENOMEM;
>   
> -	pdata->out_conns[pdata->nr_outconns - 1] = *new_conn;
> +	pdata->out_conns[pdata->nr_outconns - 1] = devm_kmalloc(
> +		dev, sizeof(struct coresight_connection), GFP_KERNEL);
> +	*pdata->out_conns[pdata->nr_outconns - 1] = *new_conn;
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(coresight_add_out_conn);
> @@ -859,7 +861,7 @@ coresight_get_platform_data(struct device *dev)
>   error:
>   	if (!IS_ERR_OR_NULL(pdata))
>   		/* Cleanup the connection information */
> -		coresight_release_platform_data(NULL, pdata);
> +		coresight_release_platform_data(NULL, dev, pdata);
>   	return ERR_PTR(ret);
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_platform_data);
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 788ff19c60f6..65ae6d161c57 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -207,6 +207,7 @@ static inline void *coresight_get_uci_data(const struct amba_id *id)
>   }
>   
>   void coresight_release_platform_data(struct coresight_device *csdev,
> +				     struct device *dev,
>   				     struct coresight_platform_data *pdata);
>   struct coresight_device *
>   coresight_find_csdev_by_fwnode(struct fwnode_handle *r_fwnode);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 61234cb8052a..1bbe5410a23d 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -782,7 +782,7 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
>   		return NULL;
>   
>   	for (i = 0; i < etr->pdata->nr_outconns; i++) {
> -		tmp = etr->pdata->out_conns[i].dest_dev;
> +		tmp = etr->pdata->out_conns[i]->dest_dev;
>   		if (tmp && coresight_is_catu_device(tmp))
>   			return tmp;
>   	}
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index ccbc5eafcb6b..7197b07deede 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -111,7 +111,7 @@ struct coresight_platform_data {
>   	int high_outport;
>   	int nr_inconns;
>   	int nr_outconns;
> -	struct coresight_connection *out_conns;
> +	struct coresight_connection **out_conns;

minor nit: Do we need to update the comment too ?

Otherwise looks good to me
Suzuki

>   };
>   
>   /**

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
