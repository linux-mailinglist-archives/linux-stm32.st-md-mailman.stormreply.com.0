Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 385FA484EFC
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jan 2022 09:05:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DABA2C5F1F6;
	Wed,  5 Jan 2022 08:05:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D0E5C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jan 2022 08:05:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2057xdcu026980;
 Wed, 5 Jan 2022 09:05:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bJZNGcwWKkd1Jkgo5S1swdvNCZ1uvjdExLTcuT53zEk=;
 b=Xc2gHp3LzhcrjZjEF+Ya9D+77uptj/6g7O5uOe0gMJnJC/C2ZBxQ1kls4aftAaWy6YiY
 Igd+wowMWoJ4SyPGEG6BHMHGXa6jEqM0pCxEpVQpE4FMlkydW7GgssmWk/8lRXASjSsD
 8DKEiwHeDXnj3WTd6gzNcekJAvh7RtTUJw0zAIU6uhfMepddYWHdA216RUyVPb9fEgSy
 dOrKdhokjFqYbc2aO5RKxr4EATQzhGGO0TJP+BDPYNcfZwGP31Vmd1s+49xhXl5skN2C
 FrQVi57TH3AqTKSgjoiXh8MBZRpSluRonRyNypyxijFdTxsuIBR4F8MpLI5uXOoauxx7 +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dd5w3ge8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 09:05:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E9FF10002A;
 Wed,  5 Jan 2022 09:05:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F3602248A6;
 Wed,  5 Jan 2022 09:05:22 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 5 Jan
 2022 09:05:21 +0100
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20211222082349.30378-1-arnaud.pouliquen@foss.st.com>
 <20211222082349.30378-2-arnaud.pouliquen@foss.st.com>
 <20220104190810.GB540353@p14s>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <9f047c7b-a91c-9600-cdaf-7984ad7666f3@foss.st.com>
Date: Wed, 5 Jan 2022 09:05:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104190810.GB540353@p14s>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_02,2022-01-04_01,2021-12-02_01
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [RFC PATCH v2 1/6] remoteproc: core: Introduce
 virtio device add/remove functions
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

Hello Mathieu,

