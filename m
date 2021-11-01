Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B4441EE2
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Nov 2021 17:57:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12FB7C5AB61;
	Mon,  1 Nov 2021 16:57:13 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E18B4C5A4FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Nov 2021 16:57:10 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id u2so6634452oiu.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Nov 2021 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nsS/0Rl8lV1MqhAr3I/tx4m9hBCBcMuxVc4GrA1ZK4c=;
 b=jXV+W3M4Qjhq5IjWhdgfLxBBGVrmhSNsyUKKEV1oLZ6X9kj7ceKMousk6cIeGfzvl6
 w+GUbdKFxLCiH/TYVsJ4MsGMJTeT2rEjP07aG3W77QavYvHM4tPL1sk4ZZza3PxOP+X5
 uRFsrjodKrGphkNNW6yjECiZSumUoCt5CuQsjK0UwVvDEWzSFWk0Rl6CU2CI7okVzHqT
 1L5XQKEVUuBm81wJ94IQGPzqwZgngyazTZ0PlKTHGTfeu1xa1GYmiUfpC2/h/UWkYWeo
 7MDY5kx7BVRafO44EcLiJxJNQ0NhuKorZyzPkwFdMP5cPxGbo3CmqnfT7BbwIQVEYGS0
 gb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nsS/0Rl8lV1MqhAr3I/tx4m9hBCBcMuxVc4GrA1ZK4c=;
 b=WfuYFcs+Y1FqsUjPhM+AfIVizUxdDWmIzpOqaPqdePUeHAvFkzSQQnp5vfdqLxvv8U
 sOoG2/axdR9R/qE5YYFGipQj5KZCxs9DmON7t5nK1Izlu5xxqNGvrbhbJMBqzj8afxnW
 mPwBeM/Wnp59xg5ZDvX3V79WjzSTu8OO09HXjDtMDjLBHx5lY27WAf9a4yvF+avL7Mjs
 pGWAWfnjlwEODA7NAMrrLf6A6Afb/CL90VIUEcPLowzS3RKG/6TVL470U1tQD4pueW/J
 fpGqO4CC5mKySYDTr0IwREOboys6Z8NiGBWa6Aw4Hlgowjy+oJQ8iZmfvZ+Dz/ysCMgp
 SGcA==
X-Gm-Message-State: AOAM530T1AlmhIBPj+h9gXUJlwcBii2IU4kSAxx2W6xxSU2N+b+0Itup
 uGvtRYEst2Ki3ewcvRRdVxxBew==
X-Google-Smtp-Source: ABdhPJyC74haUvkgcIgZCE1hmj3NWzQzN+JUcZGVMIqLH17gobR/37RPx14Y3QDWT7lGHf2vUA+vpw==
X-Received: by 2002:a05:6808:1a1b:: with SMTP id
 bk27mr92123oib.55.1635785829794; 
 Mon, 01 Nov 2021 09:57:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u20sm1455647oiw.5.2021.11.01.09.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 09:57:09 -0700 (PDT)
Date: Mon, 1 Nov 2021 11:57:04 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YYAcYLxEmbwJShg7@builder.lan>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022125426.2579-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 02/10] rpmsg: create the rpmsg class in
 core instead of in rpmsg char
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

> Migrate the creation of the rpmsg class from the rpmsg_char
> to the core that the class is usable by all rpmsg services.
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 14 ++------------
>  drivers/rpmsg/rpmsg_core.c | 26 ++++++++++++++++++++++++--
>  include/linux/rpmsg.h      | 10 ++++++++++
>  3 files changed, 36 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 941c5c54dd72..327ed739a3a7 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -28,7 +28,6 @@
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>  
>  static dev_t rpmsg_major;
> -static struct class *rpmsg_class;
>  
>  static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_ept_ida);
> @@ -362,7 +361,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  	init_waitqueue_head(&eptdev->readq);
>  
>  	device_initialize(dev);
> -	dev->class = rpmsg_class;
> +	dev->class = rpmsg_get_class();
>  	dev->parent = parent;
>  	dev->groups = rpmsg_eptdev_groups;
>  	dev_set_drvdata(dev, eptdev);
> @@ -482,7 +481,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	dev = &ctrldev->dev;
>  	device_initialize(dev);
>  	dev->parent = &rpdev->dev;
> -	dev->class = rpmsg_class;
> +	dev->class = rpmsg_get_class();
>  
>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>  	ctrldev->cdev.owner = THIS_MODULE;
> @@ -558,17 +557,9 @@ static int rpmsg_chrdev_init(void)
>  		return ret;
>  	}
>  
> -	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> -	if (IS_ERR(rpmsg_class)) {
> -		pr_err("failed to create rpmsg class\n");
> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> -		return PTR_ERR(rpmsg_class);
> -	}
> -
>  	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>  	if (ret < 0) {
>  		pr_err("rpmsgchr: failed to register rpmsg driver\n");
> -		class_destroy(rpmsg_class);
>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  	}
>  
> @@ -579,7 +570,6 @@ postcore_initcall(rpmsg_chrdev_init);
>  static void rpmsg_chrdev_exit(void)
>  {
>  	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> -	class_destroy(rpmsg_class);
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
>  module_exit(rpmsg_chrdev_exit);
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 9151836190ce..53162038254d 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -20,6 +20,8 @@
>  
>  #include "rpmsg_internal.h"
>  
> +static struct class *rpmsg_class;
> +
>  /**
>   * rpmsg_create_channel() - create a new rpmsg channel
>   * using its name and address info.
> @@ -296,6 +298,19 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  }
>  EXPORT_SYMBOL(rpmsg_poll);
>  
> +/**
> + * rpmsg_get_class() - get reference to the sysfs rpmsg class
> + *
> + * This function return the pointer to the "rpmsg" class created by the rpmsg core.
> + *
> + * Returns the struct class pointer
> + */
> +struct class *rpmsg_get_class(void)

What value does this helper function add? Can't we just expose
rpmsg_class directly?

> +{
> +	return rpmsg_class;
> +}
> +EXPORT_SYMBOL(rpmsg_get_class);
> +
>  /**
>   * rpmsg_trysend_offchannel() - send a message using explicit src/dst addresses
>   * @ept: the rpmsg endpoint
> @@ -629,10 +644,17 @@ static int __init rpmsg_init(void)
>  {
>  	int ret;
>  
> +	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> +	if (IS_ERR(rpmsg_class)) {
> +		pr_err("failed to create rpmsg class\n");
> +		return PTR_ERR(rpmsg_class);
> +	}
> +
>  	ret = bus_register(&rpmsg_bus);
> -	if (ret)
> +	if (ret) {
>  		pr_err("failed to register rpmsg bus: %d\n", ret);
> -
> +		class_destroy(rpmsg_class);
> +	}
>  	return ret;
>  }
>  postcore_initcall(rpmsg_init);
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h

Isn't this just going to be used by rpmsg_char and rpmsg_ctrl? Do we
really need to expose it in the client-facing API?

Regards,
Bjorn

> index a8dcf8a9ae88..6fe51549d931 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -186,6 +186,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  			poll_table *wait);
>  
> +struct class *rpmsg_get_class(void);
> +
>  #else
>  
>  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
> @@ -296,6 +298,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>  	return 0;
>  }
>  
> +static inline struct class *rpmsg_get_class(void)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return NULL;
> +}
> +
>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
>  
>  /* use a macro to avoid include chaining to get THIS_MODULE */
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
