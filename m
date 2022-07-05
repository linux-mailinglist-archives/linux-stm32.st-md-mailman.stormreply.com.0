Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF615673D4
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jul 2022 18:07:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2EDCC640F7;
	Tue,  5 Jul 2022 16:07:29 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70CB9C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jul 2022 16:07:28 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id a15so11888605pfv.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Jul 2022 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tnpHOyMy2L8MIueTTknfNY3zfZKOPTJOL3NOjawJZeM=;
 b=R0KlXxCAWYQcxUuZGUnU11LOz02EdcdWeN6wYWFlwtgVLKy93dBmCakldVrkRvhY50
 Q6hYKFTFUzhMxSNMeULISp2V/VGklLClo/A9z2Cn5xuSd0WLtDGLR1qMe0jKPZtrknd1
 KT10cjgIFz+0DTDOSyl2VYwhrnyKA3ylutTUsWVatf5Al0t2cdvZSYsHIWd+5n7dVHc9
 t4K/7B1AvME1dLc9fahPCb5k4B1ycwMfpZoLdo4l0kZ0sfiFDPBjM+CGCo4cJQnJdK4w
 KyWdJMX0YWBPK1dCrMohCYEl4hygHuTPnDUojfc8igl3HE7CIVTgM4ebJXJvEO3bn1Bs
 8m7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tnpHOyMy2L8MIueTTknfNY3zfZKOPTJOL3NOjawJZeM=;
 b=E399mOuwHIfmxJxEKDx5dR07VBmHjzV8vSHza5ZUC5XveM3bx7IVzzZkE/Yg/CxvNw
 zfQOwaaecQJKOJtADn8uLC2XiouLMUmO1UxkndQ5UGac0LjX+ZFQW1fQN/XzwHARkxSA
 ob37R7EFDbx/n2+silyl9RwZWhxPh6SoU/JQwg3HfAgl9W9YI3vMK3Rl6MYmwG2eN/mT
 BOJoQAqTieumAsrum97D+2m4XodvV6YIl9lbcrI/f2L+QEE7vFhOHiOGbez8dbf+Kn1O
 ffa3aOi77jRwl3RukAqEwNbZKQxknWQjcvF9mP0nT4cpx1htflXJA96S8a8qzsufrmzo
 d3hA==
X-Gm-Message-State: AJIora9UEfIY7+uPNoVFcqSURipvieF3XaCGu9ePWUF7dkmMTMv+HY6M
 jflRPfy5Ovf1yJ86Tm20k7pDXA==
X-Google-Smtp-Source: AGRyM1tfczaygxu2jMacj8lrwNyXeNo954SxBZR7cjSHUqrgdTctpgnfntg/oG46HF/N9Dm4d5jzWA==
X-Received: by 2002:a05:6a00:cce:b0:525:79b5:588c with SMTP id
 b14-20020a056a000cce00b0052579b5588cmr42452769pfv.19.1657037246934; 
 Tue, 05 Jul 2022 09:07:26 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a170902f54100b0016223016d79sm4695088plf.90.2022.07.05.09.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 09:07:25 -0700 (PDT)
Date: Tue, 5 Jul 2022 10:07:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220705160722.GB2440144@p14s>
References: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
 <20220406095446.1187968-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406095446.1187968-4-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH v5 3/4] remoteproc: Move rproc_vdev
 management to remoteproc_virtio.c
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

On Wed, Apr 06, 2022 at 11:54:45AM +0200, Arnaud Pouliquen wrote:
> Move functions related to the management of the rproc_vdev
> structure in the remoteproc_virtio.c.
> The aim is to decorrelate as possible the virtio management from
> the core part.
> 
> Due to the strong correlation between the vrings and the resource table
> the rproc_alloc/parse/free_vring functions are kept in the remoteproc core.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> Update vs previous revision:
>  - clean up bad rproc_free_vring call in rproc_vdev_release

Stale comment.  What has changed in this revision is that
rproc_rvdev_remove_device() has been dropped.

