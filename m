Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E633A89E5
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jun 2021 22:01:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2847C597AE;
	Tue, 15 Jun 2021 20:01:09 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0044AC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 20:01:07 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id x19so9045863pln.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 13:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mK+dfw12PspGdiDN7Aja8xm932jImZhUu7ubIXVtJsU=;
 b=JvEedf9F3D9MeBwaBi93hXBFxl6ykGnIO8M/fT1+3W23aYtEtMwyReUX6yig0en4/U
 +b6A+77kNIUzuP4YyHnffUicj+SsMqtektA7i6226Dlze3k09BefmU/8Lsyk9TD1gtpI
 s60V889fOAVIMfDL5SswZ8Dno9ARipANCYaI6nBNhZj5neYsb0bcgkcY9WH9SRLgmS4f
 UKofDiqKgBFywPonoEqQWjXucD7SIQE7uIa84/xw7wkIXq/lqPDyQXbb1zUieTRScxoe
 iiOL6znAeWWdzau5+bHeM7MG3bRbBvT5MPzOyEOao3ey640KHCG62Asl70Ked62XaoJU
 LvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mK+dfw12PspGdiDN7Aja8xm932jImZhUu7ubIXVtJsU=;
 b=j6ld1p0jF7hjRWAdYLVnDG6ahlqD23gu5Lq4xoaYsiu33ptt9D7ARMQ/NV5DjGE8oE
 inhgBRRMqj8v2Sn9LWsNTcswYIEF/vsHaGCxooPmx9hRZDmuNI4OMNtcU35umcPMia6m
 v+Sge5UIbh4GQ2EPVFxEYYGhqOxfxzqhYjK0FIB7dchTI/WYjIY3CJpqEdgYw0ge6sUR
 1m5dPCXvahdA99vlpxDmx9v1xQVZlC681geD2SiDNg6UFdP6lNlqoZaUXEI+9TftR6Xm
 UIpxY8B1aYL78wIMFJBCRJSedcYf3Kf6r4B5Iycsg3j4aWgXtP4CT8TNk0augkxI2Ey3
 /hlw==
X-Gm-Message-State: AOAM530tPJzRCJGx/8p/MRNuJeqJANw4BsEEbRICE/YKtEnXBkpHDZiO
 q1EMXXLDKnuwcQcnBAtx67dqSA==
X-Google-Smtp-Source: ABdhPJy9OFWieDH+w6Dl/3tdrj3B3eDZo8MuDjBTUM/GngXfeh+0a9bRd6P3eVzDzCFrqRdv3CRcWg==
X-Received: by 2002:a17:903:2c3:b029:11b:cbb9:edfb with SMTP id
 s3-20020a17090302c3b029011bcbb9edfbmr5871567plk.12.1623787265465; 
 Tue, 15 Jun 2021 13:01:05 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id x20sm5817pfu.205.2021.06.15.13.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 13:01:04 -0700 (PDT)
Date: Tue, 15 Jun 2021 14:01:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210615200102.GE604521@p14s>
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
 <20210607173032.30133-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607173032.30133-4-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/4] rpmsg: char: Introduce the
	"rpmsg-raw" channel
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

On Mon, Jun 07, 2021 at 07:30:31PM +0200, Arnaud Pouliquen wrote:
> Allows to probe the endpoint device on a remote name service announcement,
> by registering a rpmsg_driverfor the "rpmsg-raw" channel.
> 
> With this patch the /dev/rpmsgX interface can be instantiated by the remote
> firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 54 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 4199ac1bee10..3b850b218eb0 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -25,6 +25,8 @@
>  
>  #include "rpmsg_char.h"
>  
> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> +
>  static dev_t rpmsg_major;
>  static struct class *rpmsg_class;
>  
> @@ -416,6 +418,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_channel_info chinfo;
> +
> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> +	chinfo.src = rpdev->src;
> +	chinfo.dst = rpdev->dst;
> +
> +	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);

I am a little puzzled here as to why we need different modes... Why can't we
simply call rpmsg_chrdev_eptdev_create() and let the endpoint be created on
open() and destroyed on release() as per the current implementation?

I'd rather keep things simple for the refactoring and introduce new features
later if need be.

As I said, it may be that I don't understand the usecase.

Thanks,
Mathieu

> +}
> +
> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> +{
> +	int ret;
> +
> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
> +	if (ret)
> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
> +}
> +
> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
> +	{ .name	= RPMSG_CHAR_DEVNAME },
> +	{ },
> +};
> +
> +static struct rpmsg_driver rpmsg_chrdev_driver = {
> +	.probe = rpmsg_chrdev_probe,
> +	.remove = rpmsg_chrdev_remove,
> +	.id_table = rpmsg_chrdev_id_table,
> +	.drv = {
> +		.name = "rpmsg_chrdev",
> +	},
> +};
> +
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
> @@ -429,16 +465,30 @@ static int rpmsg_chrdev_init(void)
>  	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
>  	if (IS_ERR(rpmsg_class)) {
>  		pr_err("failed to create rpmsg class\n");
> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> -		return PTR_ERR(rpmsg_class);
> +		ret = PTR_ERR(rpmsg_class);
> +		goto free_region;
> +	}
> +
> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> +		goto free_class;
>  	}
>  
>  	return 0;
> +
> +free_class:
> +	class_destroy(rpmsg_class);
> +free_region:
> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +
> +	return ret;
>  }
>  postcore_initcall(rpmsg_chrdev_init);
>  
>  static void rpmsg_chrdev_exit(void)
>  {
> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>  	class_destroy(rpmsg_class);
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
