Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA34C1B452E
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 14:30:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C70FC36B0B;
	Wed, 22 Apr 2020 12:30:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAF63C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:30:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCDDBb031151; Wed, 22 Apr 2020 14:30:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=qZad2l1D8nuc7lEsIJFfNgK6NVli4mPy1LVt0pHWBsw=;
 b=fi0DbAuHy+8a0dBiQN3l0B/3REbkylQiCqS5hoSYoK6LjDhwEf2PtPF6mrpDVZcjve15
 IN9xdU0zkHCDwCAYvFrAz5UgfJI8Z+832WAFE0vsyrc/WlMvC3UjNEyUIsYV4ENqXDBN
 mH4OLHtbSGrmNyZzOwgyWjvb/XdsK/NwPEIQnhzOdLu+66hoRMJGcfWA9XH3M7BP8FA2
 Q6oxt5hf/LJYzdJijFy4GxGkvTwSV9izAhoR+Yhmu9fMWQTMVVaQH6pjtsgOtqxNEkRZ
 kWh9Ns92yTObeKbr8HNVw5kP7ojeLHl6nqu5+hyoNC7XL8kysDffsA0y4UAk4x0NkPfW lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqaweauu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:30:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 179B810002A;
 Wed, 22 Apr 2020 14:30:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06F942AE6CC;
 Wed, 22 Apr 2020 14:30:52 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 14:30:51 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	<t@xps15.st-md-mailman.stormreply.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
 <20200416161331.7606-3-arnaud.pouliquen@st.com>
 <20200421204102.GA17676@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <20b31a48-60f8-96eb-98b1-4da2bd350209@st.com>
Date: Wed, 22 Apr 2020 14:30:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421204102.GA17676@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [RFC 02/18] remoteproc: Introduce virtio device
 add/remove functions in core.
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

Hi Mathieu

On 4/21/20 10:41 PM, Mathieu Poirier wrote:
> Hey Arnaud,
> 
> I have started to review this set. Comments will come in over the next few days
> and I will be sure to let you know when I'm done.

Take as much time you need, there is already a lot in your pipe.
This RFC could be probably split into a few series, but i preferred to keep all
together to have a whole picture. Aim of this RFC is to open the discussion on
the restructuring of the rproc_virtio and the use of components to synchronize child devices.

Thanks!

Arnaud 

