Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8E42E069
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 19:49:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DDA1C5C83E;
	Thu, 14 Oct 2021 17:49:02 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEDC6C5C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 17:48:59 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 133so6243559pgb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 10:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OT60huJcLUzU4uMTP0Y4zXm9R8zcbb51JLuxqfMRZ94=;
 b=wLDDuoJmX85HQzNdokG+Ttetn04Um6PGIAdCcgnT1SUrnTJbr9y7xmCqiEt5pzQD21
 /oGZrw2O11WaGmL9Su9ZammcH9guMQB2/Ha6UTySsxZ5b+/7TW6kft8hZ2EYLz3mBuEn
 7YZLHItUk7NEl5XvoRG9vEoln7N+JH+GNBOk8+JUBB067D+JWPELkbIRfV+8Id8L6Lkr
 aJpk9Q3gd4IQ/nVxW3zQb0j0M546bBU+/4Fkk+CXe1UkcavcfOABwBzY5yqbOcXTyPbh
 HJyT8o4QcoGPYzcm/9dSZZWJsFzOT9VaQiWqB5KdPMW5xmrVIEIKc5OSsx9ZTQlN99Uf
 SxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OT60huJcLUzU4uMTP0Y4zXm9R8zcbb51JLuxqfMRZ94=;
 b=2Gv8XQJ320DzM3IbMfqEL6q1iQX/wiC43417QbPtABvnqhOaEKfSnurSMZJ6pl4PD7
 bp1gVaXZRfppkLg/hNPMDiHil3UuL+qPB8uh7gdKK/0yGSBsD6ThheVQf2NCFlIK5XOj
 icnhRAZUteMIpabJHf51lBdpSwhUcBaHbj79IXBIisyB1wEDrYuCcrsPTn8dOne631ku
 dHrnzAeMeESw1PcmoZcMmNorW4i1lNVbVYgKCKSi/ZJPXXvpeTpyUh4RPdKS2DL6CQ2h
 KrQHiXzSu9tH8g24Vjw1s9kZdni0WEAda3dowgLrTS59RpwcbI0nAvVI2Nf8QmqmXvxc
 pNLA==
X-Gm-Message-State: AOAM532PlKH6iAMuMMhDUEVvCYPZ43BARuRimbnkazLNQKu7E5gWW/be
 h5S1xCAbOtzTXhAxLtce5b5O3A==
X-Google-Smtp-Source: ABdhPJxmvaatFc+QnqNBQePvZ4CbvHeNQ65c0Ulj65LLhxEKTQGYa8hLZAe0hs+8d7h5nHtD9QEZfw==
X-Received: by 2002:aa7:9f8f:0:b0:44c:cf63:ec7c with SMTP id
 z15-20020aa79f8f000000b0044ccf63ec7cmr6741449pfr.77.1634233738398; 
 Thu, 14 Oct 2021 10:48:58 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id lp9sm3424575pjb.35.2021.10.14.10.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 10:48:57 -0700 (PDT)
Date: Thu, 14 Oct 2021 11:48:54 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211014174854.GC2847733@p14s>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-2-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh@kernel.org>,
 Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christoph Hellwig <hch@lst.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH 1/7] remoteproc: core: Introduce
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

Hi,

I have started reviewing this set.  Comments herein are related to code logic
only.  I will comment on the overall approach at a later time.

On Fri, Oct 01, 2021 at 12:12:28PM +0200, Arnaud Pouliquen wrote:
> In preparation of the migration of the management of rvdev in
> rproc_virtio, this patch spins off new functions to manage the

Are you referring to file remoteproc_virtio.c?  If so please clearly state that
it is the case by using the real name.  Otherwise it is very confusing.

> remoteproc virtio device.
> 
> The rproc_rvdev_add_device and rproc_rvdev_remove_device will be
> moved to remoteproc_virtio.

Here too I have to guess that you mean remoteproc_virtio.c.  Moreover two
different nomenclatures are used in 3 lines.

> 
> In addition the rproc_register_rvdev and rproc_unregister_rvdev is created
> as it will be exported (used in rproc_rvdev_add_device
> and rproc_rvdev_remove_device functions).
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 102 ++++++++++++++++++---------
>  1 file changed, 67 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 502b6604b757..7c783ca291a7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -484,6 +484,69 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  	return 0;
>  }
>  
> +static void rproc_register_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev && rvdev->rproc)
> +		list_add_tail(&rvdev->node, &rvdev->rproc->rvdevs);
> +}
> +
> +static void rproc_unregister_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev)
> +		list_del(&rvdev->node);
> +}

This file is a simple refactoring of the current code.  Additions such as this
one should be done in a separate patch.

> +
> +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
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

Memory is allocated for @rvdev in rproc_handle_vdev() using kzalloc().  If
we return prematurely that memory will be leaked.  Note that this problem is
present in the current code base.  I suggest sending a separate patch to fix it
while this work is ongoing.

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

Please see comment above.

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
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -519,7 +582,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vdev *rvdev;
>  	int i, ret;
> -	char name[16];
>  
>  	/* make sure resource isn't truncated */
>  	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> @@ -551,33 +613,13 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  
>  	rvdev->id = rsc->id;
>  	rvdev->rproc = rproc;
> -	rvdev->index = rproc->nb_vdev++;
> +	rvdev->index = rproc->nb_vdev;

This one may make sense in a later patch but for now it doesn't.

Depending on the time I have more comments to come later, tomorrow or on Monday.

Thanks,
Mathieu

>  
> -	/* Initialise vdev subdevice */
> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> -	rvdev->dev.parent = &rproc->dev;
> -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> +	ret = rproc_rvdev_add_device(rvdev);
>  	if (ret)
>  		return ret;
> -	rvdev->dev.release = rproc_rvdev_release;
> -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> -	dev_set_drvdata(&rvdev->dev, rvdev);
>  
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
> -		dev_warn(dev,
> -			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
> -			 dma_get_mask(rproc->dev.parent), ret);
> -	}
> +	rproc->nb_vdev++;
>  
>  	/* parse the vrings */
>  	for (i = 0; i < rsc->num_of_vrings; i++) {
> @@ -596,13 +638,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
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
> @@ -617,7 +652,6 @@ void rproc_vdev_release(struct kref *ref)
>  {
>  	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
>  	struct rproc_vring *rvring;
> -	struct rproc *rproc = rvdev->rproc;
>  	int id;
>  
>  	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> @@ -625,9 +659,7 @@ void rproc_vdev_release(struct kref *ref)
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
