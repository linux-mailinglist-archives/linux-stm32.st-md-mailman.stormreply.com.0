Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF0A4CDC7B
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 19:29:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E53D8C5F1EE;
	Fri,  4 Mar 2022 18:29:49 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11CF5C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 18:29:49 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id e2so8486291pls.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Mar 2022 10:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eB1jIuAccQ4/HmBZop9BegzVAWQrTNNBpIbjngKx9XM=;
 b=JPFWcrCBsq29SFW0LwimNqZam9XVgkpDjl5BmHUu/5Pl6EfOFOII8keLdq9Z1oRGTx
 5jPtX6B5cGwHgoKxoyJsw0vfX7FH7iBvENyNFfUrrsBq32fMYZ8Idzqv+0gKz2it73VI
 dWOq0wEIFwmuq3DFVWsoEgF9Jp+h9fUktf82HxT7/cAlF1AtLt6nD7yahqOBcEtmXBrW
 cIHSyMmKq3AWrSF6J9W3iceUbNIeMjsWdLNJg//Y3eNuCga8Nv/fxwdXUhTkw3fLFcL9
 wwTLn5KLhQuNtcTxWb00dlmqowzsyWRvS5YD6HXFcxUVcht7VOBp48+v7BThMarw9Mg2
 rwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eB1jIuAccQ4/HmBZop9BegzVAWQrTNNBpIbjngKx9XM=;
 b=LZDIvZcyNUC3DHFfO5f6/paP+pXx/Os5rC/cRGyj57U2UIriydjBoOWNU6sQmjAyX5
 FxxhfJqBXeL5nn3nfKUH1tcJpoymISyB6EdaDAOvdJ9hS37dG1lBoWvvxadbdeLF02YW
 /k/zZ+SIpDQf5ugcqg1Ksn9cIfc8mZjSw/Sf/twzaQU2GhQdPcmZMIOB8HssRl38YqkQ
 8p8ntKxpQBq9XYZFo54/YX0a8BOvgJkpw3demKVYBkzZw/l8Giw+HRufgjlwC6+bfp1k
 VA2w0P4m9AwYkH9S0tToV3jCSPGTzNym+PwDuYrzBV+jg42oXyBf0O8/Tt0sWb594+Yh
 UY7A==
X-Gm-Message-State: AOAM530KdwNjxuKXwPHnvP+lLtxIZpSINH/M2pDpxHS07XC+7EuhHZ3M
 QJ5S1mKDHtk4A+r4xIfLZAWGuQ==
X-Google-Smtp-Source: ABdhPJwbd2ZkS01dwp3AFBUXPivo+wuGgeZK4FTBsRTVjobratgvXIhhED3IJBu5U4xPhcTmPyPTOg==
X-Received: by 2002:a17:90a:7147:b0:1bd:24ac:13bd with SMTP id
 g7-20020a17090a714700b001bd24ac13bdmr11964684pjs.70.1646418587477; 
 Fri, 04 Mar 2022 10:29:47 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a056a00231600b004e1784925e5sm6714404pfh.97.2022.03.04.10.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 10:29:46 -0800 (PST)
Date: Fri, 4 Mar 2022 11:29:44 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220304182944.GA1660165@p14s>
References: <20220126162405.1131323-1-arnaud.pouliquen@foss.st.com>
 <20220126162405.1131323-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126162405.1131323-2-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH v3 1/4] remoteproc: core: Introduce
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Good morning,

It took longer than expected to review this set as I wanted to make sure the
unwind path was handled properly.

On Wed, Jan 26, 2022 at 05:24:02PM +0100, Arnaud Pouliquen wrote:
> In preparation of the migration of the management of rvdev in
> remoteproc_virtio.c, this patch spins off new functions to manage the
> remoteproc virtio device.
>  - rproc_rvdev_add_device
>  - rproc_rvdev_remove_device
> 
> The rproc_rvdev_add_device and rproc_rvdev_remove_device will be
> moved to remoteproc_virtio.c.
> 
> The rproc_vdev_data structure is introduced to provide information for
> the rvdev creation. This structure allows to manage the rvdev and vrings
> allocation in the rproc_rvdev_add_device function.
> Then the rproc_vdev_data structure will be reused in a next patch as
> platform data structure when the rvdev will rely on a platform device.
>

