Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E733AF912
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 01:16:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAF4FC57B53;
	Mon, 21 Jun 2021 23:16:39 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 240D9C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jun 2021 23:16:37 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so507995pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jun 2021 16:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o38KzSQf9bk0w4H1R0wVtOAX95R/HHsV6qoW4ydXw+4=;
 b=Y52wWIe+5PSkZscV4l4zndjTceFusvppikvaZXHKCtsxUv1L8hByVc26U04LgF7QIg
 XpKk5xmflRzxBgkJxQPYwo6/5Adnf6f8dnNwNCWvDJ3TGa9xMuGXF5/rkQJIVL6bYj/8
 IshpVIuUWX6RQhpEKrbFTPmDDGCs2260NApQqevq9I2GR7csiOovxNE6ItezXrtaCqWB
 rbNLX3FkKHgZsIb1aLqGLZLazCt6SLL0cOEGFiv6XD3UHRnVvANYDC7z8oAi7aENWxJj
 HMVSKkNPecKOW6tDlvGmXMRpSdp8C0XGajSKA8U2wcZ/zpogBS679AAIQDZhl1TGbLFo
 73VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o38KzSQf9bk0w4H1R0wVtOAX95R/HHsV6qoW4ydXw+4=;
 b=VLD+MJHicMYQrwek0aupS5Y659tas2jtLJJ8x8eVRtAa9DxTv93rO5P5MOTpnZK4yS
 s2hFSj4aeyjATvwBF4H9AAponYPSD/PYMnPAV8Sn1DR/0/kaWlK3MVFUmDZp/+zn0Vwl
 R+gFrgAy8nZ/Zt0lhGIhtOw3a6/WmYIJVYK413yJnySJj1pP0+MF9/CS0ssNuFSeiHSZ
 ZjyvoogxQSSbDGLQtkCGo/Ir1O92eC40LDt+cv/cfWplLw7Rb7R/smO3Ix6xNu/Ju0Zk
 zJfLr0Lx2lTNw2qtQ8qnElWYTQsYqT3uMs7QUxQo98X5UrqJ7b0O3UlBWtC833oDyFIy
 G7OQ==
X-Gm-Message-State: AOAM5339nKCUorhOPtCpIqX6djc+hcZqA1hmYcYvk+AcpRhWroKgGqex
 OqSK78yaBw77YV9t+CwmQluoDw==
X-Google-Smtp-Source: ABdhPJzvZNwZ5ttzMbcP5RAWrMfd1TwySMuBxZi2MrHX6mW1Virrq+UUkD7969Grh1YJRoBbIrn48A==
X-Received: by 2002:a17:902:c1cd:b029:121:3424:fcd5 with SMTP id
 c13-20020a170902c1cdb02901213424fcd5mr19098076plc.77.1624317396394; 
 Mon, 21 Jun 2021 16:16:36 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id z17sm16635456pfq.218.2021.06.21.16.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:16:35 -0700 (PDT)
Date: Mon, 21 Jun 2021 17:16:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210621231633.GC980846@p14s>
References: <20210621125800.27696-1-arnaud.pouliquen@foss.st.com>
 <20210621125800.27696-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621125800.27696-2-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] rpmsg: ctrl: Introduce new
 RPMSG_CREATE/RELEASE_DEV_IOCTL controls
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

On Mon, Jun 21, 2021 at 02:58:00PM +0200, Arnaud Pouliquen wrote:
> Allow the user space application to create and release an rpmsg device
> by adding RPMSG_CREATE_DEV_IOCTL and RPMSG_RELEASE_DEV_IOCTL ioctrls to
> the /dev/rpmsg_ctrl interface
> 
> The RPMSG_CREATE_DEV_IOCTL Ioctl can be used to instantiate a local rpmsg
> device.
> Depending on the back-end implementation, the associated rpmsg driver is
> probed and a NS announcement can be sent to the remote processor.
> 
> The RPMSG_RELEASE_DEV_IOCTL allows the user application to release a
> rpmsg device created either by the remote processor or with the
> RPMSG_CREATE_DEV_IOCTL call.
> Depending on the back-end implementation, the associated rpmsg driver is
> removed and a NS destroy rpmsg can be sent to the remote processor.
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 37 +++++++++++++++++++++++++++++++++----
>  include/uapi/linux/rpmsg.h | 10 ++++++++++
>  2 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index eeb1708548c1..cb19e32d05e1 100644
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
> @@ -82,7 +84,33 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  	chinfo.src = eptinfo.src;
>  	chinfo.dst = eptinfo.dst;
>  
> -	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
> +	mutex_lock(&ctrldev->ctrl_lock);

Have you been able to verify the VFS layer doesn't take care of serializing
ioctl() and file accesses in general?  I did a quick search in the drivers/
directory and the vast majority of implementations don't use a lock.

Thanks,
Mathieu

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
> +	case RPMSG_RELEASE_DEV_IOCTL:
> +		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
> +		if (ret)
> +			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
> +				chinfo.name, ret);
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
> @@ -119,6 +147,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
>  	device_initialize(dev);
>  	dev->parent = &rpdev->dev;
>  
> +	mutex_init(&ctrldev->ctrl_lock);
>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>  	ctrldev->cdev.owner = THIS_MODULE;
>  
> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> index f5ca8740f3fb..1637e68177d9 100644
> --- a/include/uapi/linux/rpmsg.h
> +++ b/include/uapi/linux/rpmsg.h
> @@ -33,4 +33,14 @@ struct rpmsg_endpoint_info {
>   */
>  #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
>  
> +/**
> + * Instantiate a new local rpmsg service device.
> + */
> +#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
> +
> +/**
> + * Release a local rpmsg device.
> + */
> +#define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
> +
>  #endif
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
