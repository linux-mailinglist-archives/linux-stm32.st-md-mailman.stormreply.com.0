Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF6853BD96
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jun 2022 19:52:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7869BC5A4FD;
	Thu,  2 Jun 2022 17:52:54 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82E39C03FDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 17:52:52 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so5449779pjs.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jun 2022 10:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ko+axperdAcOpFMYehmhTWPZN9HeLgqYZeYwzStaP6I=;
 b=Ue4WhhzDJFkHIN1VJc2GSKh1TPJVyuDUDJuLUx1wmSrErbVdLD3IFZMoq6dhNnG+m+
 +ssmCXBH/QO9zfoxlRWshp2b5hHWZtuQ1OzZLVwehYNd0dayYLm0u9zx4hlhyGWxN8kl
 2GbUvx/8xo1SbeggwmRzp79xz1/s1FCDb6TD2hm165FhRFE8XRIrXMSlKFjpNj3xanO6
 BNTN3IFZ5jVnYtQZvBp9rbmocpjoAtShNcLyz6xKLQdTeWk1wxS59WcGoI+n8Iw+DfZm
 rhTpWSZtLEoQG9fGSpbZu5gC8XuRujzdPrRAjTAsEGa0DDVK147FH4x63nhCZ3H39Od9
 kbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ko+axperdAcOpFMYehmhTWPZN9HeLgqYZeYwzStaP6I=;
 b=UldUWmgwpn+QLKXYH2HE6N75E9ZxjPZ+JPdfcIArE+QpAaSXQwcHHKjeoCHaLIFCOx
 hE0JPawTiGEE0FIkxTFcZ2yRzegmQx8AaFS8oUJOAAJpksomS9iEULLrr6T+P8AxWtQo
 8u+4VHIMpZ8cXNQA1WHyTcRkq9SZhZU5rvRxlD6WGEDKqK5mypK8l7G6xG08JNTUhSu1
 Gw+8SuqDAJ1jzREkZvv0w1QrdqzIum9tsayJRH0a2tEeE2UugcucYg3qLUkpDFjamqYQ
 ieSPa0rgat4FvmA9jZhlTAoY24lCbBey8vgIL9WWJluISpOPgid0Lq5auqvvAoB7j2yb
 hNhQ==
X-Gm-Message-State: AOAM530lvQ8w2FI0A/UGnqv07v1SV0Bgz/Coh6EdOGexCwe8YO0NQMZd
 luaBPdunDRpR/uJnmGFrgO8x7A==
X-Google-Smtp-Source: ABdhPJw82gzDRgc/jqEwmviKfwAtzlGVYCxxEXN+LIVDEDas0B9C092C8kuVGQdPI8NUuBSODlq5aQ==
X-Received: by 2002:a17:90b:4d11:b0:1dc:ec4f:a19c with SMTP id
 mw17-20020a17090b4d1100b001dcec4fa19cmr41129344pjb.117.1654192371140; 
 Thu, 02 Jun 2022 10:52:51 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 a25-20020aa78659000000b005187eb4194esm3792806pfo.118.2022.06.02.10.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 10:52:49 -0700 (PDT)
Date: Thu, 2 Jun 2022 11:52:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220602175247.GG531268@p14s>
References: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
 <20220406095446.1187968-2-arnaud.pouliquen@foss.st.com>
 <20220601172945.GC531268@p14s> <20220602175152.GF531268@p14s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220602175152.GF531268@p14s>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH v5 1/4] remoteproc: core: Introduce
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

