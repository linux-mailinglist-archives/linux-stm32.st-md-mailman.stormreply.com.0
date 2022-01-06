Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D14869B1
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jan 2022 19:23:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC5CEC5F1FD;
	Thu,  6 Jan 2022 18:23:03 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0ED1C5F1F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jan 2022 18:23:02 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id g2so3295331pgo.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Jan 2022 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I6+gV85PzROEGlYJM3N+KOto4KJj2e4PqdsLK48TsUs=;
 b=qvHLaU3I3YHDRWNvqsGcro4TTgHFq2pBWDkhh+5jgB4eOqgbpj5ZCHLIQ0V7nJil/u
 BD5adDExOHzqInisF7KA4q8Tz7Cx5KPp3CZ1a5IgJm1Gon01ol41Ls1ekUgfhNeH4Q6g
 AcDFmuyhPhazBpQv/9E3VnzrPp9DhAmW6LGIL+dXfICMpOLUYv9Sleqyc5fvTo8cJfql
 Qo5HXw15lB60EWDFs6KPA4Yk2B7keLcBFBd+rUzQOEaznukkXCTIcByhnz1pOXswuD44
 JSXRCJwuqN9ISpUcHUY2LcMe9riJaB+pCbsAcUpi33/HnQIJMojMK60TS1knUVuChIwL
 Mxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I6+gV85PzROEGlYJM3N+KOto4KJj2e4PqdsLK48TsUs=;
 b=IanoUnwH5iGspQqAyAoOkuW3Eoix3XVK8s/j+lHKyw4azaUkOgkEQdVO5KMJ2vcXFt
 Nzj+MsrfGMEFjcc8HM4Ky1QB/In/q5yxE/AEtg0beNSYddrzaUVM1iwWutxQzQqDOdiG
 0krXgGiW/t8tRDst8b186VWWcIzgQW9UhLPttnerq0Mdrk57H+BQc0neRn6FlPzGwN24
 lzY1lSurIL1zbUpmG8/x9UcUm6KJFdH7FBMoUK47ylH9iZwR/n9TIbptHtnY99Kzzx/Z
 /iwcjyFIzos8HjHoldeMJUfaxMcSYBotZS7q0OoeTQHC+yECXrOYniBHdlybFYurMlfl
 AbtQ==
X-Gm-Message-State: AOAM532xBSxLkRsgcw1nVMfcwf+xTKF4VH7CgURdZdOz0Ji4iXx+3tb/
 MskyXcMQ/rto845/vigRMzfmPg==
X-Google-Smtp-Source: ABdhPJweRsimwQSAjoYAJsBtwWD4QinEfZXmqu0x7zDDpGDGjuPdd9wgT90Qo4sNJ3RXACOsdEu6vQ==
X-Received: by 2002:a05:6a00:1509:b0:4ba:f004:e3af with SMTP id
 q9-20020a056a00150900b004baf004e3afmr61701114pfu.32.1641493381292; 
 Thu, 06 Jan 2022 10:23:01 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id z23sm3173944pfr.189.2022.01.06.10.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:23:00 -0800 (PST)
Date: Thu, 6 Jan 2022 11:22:58 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220106182258.GA642186@p14s>
References: <20211222082349.30378-1-arnaud.pouliquen@foss.st.com>
 <20211222082349.30378-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211222082349.30378-6-arnaud.pouliquen@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [RFC PATCH v2 5/6] remoteproc: virtio: Add helper
 to create platform device
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

Hi Arnaud,

On Wed, Dec 22, 2021 at 09:23:48AM +0100, Arnaud Pouliquen wrote:
> Add capability to create platform device for the rproc virtio.
> This is a step to move forward the management of the rproc virtio
> as an independent device.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_internal.h |  3 ++
>  drivers/remoteproc/remoteproc_virtio.c   | 36 ++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 6f511c50a15d..3007d29a26e1 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -37,6 +37,9 @@ int rproc_of_parse_firmware(struct device *dev, int index,
>  
>  /* from remoteproc_virtio.c */
>  int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
> +struct platform_device *
> +rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_pdata *vdev_data);
> +void rproc_virtio_unregister_device(struct rproc_vdev *rvdev);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
>  void rproc_vdev_release(struct kref *ref);
>  
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 5f8005caeb6e..5eef679cc520 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -578,6 +578,42 @@ void rproc_vdev_release(struct kref *ref)
>  	rproc_rvdev_remove_device(rvdev);
>  }
>  
> +/**
> + * rproc_virtio_register_device() - register a remoteproc virtio device
> + * @rproc: rproc handle to add the remoteproc virtio device to
> + * @vdev_data: platform device data
> + *
> + * Return: 0 on success, and an appropriate error value otherwise
> + */
> +struct platform_device *
> +rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_pdata *vdev_data)
> +{
> +	struct device *dev = &rproc->dev;
> +	struct platform_device *pdev;
> +
> +	pdev = platform_device_register_data(dev, "rproc-virtio", vdev_data->index, vdev_data,
> +					     sizeof(*vdev_data));
> +	if (PTR_ERR_OR_ZERO(pdev)) {

Can you expand on the reason to use PTR_ERR_OR_ZERO() rather than IS_ERR()?
Looking at the documentation for platform_device_register_data(), it should not
return 0...

> +		dev_err(rproc->dev.parent,
> +			"failed to create rproc-virtio device\n");
> +	}
> +
> +	return  pdev;
> +}
> +EXPORT_SYMBOL(rproc_virtio_register_device);
> +
> +/**
> + * rproc_virtio_unregister_device() - unregister a remoteproc virtio device
> + * @rvdev: remote proc virtio handle to unregister
> + *
> + */
> +void rproc_virtio_unregister_device(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev->pdev)
> +		platform_device_unregister(rvdev->pdev);
> +}
> +EXPORT_SYMBOL(rproc_virtio_unregister_device);
> +
>  static int rproc_virtio_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
