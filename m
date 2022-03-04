Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5924CDCDF
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 19:45:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E219AC5F1EE;
	Fri,  4 Mar 2022 18:45:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A6C4C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 18:45:37 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so8775331pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Mar 2022 10:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a0xf08VgQlIyXvq/qoHa1zd0UTpSORuzD9oy7yswlRw=;
 b=hSHoBO3V/9GzKK2oP8zhuqozMGdKmPwUQba1Z8Ok27xduSI7GpIgYOejjWP3gYBlr9
 fIVt2D5mfXmt1/KcA8lfBYtZoxLkq5teCRz93YNMKu5iSLcKfBUsQNoU3OKNYhfwocj0
 EyKFu4sAZ2aicyfPn8O9sjB8J9iiF2r3fFOopgiOVaA4DQCKKocfJAyWqPxm3NlCF1Xp
 TG7dMSKi+n3WtJerLYw703Hv2ZbEF30KhY2RLzs2vJNCwKaj66tNJzurCDCS+w2FVG81
 VTcSMFRk5sRxOyB9zbjS1Goj3sYLMuGY5gQZk0zltas4ksqkJRKg9CLCI/DzNF7LAiWN
 yPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a0xf08VgQlIyXvq/qoHa1zd0UTpSORuzD9oy7yswlRw=;
 b=7K3XtvdNcIsqg7onAkhed5ktVVw5JCmx7aDElwpCAuIQ97/ODMOk/oo2axXSQqPFxQ
 +RhxZGqa3AXcCsqy/rzTPHX1ZJ36SVZZohcPNtRdvCxRuiPViGdCewKl0Zn+q07oYhFQ
 v2QKoBCIF/ludAbNp0AJJ9HNjFZc8OQ4HZTJJGUS2FIhFeAEazL0/1xWmeH5mxyPynm7
 E0qTv1+ewftrZwwzQvyfWHyCKzd2u/QLFOfHEYs3onIGGoxZ4MHRkFtfw2OegGiEbNIF
 ykd8bTkylT8WCBPYF8Qf4Cu4eRHcZFdBAniHzTdsYpBIXTlopln02d2CtG3ERA4G1qH1
 gARA==
X-Gm-Message-State: AOAM533DuMMNU/oCPtoO7PGYtwf5b9xVjpBpxIT2vyoxHhXAvPDHiAT1
 K7bMNcda7rLDItG/K+yHn4t0ww==
X-Google-Smtp-Source: ABdhPJxsHd2DpFBMvSua/z7XaXrxWlIv1qYY9Hcvcj1oqNaz0p6Y29Swa+JgeQXqq0L8QNMxZv/oDw==
X-Received: by 2002:a17:902:f686:b0:151:ca86:e1be with SMTP id
 l6-20020a170902f68600b00151ca86e1bemr1302268plg.16.1646419535856; 
 Fri, 04 Mar 2022 10:45:35 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056a00238400b004e10b67e658sm6752139pfc.3.2022.03.04.10.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 10:45:34 -0800 (PST)
Date: Fri, 4 Mar 2022 11:45:32 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220304184532.GC1660165@p14s>
References: <20220126162405.1131323-1-arnaud.pouliquen@foss.st.com>
 <20220126162405.1131323-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126162405.1131323-4-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH v3 3/4] remoteproc: Move rproc_vdev
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

On Wed, Jan 26, 2022 at 05:24:04PM +0100, Arnaud Pouliquen wrote:
> Move functions related to the management of the rproc_vdev
> structure in the remoteproc_virtio.c.
> The aim is to decorrelate as possible the virtio management from
> the core part.
> 
> Due to the strong correlation between the vrings and the resource table
> the rproc_alloc/parse/free_vring functions are kept in the remoteproc core.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 176 +----------------------
>  drivers/remoteproc/remoteproc_internal.h |  36 ++++-
>  drivers/remoteproc/remoteproc_virtio.c   | 166 ++++++++++++++++++++-
>  3 files changed, 197 insertions(+), 181 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7a091f860c82..eb6b43b71c2b 100644
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
> @@ -66,13 +64,6 @@ static const char * const rproc_crash_names[] = {
>  	[RPROC_FATAL_ERROR]	= "fatal error",
>  };
>  
> -struct rproc_vdev_data {
> -	struct fw_rsc_vdev *rsc;
> -	u32 rsc_offset;
> -	unsigned int id;
> -	unsigned int index;
> -};

I have already commented on that one.

> -
>  /* translate rproc_crash_type to string */
>  static const char *rproc_crash_to_string(enum rproc_crash_type type)
>  {
> @@ -390,7 +381,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	return 0;
>  }
>  
> -static int
> +int
>  rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i)
>  {
>  	struct rproc *rproc = rvdev->rproc;
> @@ -441,164 +432,6 @@ void rproc_free_vring(struct rproc_vring *rvring)
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
> -static void rproc_register_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> -{
> -	if (rvdev && rproc)
> -		list_add_tail(&rvdev->node, &rproc->rvdevs);
> -}
> -
> -static void rproc_unregister_rvdev(struct rproc_vdev *rvdev)
> -{
> -	if (rvdev)
> -		list_del(&rvdev->node);
> -}

Why are these moved to rproc_internal.h?  To me this should stay in
remoteproc_core.c.

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
> -	rproc_register_rvdev(rproc, rvdev);
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
> -	rproc_unregister_rvdev(rvdev);
> -	device_unregister(&rvdev->dev);
> -}
> -
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -669,13 +502,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
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
> index a328e634b1de..7725b404afc6 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -24,16 +24,31 @@ struct rproc_debug_trace {
>  	struct rproc_mem_entry trace_mem;
>  };
>  
> +/**
> + * struct rproc_vdev_data - remoteproc virtio device data
> + * @rsc_offset: offset of the vdev's resource entry
> + * @id: virtio device id (as in virtio_ids.h)
> + * @index: vdev position versus other vdev declared in resource table
> + * @rsc: pointer to the vdev resource entry. Valid onlyduring vdev init as the resource can
> + *       be cached by rproc.
> + */
> +struct rproc_vdev_data {
> +	u32 rsc_offset;
> +	unsigned int id;
> +	unsigned int index;
> +	struct fw_rsc_vdev *rsc;
> +};
> +
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
> +irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> +void rproc_vdev_release(struct kref *ref);
>  
>  /* from remoteproc_debugfs.c */
>  void rproc_remove_trace_file(struct dentry *tfile);
> @@ -83,6 +98,7 @@ static inline void  rproc_char_device_remove(struct rproc *rproc)
>  
>  void rproc_free_vring(struct rproc_vring *rvring);
>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
> +int rproc_parse_vring(struct rproc_vdev *rvdev, struct fw_rsc_vdev *rsc, int i);
>  
>  void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
> @@ -196,4 +212,16 @@ bool rproc_u64_fit_in_size_t(u64 val)
>  	return (val <= (size_t) -1);
>  }
>  
> +static inline void rproc_register_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> +{
> +	if (rvdev && rproc)
> +		list_add_tail(&rvdev->node, &rproc->rvdevs);
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
> index 70ab496d0431..1c4fd79ac1c5 100644
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
> @@ -447,10 +468,151 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
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
> +	rproc_register_rvdev(rproc, rvdev);
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
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
