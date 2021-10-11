Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB942957B
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Oct 2021 19:22:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93BA6C5C82E;
	Mon, 11 Oct 2021 17:22:05 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86CFCC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 17:22:03 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id t4so23751296oie.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 10:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HmEokn5oUdJqWXRoigMGBMDU0hXxS+4uBuxS3ZcINxM=;
 b=HWG22c1i7wrXnbbUxNqP0GHByQbqHrpCQ9uBz2JGkqyvFn+qNXPaX/ofKK/2zDb9wV
 k8m9YtNdJeHBPpQpvMYTpL420BuMUzo+ihnJARKQz72AF+LjHSrYQZ2oe4q68WisiOzc
 /JEtbiU1rPu5UMpvkqoY2d8M2LvxemL3g1do7ma8MOEVSzdUoBuCMSyg/L4G8ADl7Vv4
 ZlBTJX14Ao0cu5Vu5jTq1DEnIU113RrIYZPWuJe31JHmIRrT887KU4xz1yqpQ7T6mYbc
 wCsv1jKQqL/JUrEzyfyIjQrAQD9ZGOstplnB2HBmL1QHMykf53J3vIo0pKIEzpCAD2d5
 /SUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HmEokn5oUdJqWXRoigMGBMDU0hXxS+4uBuxS3ZcINxM=;
 b=vCTymRBSvNLkQg5f8w6HMJzIV3fvzcOvG2RlF4t1JutE/7pLCp/s+CUJhP35AfM+1g
 ToxpaFlzZaoMM4AFXKuC3IXNftB1/bpHPn/7DWTo86v8Yjr6JmzBHRTVgLuh9DnHc9SG
 oepAJW4tuEUD61g9ivoU98rOFw92uPjT3DjAMjLvyRlzam/BCjD9BMexytPCzqP8cMnQ
 8qZ8unvSwK/KF0J9LmAQ6409XXpZnAhS/ugOhYC2fsq12QInpl64ZCsfhdjfWQLULvT5
 gRHop/XTpWzP6LHuziUYg4gQOH9ZiPZBYxlVJb5kLQAKN3zUOfMXl5X8mG6P7ym776qP
 uPuw==
X-Gm-Message-State: AOAM531IjH326Yu4P84HfMMVT/D8krx7Kx8K5ozOr9iXTdxNUe6Q37Vq
 YgBacEsxCBa/krsNpHil4tbWAQ==
X-Google-Smtp-Source: ABdhPJwlzOLG1W4ub2KbV14y6v+gpH90jywxXp37DBQhUdP75EU/sPsEI8FpAo2YyRWcehb3ZZte3A==
X-Received: by 2002:a05:6808:1141:: with SMTP id
 u1mr135628oiu.123.1633972922358; 
 Mon, 11 Oct 2021 10:22:02 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id n12sm1596854otq.32.2021.10.11.10.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:22:01 -0700 (PDT)
Date: Mon, 11 Oct 2021 10:23:35 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <YWRzFyS5WX6m5rNd@ripper>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
 <YWEOIHrp4Z8+MHaE@builder.lan>
 <c16ca06a-96da-ac04-5ae7-bbbdf4b48ee5@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c16ca06a-96da-ac04-5ae7-bbbdf4b48ee5@foss.st.com>
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

On Mon 11 Oct 08:58 PDT 2021, Arnaud POULIQUEN wrote:

> 
> 
> On 10/9/21 5:36 AM, Bjorn Andersson wrote:
> > On Fri 01 Oct 05:12 CDT 2021, Arnaud Pouliquen wrote:
> > 
> >> Create the config to associate to the remoteproc virtio.
> >>
> >> Notice that the REMOTEPROC_VIRTIO config can not set to m. the reason
> >> is that it defines API that is used by the built-in remote proc core.
> >> Functions such are rproc_add_virtio_dev can be called during the
> >> Linux boot phase.
> >>
> > 
> > Please don't introduce new Kconfig options for everything. Consider that
> > the expectation should be that everyone runs the default defconfig on
> > their boards - and if someone actually needs this level of control, they
> > are welcome to present patches with numbers showing the benefit of the
> > savings.
> 
> My goal here was to decorrelate the remote virtio from the remote proc,
> so that platforms based on a non-virtio solution do not embed the code.
> By reading your commentary it jumps out at me that that's stupid.

