Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA85F437BD7
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Oct 2021 19:25:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2401C5C85B;
	Fri, 22 Oct 2021 17:25:55 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BD0CC5C857
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 17:25:54 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id u6so3230932ple.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mw+HRTpCizRSush1bYJcwNpbU4lyMkXJCLmU1NuNo9I=;
 b=H9W58RxFjKyPmIR1s96jTDrDCVM6AvTKBZD+d5mrNXBvHCxNyScmjsHdFIlbsEDtAU
 vi7szoviYSoZCW7q30FkwalQWBs3jVXKEy+bwm2Ud71I5FWkgpotIQGgVvwRyiEJPgzp
 FAWC6EB8vcCzhVIU55uo7KFPPon/6j2j7S5cNngrG4oLXGym78HUnJSleUddeHV3nR0u
 ma2w8sBmZrG9xulErWnGiF/GVyeceEBbAWsBjPg9Z1OTEFQBQFZLux5Ys7QTXkL/6o+x
 h4dBtGHLPcfBVj9E2OXYQvX452N3TJwZ1BzN7j6Tzc1mSRoKLNXvyZ4ULxHS4PFnX6uy
 x9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mw+HRTpCizRSush1bYJcwNpbU4lyMkXJCLmU1NuNo9I=;
 b=UfjX/mzviEZJ0/GQZhPx/OU5304fbLjI8VEopAcYiLrvkXrcB8/2csuOozBDaNJ8tj
 MxfT67X8jLIi0zelSnV2BgZiCJXRmWhcEwnXHrFOgutcauFNzLmveP7F4AflranbegtY
 BkS5cIhHf9zmrj0jvrx5sVbxJg0LSkSX3Bjb+8EXnZgO8wwpc14VYdf0gHDVBxCpEcR2
 xtdOnwDslnIINKHJMrow3dvvaqu4BVeXeO3JYGl6p3HkvoUW4jbUnQiOeCe8u6t1UVtK
 S8Ofi+Lc49sV7prFV7v8XAhizSO8QyaHJQ1l7H5Ar7vUYYwCdZz7f+WPyoN6hBEjguoR
 aPVg==
X-Gm-Message-State: AOAM532ZkpVd5O6epcTWjHw4K26nOuF0UH8hbd2C1gaRTGfYWOGATMO9
 8kZ2sW++LoN0M0YOClAl3k8w6Q==
X-Google-Smtp-Source: ABdhPJyM662f62eKlRkfIzbTQRnfCtVX11iAhUuwPz23LMkEznsbOgZuei9vE3J5xoXgHGQgMRldxg==
X-Received: by 2002:a17:90b:1c06:: with SMTP id
 oc6mr16250572pjb.142.1634923552502; 
 Fri, 22 Oct 2021 10:25:52 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 23sm13443238pjc.37.2021.10.22.10.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 10:25:50 -0700 (PDT)
Date: Fri, 22 Oct 2021 11:25:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211022172548.GA3659113@p14s>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh@kernel.org>,
 Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christoph Hellwig <hch@lst.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH 2/7] remoteproc: Move rvdev management
	in rproc_virtio
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

More comments...

The title should probably be:

"remoteproc: Move rproc_vdev management to remoteproc_virtio.c"


On Fri, Oct 01, 2021 at 12:12:29PM +0200, Arnaud Pouliquen wrote:
> Move functions related to the management of the rproc_vdev
> structure in the remoteproc virtio.
> The aim is to decorrelate as possible the virtio management form

s/form/from

