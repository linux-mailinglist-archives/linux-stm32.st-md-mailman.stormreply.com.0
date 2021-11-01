Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B86441EFA
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Nov 2021 18:07:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8796C5A4FF;
	Mon,  1 Nov 2021 17:07:41 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2FF6C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Nov 2021 17:07:38 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 a17-20020a4a6851000000b002b59bfbf669so6469879oof.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Nov 2021 10:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xVH7dLm0NAiqoLAhT9eKibAtQ2bOK8bGBgP1Bfreb6M=;
 b=Y7LiKl4nLyrRiuKlSgX4TjQcpM/ylW9QAivpFGHp+nQJ7zxIUjCOFhD+kzh5McY4h1
 +H1aixASX0mry5G6V/Z0qoRU9xckH2ocSJbO1nov8xtJiLSBnuVOvHAcpkpVc0/QuJlc
 gt/1aRb65eLVQoawG2wD0dwRxsUWxd+lSG6O5CbCBs9rsafy0Sqv5ieJBA7VHeYC3D1f
 HBbgiInO7WuUKG0rHO/+B1cizGFwUnR4/ITkJm09EfHyBrGWpzEHQ7mwM2X+SUyPAOQu
 eiL4SeE047ZrL2edy1cf4J3NpIE65OJJtCZZLBIe1E1pejg6te0ixt7CCaPwMQBHyq8+
 RlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xVH7dLm0NAiqoLAhT9eKibAtQ2bOK8bGBgP1Bfreb6M=;
 b=JFWG6PRVnqCOnxNT06SIjYFIobnxd5dz0wqZUMXhtCYm2hk8kBd+Q7VLob94WYuOVz
 EA6q5XB0h1U+KwupElbP6pXpwZuc2yIj0LFvnWltrTOkalxBmayuyUJCgHqm7DAW/Nd4
 /ivkqP0wkh3SbnbFamlEx70T2cBRAvDeDCA4VKYT8hYid0VRiZTJfQjRc+SXcneSSPWL
 9RJz6c/R2U4KClTiCiV9LYky3b9QfFjkNoEYQFdin0i/dxp9KTcGHi/i+SIGvskmndCv
 cg+3pdP2FGnVWE1ZDasimfZXHySgeSCyYR37eo7jopqBOYrwIlAsYfGkqonjNv4Jz0hD
 SeJA==
X-Gm-Message-State: AOAM531xf0SchvWZwMJZPCsRXblhbMdSUvuDxcvyN26bt7uVsvc6y2Nc
 qM0nML1f9ju8sGvZbK4///C9Mg==
X-Google-Smtp-Source: ABdhPJwfISfjV4+0OloX272RAvaTJ2ui4IC0YqQHQJCAITahYdUIwlTQExuPan7NMGj5ayWP5r+ERA==
X-Received: by 2002:a4a:958b:: with SMTP id o11mr20251516ooi.35.1635786457450; 
 Mon, 01 Nov 2021 10:07:37 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x65sm4187270oix.43.2021.11.01.10.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:07:36 -0700 (PDT)
Date: Mon, 1 Nov 2021 12:07:34 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YYAe1tUR+aCZ8cw0@builder.lan>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022125426.2579-4-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 03/10] rpmsg: Move the rpmsg control
 device from rpmsg_char to rpmsg_ctrl
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

On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:

> Create the rpmsg_ctrl.c module and move the code related to the
> rpmsg_ctrldev device in this new module.
> 
> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> kconfig file.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> ---
> update vs previous version:
> - set the ctrl device class with new rpmsg_get_class API for legacy support
> ---
>  drivers/rpmsg/Kconfig      |   9 ++
>  drivers/rpmsg/Makefile     |   1 +
>  drivers/rpmsg/rpmsg_char.c | 169 +----------------------------
>  drivers/rpmsg/rpmsg_char.h |   2 +
>  drivers/rpmsg/rpmsg_ctrl.c | 216 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 230 insertions(+), 167 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 0b4407abdf13..d822ec9ec692 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -10,11 +10,20 @@ config RPMSG_CHAR
>  	tristate "RPMSG device interface"
>  	depends on RPMSG
>  	depends on NET
> +	select RPMSG_CTRL

We don't want select of user selectable config options.

>  	help
>  	  Say Y here to export rpmsg endpoints as device files, usually found
>  	  in /dev. They make it possible for user-space programs to send and
>  	  receive rpmsg packets.
>  
> +config RPMSG_CTRL

I still don't like the introduction of more Kconfig options - search the
list for the number of patches that has corrected Kconfig dependency
issues.

That said, if you get it right...

> +	tristate "RPMSG control interface"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the /dev/rpmsg_ctrlX API. This API
> +	  allows user-space programs to create endpoints with specific service name,
> +	  source and destination addresses.
> +
>  config RPMSG_NS
>  	tristate "RPMSG name service announcement"
>  	depends on RPMSG
[..]
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
[..]
> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> index 109c2c43005f..ff1acc42628a 100644
> --- a/drivers/rpmsg/rpmsg_char.h
> +++ b/drivers/rpmsg/rpmsg_char.h
> @@ -12,6 +12,8 @@
>   * In such case a kernel warning is printed to help develloper to fix the issue.
>   */
>  
> +#define RPMSG_DEV_MAX	(MINORMASK + 1)

This was used to define the minors of the rpmsg chdev, now you're
splitting that range in one for the ctrl and one for the char.

Moving this define to a common place gives an impression that there's a
relationship between the two, but I don't see any. So I think you should
duplicate this in the two files - just like the other stuff.

> +
>  #if IS_REACHABLE(CONFIG_RPMSG_CHAR)
>  /**
>   * rpmsg_chrdev_eptdev_create() - register char device based on an endpoint
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> new file mode 100644
> index 000000000000..1d3c12e5cdcf
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021, STMicroelectronics

Did you actually change anything that warrant the explicit copyright
claim?

> + * Copyright (c) 2016, Linaro Ltd.
> + * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
> + * Copyright (c) 2012, PetaLogix
> + * Copyright (c) 2011, Texas Instruments, Inc.
> + * Copyright (c) 2011, Google, Inc.
> + *
> + * Based on rpmsg performance statistics driver by Michal Simek, which in turn
> + * was based on TI & Google OMX rpmsg driver.
> + */
[..]
> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_ctrldev *ctrldev;
> +	struct device *dev;
> +	int ret;
> +
> +	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
> +	if (!ctrldev)
> +		return -ENOMEM;
> +
> +	ctrldev->rpdev = rpdev;
> +
> +	dev = &ctrldev->dev;
> +	device_initialize(dev);
> +	dev->parent = &rpdev->dev;
> +	dev->class = rpmsg_get_class();

Thank you.

Regards,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
