Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D58565D44
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 20:00:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47BDAC640EF;
	Mon,  4 Jul 2022 18:00:49 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EEC7C640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 18:00:47 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso4978244pjo.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jul 2022 11:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m7UJ+YG5CXHk/LR6YSJUbKvXt0/M9BLJzyNtxtftuDs=;
 b=lCJqce/AmmNuefMQS0l5Lc63NRUef3tEkehYhM0q6WPX3fsdGV00lIPwu+YIvNfe3I
 z+vZkiC2iaQyT4tjJxYoZ0BD1aO4RC3OvwJy4lydHDeOTzvG2UZ+4lI2nEn0t6qO5H0N
 qsc4HMlCyOO0ISj1ciw3FJm+w9RQ/xI6HuVYq/FmXgYWVFrZnlTkpOmGTwy9P7KVFXj2
 M6+s30FCM3Bu6dX1YhYZ5jkDVD+9jkR78FpnL98WM5swYTwPK9SMiDD9z0zl8la3o6G5
 mtM5uW82rR7QIep1kJERLhJtgw4UcV6/fm+BqRFBs0UzrRLYLkvnzw/Gh0e/FFzL/6rU
 9VEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m7UJ+YG5CXHk/LR6YSJUbKvXt0/M9BLJzyNtxtftuDs=;
 b=ymr/S7OknQyfGoHmnF/iJUZkkwSG1aCm3wMioo897bnpDayvqyQENYwJtAG4qyyyuQ
 +IzTy7edI+YlkrSWNx4WIdB7gKearjwYSqmzSLSlxcIqBozOASOxWlk7SkItpJ9fRx2x
 Ok/GyDXyCsU7UwWRGqomwm0GhyzeG7BWXRFYN5tuO1L8mxFxu3ksXSkTWRFDBoHpw0tf
 znmrFykk7aamwruM1JlKly+5XUvM7KmpsETVxnzJiS4SCe4/x5qRW5mS7gwHI5PxbbY+
 drQPtZv9zif7dus30BBpDcq7whOBmqZa3qAlRwvTjhtZdEe/u2lsfzHIQXI0xyBYImlD
 ecyQ==
X-Gm-Message-State: AJIora+Rc3coeooXhZNyXCFMXwhoARaxaLN+zl+pVGqrXi2ZOPj6xvtQ
 w6oXNClqfaqQxTMaMiP4aSVd+06mkrm8wA==
X-Google-Smtp-Source: AGRyM1vS4WoOBYR1kjgATDREJnIY0Lh1WxfImEtlm8sicCq+0ROl94da+SVFAX4uUKmOj1LWnuynuQ==
X-Received: by 2002:a17:902:c3c1:b0:16a:14bd:8b19 with SMTP id
 j1-20020a170902c3c100b0016a14bd8b19mr36346350plj.152.1656957645747; 
 Mon, 04 Jul 2022 11:00:45 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a170902768c00b0016a17da4ad4sm21484231pll.39.2022.07.04.11.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 11:00:44 -0700 (PDT)
Date: Mon, 4 Jul 2022 12:00:42 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220704180042.GD2375750@p14s>
References: <20220603163158.612513-1-arnaud.pouliquen@foss.st.com>
 <20220603163158.612513-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603163158.612513-2-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 1/4] remoteproc: core: Introduce
 rproc_rvdev_add_device function
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

On Fri, Jun 03, 2022 at 06:31:55PM +0200, Arnaud Pouliquen wrote:
> In preparation of the migration of the management of rvdev in
> remoteproc_virtio.c, this patch spins off a new function to manage the
> remoteproc virtio device creation.
> 
> The rproc_rvdev_add_device will be moved to remoteproc_virtio.c.
> 
> The rproc_vdev_data structure is introduced to provide information for
> the rvdev creation. This structure allows to manage the rvdev and vrings
> allocation in the rproc_rvdev_add_device function.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates vs previous revision (based on Mathieu Poirier's comments):
>   - rproc_vdev_data struct change index field type to u32
>   - remove rproc_rvdev_remove_device function creation
> ---
>  drivers/remoteproc/remoteproc_core.c     | 145 +++++++++++++----------
>  drivers/remoteproc/remoteproc_internal.h |  15 +++
>  2 files changed, 97 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c510125769b9..c438c32f7f0d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -484,74 +484,23 @@ static int copy_dma_range_map(struct device *to, struct device *from)
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
> @@ -563,7 +512,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	ret = device_register(&rvdev->dev);
>  	if (ret) {
>  		put_device(&rvdev->dev);
> -		return ret;
> +		return ERR_PTR(ret);
>  	}
>  
>  	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> @@ -576,7 +525,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
>  					   dma_get_mask(rproc->dev.parent));
>  	if (ret) {
> -		dev_warn(dev,
> +		dev_warn(&rvdev->dev,
>  			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
>  			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
>  	}
> @@ -589,7 +538,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	}
>  
>  	/* remember the resource offset*/
> -	rvdev->rsc_offset = offset;
> +	rvdev->rsc_offset = rvdev_data->rsc_offset;
>  
>  	/* allocate the vring resources */
>  	for (i = 0; i < rsc->num_of_vrings; i++) {
> @@ -605,14 +554,14 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
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
>  void rproc_vdev_release(struct kref *ref)
> @@ -632,6 +581,76 @@ void rproc_vdev_release(struct kref *ref)
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
>  /**
>   * rproc_handle_trace() - handle a shared trace buffer resource
>   * @rproc: the remote processor
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 72d4d3d7d94d..caa1ef91be14 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -24,6 +24,21 @@ struct rproc_debug_trace {
>  	struct rproc_mem_entry trace_mem;
>  };
>  
> +/**
> + * struct rproc_vdev_data - remoteproc virtio device data
> + * @rsc_offset: offset of the vdev's resource entry
> + * @id: virtio device id (as in virtio_ids.h)
> + * @index: vdev position versus other vdev declared in resource table
> + * @rsc: pointer to the vdev resource entry. Valid onlyduring vdev init as the resource can

s/onlyduring/only during

More comments coming tomorrow.

> + *       be cached by rproc.
> + */
> +struct rproc_vdev_data {
> +	u32 rsc_offset;
> +	unsigned int id;
> +	u32 index;
> +	struct fw_rsc_vdev *rsc;
> +};
> +
>  /* from remoteproc_core.c */
>  void rproc_release(struct kref *kref);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> -- 
> 2.24.3
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