> the core part.
> 
> Due to the strong correlation between the vrings and the resource table
> the vrings management is kept in the remoteproc core.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 127 -----------------------
>  drivers/remoteproc/remoteproc_internal.h |  19 +++-
>  drivers/remoteproc/remoteproc_virtio.c   | 121 ++++++++++++++++++++-
>  3 files changed, 134 insertions(+), 133 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7c783ca291a7..67ccd088db8f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -434,119 +434,6 @@ void rproc_free_vring(struct rproc_vring *rvring)
>  	}
>  }
>  
> -static int rproc_vdev_do_start(struct rproc_subdev *subdev)
> -{
> -	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
> -
> -	return rproc_add_virtio_dev(rvdev, rvdev->id);
> -}
> -
> -static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
> -{
> -	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
> -	int ret;
> -
> -	ret = device_for_each_child(&rvdev->dev, NULL, rproc_remove_virtio_dev);
> -	if (ret)
> -		dev_warn(&rvdev->dev, "can't remove vdev child device: %d\n", ret);
> -}
> -
> -/**
> - * rproc_rvdev_release() - release the existence of a rvdev
> - *
> - * @dev: the subdevice's dev
> - */
> -static void rproc_rvdev_release(struct device *dev)
> -{
> -	struct rproc_vdev *rvdev = container_of(dev, struct rproc_vdev, dev);
> -
> -	of_reserved_mem_device_release(dev);
> -
> -	kfree(rvdev);
> -}
> -
> -static int copy_dma_range_map(struct device *to, struct device *from)
> -{
> -	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> -	int num_ranges = 0;
> -
> -	if (!map)
> -		return 0;
> -
> -	for (r = map; r->size; r++)
> -		num_ranges++;
> -
> -	new_map = kmemdup(map, array_size(num_ranges + 1, sizeof(*map)),
> -			  GFP_KERNEL);
> -	if (!new_map)
> -		return -ENOMEM;
> -	to->dma_range_map = new_map;
> -	return 0;
> -}
> -
> -static void rproc_register_rvdev(struct rproc_vdev *rvdev)
> -{
> -	if (rvdev && rvdev->rproc)
> -		list_add_tail(&rvdev->node, &rvdev->rproc->rvdevs);
> -}
> -
> -static void rproc_unregister_rvdev(struct rproc_vdev *rvdev)
> -{
> -	if (rvdev)
> -		list_del(&rvdev->node);
> -}
> -
> -static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> -{
> -	struct rproc *rproc = rvdev->rproc;
> -	char name[16];
> -	int ret;
> -
> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> -	rvdev->dev.parent = &rproc->dev;
> -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> -	if (ret)
> -		return ret;
> -
> -	rvdev->dev.release = rproc_rvdev_release;
> -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> -	dev_set_drvdata(&rvdev->dev, rvdev);
> -
> -	ret = device_register(&rvdev->dev);
> -	if (ret) {
> -		put_device(&rvdev->dev);
> -		return ret;
> -	}
> -	/* Make device dma capable by inheriting from parent's capabilities */
> -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> -
> -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> -					   dma_get_mask(rproc->dev.parent));
> -	if (ret) {
> -		dev_warn(&rvdev->dev,
> -			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
> -			 dma_get_mask(rproc->dev.parent), ret);
> -	}
> -
> -	rproc_register_rvdev(rvdev);
> -
> -	rvdev->subdev.start = rproc_vdev_do_start;
> -	rvdev->subdev.stop = rproc_vdev_do_stop;
> -
> -	rproc_add_subdev(rproc, &rvdev->subdev);
> -
> -	return 0;
> -}
> -
> -static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> -{
> -	struct rproc *rproc = rvdev->rproc;
> -
> -	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	rproc_unregister_rvdev(rvdev);
> -	device_unregister(&rvdev->dev);
> -}
> -
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -648,20 +535,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	return ret;
>  }
>  
> -void rproc_vdev_release(struct kref *ref)
> -{
> -	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> -	struct rproc_vring *rvring;
> -	int id;
> -
> -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> -		rvring = &rvdev->vring[id];
> -		rproc_free_vring(rvring);
> -	}
> -
> -	rproc_rvdev_remove_device(rvdev);
> -}
> -
>  /**
>   * rproc_handle_trace() - handle a shared trace buffer resource
>   * @rproc: the remote processor
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index a328e634b1de..152fe2e8668a 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -26,14 +26,13 @@ struct rproc_debug_trace {
>  
>  /* from remoteproc_core.c */
>  void rproc_release(struct kref *kref);
> -irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> -void rproc_vdev_release(struct kref *ref);
>  int rproc_of_parse_firmware(struct device *dev, int index,
>  			    const char **fw_name);
>  
>  /* from remoteproc_virtio.c */
> -int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id);
> -int rproc_remove_virtio_dev(struct device *dev, void *data);
> +int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
> +irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> +void rproc_vdev_release(struct kref *ref);
>  
>  /* from remoteproc_debugfs.c */
>  void rproc_remove_trace_file(struct dentry *tfile);
> @@ -196,4 +195,16 @@ bool rproc_u64_fit_in_size_t(u64 val)
>  	return (val <= (size_t) -1);
>  }
>  
> +static inline void rproc_register_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev && rvdev->rproc)
> +		list_add_tail(&rvdev->node, &rvdev->rproc->rvdevs);
> +}
> +
> +static inline void rproc_unregister_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev)
> +		list_del(&rvdev->node);
> +}
> +
>  #endif /* REMOTEPROC_INTERNAL_H */
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index cf4d54e98e6a..5e5a78b3243f 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -9,7 +9,9 @@
>   * Brian Swetland <swetland@google.com>
>   */
>  
> +#include <linux/dma-direct.h>
>  #include <linux/dma-map-ops.h>
> +#include <linux/dma-mapping.h>