I definitely don't think it's stupid. In a resource constraint
environment that want to use remoteproc but won't use virtio this makes
total sense.

But the added Kconfig creates complexity and people run into issues
because the default defconfig is incomplete, they got their defconfig
"wrong" or "make olddefconfig" misses the new config.

As such, I simply would like us to postpone the introduction of
configurability until there's someone that can show it's worth the
complexity.

> The REMOTEPROC_VIRTIO config is useless as the remoteproc_virtio must
> be kept built-in for legacy compatibility.
> 

Right, so we would have to make sure that in all "standard"
configurations REMOTEPROC_VIRTIO is included.

Regards,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> > Thanks,
> > Bjorn
> > 
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/remoteproc/Kconfig               | 11 +++++++++-
> >>  drivers/remoteproc/Makefile              |  2 +-
> >>  drivers/remoteproc/remoteproc_internal.h | 28 ++++++++++++++++++++++++
> >>  3 files changed, 39 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> >> index 9a6eedc3994a..f271552c0d84 100644
> >> --- a/drivers/remoteproc/Kconfig
> >> +++ b/drivers/remoteproc/Kconfig
> >> @@ -6,7 +6,7 @@ config REMOTEPROC
> >>  	depends on HAS_DMA
> >>  	select CRC32
> >>  	select FW_LOADER
> >> -	select VIRTIO
> >> +	select REMOTEPROC_VIRTIO
> >>  	select WANT_DEV_COREDUMP
> >>  	help
> >>  	  Support for remote processors (such as DSP coprocessors). These
> >> @@ -14,6 +14,15 @@ config REMOTEPROC
> >>  
> >>  if REMOTEPROC
> >>  
> >> +config REMOTEPROC_VIRTIO
> >> +	bool "Remoteproc virtio device "
> >> +	select VIRTIO
> >> +	help
> >> +	  Say y here to have a virtio device support for the remoteproc
> >> +	  communication.
> >> +
> >> +	  It's safe to say N if you don't use the virtio for the IPC.
> >> +
> >>  config REMOTEPROC_CDEV
> >>  	bool "Remoteproc character device interface"
> >>  	help
> >> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> >> index bb26c9e4ef9c..73d2384a76aa 100644
> >> --- a/drivers/remoteproc/Makefile
> >> +++ b/drivers/remoteproc/Makefile
> >> @@ -8,8 +8,8 @@ remoteproc-y				:= remoteproc_core.o
> >>  remoteproc-y				+= remoteproc_coredump.o
> >>  remoteproc-y				+= remoteproc_debugfs.o
> >>  remoteproc-y				+= remoteproc_sysfs.o
> >> -remoteproc-y				+= remoteproc_virtio.o
> >>  remoteproc-y				+= remoteproc_elf_loader.o
> >> +obj-$(CONFIG_REMOTEPROC_VIRTIO)		+= remoteproc_virtio.o
> >>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
> >>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
> >>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >> index 152fe2e8668a..4ce012c353c0 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -30,10 +30,38 @@ int rproc_of_parse_firmware(struct device *dev, int index,
> >>  			    const char **fw_name);
> >>  
> >>  /* from remoteproc_virtio.c */
> >> +#if IS_ENABLED(CONFIG_REMOTEPROC_VIRTIO)
> >> +
> >>  int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
> >>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> >>  void rproc_vdev_release(struct kref *ref);
> >>  
> >> +#else
> >> +
> >> +int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +
> >> +	return -ENXIO;
> >> +}
> >> +
> >> +static inline irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +
> >> +	return IRQ_NONE;
> >> +}
> >> +
> >> +static inline void rproc_vdev_release(struct kref *ref)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +}
> >> +
> >> +#endif
> >> +
> >>  /* from remoteproc_debugfs.c */
> >>  void rproc_remove_trace_file(struct dentry *tfile);
> >>  struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
