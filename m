Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC4F4857E7
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jan 2022 19:05:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE964C5F1F6;
	Wed,  5 Jan 2022 18:05:30 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9309BC5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jan 2022 18:05:29 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id t187so37859pfb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Jan 2022 10:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MeOAoCPYCMAS03NMK5FT9IOH4xI01JHtqGdi4oXBEZc=;
 b=YlsWA6qYnCazBrn4jPFl2aS1N0OojH5q0Kopc6nrJatN0uKTGXl2fI8mvYnNQJICSq
 I1rUcxBUJYurTkG0eX8Pwc38jTPMi0co3LGPFsWDrx9XcpYupTI1wpr2bFqnWpIRUM1P
 rVfTp56IQgdhfDbPtaHMs6gDsK1eGGZRMbJBIfJQttiw+f6b+XQr8d9p5muGWaZ/2gPK
 Jl1yd18WgBHzKML2j4HCrWNGaINxfoTu+QVXa0DAaF6D9WYprjAf05cwrW+ZyApKmUQN
 y6VysdQ3PPiuNgo5IXNig3h+0XDf/KT1vPj0kIXd06+81Tt/fM9hVSUqNwiAcFNTabhr
 8nZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MeOAoCPYCMAS03NMK5FT9IOH4xI01JHtqGdi4oXBEZc=;
 b=lNis88KsHNW/MuIUESJ96YQt+ymeDEC0EFBmPiiuq5D9SjKTkwIumEKBrzlmQ72Y01
 JLyoxX4/eYaBJAF1exR6FRDka+84hFHkFwqLZvOHsYq2FpQQ5k5kFpHdnX/CrlJbY0Xc
 DWojFoJXvvYNXyMkdwkhFcVUkHsje3yVLJoU7N/SCmx7ouIE97rGKyPDjMqJbjXPYpla
 bCejomSYA1v6VPVD/Rg5MsqWjZBjRP6F8MU03636ZdPdlaCbbv0orx+MHvocOD1lpmJu
 2JeJ3CKpf5J7pYIYWDNVr+aHMqBLYfdt2nLEzUDU4ULKw88Z20AEpnXFNl1KiCvbLgp+
 1lVA==
X-Gm-Message-State: AOAM533P7jkYtjO6QmK2+fK4CIkzLt9ktn/vkM7eEM2m5hpYBPSr5j3e
 G2FiWRbYXNvsngT5QHpxRI7E7OE9xFKWRg==
X-Google-Smtp-Source: ABdhPJzjgNhV8sILtvoBvEl953Rr3Jao1tADL5uKBWruu1T3xMU+fgHr8nyDkzcYJRgHzwRC9TLdIQ==
X-Received: by 2002:a62:b503:0:b0:4bc:657e:cfa6 with SMTP id
 y3-20020a62b503000000b004bc657ecfa6mr26162926pfe.25.1641405928061; 
 Wed, 05 Jan 2022 10:05:28 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id k8sm3291224pjs.53.2022.01.05.10.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:05:27 -0800 (PST)
Date: Wed, 5 Jan 2022 11:05:24 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20220105180524.GA597001@p14s>
References: <20211222082349.30378-1-arnaud.pouliquen@foss.st.com>
 <20211222082349.30378-2-arnaud.pouliquen@foss.st.com>
 <20220104190810.GB540353@p14s>
 <9f047c7b-a91c-9600-cdaf-7984ad7666f3@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f047c7b-a91c-9600-cdaf-7984ad7666f3@foss.st.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Jan 05, 2022 at 09:05:21AM +0100, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 1/4/22 8:08 PM, Mathieu Poirier wrote:
