Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB6348484E
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jan 2022 20:08:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F7D4C5F1F9;
	Tue,  4 Jan 2022 19:08:17 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71618C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 19:08:15 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so4124363pji.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Jan 2022 11:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cQF+XH6V3kVHXWMXV3EqI1J84nIsrn1qXMCyxHnZTsc=;
 b=FiB1DfbLLjQ29EVkKGbeCeHRekDd/OS5bBExr6rJx7COnYOge7ZEpfxupcxx5TqM4/
 loCsJHdeShJSN0TTKrNk0O/MedFHbumhWmFnidhP6D2gW6t+gOiipwKILPj29DdHKHci
 w6+yJaBBExlOwHKk9R8QIZCr6xNjFB+LSp8YcoAPNb/hkI3YEFArKh6XxoqLouzdHZfj
 7UDna6l9NTPRmT3xuwNHagpxn9IrKt01pBMyHd22sJdPKTHiRIWj6B94Y86HEl41HQBH
 UwkQ9WR8bJwPd7ixBptosHbjI0DO6Iivoq+eb+UePncHwXZX8X52EOYAPtG1oJVabPNj
 oLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cQF+XH6V3kVHXWMXV3EqI1J84nIsrn1qXMCyxHnZTsc=;
 b=drK3Jhy7+La81Lqrsx8aoLk8G7iF3dz6RBJ3FeVhBqTlqEWIHF2N63B5Cgn9RZ4ipK
 r6irMWetQs9o3LURldujcdzK5MO4mDgggiGRQSur/qMdZu1c+0GNnMZDA6pcK7hs36qB
 4ol9JHjZ28pEVtK8KwxZf+6hKMRz2oLuvOPftBCVO/3SylQLQl2vHVrmfMTggyqlX3qt
 vvdBfMS4xR5723M7glMmDlXye2oRBLQmYqBwTC3L2RDCnC+Npzpqh4JZD+E5GbRt7T0i
 2mcOSfyVghA2hjIwa5cxbd3VqXqHv93iQ1x7978UW2T1eH5fhe/wWGR5jaMvR1+n059k
 +zmQ==
X-Gm-Message-State: AOAM533qJvUWPeP0i7NbyKqV5ArD7rtKtp4QZS7qt2IuPaiZLLmnRYXv
 shB/xGS79qfZXwNBNcxC4KMi7g==
X-Google-Smtp-Source: ABdhPJw+rINow93orCEPCmEtD0MDuQgTEqcobjcf4Rhbdbw1tMT0NIZjbrecupBcM9PPml8ExcaUEA==
X-Received: by 2002:a17:90b:4d8c:: with SMTP id
 oj12mr62468509pjb.11.1641323293874; 
 Tue, 04 Jan 2022 11:08:13 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id h4sm499390pjk.2.2022.01.04.11.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 11:08:12 -0800 (PST)
Date: Tue, 4 Jan 2022 12:08:10 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220104190810.GB540353@p14s>
References: <20211222082349.30378-1-arnaud.pouliquen@foss.st.com>
 <20211222082349.30378-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211222082349.30378-2-arnaud.pouliquen@foss.st.com>
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

Good morning,

On Wed, Dec 22, 2021 at 09:23:44AM +0100, Arnaud Pouliquen wrote:
> In preparation of the migration of the management of rvdev in
> remoteproc_virtio.c, this patch spins off new functions to manage the
> remoteproc virtio device.
> 
> The rproc_rvdev_add_device and rproc_rvdev_remove_device will be
> moved to remoteproc_virtio.c.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> update vs previous revision:
>  - update according to the rebase from v15-rc1 to v16-rc1
>  - split patch to introduce rproc_register_rvdev and rproc_unregister_rvdev
>    function in a separate patch
> ---
>  drivers/remoteproc/remoteproc_core.c | 94 +++++++++++++++++-----------
>  1 file changed, 57 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 69f51acf235e..d1f1c5c25bd7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -484,6 +484,61 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  	return 0;
>  }
>  
> +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> +{
> +	struct rproc *rproc = rvdev->rproc;
> +	char name[16];
> +	int ret;
> +
> +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> +	rvdev->dev.parent = &rproc->dev;
> +	rvdev->dev.release = rproc_rvdev_release;
> +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> +	dev_set_drvdata(&rvdev->dev, rvdev);
> +
> +	ret = device_register(&rvdev->dev);
> +	if (ret) {
> +		put_device(&rvdev->dev);
> +		return ret;
> +	}

Registering the device here is a problem...  If device_register() fails
put_device() is called and we return, only to call device_unregister() on the
same device in rproc_handle_vdev(). 

Moreover in rproc_handle_vdev(), device_unregister() is called in the error
path but device_register() is called here in rproc_rvdev_add_device().  This
introduces coupling between the two functions, making it hard to maintain from
hereon.

I suggest calling device_register() in rproc_handle_vdev() after
rproc_rvdev_add_device() has returned successfully. 

More comments to come tomorrow.

Thanks,
Mathieu

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
> +	list_add_tail(&rvdev->node, &rproc->rvdevs);
> +
> +	rvdev->subdev.start = rproc_vdev_do_start;
> +	rvdev->subdev.stop = rproc_vdev_do_stop;
> +
> +	rproc_add_subdev(rproc, &rvdev->subdev);
> +
> +	return 0;
> +
> +free_rvdev:
> +	device_unregister(&rvdev->dev);
> +	return ret;
> +}
> +
> +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> +{
> +	struct rproc *rproc = rvdev->rproc;
> +
> +	rproc_remove_subdev(rproc, &rvdev->subdev);
> +	list_del(&rvdev->node);
> +	device_unregister(&rvdev->dev);
> +}
> +
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -519,7 +574,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vdev *rvdev;
>  	int i, ret;
> -	char name[16];
>  
>  	/* make sure resource isn't truncated */
>  	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> @@ -553,34 +607,10 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	rvdev->rproc = rproc;
>  	rvdev->index = rproc->nb_vdev++;
>  
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
> -		return ret;
> -	}
> -
> -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> +	ret = rproc_rvdev_add_device(rvdev);
>  	if (ret)
>  		goto free_rvdev;
>  
> -	/* Make device dma capable by inheriting from parent's capabilities */
> -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> -
> -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> -					   dma_get_mask(rproc->dev.parent));
> -	if (ret) {
> -		dev_warn(dev,
> -			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> -			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> -	}
> -
>  	/* parse the vrings */
>  	for (i = 0; i < rsc->num_of_vrings; i++) {
>  		ret = rproc_parse_vring(rvdev, rsc, i);
> @@ -598,13 +628,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  			goto unwind_vring_allocations;
>  	}
>  
> -	list_add_tail(&rvdev->node, &rproc->rvdevs);
> -
> -	rvdev->subdev.start = rproc_vdev_do_start;
> -	rvdev->subdev.stop = rproc_vdev_do_stop;
> -
> -	rproc_add_subdev(rproc, &rvdev->subdev);
> -
>  	return 0;
>  
>  unwind_vring_allocations:
> @@ -619,7 +642,6 @@ void rproc_vdev_release(struct kref *ref)
>  {
>  	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
>  	struct rproc_vring *rvring;
> -	struct rproc *rproc = rvdev->rproc;
>  	int id;
>  
>  	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> @@ -627,9 +649,7 @@ void rproc_vdev_release(struct kref *ref)
>  		rproc_free_vring(rvring);
>  	}
>  
> -	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	list_del(&rvdev->node);
> -	device_unregister(&rvdev->dev);
> +	rproc_rvdev_remove_device(rvdev);
>  }
>  
>  /**
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
