Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5B33A8822
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jun 2021 19:53:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAC12C597B0;
	Tue, 15 Jun 2021 17:53:40 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A3EBC597AE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 17:53:39 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id k15so20168pfp.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qYdWcRQM4y5ppqD8DVn9IzKuN6FZdzqCct08fJM4mR0=;
 b=FsbuFP7IJTe2Ec/7O4Pyca3eLrgZ/zmcJHMVTZGpVzofZbVTKfo9azMmUqBLdfwq81
 07NNr1fTDon6nHXHWsR6cnTMVzS5cZhLOGb0OOkQP8pvdvxQRFiHNTOhcwtj5osllzQK
 r77W5Wlx9xsoei57zIiTkL6KELCBNOKKbcZLLBrwOUzt555jK8FLE9Ei9GkdIvbvN8M5
 2DZeaH2fAy77PO89CljgvP6egfVSsiUAOSo+GCifsvjPyaOyaKgCQXGakKQSzI3Wyy8t
 9IcwVQBApJ71KKNb2X2EPYGzVoz6bDG/E+MA32R4X2zV+kRwV5hK80Ksq2rvAALCYYeM
 Kyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qYdWcRQM4y5ppqD8DVn9IzKuN6FZdzqCct08fJM4mR0=;
 b=hnfM+GSvEUl9ZByu9CPScr3baGIuekpQm21lxenxR/WF+aijgRUlRyGlxQvQFNid2K
 akmbOKHHdnWAC4cyevNjaQCJN7smElI7yiPnhPEj3VXmeBYX4xkc9myrxICMfWBxM8TX
 PbmIvXDDJTbj26E+eZqgzC9cNJIcpfj68/GtI6L/buJHI+rhlb+ZXK8Bo1dVSatCjftl
 ZpoMGHR7peisOFrhPDbGF015/kmcBsLpkK1prnKKjnJWwO+2sbsme/0Bxplyp2HHt+Bu
 vx90RpOqW8OoHMLC4GfzL+YSrGzeUwaXQPkBIucQCZXoyv6KBLuFT8HvTO10uj6y1xP+
 RTxw==
X-Gm-Message-State: AOAM532xaOJDS4aL3gOLhzkWmtRy6Xa56f5qJcFKMkNja/1E/90R/rY7
 ttsKlatPnH1l63yZiKxF5XVhlQ==
X-Google-Smtp-Source: ABdhPJwsU4R2fp87erP/gI6ivQmNCb+AeFlVb5bzuxDA8fUjqHdwsXzTkItERIUs7aBx+upuh4lnEQ==
X-Received: by 2002:aa7:8f28:0:b029:2f4:9245:4ed with SMTP id
 y8-20020aa78f280000b02902f4924504edmr5378477pfr.24.1623779617576; 
 Tue, 15 Jun 2021 10:53:37 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id t14sm17721523pgm.9.2021.06.15.10.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:53:36 -0700 (PDT)
Date: Tue, 15 Jun 2021 11:53:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210615175334.GD604521@p14s>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604091406.15901-2-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/4] rpmsg: ctrl: Introduce
	RPMSG_CREATE_DEV_IOCTL
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

On Fri, Jun 04, 2021 at 11:14:03AM +0200, Arnaud Pouliquen wrote:
> Implement the RPMSG_CREATE_DEV_IOCTL to allow the user application to
> initiate a communication through a new rpmsg channel.
> This Ioctl can be used to instantiate a local rpmsg device.
> Depending on the back-end implementation, the associated rpmsg driver is
> probed and a NS announcement can be sent to the remote processor.
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 30 ++++++++++++++++++++++++++----
>  include/uapi/linux/rpmsg.h |  5 +++++
>  2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index eeb1708548c1..4aa962df3661 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -23,6 +23,7 @@
>  #include <uapi/linux/rpmsg.h>
>  
>  #include "rpmsg_char.h"
> +#include "rpmsg_internal.h"
>  
>  static dev_t rpmsg_major;
>  
> @@ -37,11 +38,13 @@ static DEFINE_IDA(rpmsg_minor_ida);
>   * @rpdev:	underlaying rpmsg device
>   * @cdev:	cdev for the ctrl device
>   * @dev:	device for the ctrl device
> + * @ctrl_lock:	serialize the ioctrls.
>   */
>  struct rpmsg_ctrldev {
>  	struct rpmsg_device *rpdev;
>  	struct cdev cdev;
>  	struct device dev;
> +	struct mutex ctrl_lock;
>  };
>  
>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> @@ -70,9 +73,8 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  	void __user *argp = (void __user *)arg;
>  	struct rpmsg_endpoint_info eptinfo;
>  	struct rpmsg_channel_info chinfo;
> -
> -	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> -		return -EINVAL;
> +	struct rpmsg_device *rpdev;
> +	int ret = 0;
>  
>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>  		return -EFAULT;
> @@ -82,7 +84,26 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  	chinfo.src = eptinfo.src;
>  	chinfo.dst = eptinfo.dst;
>  
> -	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
> +	mutex_lock(&ctrldev->ctrl_lock);

Do we need a lock here?  I thought the character device layer would guarantee
accesses on a file handler would be atomic...  Am I wrong?

> +	switch (cmd) {
> +	case RPMSG_CREATE_EPT_IOCTL:
> +		ret = rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
> +		break;
> +
> +	case RPMSG_CREATE_DEV_IOCTL:
> +		rpdev = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
> +		if (!rpdev) {
> +			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
> +			ret = -ENXIO;
> +		}
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +	}
> +	mutex_unlock(&ctrldev->ctrl_lock);
> +
> +	return ret;
>  };
>  
>  static const struct file_operations rpmsg_ctrldev_fops = {
> @@ -119,6 +140,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
>  	device_initialize(dev);
>  	dev->parent = &rpdev->dev;
>  
> +	mutex_init(&ctrldev->ctrl_lock);
>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>  	ctrldev->cdev.owner = THIS_MODULE;
>  
> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> index f5ca8740f3fb..f9d5a74e7801 100644
> --- a/include/uapi/linux/rpmsg.h
> +++ b/include/uapi/linux/rpmsg.h
> @@ -33,4 +33,9 @@ struct rpmsg_endpoint_info {
>   */
>  #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
>  
> +/**
> + * Instantiate a rpmsg service device.
> + */
> +#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
> +
>  #endif
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
