Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C333466FA9
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 03:17:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61259C5F1DC;
	Fri,  3 Dec 2021 02:17:49 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 247B0C5F1D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 02:17:48 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id n66so2927861oia.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 18:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/xEnHpiNZIiBMq7VBpsg6nm2XEWpv3RfgGXRqVy/dX0=;
 b=eJ1BxUe4FjEz+PM1veXkHjD2GeDsLhl/S/Ao8DVTTwWFV0zv5YP6gIR1tWDCNVVrfL
 p3LMroMnIwU3vCIgySbWESxtfifSg0xB19iBaCrIw2hvdwVj9QKFnXtr6MqQBB4ukbOt
 m4eWGLXMpkbRdiGFPA5HVkhElxP1/a474m5+sjJCPTt7gwiIl27T7QtNI2V+y9WWvXmI
 rNEkpqS6EoVbOJ2Fh9jXovBmS+kZiWGQ1s7rvq2y2MiDJ1yMh+4GU2z0rF84E2rSH2Ho
 Fz/RzpU35ty1T//CDyXQF622ngb/QUg2piSTU0ooUYqd5VgZif9Z1tQdT8bWdN8wKXL6
 zKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/xEnHpiNZIiBMq7VBpsg6nm2XEWpv3RfgGXRqVy/dX0=;
 b=mp9Xx3FTvv9tGtZRd5I92lr0Bt/GwsK23MAGLVctWUB+DqYY3GvHN0K1f59qcnwppW
 JKToudxtO7xtSeXSazHxHRG4ob4mqw6gzFRze6SJ03E+I27EHRDMICXJId/i7kxfcNDj
 SuKx5pFchqR+JAKvEZzue5Gzpl54YgQtuvlhLLlBEUsyVxMe8MnmIqahv+U+a16xAcBB
 cTKThoOuRVrTO5zyXDGnbUG+GwB9BsA7uUKbk7IoHnXop1VnG7LnLcO1G5q6Zhc11HCY
 nplPKQIVxRnJfEIAwIHgGXxVJFp18Lv9S/4pnexELQl5ur9VpGOINMF+siyigfbAGwUA
 Xgmg==
X-Gm-Message-State: AOAM531eIUGBBbY/VeX0hD4nC7wqtHbCZcJLX4O2XEUQc1VLhSWpZlff
 ykdM3yD13nUL/3tnRcFjWwxUMA==
X-Google-Smtp-Source: ABdhPJzlnEGMLizbKrS+0DrTUk/CTUO+16IImKgwrRBAvDWOmTbdjreM/mOhfK3TclNVwBf5MCqklQ==
X-Received: by 2002:a05:6808:23c3:: with SMTP id
 bq3mr7483254oib.124.1638497866914; 
 Thu, 02 Dec 2021 18:17:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t14sm379403otr.23.2021.12.02.18.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 18:17:46 -0800 (PST)
Date: Thu, 2 Dec 2021 20:17:43 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <Yal+R7nd1tuBHioi@builder.lan>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
 <20211108141937.13016-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211108141937.13016-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v7 02/12] rpmsg: Create the rpmsg class in
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

On Mon 08 Nov 08:19 CST 2021, Arnaud Pouliquen wrote:

> Migrate the creation of the rpmsg class from the rpmsg_char
> to the core that the class is usable by the rpmsg_char and
> the futur rpmsg_ctrl module.
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> Update vs previous revision:
> - remove rpmsg_get_class API and export the rpmsg_class in rpmsg_internal.h
> ---
>  drivers/rpmsg/rpmsg_char.c     | 10 ----------
>  drivers/rpmsg/rpmsg_core.c     | 15 +++++++++++++--
>  drivers/rpmsg/rpmsg_internal.h |  2 ++
>  3 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 44934d7fa3c4..8ab5ac23850c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -29,7 +29,6 @@
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>  
>  static dev_t rpmsg_major;
> -static struct class *rpmsg_class;
>  
>  static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_ept_ida);
> @@ -559,17 +558,9 @@ static int rpmsg_chrdev_init(void)
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
> @@ -580,7 +571,6 @@ postcore_initcall(rpmsg_chrdev_init);
>  static void rpmsg_chrdev_exit(void)
>  {
>  	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> -	class_destroy(rpmsg_class);
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
>  module_exit(rpmsg_chrdev_exit);
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 9151836190ce..45227c864aa2 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -20,6 +20,9 @@
>  
>  #include "rpmsg_internal.h"
>  
> +struct class *rpmsg_class;
> +EXPORT_SYMBOL(rpmsg_class);
> +
>  /**
>   * rpmsg_create_channel() - create a new rpmsg channel
>   * using its name and address info.
> @@ -629,10 +632,17 @@ static int __init rpmsg_init(void)
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
> @@ -640,6 +650,7 @@ postcore_initcall(rpmsg_init);
>  static void __exit rpmsg_fini(void)
>  {
>  	bus_unregister(&rpmsg_bus);
> +	class_destroy(rpmsg_class);
>  }
>  module_exit(rpmsg_fini);
>  
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..1b6f998e1a4a 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -18,6 +18,8 @@
>  #define to_rpmsg_device(d) container_of(d, struct rpmsg_device, dev)
>  #define to_rpmsg_driver(d) container_of(d, struct rpmsg_driver, drv)
>  
> +extern struct class *rpmsg_class;
> +
>  /**
>   * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
>   * @create_channel:	create backend-specific channel, optional
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
