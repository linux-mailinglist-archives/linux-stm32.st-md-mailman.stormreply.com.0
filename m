Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD374276F1
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Oct 2021 05:36:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05B66C5C824;
	Sat,  9 Oct 2021 03:36:07 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28338C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Oct 2021 03:36:04 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so13972349otx.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 20:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4bSpNJPwT1vNF1+AfYe0YCy792p+0Ep8kGezfzAgQtY=;
 b=DHngEJe1oZcDoy9FWK6YfExDfhAM35H4sK9yztoZ9RAL2HE94VKG2iO5zTejlkOqVF
 HgJtOG63wpgRxOxpMkqwHuNdwJ06u8HMsoRrItl3svlMaa9jssnUCdgOOxNc8yPlboFo
 7gxrlt8APJeBIIkLcovevN/nmkJBW5i1f8gnxGSiZWpA6+kMDcv1PIxwkH1OAtGeWqL8
 hgB2xC6FY6aTKzUNS5Zu89jFvGHmzNeMhm+NH7zwfjvI6Ig5R/JE+51d0s3D5woEAdgt
 +6q1Al51Gsjif1dcNGyXd3wZ5vd6A7mPFNd6iIMALu+ztlZDiQs8hd8PlrO5EknG+h4s
 DbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4bSpNJPwT1vNF1+AfYe0YCy792p+0Ep8kGezfzAgQtY=;
 b=YAqNKGyrALIPBRiesr+Vjulvbd7gTPHk2tBUGbCvuSFNlC6A4r/tbpW0ie7C8rirpb
 5JdlnmH15Vb3Rd+cNegJnFkWZ4lTPqvI+PyP9bR6lNvzKeni7x28aWE1JH86QomEXiv3
 U3hBfiNiY1lXTtPQ90WfUEyDko4pCiP9H2b+vvOaHnBwOjWhNJj0dIIiMSQvWsdayPgM
 41xs3dzZ8lzyLvG+divOx7P38tpf/nBtX1UsKp7FbJyveNvwIEwfhzJc3xPdnGmTB4Y5
 CmiWWbXcTErGBvQOELIBBMjLiiPGX4c1Ueqej/9tQngz0BevhYmebugfada9L4ibncwY
 +RtQ==
X-Gm-Message-State: AOAM530T2IHgy+xpdUgYnUKGqCEJ2jEXvwIeDi04j5a0YE0FG/nPIsE4
 uK0kt+T8RKGpWxECTtWlwuIOIw==
X-Google-Smtp-Source: ABdhPJyaa9dlRviM/cAUSatTSRIaJzgJe5GD1iSAJtY5jd32p+Rh+j0pYpc0Yc+BgfmZscIvNaUurg==
X-Received: by 2002:a05:6830:1d8b:: with SMTP id
 y11mr11561729oti.291.1633750562871; 
 Fri, 08 Oct 2021 20:36:02 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id j12sm283806ota.47.2021.10.08.20.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 20:36:02 -0700 (PDT)
Date: Fri, 8 Oct 2021 22:36:00 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YWEOIHrp4Z8+MHaE@builder.lan>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh@kernel.org>,
 Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH 4/7] remoteproc: create the
	REMOTEPROC_VIRTIO config
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

On Fri 01 Oct 05:12 CDT 2021, Arnaud Pouliquen wrote:

> Create the config to associate to the remoteproc virtio.
> 
> Notice that the REMOTEPROC_VIRTIO config can not set to m. the reason
> is that it defines API that is used by the built-in remote proc core.
> Functions such are rproc_add_virtio_dev can be called during the
> Linux boot phase.
> 

Please don't introduce new Kconfig options for everything. Consider that
the expectation should be that everyone runs the default defconfig on
their boards - and if someone actually needs this level of control, they
are welcome to present patches with numbers showing the benefit of the
savings.

Thanks,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/Kconfig               | 11 +++++++++-
>  drivers/remoteproc/Makefile              |  2 +-
>  drivers/remoteproc/remoteproc_internal.h | 28 ++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 9a6eedc3994a..f271552c0d84 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -6,7 +6,7 @@ config REMOTEPROC
>  	depends on HAS_DMA
>  	select CRC32
>  	select FW_LOADER
> -	select VIRTIO
> +	select REMOTEPROC_VIRTIO
>  	select WANT_DEV_COREDUMP
>  	help
>  	  Support for remote processors (such as DSP coprocessors). These
> @@ -14,6 +14,15 @@ config REMOTEPROC
>  
>  if REMOTEPROC
>  
> +config REMOTEPROC_VIRTIO
> +	bool "Remoteproc virtio device "
> +	select VIRTIO
> +	help
> +	  Say y here to have a virtio device support for the remoteproc
> +	  communication.
> +
> +	  It's safe to say N if you don't use the virtio for the IPC.
> +
>  config REMOTEPROC_CDEV
>  	bool "Remoteproc character device interface"
>  	help
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index bb26c9e4ef9c..73d2384a76aa 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -8,8 +8,8 @@ remoteproc-y				:= remoteproc_core.o
>  remoteproc-y				+= remoteproc_coredump.o
>  remoteproc-y				+= remoteproc_debugfs.o
>  remoteproc-y				+= remoteproc_sysfs.o
> -remoteproc-y				+= remoteproc_virtio.o
>  remoteproc-y				+= remoteproc_elf_loader.o
> +obj-$(CONFIG_REMOTEPROC_VIRTIO)		+= remoteproc_virtio.o
>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 152fe2e8668a..4ce012c353c0 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -30,10 +30,38 @@ int rproc_of_parse_firmware(struct device *dev, int index,
>  			    const char **fw_name);
>  
>  /* from remoteproc_virtio.c */
> +#if IS_ENABLED(CONFIG_REMOTEPROC_VIRTIO)
> +
>  int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
>  void rproc_vdev_release(struct kref *ref);
>  
> +#else
> +
> +int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return -ENXIO;
> +}
> +
> +static inline irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return IRQ_NONE;
> +}
> +
> +static inline void rproc_vdev_release(struct kref *ref)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +}
> +
> +#endif
> +
>  /* from remoteproc_debugfs.c */
>  void rproc_remove_trace_file(struct dentry *tfile);
>  struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