> ---
>  drivers/remoteproc/remoteproc_core.c     | 162 +----------------------
>  drivers/remoteproc/remoteproc_internal.h |  11 +-
>  drivers/remoteproc/remoteproc_virtio.c   | 159 +++++++++++++++++++++-
>  3 files changed, 167 insertions(+), 165 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 081bea39daf4..bd6d3f2decc6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -23,9 +23,7 @@
>  #include <linux/panic_notifier.h>
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
> -#include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
> -#include <linux/dma-direct.h> /* XXX: pokes into bus_dma_range */
>  #include <linux/firmware.h>
>  #include <linux/string.h>
>  #include <linux/debugfs.h>
> @@ -383,7 +381,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	return 0;
>  }
>  
> -static int
> +int
>  rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
>  {
>  	struct rproc *rproc = rvdev->rproc;
> @@ -434,164 +432,17 @@ void rproc_free_vring(struct rproc_vring *rvring)
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
> -static void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> +void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
>  {
>  	if (rvdev && rproc)
>  		list_add_tail(&rvdev->node, &rproc->rvdevs);
>  }
>  
> -static void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> +void rproc_remove_rvdev(struct rproc_vdev *rvdev)
>  {
>  	if (rvdev)
>  		list_del(&rvdev->node);
>  }
> -
> -static struct rproc_vdev *
> -rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
> -{
> -	struct rproc_vdev *rvdev;
> -	struct fw_rsc_vdev *rsc = rvdev_data->rsc;
> -	char name[16];
> -	int i, ret;
> -
> -	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
> -	if (!rvdev)
> -		return ERR_PTR(-ENOMEM);
> -
> -	kref_init(&rvdev->refcount);
> -
> -	rvdev->id = rvdev_data->id;
> -	rvdev->rproc = rproc;
> -	rvdev->index = rvdev_data->index;
> -
> -	/* Initialise vdev subdevice */
> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> -	rvdev->dev.parent = &rproc->dev;
> -	rvdev->dev.release = rproc_rvdev_release;
> -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> -	dev_set_drvdata(&rvdev->dev, rvdev);
> -
> -	ret = device_register(&rvdev->dev);
> -	if (ret) {
> -		put_device(&rvdev->dev);
> -		return ERR_PTR(ret);
> -	}
> -
> -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> -	if (ret)
> -		goto free_rvdev;
> -
> -	/* Make device dma capable by inheriting from parent's capabilities */
> -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> -
> -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> -					   dma_get_mask(rproc->dev.parent));
> -	if (ret) {
> -		dev_warn(&rvdev->dev,
> -			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> -			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> -	}
> -
> -	/* parse the vrings */
> -	for (i = 0; i < rsc->num_of_vrings; i++) {
> -		ret = rproc_parse_vring(rvdev, rsc, i);
> -		if (ret)
> -			goto free_rvdev;
> -	}
> -
> -	/* remember the resource offset*/
> -	rvdev->rsc_offset = rvdev_data->rsc_offset;
> -
> -	/* allocate the vring resources */
> -	for (i = 0; i < rsc->num_of_vrings; i++) {
> -		ret = rproc_alloc_vring(rvdev, i);
> -		if (ret)
> -			goto unwind_vring_allocations;
> -	}
> -
> -	rproc_add_rvdev(rproc, rvdev);
> -
> -	rvdev->subdev.start = rproc_vdev_do_start;
> -	rvdev->subdev.stop = rproc_vdev_do_stop;
> -
> -	rproc_add_subdev(rproc, &rvdev->subdev);
> -
> -	return rvdev;
> -
> -unwind_vring_allocations:
> -	for (i--; i >= 0; i--)
> -		rproc_free_vring(&rvdev->vring[i]);
> -free_rvdev:
> -	device_unregister(&rvdev->dev);
> -	return ERR_PTR(ret);
> -}
> -
> -static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> -{
> -	struct rproc *rproc = rvdev->rproc;
> -	struct rproc_vring *rvring;
> -	int id;
> -
> -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> -		rvring = &rvdev->vring[id];
> -		rproc_free_vring(rvring);
> -	}
> -
> -	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	rproc_remove_rvdev(rvdev);
> -	device_unregister(&rvdev->dev);
> -}
> -
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -662,13 +513,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	return 0;
>  }
>  
> -void rproc_vdev_release(struct kref *ref)
> -{
> -	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> -
> -	rproc_rvdev_remove_device(rvdev);
> -}
> -
>  /**
>   * rproc_handle_trace() - handle a shared trace buffer resource
>   * @rproc: the remote processor
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 99f2ff88079f..f82f9a5378ae 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -41,14 +41,14 @@ struct rproc_vdev_data {
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
> +struct rproc_vdev *rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data);
> +void rproc_rvdev_remove_device(struct rproc_vdev *rvdev);

Stale

> +irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> +void rproc_vdev_release(struct kref *ref);
>  
>  /* from remoteproc_debugfs.c */
>  void rproc_remove_trace_file(struct dentry *tfile);
> @@ -98,6 +98,7 @@ static inline void  rproc_char_device_remove(struct rproc *rproc)
>  
>  void rproc_free_vring(struct rproc_vring *rvring);
>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
> +int rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i);
>  
>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>  int rproc_trigger_recovery(struct rproc *rproc);
> @@ -110,6 +111,8 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>  						       const struct firmware *fw);
>  struct rproc_mem_entry *
>  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> +void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
> +void rproc_remove_rvdev(struct rproc_vdev *rvdev);
>  
>  static inline int rproc_prepare_device(struct rproc *rproc)
>  {
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 70ab496d0431..e2e796ab2fd8 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -9,7 +9,9 @@
>   * Brian Swetland <swetland@google.com>
>   */
>  
> +#include <linux/dma-direct.h>
>  #include <linux/dma-map-ops.h>
> +#include <linux/dma-mapping.h>
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
>  static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
>  {
>  	return container_of(vdev->dev.parent, struct rproc_vdev, dev);
> @@ -339,7 +360,7 @@ static void rproc_virtio_dev_release(struct device *dev)
>   *
>   * Return: 0 on success or an appropriate error value otherwise
>   */
> -int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> +static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  {
>  	struct rproc *rproc = rvdev->rproc;
>  	struct device *dev = &rvdev->dev;
> @@ -447,10 +468,144 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
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
> +struct rproc_vdev *
> +rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
> +{
> +	struct rproc_vdev *rvdev;
> +	struct fw_rsc_vdev *rsc = rvdev_data->rsc;
> +	char name[16];
> +	int i, ret;
> +
> +	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
> +	if (!rvdev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&rvdev->refcount);
> +
> +	rvdev->id = rvdev_data->id;
> +	rvdev->rproc = rproc;
> +	rvdev->index = rvdev_data->index;
> +
> +	/* Initialise vdev subdevice */
> +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> +	rvdev->dev.parent = &rproc->dev;
> +	rvdev->dev.release = rproc_rvdev_release;
> +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> +	dev_set_drvdata(&rvdev->dev, rvdev);
> +
> +	ret = device_register(&rvdev->dev);
> +	if (ret) {
> +		put_device(&rvdev->dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> +	if (ret)
> +		goto free_rvdev;
> +
> +	/* Make device dma capable by inheriting from parent's capabilities */
> +	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> +
> +	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> +					   dma_get_mask(rproc->dev.parent));
> +	if (ret) {
> +		dev_warn(&rvdev->dev,
> +			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> +			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> +	}
> +
> +	/* parse the vrings */
> +	for (i = 0; i < rsc->num_of_vrings; i++) {
> +		ret = rproc_parse_vring(rvdev, rsc, i);
> +		if (ret)
> +			goto free_rvdev;
> +	}
> +
> +	/* remember the resource offset*/
> +	rvdev->rsc_offset = rvdev_data->rsc_offset;
> +
> +	/* allocate the vring resources */
> +	for (i = 0; i < rsc->num_of_vrings; i++) {
> +		ret = rproc_alloc_vring(rvdev, i);
> +		if (ret)
> +			goto unwind_vring_allocations;
> +	}
> +
> +	rproc_add_rvdev(rproc, rvdev);
> +
> +	rvdev->subdev.start = rproc_vdev_do_start;
> +	rvdev->subdev.stop = rproc_vdev_do_stop;
> +
> +	rproc_add_subdev(rproc, &rvdev->subdev);
> +
> +	return rvdev;
> +
> +unwind_vring_allocations:
> +	for (i--; i >= 0; i--)
> +		rproc_free_vring(&rvdev->vring[i]);
> +free_rvdev:
> +	device_unregister(&rvdev->dev);
> +	return ERR_PTR(ret);
> +}
> +
> +void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> +{
> +	struct rproc *rproc = rvdev->rproc;
> +	struct rproc_vring *rvring;
> +	int id;
> +
> +	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> +		rvring = &rvdev->vring[id];
> +		rproc_free_vring(rvring);
> +	}
> +
> +	rproc_remove_subdev(rproc, &rvdev->subdev);
> +	rproc_remove_rvdev(rvdev);
> +	device_unregister(&rvdev->dev);
> +}
> +
> +void rproc_vdev_release(struct kref *ref)
> +{
> +	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> +
> +	rproc_rvdev_remove_device(rvdev);
> +}
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