The last sentence is not needed, please remove.

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> update vs previous revision:
>  - rework rproc_rvdev_add_device function to better manage error cases
> 	- introduce rproc_vdev_data struct
> 	- allocate rvdev in rproc_rvdev_add_device
> ---
>  drivers/remoteproc/remoteproc_core.c | 164 ++++++++++++++++-----------
>  1 file changed, 98 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 69f51acf235e..83ff44a6a4db 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -66,6 +66,13 @@ static const char * const rproc_crash_names[] = {
>  	[RPROC_FATAL_ERROR]	= "fatal error",
>  };
>  
> +struct rproc_vdev_data {
> +	struct fw_rsc_vdev *rsc;
> +	u32 rsc_offset;
> +	unsigned int id;
> +	unsigned int index;
> +};

Here this structure is introduced without documentation and in patch 3/4 it is
moved to remoteproc_internal.h where documentation is added.  Please added there
(with documentation) in the first place.  That way it doesn't have to be moved
again.

> +
>  /* translate rproc_crash_type to string */
>  static const char *rproc_crash_to_string(enum rproc_crash_type type)
>  {
> @@ -484,74 +491,23 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  	return 0;
>  }
>  
> -/**
> - * rproc_handle_vdev() - handle a vdev fw resource
> - * @rproc: the remote processor
> - * @ptr: the vring resource descriptor
> - * @offset: offset of the resource entry
> - * @avail: size of available data (for sanity checking the image)
> - *
> - * This resource entry requests the host to statically register a virtio
> - * device (vdev), and setup everything needed to support it. It contains
> - * everything needed to make it possible: the virtio device id, virtio
> - * device features, vrings information, virtio config space, etc...
> - *
> - * Before registering the vdev, the vrings are allocated from non-cacheable
> - * physically contiguous memory. Currently we only support two vrings per
> - * remote processor (temporary limitation). We might also want to consider
> - * doing the vring allocation only later when ->find_vqs() is invoked, and
> - * then release them upon ->del_vqs().
> - *
> - * Note: @da is currently not really handled correctly: we dynamically
> - * allocate it using the DMA API, ignoring requested hard coded addresses,
> - * and we don't take care of any required IOMMU programming. This is all
> - * going to be taken care of when the generic iommu-based DMA API will be
> - * merged. Meanwhile, statically-addressed iommu-based firmware images should
> - * use RSC_DEVMEM resource entries to map their required @da to the physical
> - * address of their base CMA region (ouch, hacky!).
> - *
> - * Return: 0 on success, or an appropriate error code otherwise
> - */
> -static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> -			     int offset, int avail)
> +static struct rproc_vdev *
> +rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  {
> -	struct fw_rsc_vdev *rsc = ptr;
> -	struct device *dev = &rproc->dev;
>  	struct rproc_vdev *rvdev;
> -	int i, ret;
> +	struct fw_rsc_vdev *rsc = rvdev_data->rsc;
>  	char name[16];
> -
> -	/* make sure resource isn't truncated */
> -	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> -			avail) {
> -		dev_err(dev, "vdev rsc is truncated\n");
> -		return -EINVAL;
> -	}
> -
> -	/* make sure reserved bytes are zeroes */
> -	if (rsc->reserved[0] || rsc->reserved[1]) {
> -		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
> -		return -EINVAL;
> -	}
> -
> -	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
> -		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
> -
> -	/* we currently support only two vrings per rvdev */
> -	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
> -		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
> -		return -EINVAL;
> -	}
> +	int i, ret;
>  
>  	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
>  	if (!rvdev)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	kref_init(&rvdev->refcount);
>  
> -	rvdev->id = rsc->id;
> +	rvdev->id = rvdev_data->id;
>  	rvdev->rproc = rproc;
> -	rvdev->index = rproc->nb_vdev++;
> +	rvdev->index = rvdev_data->index;
>  
>  	/* Initialise vdev subdevice */
>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> @@ -563,7 +519,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	ret = device_register(&rvdev->dev);
>  	if (ret) {
>  		put_device(&rvdev->dev);
> -		return ret;
> +		return ERR_PTR(ret);
>  	}
>  
>  	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> @@ -576,7 +532,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
>  					   dma_get_mask(rproc->dev.parent));
>  	if (ret) {
> -		dev_warn(dev,
> +		dev_warn(&rvdev->dev,
>  			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
>  			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
>  	}
> @@ -589,7 +545,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	}
>  
>  	/* remember the resource offset*/
> -	rvdev->rsc_offset = offset;
> +	rvdev->rsc_offset = rvdev_data->rsc_offset;
>  
>  	/* allocate the vring resources */
>  	for (i = 0; i < rsc->num_of_vrings; i++) {
> @@ -605,21 +561,20 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  
>  	rproc_add_subdev(rproc, &rvdev->subdev);
>  
> -	return 0;
> +	return rvdev;
>  
>  unwind_vring_allocations:
>  	for (i--; i >= 0; i--)
>  		rproc_free_vring(&rvdev->vring[i]);
>  free_rvdev:
>  	device_unregister(&rvdev->dev);
> -	return ret;
> +	return ERR_PTR(ret);
>  }
>  
> -void rproc_vdev_release(struct kref *ref)
> +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
>  {
> -	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> -	struct rproc_vring *rvring;
>  	struct rproc *rproc = rvdev->rproc;
> +	struct rproc_vring *rvring;
>  	int id;
>  
>  	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> @@ -632,6 +587,83 @@ void rproc_vdev_release(struct kref *ref)
>  	device_unregister(&rvdev->dev);
>  }
>  
> +/**
> + * rproc_handle_vdev() - handle a vdev fw resource
> + * @rproc: the remote processor
> + * @ptr: the vring resource descriptor
> + * @offset: offset of the resource entry
> + * @avail: size of available data (for sanity checking the image)
> + *
> + * This resource entry requests the host to statically register a virtio
> + * device (vdev), and setup everything needed to support it. It contains
> + * everything needed to make it possible: the virtio device id, virtio
> + * device features, vrings information, virtio config space, etc...
> + *
> + * Before registering the vdev, the vrings are allocated from non-cacheable
> + * physically contiguous memory. Currently we only support two vrings per
> + * remote processor (temporary limitation). We might also want to consider
> + * doing the vring allocation only later when ->find_vqs() is invoked, and
> + * then release them upon ->del_vqs().
> + *
> + * Note: @da is currently not really handled correctly: we dynamically
> + * allocate it using the DMA API, ignoring requested hard coded addresses,
> + * and we don't take care of any required IOMMU programming. This is all
> + * going to be taken care of when the generic iommu-based DMA API will be
> + * merged. Meanwhile, statically-addressed iommu-based firmware images should
> + * use RSC_DEVMEM resource entries to map their required @da to the physical
> + * address of their base CMA region (ouch, hacky!).
> + *
> + * Return: 0 on success, or an appropriate error code otherwise
> + */
> +static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> +			     int offset, int avail)
> +{
> +	struct fw_rsc_vdev *rsc = ptr;
> +	struct device *dev = &rproc->dev;
> +	struct rproc_vdev *rvdev;
> +	struct rproc_vdev_data rvdev_data;
> +
> +	/* make sure resource isn't truncated */
> +	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> +			avail) {
> +		dev_err(dev, "vdev rsc is truncated\n");
> +		return -EINVAL;
> +	}
> +
> +	/* make sure reserved bytes are zeroes */
> +	if (rsc->reserved[0] || rsc->reserved[1]) {
> +		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
> +		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
> +
> +	/* we currently support only two vrings per rvdev */
> +	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
> +		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
> +		return -EINVAL;
> +	}
> +
> +	rvdev_data.id = rsc->id;
> +	rvdev_data.index = rproc->nb_vdev++;
> +	rvdev_data.rsc_offset = offset;
> +	rvdev_data.rsc = rsc;
> +
> +	rvdev = rproc_rvdev_add_device(rproc, &rvdev_data);
> +	if (IS_ERR(rvdev))
> +		return PTR_ERR(rvdev);
> +
> +	return 0;
> +}
> +
> +void rproc_vdev_release(struct kref *ref)
> +{
> +	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> +
> +	rproc_rvdev_remove_device(rvdev);
> +}
> +
>  /**
>   * rproc_handle_trace() - handle a shared trace buffer resource
>   * @rproc: the remote processor
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
