Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0406374101
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 18:42:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76D43C58D7F;
	Wed,  5 May 2021 16:42:05 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0827DC58D78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 16:42:04 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id m190so2228754pga.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 May 2021 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DoaVFzcWT65RDKIsoX6i4zeOSXhY9rWNOtYUEZapV9M=;
 b=mbZtkkRloDaT6rF9tDRW/WZymf+9jLo9twlvhFYxhRfFiYZWjAvMyvN+viRiqjgKqt
 UyNF1Iyh1k99tg8rgQ6BV9Ounqvoxr+rsdEzMRXR1g485Q9YLIoIHHPIXsXrBKG2ZiUD
 nB4R4irRIQryWE92wgzcDCfKhD347u2q3t4um5tDOwylV4/JpVT4quKNpXWYBJD+R1XZ
 5mj3Q2S4ucykX2zQpNuWEZmj6Uy9OWc010d33E+j2WUygzeT0YPt7CZAScPpA/igYKG1
 LCTLsArcXQyVbFFbWENRBoQWIb3qt8GrYR870JQZMymqQ4A/rADuCXEcgXn+I5XPqGD/
 vzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DoaVFzcWT65RDKIsoX6i4zeOSXhY9rWNOtYUEZapV9M=;
 b=XaM3a7l9g2jFvcyN/MRIvpw42hl8PLx1gJqDPnAmc+KtOKYIaecOnb4mF/0gyZ4M+Y
 yrmdNV02bNT71SLkC9oO3tmAfYzsZzKBTITSg8iGFrmeKNcbCNeYArbWTKfPyl/+jUr0
 m8F04KAD1GMSxh7XKTFd1vY9BpVZGlo0ku/vn9BI5DDkci0hqvhpU0CIMiZULOUfB7pm
 y/AAaP7lPhw7tFyW1mlm9fq6kIAil5dEUZsF5ZEI85VthqbVKqo5E4MZ/yc9QegR61br
 djwB3LKtSp3cTSd21oOJN5t/VinwV4//foZS6guMJPVCLwTaQD0pV0QI0QneSwNTNw74
 HO2Q==
X-Gm-Message-State: AOAM532zDLHIfXeghvmr6LixQAHHiRd5YVnPG9CCKzCCL47uuMD0jRUn
 Zi0p3/5IPSyuiBqOi/CPjLhunw==
X-Google-Smtp-Source: ABdhPJy8aXfyfO/v6bt55dmHC/uDTmkRDUhRcGL0u1NDJI/QiWxFP8baqLitM5Yc9kh12gLU5ynfdg==
X-Received: by 2002:a63:5322:: with SMTP id h34mr29849146pgb.182.1620232922466; 
 Wed, 05 May 2021 09:42:02 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id a18sm7502227pgg.51.2021.05.05.09.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:42:01 -0700 (PDT)
Date: Wed, 5 May 2021 10:41:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210505164159.GB1766375@xps15>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
 <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 5/6] rpmsg: char: Introduce a rpmsg
 driver for the rpmsg char device
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

On Thu, Apr 29, 2021 at 03:55:06PM +0200, Arnaud Pouliquen wrote:
> A rpmsg char device allows to probe the endpoint device on a remote name
> service announcement.
> 
> With this patch the /dev/rpmsgX interface is created either by a user
> application or by the remote firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> update from V1:
> 
>  - add missing unregister_rpmsg_driver call on module exit.
> ---
>  drivers/rpmsg/rpmsg_char.c | 53 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 5c6a7da6e4d7..9166454c1310 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -18,6 +18,8 @@
>  
>  #include "rpmsg_char.h"
>  
> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> +
>  static dev_t rpmsg_major;
>  static struct class *rpmsg_class;
>  
> @@ -413,6 +415,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
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

The sole purpose of doing this is to create instances of rpmsg_chrdevs from the
name service - but is it really needed?  Up to now and aside from GLINK and SMD,
there asn't been other users of it so I'm wondering if it is worth going through
all this trouble.

As such I suggest we don't go out of our way to expose rpmsg_chrdevs to the name
service.  That way patches 4, 5 and 6 of this set can be dropped.

Thanks,
Mathieu

> +
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
> @@ -427,15 +463,30 @@ static int rpmsg_chrdev_init(void)
>  	if (IS_ERR(rpmsg_class)) {
>  		pr_err("failed to create rpmsg class\n");
>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
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
