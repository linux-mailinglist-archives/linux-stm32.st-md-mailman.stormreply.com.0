Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF379466F59
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 02:52:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 851CFC5F1DC;
	Fri,  3 Dec 2021 01:52:37 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36394C5F1D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 01:52:36 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso2131551ots.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 17:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7mMlMJcjWFiI2W1C5SLC/CCOWk/rtwKkTXW1CQZM02M=;
 b=vdZDqYWqqFPSHHnrXxQ/QouLOJQrts2O2q7uKSoiGjwDgCArLHicGCh4baJKAgFDAd
 8wsz01sIKQbZuABTqg6PwTDo4zXMT76ApuSQJ87S69wlEc+1jgZ/WdZdf2snuHo0GQ0E
 wdF49QMck7QD/ww8ZCyUomdYFYiKCsFATXgNOriFbUVNbdMg9KwBzPHQrvOdJOYxhsFl
 5AM4SWdSL0z+I+DJhx6AAWk/ZfaLSpXbv37fsdA9DpiOGt5KEyi2qBh8zKBY4TyrsitM
 H2x3h9jdn3G4uq9pmnpYZRGmfv8biU6jLg/+jJafHF5cQUtYCm63ll5SjVToOg7ewrxE
 Ksmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7mMlMJcjWFiI2W1C5SLC/CCOWk/rtwKkTXW1CQZM02M=;
 b=XV1nszjwNppE2CVRKGjvKrZppFQ4DV+NUfB36XEWF3Xh/VbsB2JZ+/ce5cTZQ6ewDa
 H/DIsrJQtv2ASRlLivaypvAjgpR5b9YWM1EHooY69hMBiqhLpTlVAtQ0P9UwPaHf/d4v
 +uE5kT7+mo5zuRfYF9lc8ynYUvVe6UzV9Ei6QeYNmgLoJ0myORaIAixMYN5pJDj1/gwq
 K/IeV0QNnxCflrZBzu8aE1ECr1luPXjSXAzttK8OOU6XOZoR7lQnRW37aLNwkqu4QHkZ
 +7KBTUCu/PEY27i+StXuCCHVbCwncSzVmR7K5dFzv2to3qRfxkBUrg9OBO6mbe/vCPbU
 8hhw==
X-Gm-Message-State: AOAM530awz5iikmRPTevckp/wxY4O1ASS3OzzOjprN1o6Sa/wGraix4k
 f/qX0XPPuY205emWI93R23w2pA==
X-Google-Smtp-Source: ABdhPJxDEprfD0kGWyUVTAE4w3xRpccrCwQvCjeV/FWVKojpFKNxDvfWyALAionnLaK9K+JYbRGrow==
X-Received: by 2002:a9d:2605:: with SMTP id a5mr14557262otb.217.1638496354819; 
 Thu, 02 Dec 2021 17:52:34 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id a12sm380940otk.35.2021.12.02.17.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 17:52:34 -0800 (PST)
Date: Thu, 2 Dec 2021 19:52:29 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <Yal4XcCVa6GAQYkG@builder.lan>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
 <20211108141937.13016-11-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211108141937.13016-11-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v7 10/12] rpmsg: char: Introduce the
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

On Mon 08 Nov 08:19 CST 2021, Arnaud Pouliquen wrote:

> Allows to probe the endpoint device on a remote name service announcement,
> by registering a rpmsg_driverfor the "rpmsg-raw" channel.
> 
> With this patch the /dev/rpmsgX interface can be instantiated by the remote
> firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 64 ++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_ctrl.c |  7 +++--
>  2 files changed, 69 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 6a01e8e1c111..dd754c870ba1 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -432,6 +432,58 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_channel_info chinfo;
> +	struct rpmsg_eptdev *eptdev;
> +	struct device *dev = &rpdev->dev;
> +
> +	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
> +	chinfo.src = rpdev->src;
> +	chinfo.dst = rpdev->dst;
> +
> +	eptdev = rpmsg_chrdev_eptdev_alloc(rpdev, dev);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	/*
> +	 * Create the default endpoint associated to the rpmsg device and provide rpmsg_eptdev
> +	 * structure as callback private data.
> +	 * Do not allow the creation and release of an endpoint on /dev/rpmsgX open and close,
> +	 * reuse the default endpoint instead
> +	 */
> +	eptdev->default_ept = rpmsg_create_default_ept(rpdev, rpmsg_ept_cb, eptdev, chinfo);
> +	if (!eptdev->default_ept) {
> +		dev_err(&rpdev->dev, "failed to create %s\n", chinfo.name);
> +		put_device(dev);

Which get_device() does this correlate to?

> +		kfree(eptdev);

After the device_initialize() in rpmsg_chrdev_eptdev_alloc() you're
supposed to put_device() &eptdev->dev, which would kfree(eptdev)...


Note though that rpmsg_eptdev_release_device() calls cdev_del(), which
you can't do. It was however recently reported that this cdev_del()
should be done in conjunction with the device_del() as the current
implementation enables a race between release and fops->open.

Regards,
Bjorn

> +		return -EINVAL;
> +	}
> +
> +	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
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
> +	{ .name	= "rpmsg-raw" },
> +	{ },
> +};
> +
> +static struct rpmsg_driver rpmsg_chrdev_driver = {
> +	.probe = rpmsg_chrdev_probe,
> +	.remove = rpmsg_chrdev_remove,
> +	.id_table = rpmsg_chrdev_id_table,
> +	.drv.name = "rpmsg_chrdev",
> +};
> +
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
> @@ -442,12 +494,24 @@ static int rpmsg_chrdev_init(void)
>  		return ret;
>  	}
>  
> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> +		goto free_region;
> +	}
> +
>  	return 0;
> +
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
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
>  module_exit(rpmsg_chrdev_exit);
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 59d2bd264fdb..298e75dc7774 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -10,6 +10,9 @@
>   * Based on rpmsg performance statistics driver by Michal Simek, which in turn
>   * was based on TI & Google OMX rpmsg driver.
>   */
> +
> +#define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt
> +
>  #include <linux/cdev.h>
>  #include <linux/device.h>
>  #include <linux/fs.h>
> @@ -193,13 +196,13 @@ static int rpmsg_ctrldev_init(void)
>  
>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_ctrl");
>  	if (ret < 0) {
> -		pr_err("rpmsg: failed to allocate char dev region\n");
> +		pr_err("failed to allocate char dev region\n");
>  		return ret;
>  	}
>  
>  	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
>  	if (ret < 0) {
> -		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
> +		pr_err("failed to register rpmsg driver\n");
>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  	}
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
