Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C64D433DC4
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 19:49:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29627C5C857;
	Tue, 19 Oct 2021 17:49:25 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55751C5C854
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 17:49:21 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id f11so581170pfc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=89Q/XwlG7K9QjhGfCn1Wc1KjC2i0sRysqqYs+AmNUQE=;
 b=QqBZQ2oY0XncA0F2vWMKSAd1b02KZ1fZMpyo5zMWdEAftnVkOaBQWB/5RLU4FI1opi
 jkOZJlMz6WLfWBCeygXdJXIHT+cBGooxdY326qmmymUk5GdXZciETGT0RLsFAVmitW50
 zxKEax9RktgHj28gpfInseMAVbJSpXae0a+sm1DtL6e6DeScdyyoSh7UEI1b8/ayZ9EZ
 356fDv1e+rib82YPUwHA/Ucil+4Cv1gwWyhi4f3FoU7KMjzvagupwxUBCfrzpWuLKYMz
 /pMSPg3WhEKuEd8nmj+EQlFiiUPts8rBe4p3Yrk1yMiCiHN5tzWbRze+CplP2OC8noBL
 J2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=89Q/XwlG7K9QjhGfCn1Wc1KjC2i0sRysqqYs+AmNUQE=;
 b=l2F61jhrg19IrRGlhZSvIljpxxKJJJNrTP+DtrnUHfRKAEijgf2vUC9KYg3+IdEN32
 BVxbCiutZnOZhaKn74KXdDKqv8yOacqvsyKQ3gLdAnpnGVhBvfdP+ex1MdWTejeoSZfp
 V07BEBCev1U8pVaQJzpRkdF3iTirPpRL8EJznp8HdyeEEagH4xFAmr3glLeGAy9HVEkp
 acqCJmsKyn5u/Emr/juxsSDfaK41w1MhDC1NoO0S6hH6Tjm3JTKxe9lc+/mCrLalQoFM
 uC8ajSkTrQNbChcsck7Rf3yQOS+TyeBJOcAhv3yB8rh/z+0QiB5d7fJ3cu+yT62FKI2/
 p8dg==
X-Gm-Message-State: AOAM530i/J8iq4OgfhMQWkDO+m/5fmOFBHvclR9yEkuPK6RIRX+hYqQB
 6ltCkQ8shzhC1tThx7g2FvEeGQ==
X-Google-Smtp-Source: ABdhPJyEWdYwNsiXCAAz9qvhhihWmXzPVhX2Nk3xsl0xaBfcdISq0U7NdW2leRUWeoK1YEYbfPzPmg==
X-Received: by 2002:a05:6a00:234f:b0:3eb:3ffd:6da2 with SMTP id
 j15-20020a056a00234f00b003eb3ffd6da2mr1252022pfj.15.1634665759796; 
 Tue, 19 Oct 2021 10:49:19 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id s22sm16722906pfe.76.2021.10.19.10.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 10:49:18 -0700 (PDT)
Date: Tue, 19 Oct 2021 11:49:16 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211019174916.GB3340362@p14s>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh@kernel.org>,
 Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christoph Hellwig <hch@lst.de>, linux-stm32@st-md-mailman.stormreply.com
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

On Fri, Oct 01, 2021 at 12:12:31PM +0200, Arnaud Pouliquen wrote:
> Create the config to associate to the remoteproc virtio.
> 
> Notice that the REMOTEPROC_VIRTIO config can not set to m. the reason
> is that it defines API that is used by the built-in remote proc core.
> Functions such are rproc_add_virtio_dev can be called during the
> Linux boot phase.
> 
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

This one is weird but there is no need to comment further after reading your
conversation with Bjorn.

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