On Thu, Jun 02, 2022 at 11:51:52AM -0600, Mathieu Poirier wrote:
> On Wed, Jun 01, 2022 at 11:29:45AM -0600, Mathieu Poirier wrote:
> > On Wed, Apr 06, 2022 at 11:54:43AM +0200, Arnaud Pouliquen wrote:
> > > In preparation of the migration of the management of rvdev in
> > > remoteproc_virtio.c, this patch spins off new functions to manage the
> > > remoteproc virtio device.
> > >  - rproc_rvdev_add_device
> > >  - rproc_rvdev_remove_device
> > > 
> > > The rproc_rvdev_add_device and rproc_rvdev_remove_device will be
> > > moved to remoteproc_virtio.c.
> > > 
> > > The rproc_vdev_data structure is introduced to provide information for
> > > the rvdev creation. This structure allows to manage the rvdev and vrings
> > > allocation in the rproc_rvdev_add_device function.
> > > 
> > > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c     | 157 +++++++++++++----------
> > >  drivers/remoteproc/remoteproc_internal.h |  15 +++
> > >  2 files changed, 106 insertions(+), 66 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index c510125769b9..3a469220ac73 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -484,74 +484,23 @@ static int copy_dma_range_map(struct device *to, struct device *from)
> > >  	return 0;
> > >  }
> > >  
> > > -/**
> > > - * rproc_handle_vdev() - handle a vdev fw resource
> > > - * @rproc: the remote processor
> > > - * @ptr: the vring resource descriptor
> > > - * @offset: offset of the resource entry
> > > - * @avail: size of available data (for sanity checking the image)
> > > - *
> > > - * This resource entry requests the host to statically register a virtio
> > > - * device (vdev), and setup everything needed to support it. It contains
> > > - * everything needed to make it possible: the virtio device id, virtio
> > > - * device features, vrings information, virtio config space, etc...
> > > - *
> > > - * Before registering the vdev, the vrings are allocated from non-cacheable
> > > - * physically contiguous memory. Currently we only support two vrings per
> > > - * remote processor (temporary limitation). We might also want to consider
> > > - * doing the vring allocation only later when ->find_vqs() is invoked, and
> > > - * then release them upon ->del_vqs().
> > > - *
> > > - * Note: @da is currently not really handled correctly: we dynamically
> > > - * allocate it using the DMA API, ignoring requested hard coded addresses,
> > > - * and we don't take care of any required IOMMU programming. This is all
> > > - * going to be taken care of when the generic iommu-based DMA API will be
> > > - * merged. Meanwhile, statically-addressed iommu-based firmware images should
> > > - * use RSC_DEVMEM resource entries to map their required @da to the physical
> > > - * address of their base CMA region (ouch, hacky!).
> > > - *
> > > - * Return: 0 on success, or an appropriate error code otherwise
> > > - */
> > > -static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > > -			     int offset, int avail)
> > > +static struct rproc_vdev *
> > > +rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
> > >  {
> > > -	struct fw_rsc_vdev *rsc = ptr;
> > > -	struct device *dev = &rproc->dev;
> > >  	struct rproc_vdev *rvdev;
> > > -	int i, ret;
> > > +	struct fw_rsc_vdev *rsc = rvdev_data->rsc;
> > >  	char name[16];
> > > -
> > > -	/* make sure resource isn't truncated */
> > > -	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> > > -			avail) {
> > > -		dev_err(dev, "vdev rsc is truncated\n");
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	/* make sure reserved bytes are zeroes */
> > > -	if (rsc->reserved[0] || rsc->reserved[1]) {
> > > -		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
> > > -		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
> > > -
> > > -	/* we currently support only two vrings per rvdev */
> > > -	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
> > > -		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
> > > -		return -EINVAL;
> > > -	}
> > > +	int i, ret;
> > >  
> > >  	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
> > >  	if (!rvdev)
> > > -		return -ENOMEM;
> > > +		return ERR_PTR(-ENOMEM);
> > >  
> > >  	kref_init(&rvdev->refcount);
> > >  
> > > -	rvdev->id = rsc->id;
> > > +	rvdev->id = rvdev_data->id;
> > >  	rvdev->rproc = rproc;
> > > -	rvdev->index = rproc->nb_vdev++;
> > > +	rvdev->index = rvdev_data->index;
> > >  
> > >  	/* Initialise vdev subdevice */
> > >  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> > > @@ -563,7 +512,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  	ret = device_register(&rvdev->dev);
> > >  	if (ret) {
> > >  		put_device(&rvdev->dev);
> > > -		return ret;
> > > +		return ERR_PTR(ret);
> > >  	}
> > >  
> > >  	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> > > @@ -576,7 +525,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> > >  					   dma_get_mask(rproc->dev.parent));
> > >  	if (ret) {
> > > -		dev_warn(dev,
> > > +		dev_warn(&rvdev->dev,
> > >  			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > >  			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> > >  	}
> > > @@ -589,7 +538,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  	}
> > >  
> > >  	/* remember the resource offset*/
> > > -	rvdev->rsc_offset = offset;
> > > +	rvdev->rsc_offset = rvdev_data->rsc_offset;
> > >  
> > >  	/* allocate the vring resources */
> > >  	for (i = 0; i < rsc->num_of_vrings; i++) {
> > > @@ -605,21 +554,20 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  
> > >  	rproc_add_subdev(rproc, &rvdev->subdev);
> > >  
> > > -	return 0;
> > > +	return rvdev;
> > >  
> > >  unwind_vring_allocations:
> > >  	for (i--; i >= 0; i--)
> > >  		rproc_free_vring(&rvdev->vring[i]);
> > >  free_rvdev:
> > >  	device_unregister(&rvdev->dev);
> > > -	return ret;
> > > +	return ERR_PTR(ret);
> > >  }
> > >  
> > > -void rproc_vdev_release(struct kref *ref)
> > > +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> > >  {
> > > -	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> > > -	struct rproc_vring *rvring;
> > >  	struct rproc *rproc = rvdev->rproc;
> > > +	struct rproc_vring *rvring;
> > >  	int id;
> > >  
> > >  	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> > > @@ -632,6 +580,83 @@ void rproc_vdev_release(struct kref *ref)
> > >  	device_unregister(&rvdev->dev);
> > >  }
> > >  
> > > +/**
> > > + * rproc_handle_vdev() - handle a vdev fw resource
> > > + * @rproc: the remote processor
> > > + * @ptr: the vring resource descriptor
> > > + * @offset: offset of the resource entry
> > > + * @avail: size of available data (for sanity checking the image)
> > > + *
> > > + * This resource entry requests the host to statically register a virtio
> > > + * device (vdev), and setup everything needed to support it. It contains
> > > + * everything needed to make it possible: the virtio device id, virtio
> > > + * device features, vrings information, virtio config space, etc...
> > > + *
> > > + * Before registering the vdev, the vrings are allocated from non-cacheable
> > > + * physically contiguous memory. Currently we only support two vrings per
> > > + * remote processor (temporary limitation). We might also want to consider
> > > + * doing the vring allocation only later when ->find_vqs() is invoked, and
> > > + * then release them upon ->del_vqs().
> > > + *
> > > + * Note: @da is currently not really handled correctly: we dynamically
> > > + * allocate it using the DMA API, ignoring requested hard coded addresses,
> > > + * and we don't take care of any required IOMMU programming. This is all
> > > + * going to be taken care of when the generic iommu-based DMA API will be
> > > + * merged. Meanwhile, statically-addressed iommu-based firmware images should
> > > + * use RSC_DEVMEM resource entries to map their required @da to the physical
> > > + * address of their base CMA region (ouch, hacky!).
> > > + *
> > > + * Return: 0 on success, or an appropriate error code otherwise
> > > + */
> > > +static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > > +			     int offset, int avail)
> > > +{
> > > +	struct fw_rsc_vdev *rsc = ptr;
> > > +	struct device *dev = &rproc->dev;
> > > +	struct rproc_vdev *rvdev;
> > > +	struct rproc_vdev_data rvdev_data;
> > > +
> > > +	/* make sure resource isn't truncated */
> > > +	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> > > +			avail) {
> > > +		dev_err(dev, "vdev rsc is truncated\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* make sure reserved bytes are zeroes */
> > > +	if (rsc->reserved[0] || rsc->reserved[1]) {
> > > +		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
> > > +		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
> > > +
> > > +	/* we currently support only two vrings per rvdev */
> > > +	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
> > > +		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	rvdev_data.id = rsc->id;
> > > +	rvdev_data.index = rproc->nb_vdev++;
> > > +	rvdev_data.rsc_offset = offset;
> > > +	rvdev_data.rsc = rsc;
> > > +
> > > +	rvdev = rproc_rvdev_add_device(rproc, &rvdev_data);
> > > +	if (IS_ERR(rvdev))
> > > +		return PTR_ERR(rvdev);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void rproc_vdev_release(struct kref *ref)
> > > +{
> > > +	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> > > +
> > > +	rproc_rvdev_remove_device(rvdev);
> 
> I understand that rproc_rvdev_remove_device() is created to counter balance
> rproc_rvdev_add_device() but in this case it doesn't provide much.  Moreover it
> is removed and rproc_vdev_release() renamed in patch 4, making that one more
> complex than it should be.  As such please leave rproc_vdev_release() unchanged.
> 
> > > +}
> > > +
> > >  /**
> > >   * rproc_handle_trace() - handle a shared trace buffer resource
> > >   * @rproc: the remote processor
> > > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > > index 72d4d3d7d94d..99f2ff88079f 100644
> > > --- a/drivers/remoteproc/remoteproc_internal.h
> > > +++ b/drivers/remoteproc/remoteproc_internal.h
> > > @@ -24,6 +24,21 @@ struct rproc_debug_trace {
> > >  	struct rproc_mem_entry trace_mem;
> > >  };
> > >  
> > > +/**
> > > + * struct rproc_vdev_data - remoteproc virtio device data
> > > + * @rsc_offset: offset of the vdev's resource entry
> > > + * @id: virtio device id (as in virtio_ids.h)
> > > + * @index: vdev position versus other vdev declared in resource table
> > > + * @rsc: pointer to the vdev resource entry. Valid onlyduring vdev init as the resource can
> > > + *       be cached by rproc.
> > > + */
> > > +struct rproc_vdev_data {
> > > +	u32 rsc_offset;
> > > +	unsigned int id;
> > > +	unsigned int index;
> > 
> > rvdev->index is a u32 so rproc_vdev_data::index should also be a u32.
> > 
> > With the above:
> > 
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> I'll take that back to see how the above refactoring fans out.
> 
> I am done reviewing this set.

You can drop the "RFC" for the next revision, we are well past that point.

> 
> Thanks,
> Mathieu
> 
> > 
> > 
> > > +	struct fw_rsc_vdev *rsc;
> > > +};
> > > +
> > >  /* from remoteproc_core.c */
> > >  void rproc_release(struct kref *kref);
> > >  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> > > -- 
> > > 2.25.1
> > > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