> > Good morning,
> > 
> > On Wed, Dec 22, 2021 at 09:23:44AM +0100, Arnaud Pouliquen wrote:
> > > In preparation of the migration of the management of rvdev in
> > > remoteproc_virtio.c, this patch spins off new functions to manage the
> > > remoteproc virtio device.
> > > 
> > > The rproc_rvdev_add_device and rproc_rvdev_remove_device will be
> > > moved to remoteproc_virtio.c.
> > > 
> > > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > > ---
> > > update vs previous revision:
> > >   - update according to the rebase from v15-rc1 to v16-rc1
> > >   - split patch to introduce rproc_register_rvdev and rproc_unregister_rvdev
> > >     function in a separate patch
> > > ---
> > >   drivers/remoteproc/remoteproc_core.c | 94 +++++++++++++++++-----------
> > >   1 file changed, 57 insertions(+), 37 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 69f51acf235e..d1f1c5c25bd7 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -484,6 +484,61 @@ static int copy_dma_range_map(struct device *to, struct device *from)
> > >   	return 0;
> > >   }
> > > +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> > > +{
> > > +	struct rproc *rproc = rvdev->rproc;
> > > +	char name[16];
> > > +	int ret;
> > > +
> > > +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> > > +	rvdev->dev.parent = &rproc->dev;
> > > +	rvdev->dev.release = rproc_rvdev_release;
> > > +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> > > +	dev_set_drvdata(&rvdev->dev, rvdev);
> > > +
> > > +	ret = device_register(&rvdev->dev);
> > > +	if (ret) {
> > > +		put_device(&rvdev->dev);
> > > +		return ret;
> > > +	}
> > 
> > Registering the device here is a problem...  If device_register() fails
> > put_device() is called and we return, only to call device_unregister() on the
> > same device in rproc_handle_vdev().
> > 
> > Moreover in rproc_handle_vdev(), device_unregister() is called in the error
> > path but device_register() is called here in rproc_rvdev_add_device().  This
> > introduces coupling between the two functions, making it hard to maintain from
> > hereon.
> 
> Very relevant, I need to rework the error management.
> 
> > 
> > I suggest calling device_register() in rproc_handle_vdev() after
> > rproc_rvdev_add_device() has returned successfully.
> 
> One of the goals of this patchset is to move the device_register in
> remote_proc_virtio.c
> Doing this would not go in this direction.
>
> I need to test but following could be an alternative:
> - Call rproc_rvdev_remove_device in rproc_handle_vdev in case of error.
> - Remove the put_device in rproc_rvdev_add_device.
>

Right, some kind of rework is needed.  I offered a simple solution but something
more involved is likely required.

> => This would be aligned with patch [6/6] implementation
> with rproc_virtio_register_device/rproc_virtio_unregister_device...
> 
> Thanks,
> Arnaud
> 
> > 
> > More comments to come tomorrow.
> > 
> > Thanks,
> > Mathieu
> > 
> > > +	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> > > +	if (ret)
> > > +		goto free_rvdev;
> > > +
> > > +	/* Make device dma capable by inheriting from parent's capabilities */
> > > +	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> > > +
> > > +	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> > > +					   dma_get_mask(rproc->dev.parent));
> > > +	if (ret) {
> > > +		dev_warn(&rvdev->dev,
> > > +			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > > +			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> > > +	}
> > > +
> > > +	list_add_tail(&rvdev->node, &rproc->rvdevs);
> > > +
> > > +	rvdev->subdev.start = rproc_vdev_do_start;
> > > +	rvdev->subdev.stop = rproc_vdev_do_stop;
> > > +
> > > +	rproc_add_subdev(rproc, &rvdev->subdev);
> > > +
> > > +	return 0;
> > > +
> > > +free_rvdev:
> > > +	device_unregister(&rvdev->dev);
> > > +	return ret;
> > > +}
> > > +
> > > +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> > > +{
> > > +	struct rproc *rproc = rvdev->rproc;
> > > +
> > > +	rproc_remove_subdev(rproc, &rvdev->subdev);
> > > +	list_del(&rvdev->node);
> > > +	device_unregister(&rvdev->dev);
> > > +}
> > > +
> > >   /**
> > >    * rproc_handle_vdev() - handle a vdev fw resource
> > >    * @rproc: the remote processor
> > > @@ -519,7 +574,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >   	struct device *dev = &rproc->dev;
> > >   	struct rproc_vdev *rvdev;
> > >   	int i, ret;
> > > -	char name[16];
> > >   	/* make sure resource isn't truncated */
> > >   	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> > > @@ -553,34 +607,10 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >   	rvdev->rproc = rproc;
> > >   	rvdev->index = rproc->nb_vdev++;
> > > -	/* Initialise vdev subdevice */
> > > -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> > > -	rvdev->dev.parent = &rproc->dev;
> > > -	rvdev->dev.release = rproc_rvdev_release;
> > > -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> > > -	dev_set_drvdata(&rvdev->dev, rvdev);
> > > -
> > > -	ret = device_register(&rvdev->dev);
> > > -	if (ret) {
> > > -		put_device(&rvdev->dev);
> > > -		return ret;
> > > -	}
> > > -
> > > -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> > > +	ret = rproc_rvdev_add_device(rvdev);
> > >   	if (ret)
> > >   		goto free_rvdev;
> > > -	/* Make device dma capable by inheriting from parent's capabilities */
> > > -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> > > -
> > > -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> > > -					   dma_get_mask(rproc->dev.parent));
> > > -	if (ret) {
> > > -		dev_warn(dev,
> > > -			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > > -			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> > > -	}
> > > -
> > >   	/* parse the vrings */
> > >   	for (i = 0; i < rsc->num_of_vrings; i++) {
> > >   		ret = rproc_parse_vring(rvdev, rsc, i);
> > > @@ -598,13 +628,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >   			goto unwind_vring_allocations;
> > >   	}
> > > -	list_add_tail(&rvdev->node, &rproc->rvdevs);
> > > -
> > > -	rvdev->subdev.start = rproc_vdev_do_start;
> > > -	rvdev->subdev.stop = rproc_vdev_do_stop;
> > > -
> > > -	rproc_add_subdev(rproc, &rvdev->subdev);
> > > -
> > >   	return 0;
> > >   unwind_vring_allocations:
> > > @@ -619,7 +642,6 @@ void rproc_vdev_release(struct kref *ref)
> > >   {
> > >   	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> > >   	struct rproc_vring *rvring;
> > > -	struct rproc *rproc = rvdev->rproc;
> > >   	int id;
> > >   	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> > > @@ -627,9 +649,7 @@ void rproc_vdev_release(struct kref *ref)
> > >   		rproc_free_vring(rvring);
> > >   	}
> > > -	rproc_remove_subdev(rproc, &rvdev->subdev);
> > > -	list_del(&rvdev->node);
> > > -	device_unregister(&rvdev->dev);
> > > +	rproc_rvdev_remove_device(rvdev);
> > >   }
> > >   /**
> > > -- 
> > > 2.17.1
> > > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
