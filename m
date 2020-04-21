Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0036D1B315E
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2020 22:41:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B333EC36B0C;
	Tue, 21 Apr 2020 20:41:07 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6380FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 20:41:06 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x26so7321786pgc.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 13:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q/r+FSJ7pvz4zvnfdsnXitvZi5C6EJGHawqwSL0G7mY=;
 b=yfYHWudGRbW1pj+i6ES/s8HeW44zwhC0Rjh8CAn31XRDuNxl0QNvcIyt5RgSZ1dGgG
 GrqkoV37KN75bVtOgraCSLTbjLLRA8AFbeh43xxA0SgKQ2A4OlRKQBkx58Y9rU+9A1o0
 g4Vjwla50FlGdJQIgbBSfv/EOYuR5wGYfeXcEssRE0udZQLExPd4rPxFrqHXAsQmEkve
 WOv0HaioCbxVdq2n/2fDZeJAXRhQAW1m7u9NBvY4z5Q1a9OLuPmr+a1TUe6ojyFkqqiH
 EPQNcLXqYupiVDJEGhR3Io8o4nDEOO1g6ap4SDjArtiFEbTCCH0ef4F/BsvayPQHT1xg
 FMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q/r+FSJ7pvz4zvnfdsnXitvZi5C6EJGHawqwSL0G7mY=;
 b=CqYY/IeGGObiCaGIdkgpWmJAXTRP5oAcvvSlYoG3nWY+4tOWqemlwpHv24OWOrk1j2
 1TqwJi6TuXH3F1skLREubzWpbriaLPomXm3pibJxCaRIht/z4G8kWU5pjYqO2BJ5Nnuw
 n5E4g9khjDLhHwhCbNv2OgLeuDhmGVHCQIt6DkscPflDigyBncQBQKP8UTPkNB76e/PA
 n/JnvzP8J/QxsuP0+N/vfhden6HArSxz4JshIAPR4F69Gs/fCdiisrmMzv2lkjU6C/oY
 D9u4u9Pe+pbAsmP9uu8aCKRbvQY+fQ7nm65Ijx6mv+f6r0OwA8DEqObjJpHELHNtT8Bv
 ACXg==
X-Gm-Message-State: AGi0PuaqeBlhTz+3iPZuxS/MaPgbLuGZv/eHV2uXxe1oaFGIfqzN5CfF
 lAGB8HHxfw0xr8JSTq5M4emtog==
X-Google-Smtp-Source: APiQypKNF/nsktA9gOxV63v27Niq4wseKeuf9UzbYzxbekzsSlrVHLQ5puVPlqNXBte2BezfxSJROA==
X-Received: by 2002:a62:cf81:: with SMTP id b123mr22790189pfg.84.1587501664736; 
 Tue, 21 Apr 2020 13:41:04 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id y8sm3360062pfg.216.2020.04.21.13.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 13:41:04 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:41:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	t@xps15.st-md-mailman.stormreply.com
Message-ID: <20200421204102.GA17676@xps15>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
 <20200416161331.7606-3-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416161331.7606-3-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [RFC 02/18] remoteproc: Introduce virtio device
 add/remove functions in core.
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

Hey Arnaud,

I have started to review this set. Comments will come in over the next few days
and I will be sure to let you know when I'm done.

