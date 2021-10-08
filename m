Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F0442742D
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Oct 2021 01:27:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58E67C5C824;
	Fri,  8 Oct 2021 23:27:34 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F210EC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 23:27:32 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 w10-20020a056830280a00b0054e4e6c85a6so4479318otu.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 16:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UcoB+5fCYF52we3qe/RiFWGs8jkkNhY5tHgymk6y40o=;
 b=NLD/D3P5mqq3fW68lN15+KWSAZeFqaGF+aJuxw9CoGyup0gCHTxodQpE6VivP1j1xp
 5aQX9A9E5vENxJWzhc/KnpOEfQf4yVBXtkQ1jV68tKH2Xc6W5i1zzZH4zwrERc4fEikS
 YjQs8tmh3d/u/5mjwciWLPIuWjtmNbaXjo9DNw6T2JbVxPABfoSIMLHv6K/wdb9LC3Ce
 Uz4OUoaTKfxJtcwA9kbHN9khRTkegkU0scHi0jdo0bhV9Zr+eWqeR2cfOylIy3HBlpNG
 +87OL0YMB3eoEKtagaw+n9hLPPuVYOpuZGqBS+RhcXe5gY6GgvMTXbMsDrce66xKl9wG
 Xy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UcoB+5fCYF52we3qe/RiFWGs8jkkNhY5tHgymk6y40o=;
 b=fQa2ncgUlyAyGlZKeVpgQdnShMFeQ9kFo4W1AFIeUzpzmMCHJE96Sx2+psWLze6MQ/
 u7txtFSKUUq6zAoth6B+iWMX+mGa6IN9eh/IxXy98NDHFKDVaK9op1GVNOUJPY1ii0wr
 g8L3ELAhw5oy2GBHGA2KFbj7+nM1sH3T0x//anX5Nrx4vV9XMiueWvl4f3jYrJEu7JGa
 H5noTez/ex/ESb2N+autj+8H71lCPUKBwkiYH4l+wmODfd57Bva2dQJvSQyf6I8341za
 yrJh8wSWD07bBKXX+t/tidivqmcBvTmW1GI+6Trf/o5rI1QPFsiIVx7PYpRjJIMegkmF
 UnHw==
X-Gm-Message-State: AOAM532z40gyfzCI6QoyZkhz5rl2RAjblSG78s6JGQbzsBkwhTMH8/2+
 mvR1vnqKeipYs6mLEFZsnQxLwA==
X-Google-Smtp-Source: ABdhPJxJ6Y5o8Ma3y0qrOQzeuoTAxD9GmIPjDyw5Vh2WcihB6FL1lmd9w2RqDM0YuWzvO8wZn8Nu2w==
X-Received: by 2002:a05:6830:60c:: with SMTP id
 w12mr11030494oti.370.1633735651730; 
 Fri, 08 Oct 2021 16:27:31 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id h11sm165108otu.49.2021.10.08.16.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:27:31 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:29:09 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YWDURVTg1PpxRDEu@ripper>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712123752.10449-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 2/4] rpmsg: char: Export eptdev create
 an destroy functions
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

On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
[..]
> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> new file mode 100644
> index 000000000000..22573b60e008
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_char.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) STMicroelectronics 2021.
> + */
> +
> +#ifndef __RPMSG_CHRDEV_H__
> +#define __RPMSG_CHRDEV_H__
> +
> +#if IS_REACHABLE(CONFIG_RPMSG_CHAR)

This does allow you to build a kernel with RPMSG_CHAR=m and RPMSG_CTRL=y
without link failures. Any modules in the system will be able to call
rpmsg_chrdev_eptdev_create(), but the rpmsg_ctrl driver will only end up
in the stub.

This sounds like a recipe for a terrible debugging session...

Regards,
Bjorn

> +/**
> + * rpmsg_chrdev_eptdev_create() - register char device based on an endpoint
> + * @rpdev:  prepared rpdev to be used for creating endpoints
> + * @parent: parent device
> + * @chinfo: associated endpoint channel information.
> + *
> + * This function create a new rpmsg char endpoint device to instantiate a new
> + * endpoint based on chinfo information.
> + */
> +int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo);
> +
> +/**
> + * rpmsg_chrdev_eptdev_destroy() - destroy created char device endpoint.
> + * @data: private data associated to the endpoint device
> + *
> + * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
> + * control.
> + */
> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
> +
> +#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
> +
> +static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +					     struct rpmsg_channel_info chinfo)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +#endif /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
> +
> +#endif /*__RPMSG_CHRDEV_H__ */
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
