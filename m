Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFBD3A8800
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jun 2021 19:46:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21D73C597AE;
	Tue, 15 Jun 2021 17:46:41 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F75FC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 17:46:39 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id x73so13841303pfc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wddwTSMBbde5fomYmsiyLam28xGB6dPV0cf1qnti6ic=;
 b=RZ9l3hLv315HQzf74YqNq66u68piUTOQ4YEdk1ODigk1fSGwtzivrrZDNRdC1PncLw
 +/svDhoxXmOGWyK2ocUeeV1vZ8t1+fkxrXImy6iXlOkYFGKuQpCv64AD6tFy/HrX6iz/
 FnYgYtfx1j9DWUArUfF8//Mgo2ORXezFC+sLEZfdj2kkVJcO6a39Mfo8cnX7n3S0RPeR
 hu/b0fiIPcVSkZy5gZ9+Eu/CxoRGngDnWRIvC+oopFUYiWzDsM1qPXttNasNrcocf/AG
 0LsHVkwMMwAdporoK9/ao3Xrys5wzNeDwqsGMNCHhiheVgm/cCF2btVyKUVfQaAEnsXM
 PAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wddwTSMBbde5fomYmsiyLam28xGB6dPV0cf1qnti6ic=;
 b=k/2bOLRx6x/MPHD88TuRM2d46fj6rmLOVAgXAXqIBKaPImOrGf1cesP0zniLxv8nVH
 xszKaZTAJb6lhMXAq0dmJV4xxQVAc5Ggs0ZwXaL1im3wWUJcxkhoWeCWKlhzsO6CFszj
 uTeUlZl3/a4uNdX6t8/4rUweH827UpBPQ8SjmrbcOb6NAcbZW5dONxQnOdwZKZ8yqUIs
 w4GVAjY6QUTJjCJOqAth4+/wxk+rG9mX1QV5+nJPEN3N6Hw6b23SeWfbu5lW9t5zG6Ij
 esWxU09ZeGk3mzU0HT+YT35M6YwPfhxApXhXv5pE5puBUM9hbkllrAggQgN/8UWJ/bUH
 lhvA==
X-Gm-Message-State: AOAM533n4tigK3xpAvPGbSFOuBkZYqGgDYIs9pGWT0qhYPwZzFO+QCX9
 sRa3+BGM0e3w66qfFMFSyUzr8g==
X-Google-Smtp-Source: ABdhPJwFCtkBDaxNtqg+71URNkezF2YmFzdj1QOm2PfqazbyIO6ce3Jmtz4NDXGXw9U1bAuAzSYkhw==
X-Received: by 2002:a05:6a00:d65:b029:2ec:2bfa:d0d1 with SMTP id
 n37-20020a056a000d65b02902ec2bfad0d1mr5502974pfv.14.1623779197593; 
 Tue, 15 Jun 2021 10:46:37 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id f15sm16463659pgg.23.2021.06.15.10.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:46:36 -0700 (PDT)
Date: Tue, 15 Jun 2021 11:46:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210615174634.GB604521@p14s>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604091406.15901-4-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 3/4] rpmsg: ctrl: Add check on rpmsg
 device removability from user space
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

On Fri, Jun 04, 2021 at 11:14:05AM +0200, Arnaud Pouliquen wrote:
> Using the RPMSG_RELEASE_DEV_IOCTL is possible to remove any
> rpmsg device (such as the rpmsg ns or the rpmsg ctrldev).
> 
> Add a new field to store the removability of the device.
> 
> By default the rpmsg device can not be removed by user space. It is
> set to 1 by the rpmsg ctrl on RPMSG_CREATE_DEV_IOCTL request, but
> could also be set by an rpmsg driver during probe.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 17 ++++++++++++++++-
>  include/linux/rpmsg.h      |  2 ++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index cb19e32d05e1..e93c6ec49038 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -74,6 +74,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  	struct rpmsg_endpoint_info eptinfo;
>  	struct rpmsg_channel_info chinfo;
>  	struct rpmsg_device *rpdev;
> +	struct device *dev;
>  	int ret = 0;
>  
>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> @@ -95,11 +96,25 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  		if (!rpdev) {
>  			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
>  			ret = -ENXIO;
> +		} else {
> +			/* Allow user space to release the device. */
> +			rpdev->us_removable = 1;

As a rule of thumb I try really hard to avoid introducing new flags.  In this case we
can attain the same result by looking at chinfo->name, chinfo->src and
chinfo->dst.  I would introduce a new inline function in rpmsg_internal.h,
something like rpmsg_chrdev_is_ctrl_dev(), and compare the specifics in chinfo
to rpdev->id.name, rpdev->src and rpdev->dst.  If they all match then the
operation is refused.

That way we don't introduce a new flag and there is also no need to call
rpmsg_find_device() twice.

Thanks,
Mathieu

>  		}
>  		break;
>  
>  	case RPMSG_RELEASE_DEV_IOCTL:
> -		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
> +		dev = rpmsg_find_device(ctrldev->rpdev->dev.parent, &chinfo);
> +		if (!dev)
> +			ret =  -ENXIO;
> +
> +		/* Verify that rpmsg device removal is allowed. */
> +		if (!ret) {
> +			rpdev = to_rpmsg_device(dev);
> +			if (!rpdev->us_removable)
> +				ret = -EACCES;
> +		}
> +		if (!ret)
> +			ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
>  		if (ret)
>  			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
>  				chinfo.name, ret);
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index d97dcd049f18..3642aad1a789 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -47,6 +47,7 @@ struct rpmsg_channel_info {
>   * @ept: the rpmsg endpoint of this channel
>   * @announce: if set, rpmsg will announce the creation/removal of this channel
>   * @little_endian: True if transport is using little endian byte representation
> + * @us_removable: True if userspace application has permission to remove the rpmsg device
>   */
>  struct rpmsg_device {
>  	struct device dev;
> @@ -57,6 +58,7 @@ struct rpmsg_device {
>  	struct rpmsg_endpoint *ept;
>  	bool announce;
>  	bool little_endian;
> +	bool us_removable;
>  
>  	const struct rpmsg_device_ops *ops;
>  };
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