> 
> On Thu, Apr 16, 2020 at 06:13:15PM +0200, Arnaud Pouliquen wrote:
>> In preparation of the migration of the management of rvdev in
>> rproc_virtio, this patch spins off new functions to manage the
>> virtio device.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 149 +++++++++++++++------------
>>  1 file changed, 83 insertions(+), 66 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 2a0425ab82a7..5c90d569c0f7 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -441,6 +441,86 @@ static void rproc_rvdev_release(struct device *dev)
>>  	kfree(rvdev);
>>  }
>>  
>> +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
>> +{
>> +	struct rproc *rproc = rvdev->rproc;
>> +	struct fw_rsc_vdev *rsc = rvdev->rsc;
>> +	char name[16];
>> +	int ret, i;
>> +
>> +	/* Initialise vdev subdevice */
>> +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>> +	rvdev->dev.parent = &rproc->dev;
>> +	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
>> +	rvdev->dev.release = rproc_rvdev_release;
>> +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>> +	dev_set_drvdata(&rvdev->dev, rvdev);
>> +
>> +	ret = device_register(&rvdev->dev);
>> +	if (ret) {
>> +		put_device(&rvdev->dev);
>> +		return ret;
>> +	}
>> +	/* Make device dma capable by inheriting from parent's capabilities */
>> +	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
>> +
>> +	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
>> +					   dma_get_mask(rproc->dev.parent));
>> +	if (ret) {
>> +		dev_warn(&rvdev->dev,
>> +			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
>> +			 dma_get_mask(rproc->dev.parent), ret);
>> +	}
>> +
>> +	/* parse the vrings */
>> +	for (i = 0; i < rsc->num_of_vrings; i++) {
>> +		ret = rproc_parse_vring(rvdev, rsc, i);
>> +		if (ret)
>> +			goto free_rvdev;
>> +	}
>> +
>> +	/* allocate the vring resources */
>> +	for (i = 0; i < rsc->num_of_vrings; i++) {
>> +		ret = rproc_alloc_vring(rvdev, i);
>> +		if (ret)
>> +			goto free_vg;
> 
> I don't get the "free_vg" part... At the moment this patch is only about
> refactoring and as such I would encourage you to keep things the same as
> much as possible.  It is certainly ok to make modifications but they should be
> done in an incremental patch.  Otherwise reviewers needlessly have to scrutinize
> the changes thinking there is something more to figure out.
> 
>> +	}
>> +
>> +	rvdev->subdev.start = rproc_vdev_do_start;
>> +	rvdev->subdev.stop = rproc_vdev_do_stop;
>> +
>> +	rproc_add_subdev(rproc, &rvdev->subdev);
>> +
>> +	return 0;
>> +
>> +free_vg:
>> +	for (i--; i >= 0; i--) {
>> +		struct rproc_vring *rvring = &rvdev->vring[i];
>> +
>> +		rproc_free_vring(rvring);
>> +	}
>> +
>> +free_rvdev:
>> +	device_unregister(&rvdev->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
>> +{
>> +	struct rproc *rproc = rvdev->rproc;
>> +	struct rproc_vring *rvring;
>> +	int id;
>> +
>> +	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
>> +		rvring = &rvdev->vring[id];
>> +		rproc_free_vring(rvring);
>> +	}
>> +
>> +	rproc_remove_subdev(rproc, &rvdev->subdev);
>> +	device_unregister(&rvdev->dev);
>> +}
>> +
>>  /**
>>   * rproc_handle_vdev() - handle a vdev fw resource
>>   * @rproc: the remote processor
>> @@ -473,8 +553,6 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>>  {
>>  	struct device *dev = &rproc->dev;
>>  	struct rproc_vdev *rvdev;
>> -	int i, ret;
>> -	char name[16];
>>  
>>  	/* make sure resource isn't truncated */
>>  	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
>> @@ -505,83 +583,22 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>>  	kref_init(&rvdev->refcount);
>>  
>>  	rvdev->rsc = rsc;
>> +	rvdev->rsc_offset = offset;
>>  	rvdev->id = rsc->id;
>>  	rvdev->rproc = rproc;
>>  	rvdev->index = rproc->nb_vdev++;
>>  
>> -	/* Initialise vdev subdevice */
>> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>> -	rvdev->dev.parent = rproc->dev.parent;
>> -	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
>> -	rvdev->dev.release = rproc_rvdev_release;
>> -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>> -	dev_set_drvdata(&rvdev->dev, rvdev);
>> -
>> -	ret = device_register(&rvdev->dev);
>> -	if (ret) {
>> -		put_device(&rvdev->dev);
>> -		return ret;
>> -	}
>> -	/* Make device dma capable by inheriting from parent's capabilities */
>> -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
>> -
>> -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
>> -					   dma_get_mask(rproc->dev.parent));
>> -	if (ret) {
>> -		dev_warn(dev,
>> -			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
>> -			 dma_get_mask(rproc->dev.parent), ret);
>> -	}
>> -
>> -	/* parse the vrings */
>> -	for (i = 0; i < rsc->num_of_vrings; i++) {
>> -		ret = rproc_parse_vring(rvdev, rsc, i);
>> -		if (ret)
>> -			goto free_rvdev;
>> -	}
>> -
>> -	/* remember the resource offset*/
>> -	rvdev->rsc_offset = offset;
>> -
>> -	/* allocate the vring resources */
>> -	for (i = 0; i < rsc->num_of_vrings; i++) {
>> -		ret = rproc_alloc_vring(rvdev, i);
>> -		if (ret)
>> -			goto unwind_vring_allocations;
>> -	}
>> -
>>  	list_add_tail(&rvdev->node, &rproc->rvdevs);
>>  
>> -	rvdev->subdev.start = rproc_vdev_do_start;
>> -	rvdev->subdev.stop = rproc_vdev_do_stop;
>> -
>> -	rproc_add_subdev(rproc, &rvdev->subdev);
>> -
>> -	return 0;
>> -
>> -unwind_vring_allocations:
>> -	for (i--; i >= 0; i--)
>> -		rproc_free_vring(&rvdev->vring[i]);
>> -free_rvdev:
>> -	device_unregister(&rvdev->dev);
>> -	return ret;
>> +	return rproc_rvdev_add_device(rvdev);
>>  }
>>  
>>  void rproc_vdev_release(struct kref *ref)
>>  {
>>  	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
>> -	struct rproc_vring *rvring;
>> -	struct rproc *rproc = rvdev->rproc;
>> -	int id;
>> -
>> -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
>> -		rvring = &rvdev->vring[id];
>> -		rproc_free_vring(rvring);
>> -	}
>>  
>> -	rproc_remove_subdev(rproc, &rvdev->subdev);
>> +	rproc_rvdev_remove_device(rvdev);
> 
> At this time I don't see how introducing rproc_rvdev_remore_device() is
> advantageous.  Maybe I'll find an answer as I review upcoming patches...
> 
> Thanks,
> Mathieu 
> 
>>  	list_del(&rvdev->node);
>> -	device_unregister(&rvdev->dev);
>>  }
>>  
>>  /**
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
