Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C6581719
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jul 2022 18:15:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D11CC640EF;
	Tue, 26 Jul 2022 16:15:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC88BC035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jul 2022 16:15:43 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so13750493pjl.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jul 2022 09:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RbbJRiZWLE14OI0Iog5V2+USzqv/CchO2MI4brfyHQY=;
 b=Z0h4uq3lq/pkN9tJP5MUU6WCKlSXK7kvINRztsQuSK/dNMWCWhPgpY4ZXiRTT80Lia
 MbQYSLCvbpQQP55Aqwx6u9aRYwMk3PxLkpymyfc8MDWlKYbPT63GrGn0MYLw3zEUiVQJ
 hbvxM001kgSQOmVQunEiVgztdJz1fGgglt21AbbuHYRRcUqAVymay4FvOkLb4Xrrtd0P
 k4RQHMQOCA/ZCMrHxT+ASHV9bXwNtINeM8nxxHcPWCTW6D6dB0qlIzEqHkgbzbYo3TlF
 a2fNdeqcRb98t8jqt2OhxTrUsqpZCBHVqe03987MoDS4NJGq+WekMTsn2J8RsGgcrc6q
 bf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RbbJRiZWLE14OI0Iog5V2+USzqv/CchO2MI4brfyHQY=;
 b=ISmS7W+U9oZP0m+rG3PWoPLC17+38HofiR815jdqD1HfD+bLDOZEZtXg3C9z3mvtpz
 eWCPjTmAgWfFfhQJbFrLQ/qQgCIBudvjRkXC738OFo/blaQAX6k7ATrUJExe2TSjJuz4
 sJhKc4fuMaJQQxLJA0oWzVo0rVhpFYgbQSHA9GcvDubUusiZDLOB2nI/xX95CzhpT93v
 wR3kwJq7qMdHatG95101E0bhMK//Ye6VaokHs9Awnd3uHzIt6QsSUdnLVNH2iXrR8Tl5
 1IY2b2H9BdGZzFnwjlUooJvdAJaRrZb/TFqE9hhfcPycR/qG6APLaSz6gk7DcpTdMMir
 mCZg==
X-Gm-Message-State: AJIora872+FDWY5xnMm+NYFs6WybSGpnuCQQzHMmcEpwduSto7YW9Thi
 KrfVBUC+GLPvXgHCp+9jtwlefQ==
X-Google-Smtp-Source: AGRyM1uHPvfpKKKnzKGEaAj85DYimjpGL/QBy03PEyfb111VKQ2dvtwdrN0sLNmkalsx6fCVcMVPbg==
X-Received: by 2002:a17:902:e945:b0:16b:f802:1660 with SMTP id
 b5-20020a170902e94500b0016bf8021660mr17772012pll.7.1658852142181; 
 Tue, 26 Jul 2022 09:15:42 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 x21-20020aa79ad5000000b00528a097aeffsm11855385pfp.118.2022.07.26.09.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 09:15:41 -0700 (PDT)
Date: Tue, 26 Jul 2022 10:15:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220726161538.GA15392@p14s>
References: <20220713113612.2117279-1-arnaud.pouliquen@foss.st.com>
 <20220713113612.2117279-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713113612.2117279-2-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v7 1/4] remoteproc: core: Introduce
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

On Wed, Jul 13, 2022 at 01:36:09PM +0200, Arnaud Pouliquen wrote:
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
> update vs previous revision:
> The update are based on Mathieu Poirier's comments.
>   - fix typo s/onlyduring/only during
> ---
>  drivers/remoteproc/remoteproc_core.c     | 145 +++++++++++++----------
>  drivers/remoteproc/remoteproc_internal.h |  15 +++
>  2 files changed, 97 insertions(+), 63 deletions(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 02a04ab34a23..f328d45d8376 100644
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
> index 72d4d3d7d94d..07c503de0f95 100644
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
> + * @rsc: pointer to the vdev resource entry. Valid only during vdev init as
> + *       the resource can be cached by rproc.
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
