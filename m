Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E49E5486A2F
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jan 2022 19:53:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0E14C5F1FD;
	Thu,  6 Jan 2022 18:53:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB77AC5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jan 2022 18:53:14 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id p37so3272817pfh.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Jan 2022 10:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JNS0S6ws0b44uRH/I7fHJUlSoq/HfDftbNx1kWhJBDY=;
 b=C3J72x1eujONqwRMfNpCgBraDBl5F0HTlrDwkyG9dAbOZ7scJAuWZffpVhejkYf9VR
 UpQcWhRIQvduHeJONSD+e14UoZ1WCvIASeYtusK3tPaLvANNBhuKDj0+VLoiPOgMlUuS
 qMshNcLU4baJG+xltNXFhjexyYyFdSfmjZXK+baX7VfgBWvpl0SYtxi8eLu1vtERU6xa
 UG87F3wqoLKtmV46VMsRz7X9SfLMLWadperyd5xdGjJ9QcEXxArShoCdFLIrADyv0UKt
 EQyMtYvu5ggCGiYshY2JTv9iwRhQhbTAmLgf9enVLS/L6Ttk6Gc2EzDmrDpbRa30OZwM
 UahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JNS0S6ws0b44uRH/I7fHJUlSoq/HfDftbNx1kWhJBDY=;
 b=su2PBKGHThJMU57+HOBvOw4PQGLZR01a8gN3BlJqdYrtZ4q5P/raig5x7e7HXck3Ri
 2DztDjPaDhcVdKr+KqOYQxy4T98pmspKeyN0VkSTFOPtWDs5y5ci1DZzrltMCtvvcFU2
 NjnUmjzY1enWeib7edzx8EYuxueL7TCSXCDXS/VqDO4siDmEmJmY39iJ79vBYOStTEJA
 f+DMYnGRtnGwnDR0UceisgRELJ6WtsIpPU9bKkY2Khprz0eR1vIz62GzIK49XHz6WdLZ
 ymyfApJQm8mPEqBOmLVs7wzi4tyjAkYFXosdhvPYVcB1RhuaY3Ct6eEv8aUxYsKK0/WU
 XB2A==
X-Gm-Message-State: AOAM533GUqgMst+LUimQhCs0F3lyvHufF+AYFRDSBbAkAoAgU/ae/L+u
 1jqEWpkeawmYXDjBH5ZTR/qZPg==
X-Google-Smtp-Source: ABdhPJy6rQHSiSMgrDLVkpo3O/ViA2YSigATsKEr+J9KyotV6Ig/DgyVJF2M7sByf/cSlIP2E9VC6g==
X-Received: by 2002:a63:6ecf:: with SMTP id
 j198mr43522960pgc.287.1641495193133; 
 Thu, 06 Jan 2022 10:53:13 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id c10sm127881pfl.200.2022.01.06.10.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:53:11 -0800 (PST)
Date: Thu, 6 Jan 2022 11:53:09 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220106185309.GC642186@p14s>
References: <20211222082349.30378-1-arnaud.pouliquen@foss.st.com>
 <20211222082349.30378-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211222082349.30378-5-arnaud.pouliquen@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [RFC PATCH v2 4/6] remoteproc: virtio: Create
 platform device for the remoteproc_virtio
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