On Thu, Apr 16, 2020 at 06:13:15PM +0200, Arnaud Pouliquen wrote:
> In preparation of the migration of the management of rvdev in
> rproc_virtio, this patch spins off new functions to manage the
> virtio device.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 149 +++++++++++++++------------
>  1 file changed, 83 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 2a0425ab82a7..5c90d569c0f7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -441,6 +441,86 @@ static void rproc_rvdev_release(struct device *dev)
>  	kfree(rvdev);
>  }
>  
> +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> +{
> +	struct rproc *rproc = rvdev->rproc;
> +	struct fw_rsc_vdev *rsc = rvdev->rsc;
> +	char name[16];
> +	int ret, i;
> +
> +	/* Initialise vdev subdevice */
> +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> +	rvdev->dev.parent = &rproc->dev;
> +	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
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
> +	/* parse the vrings */
> +	for (i = 0; i < rsc->num_of_vrings; i++) {
> +		ret = rproc_parse_vring(rvdev, rsc, i);
> +		if (ret)
> +			goto free_rvdev;
> +	}
> +
> +	/* allocate the vring resources */
> +	for (i = 0; i < rsc->num_of_vrings; i++) {
> +		ret = rproc_alloc_vring(rvdev, i);
> +		if (ret)
> +			goto free_vg;

I don't get the "free_vg" part... At the moment this patch is only about
refactoring and as such I would encourage you to keep things the same as
much as possible.  It is certainly ok to make modifications but they should be
done in an incremental patch.  Otherwise reviewers needlessly have to scrutinize
the changes thinking there is something more to figure out.

> +	}
> +
> +	rvdev->subdev.start = rproc_vdev_do_start;
> +	rvdev->subdev.stop = rproc_vdev_do_stop;
> +
> +	rproc_add_subdev(rproc, &rvdev->subdev);
> +
> +	return 0;
> +
> +free_vg:
> +	for (i--; i >= 0; i--) {
> +		struct rproc_vring *rvring = &rvdev->vring[i];
> +
> +		rproc_free_vring(rvring);
> +	}
> +
> +free_rvdev:
> +	device_unregister(&rvdev->dev);
> +
> +	return ret;
> +}
> +
> +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
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
> +	device_unregister(&rvdev->dev);
> +}
> +
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -473,8 +553,6 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>  {
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vdev *rvdev;
> -	int i, ret;
> -	char name[16];
>  
>  	/* make sure resource isn't truncated */
>  	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> @@ -505,83 +583,22 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>  	kref_init(&rvdev->refcount);
>  
>  	rvdev->rsc = rsc;
> +	rvdev->rsc_offset = offset;
>  	rvdev->id = rsc->id;
>  	rvdev->rproc = rproc;
>  	rvdev->index = rproc->nb_vdev++;
>  
> -	/* Initialise vdev subdevice */
> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> -	rvdev->dev.parent = rproc->dev.parent;
> -	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
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
> -		dev_warn(dev,
> -			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
> -			 dma_get_mask(rproc->dev.parent), ret);
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
> -	rvdev->rsc_offset = offset;
> -
> -	/* allocate the vring resources */
> -	for (i = 0; i < rsc->num_of_vrings; i++) {
> -		ret = rproc_alloc_vring(rvdev, i);
> -		if (ret)
> -			goto unwind_vring_allocations;
> -	}
> -
>  	list_add_tail(&rvdev->node, &rproc->rvdevs);
>  
> -	rvdev->subdev.start = rproc_vdev_do_start;
> -	rvdev->subdev.stop = rproc_vdev_do_stop;
> -
> -	rproc_add_subdev(rproc, &rvdev->subdev);
> -
> -	return 0;
> -
> -unwind_vring_allocations:
> -	for (i--; i >= 0; i--)
> -		rproc_free_vring(&rvdev->vring[i]);
> -free_rvdev:
> -	device_unregister(&rvdev->dev);
> -	return ret;
> +	return rproc_rvdev_add_device(rvdev);
>  }
>  
>  void rproc_vdev_release(struct kref *ref)
>  {
>  	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> -	struct rproc_vring *rvring;
> -	struct rproc *rproc = rvdev->rproc;
> -	int id;
> -
> -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> -		rvring = &rvdev->vring[id];
> -		rproc_free_vring(rvring);
> -	}
>  
> -	rproc_remove_subdev(rproc, &rvdev->subdev);
> +	rproc_rvdev_remove_device(rvdev);

At this time I don't see how introducing rproc_rvdev_remore_device() is
advantageous.  Maybe I'll find an answer as I review upcoming patches...

Thanks,
Mathieu 

>  	list_del(&rvdev->node);
> -	device_unregister(&rvdev->dev);
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
