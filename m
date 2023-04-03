Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB776D4011
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 11:18:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51A15C65E70;
	Mon,  3 Apr 2023 09:18:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECBC4C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 09:18:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF9591063;
 Mon,  3 Apr 2023 02:18:50 -0700 (PDT)
Received: from [10.57.54.53] (unknown [10.57.54.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7545F3F840;
 Mon,  3 Apr 2023 02:18:04 -0700 (PDT)
Message-ID: <2c3e8332-e964-91d0-51e9-649e09d9187c@arm.com>
Date: Mon, 3 Apr 2023 10:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
 quic_jinlmao@quicinc.com, mike.leach@linaro.org
References: <20230329115329.2747724-1-james.clark@arm.com>
 <20230329115329.2747724-9-james.clark@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20230329115329.2747724-9-james.clark@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Leo Yan <leo.yan@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 08/13] coresight: Simplify connection
	fixup mechanism
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
> There is some duplication between coresight_fixup_device_conns() and
> coresight_fixup_orphan_conns(). They both do the same thing except for
> the fact that coresight_fixup_orphan_conns() can't handle iterating over
> itself.
> 
> By making it able to handle fixing up it's own connections the other
> function can be removed.
> 
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 72 +++++++-------------
>   1 file changed, 26 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 389f6203c8f0..2f4aa15ef8f9 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1316,38 +1316,42 @@ static int coresight_orphan_match(struct device *dev, void *data)
>   {
>   	int i, ret = 0;
>   	bool still_orphan = false;
> -	struct coresight_device *csdev, *i_csdev;
> +	struct coresight_device *csdev = data;
> +	struct coresight_device *i_csdev = to_coresight_device(dev);
>   	struct coresight_connection *conn;
>   
> -	csdev = data;
> -	i_csdev = to_coresight_device(dev);
> -
> -	/* No need to check oneself */
> -	if (csdev == i_csdev)
> -		return 0;
> -
>   	/* Move on to another component if no connection is orphan */
>   	if (!i_csdev->orphan)
>   		return 0;
>   	/*
> -	 * Circle throuch all the connection of that component.  If we find
> +	 * Circle through all the connections of that component.  If we find
>   	 * an orphan connection whose name matches @csdev, link it.
>   	 */
>   	for (i = 0; i < i_csdev->pdata->nr_outconns; i++) {
>   		conn = i_csdev->pdata->out_conns[i];
>   
> -		/* We have found at least one orphan connection */
> -		if (conn->dest_dev == NULL) {
> -			/* Does it match this newly added device? */
> -			if (conn->dest_fwnode == csdev->dev.fwnode) {
> -				ret = coresight_make_links(i_csdev,
> -							   conn, csdev);
> -				if (ret)
> -					return ret;
> -			} else {
> -				/* This component still has an orphan */
> -				still_orphan = true;
> -			}


To be honest, this unification makes it really hard to follow.

> +		/* Skip the port if it's already connected. */
> +		if (conn->dest_dev)
> +			continue;
> +
> +		/*
> +		 * When connecting the newly registered device, we need to find
> +		 * the remote instead of using the *data shortcut that avoids
> +		 * the need for this search.
> +		 */
> +		if (csdev == i_csdev)
> +			csdev = coresight_find_csdev_by_fwnode(
> +				conn->dest_fwnode);

And this is overwriting the csdev, and I am struggling to follow, how
further connections are being fixed up after the first one, because the
condition wouldn't be true after the first one.

One way to do that would be, doing something like:

Rename the variables as follow:

	csdev => dst_dev
	i_csdev => src_dev

	bool fixup_self = (src_dev == dst_dev);


	for (i = 0; i ....) {
		...

		/*
		 * If we are at the "new" device, which triggered
		 * this search, we must find the remote device
		 * from the fwnode in the connection.
		 */
		if (fixup_self) {
			dst_dev = find_by_fwnode(...);
		}

> +
> +		/* Does it match this newly added device? */
> +		if (csdev && conn->dest_fwnode == csdev->dev.fwnode) {
> +			ret = coresight_make_links(i_csdev, conn, csdev);
> +			if (ret)
> +				return ret;
> +
> +		} else {
> +			/* This component still has an orphan */
> +			still_orphan = true;
>   		}
>   	}


Suzuki


>   
> @@ -1366,28 +1370,6 @@ static int coresight_fixup_orphan_conns(struct coresight_device *csdev)
>   			 csdev, coresight_orphan_match);
>   }
>   
> -
> -static int coresight_fixup_device_conns(struct coresight_device *csdev)
> -{
> -	int i, ret = 0;
> -
> -	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
> -		struct coresight_connection *conn = csdev->pdata->out_conns[i];
> -
> -		conn->dest_dev =
> -			coresight_find_csdev_by_fwnode(conn->dest_fwnode);
> -		if (conn->dest_dev && conn->dest_dev->has_conns_grp) {
> -			ret = coresight_make_links(csdev, conn, conn->dest_dev);
> -			if (ret)
> -				break;
> -		} else {
> -			csdev->orphan = true;
> -		}
> -	}
> -
> -	return ret;
> -}
> -
>   static int coresight_remove_match(struct device *dev, void *data)
>   {
>   	int i;
> @@ -1594,7 +1576,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   	csdev->subtype = desc->subtype;
>   	csdev->ops = desc->ops;
>   	csdev->access = desc->access;
> -	csdev->orphan = false;
> +	csdev->orphan = true;
>   
>   	csdev->dev.type = &coresight_dev_type[desc->type];
>   	csdev->dev.groups = desc->groups;
> @@ -1644,8 +1626,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   	registered = true;
>   
>   	ret = coresight_create_conns_sysfs_group(csdev);
> -	if (!ret)
> -		ret = coresight_fixup_device_conns(csdev);
>   	if (!ret)
>   		ret = coresight_fixup_orphan_conns(csdev);
>   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