On Wed, Dec 22, 2021 at 09:23:47AM +0100, Arnaud Pouliquen wrote:
> Define a platform driver to prepare for the management of
> remoteproc virtio devices as platform devices.
> 
> The platform device allows to pass rproc_vdev_data platform data to
> specify properties that are stored in the rproc_vdev structure.
> 
> Such approach will allow to preserve legacy remoteproc virtio device
> creation but also to probe the device using device tree mechanism.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Update vs previous revision:
>   - Fix commit and rename rproc_vdev_data to rproc_vdev_pdata
> ---
>  drivers/remoteproc/remoteproc_internal.h |  6 +++
>  drivers/remoteproc/remoteproc_virtio.c   | 65 ++++++++++++++++++++++++
>  include/linux/remoteproc.h               |  2 +
>  3 files changed, 73 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index e9e9a551a8c2..6f511c50a15d 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -24,6 +24,12 @@ struct rproc_debug_trace {
>  	struct rproc_mem_entry trace_mem;
>  };
>  
> +struct rproc_vdev_pdata {
> +	u32 rsc_offset;
> +	unsigned int id;
> +	unsigned int index;
> +};
> +
>  /* from remoteproc_core.c */
>  void rproc_release(struct kref *kref);
>  int rproc_of_parse_firmware(struct device *dev, int index,
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 51d415744fc6..5f8005caeb6e 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2011 Texas Instruments, Inc.
>   * Copyright (C) 2011 Google, Inc.
> + * Copyright (C) 2021 STMicroelectronics
>   *
>   * Ohad Ben-Cohen <ohad@wizery.com>
>   * Brian Swetland <swetland@google.com>
> @@ -13,6 +14,7 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/export.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/remoteproc.h>
>  #include <linux/virtio.h>
> @@ -575,3 +577,66 @@ void rproc_vdev_release(struct kref *ref)
>  
>  	rproc_rvdev_remove_device(rvdev);
>  }
> +
> +static int rproc_virtio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rproc_vdev_pdata *vdev_data = dev->platform_data;
> +	struct rproc_vdev *rvdev;
> +	struct rproc *rproc;
> +
> +	if (!vdev_data)
> +		return -EINVAL;
> +
> +	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
> +	if (!rvdev)
> +		return -ENOMEM;
> +
> +	rproc = container_of(dev->parent, struct rproc, dev);
> +
> +	rvdev->rsc_offset = vdev_data->rsc_offset;
> +	rvdev->id = vdev_data->id;
> +	rvdev->index = vdev_data->index;
> +
> +	rvdev->pdev = pdev;
> +	rvdev->rproc = rproc;
> +
> +	platform_set_drvdata(pdev, rvdev);
> +
> +	return rproc_rvdev_add_device(rvdev);
> +}
> +
> +static int rproc_virtio_remove(struct platform_device *pdev)
> +{
> +	struct rproc_vdev *rvdev = dev_get_drvdata(&pdev->dev);
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
> +	dev_dbg(&pdev->dev, "virtio dev %d removed\n",  rvdev->index);
> +

Function rproc_virtio_remove() doesn't do the opposite of rproc_virtio_probe(),
making it hard for people to wrap their head around what is happening.  This may
get cleaned up as part of the error path problem we already talked about...  If not
this is something to improve one.

I am done reviewing this set.

Thanks,
Mathieu

> +	return 0;
> +}
> +
> +/* Platform driver */
> +static const struct of_device_id rproc_virtio_match[] = {
> +	{ .compatible = "rproc-virtio", },
> +	{},
> +};
> +
> +static struct platform_driver rproc_virtio_driver = {
> +	.probe		= rproc_virtio_probe,
> +	.remove		= rproc_virtio_remove,
> +	.driver		= {
> +		.name	= "rproc-virtio",
> +		.of_match_table	= rproc_virtio_match,
> +	},
> +};
> +builtin_platform_driver(rproc_virtio_driver);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e0600e1e5c17..542a3d4664f2 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -616,6 +616,7 @@ struct rproc_vring {
>   * struct rproc_vdev - remoteproc state for a supported virtio device
>   * @refcount: reference counter for the vdev and vring allocations
>   * @subdev: handle for registering the vdev as a rproc subdevice
> + * @pdev: remoteproc virtio platform device
>   * @dev: device struct used for reference count semantics
>   * @id: virtio device id (as in virtio_ids.h)
>   * @node: list node
> @@ -628,6 +629,7 @@ struct rproc_vdev {
>  	struct kref refcount;
>  
>  	struct rproc_subdev subdev;
> +	struct platform_device *pdev;
>  	struct device dev;
>  
>  	unsigned int id;
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