On 1/4/22 8:08 PM, Mathieu Poirier wrote:
> Good morning,
> 
> On Wed, Dec 22, 2021 at 09:23:44AM +0100, Arnaud Pouliquen wrote:
>> In preparation of the migration of the management of rvdev in
>> remoteproc_virtio.c, this patch spins off new functions to manage the
>> remoteproc virtio device.
>>
>> The rproc_rvdev_add_device and rproc_rvdev_remove_device will be
>> moved to remoteproc_virtio.c.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> update vs previous revision:
>>   - update according to the rebase from v15-rc1 to v16-rc1
>>   - split patch to introduce rproc_register_rvdev and rproc_unregister_rvdev
>>     function in a separate patch
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 94 +++++++++++++++++-----------
>>   1 file changed, 57 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 69f51acf235e..d1f1c5c25bd7 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -484,6 +484,61 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>>   	return 0;
>>   }
>>   
>> +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
>> +{
>> +	struct rproc *rproc = rvdev->rproc;
>> +	char name[16];
>> +	int ret;
>> +
>> +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>> +	rvdev->dev.parent = &rproc->dev;
>> +	rvdev->dev.release = rproc_rvdev_release;
>> +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>> +	dev_set_drvdata(&rvdev->dev, rvdev);
>> +
>> +	ret = device_register(&rvdev->dev);
>> +	if (ret) {
>> +		put_device(&rvdev->dev);
>> +		return ret;
>> +	}
> 
> Registering the device here is a problem...  If device_register() fails
> put_device() is called and we return, only to call device_unregister() on the
> same device in rproc_handle_vdev().
> 
> Moreover in rproc_handle_vdev(), device_unregister() is called in the error
> path but device_register() is called here in rproc_rvdev_add_device().  This
> introduces coupling between the two functions, making it hard to maintain from
> hereon.

Very relevant, I need to rework the error management.

> 
> I suggest calling device_register() in rproc_handle_vdev() after
> rproc_rvdev_add_device() has returned successfully.

One of the goals of this patchset is to move the device_register in 
remote_proc_virtio.c
Doing this would not go in this direction.

I need to test but following could be an alternative:
- Call rproc_rvdev_remove_device in rproc_handle_vdev in case of error.
- Remove the put_device in rproc_rvdev_add_device.

=> This would be aligned with patch [6/6] implementation
with rproc_virtio_register_device/rproc_virtio_unregister_device...

Thanks,
Arnaud

> 
> More comments to come tomorrow.
> 
> Thanks,
> Mathieu
> 
>> +	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
>> +	if (ret)
>> +		goto free_rvdev;
>> +
>> +	/* Make device dma capable by inheriting from parent's capabilities */
>> +	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
>> +
>> +	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
>> +					   dma_get_mask(rproc->dev.parent));
>> +	if (ret) {
>> +		dev_warn(&rvdev->dev,
>> +			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
>> +			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
>> +	}
>> +
>> +	list_add_tail(&rvdev->node, &rproc->rvdevs);
>> +
>> +	rvdev->subdev.start = rproc_vdev_do_start;
>> +	rvdev->subdev.stop = rproc_vdev_do_stop;
>> +
>> +	rproc_add_subdev(rproc, &rvdev->subdev);
>> +
>> +	return 0;
>> +
>> +free_rvdev:
>> +	device_unregister(&rvdev->dev);
>> +	return ret;
>> +}
>> +
>> +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
>> +{
>> +	struct rproc *rproc = rvdev->rproc;
>> +
>> +	rproc_remove_subdev(rproc, &rvdev->subdev);
>> +	list_del(&rvdev->node);
>> +	device_unregister(&rvdev->dev);
>> +}
>> +
>>   /**
>>    * rproc_handle_vdev() - handle a vdev fw resource
>>    * @rproc: the remote processor
>> @@ -519,7 +574,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>   	struct device *dev = &rproc->dev;
>>   	struct rproc_vdev *rvdev;
>>   	int i, ret;
>> -	char name[16];
>>   
>>   	/* make sure resource isn't truncated */
>>   	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
>> @@ -553,34 +607,10 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>   	rvdev->rproc = rproc;
>>   	rvdev->index = rproc->nb_vdev++;
>>   
>> -	/* Initialise vdev subdevice */
>> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>> -	rvdev->dev.parent = &rproc->dev;
>> -	rvdev->dev.release = rproc_rvdev_release;
>> -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>> -	dev_set_drvdata(&rvdev->dev, rvdev);
>> -
>> -	ret = device_register(&rvdev->dev);
>> -	if (ret) {
>> -		put_device(&rvdev->dev);
>> -		return ret;
>> -	}
>> -
>> -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
>> +	ret = rproc_rvdev_add_device(rvdev);
>>   	if (ret)
>>   		goto free_rvdev;
>>   
>> -	/* Make device dma capable by inheriting from parent's capabilities */
>> -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
>> -
>> -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
>> -					   dma_get_mask(rproc->dev.parent));
>> -	if (ret) {
>> -		dev_warn(dev,
>> -			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
>> -			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
>> -	}
>> -
>>   	/* parse the vrings */
>>   	for (i = 0; i < rsc->num_of_vrings; i++) {
>>   		ret = rproc_parse_vring(rvdev, rsc, i);
>> @@ -598,13 +628,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>   			goto unwind_vring_allocations;
>>   	}
>>   
>> -	list_add_tail(&rvdev->node, &rproc->rvdevs);
>> -
>> -	rvdev->subdev.start = rproc_vdev_do_start;
>> -	rvdev->subdev.stop = rproc_vdev_do_stop;
>> -
>> -	rproc_add_subdev(rproc, &rvdev->subdev);
>> -
>>   	return 0;
>>   
>>   unwind_vring_allocations:
>> @@ -619,7 +642,6 @@ void rproc_vdev_release(struct kref *ref)
>>   {
>>   	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
>>   	struct rproc_vring *rvring;
>> -	struct rproc *rproc = rvdev->rproc;
>>   	int id;
>>   
>>   	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
>> @@ -627,9 +649,7 @@ void rproc_vdev_release(struct kref *ref)
>>   		rproc_free_vring(rvring);
>>   	}
>>   
>> -	rproc_remove_subdev(rproc, &rvdev->subdev);
>> -	list_del(&rvdev->node);
>> -	device_unregister(&rvdev->dev);
>> +	rproc_rvdev_remove_device(rvdev);
>>   }
>>   
>>   /**
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