Please see if either dma-direct.h and dma-mapping.h can be removed from
remoteproc_core.c

>  #include <linux/export.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/remoteproc.h>
> @@ -23,6 +25,25 @@
>  
>  #include "remoteproc_internal.h"
>  
> +static int copy_dma_range_map(struct device *to, struct device *from)
> +{
> +	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> +	int num_ranges = 0;
> +
> +	if (!map)
> +		return 0;
> +
> +	for (r = map; r->size; r++)
> +		num_ranges++;
> +
> +	new_map = kmemdup(map, array_size(num_ranges + 1, sizeof(*map)),
> +			  GFP_KERNEL);
> +	if (!new_map)
> +		return -ENOMEM;
> +	to->dma_range_map = new_map;
> +	return 0;
> +}
> +
>  /* kick the remote processor, and let it know which virtqueue to poke at */
>  static bool rproc_virtio_notify(struct virtqueue *vq)
>  {
> @@ -327,7 +348,7 @@ static void rproc_virtio_dev_release(struct device *dev)
>   *
>   * Return: 0 on success or an appropriate error value otherwise
>   */
> -int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> +static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  {
>  	struct rproc *rproc = rvdev->rproc;
>  	struct device *dev = &rvdev->dev;
> @@ -435,10 +456,106 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>   *
>   * Return: 0
>   */
> -int rproc_remove_virtio_dev(struct device *dev, void *data)
> +static int rproc_remove_virtio_dev(struct device *dev, void *data)
>  {
>  	struct virtio_device *vdev = dev_to_virtio(dev);
>  
>  	unregister_virtio_device(vdev);
>  	return 0;
>  }
> +
> +static int rproc_vdev_do_start(struct rproc_subdev *subdev)
> +{
> +	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
> +
> +	return rproc_add_virtio_dev(rvdev, rvdev->id);
> +}
> +
> +static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
> +{
> +	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
> +	int ret;
> +
> +	ret = device_for_each_child(&rvdev->dev, NULL, rproc_remove_virtio_dev);
> +	if (ret)
> +		dev_warn(&rvdev->dev, "can't remove vdev child device: %d\n", ret);
> +}
> +
> +/**
> + * rproc_rvdev_release() - release the existence of a rvdev
> + *
> + * @dev: the subdevice's dev
> + */
> +static void rproc_rvdev_release(struct device *dev)
> +{
> +	struct rproc_vdev *rvdev = container_of(dev, struct rproc_vdev, dev);
> +
> +	of_reserved_mem_device_release(dev);
> +
> +	kfree(rvdev);
> +}
> +
> +int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> +{
> +	struct rproc *rproc = rvdev->rproc;
> +	char name[16];
> +	int ret;
> +
> +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> +	rvdev->dev.parent = &rproc->dev;
> +	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> +	if (ret)
> +		return ret;
> +
> +	rvdev->dev.release = rproc_rvdev_release;
> +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> +	dev_set_drvdata(&rvdev->dev, rvdev);
> +
> +	ret = device_register(&rvdev->dev);
> +	if (ret) {
> +		put_device(&rvdev->dev);
> +		return ret;
> +	}
> +	/* Make device dma capable by inheriting from parent's capabilities */
> +	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> +
> +	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> +					   dma_get_mask(rproc->dev.parent));
> +	if (ret) {
> +		dev_warn(&rvdev->dev,
> +			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
> +			 dma_get_mask(rproc->dev.parent), ret);
> +	}
> +
> +	rproc_register_rvdev(rvdev);
> +
> +	rvdev->subdev.start = rproc_vdev_do_start;
> +	rvdev->subdev.stop = rproc_vdev_do_stop;
> +
> +	rproc_add_subdev(rproc, &rvdev->subdev);
> +
> +	return 0;
> +}
> +
> +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> +{
> +	struct rproc *rproc = rvdev->rproc;
> +
> +	rproc_remove_subdev(rproc, &rvdev->subdev);
> +	rproc_unregister_rvdev(rvdev);
> +	device_unregister(&rvdev->dev);
> +}
> +
> +void rproc_vdev_release(struct kref *ref)
> +{
> +	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> +	struct rproc_vring *rvring;
> +	int id;
> +
> +	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> +		rvring = &rvdev->vring[id];
> +		rproc_free_vring(rvring);
> +	}
> +
> +	rproc_rvdev_remove_device(rvdev);
> +}
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
