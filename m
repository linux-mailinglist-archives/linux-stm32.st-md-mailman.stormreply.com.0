Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 524752EA16C
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 01:21:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03E00C56634;
	Tue,  5 Jan 2021 00:21:37 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47AF2C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 00:21:32 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id k7so6707993ooa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jan 2021 16:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LIXker5EnJHsafQbP79joilioWbkmngYyx1RHHCv7Uw=;
 b=rErqZ3A4dvxuuUMV7sKWvjSE5Xh1gIPEOcJtqQGZovSnHI2/SNEuntWX+mK/5dVz68
 8MCBr49BsH6FHG7MpFtpYn0G9SckPtY9giGOSkeEsZETj4RObZ5v4yBdYQG6GSukM08J
 h3FpRjRlWhJ9fB5/Vm5ll4P8a2SJJqtuX/i+AqGSwYq1a9dOe33rD6zoa5yiaG+u0zAM
 N27CM2vDlhON6dmigX1c/q9Q+nWo+3APfHEnoes2w46u58W89/hOm9pvzUPNsobAFX0v
 spoalltPT1akQd6H4/7/b4kpkqaJy1Y0wSLYhWE9/e0MzUumaQtVItpQ3Ysi1VLbU7jF
 bfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LIXker5EnJHsafQbP79joilioWbkmngYyx1RHHCv7Uw=;
 b=RXA9a7nJow5MlZW9FNiyVZ+vXcr98Nav8FgD6jDjliyxfM7q9cUxvgXNdMgL6IEJ3W
 9/2cSLwGG+sXgaSfw39XmNcsUH2SgR62CXT74RfDnJuNAOF7zwJZU08eJg5Xd7vimx0K
 09tUMw23MAhx5Gw0jyAkElLkq3DFCoGKSin+/34JcJfP0OtUqyyVvT9N/CCOLUHJC/nF
 2U/UJvFX8Y8RAxqKgzaJkHgSkFZ5vJYh3wrEKw6YkDhk3+2wH5ksToOQVeVHNGg9OQZY
 XP6aOmowKhUJT9ZCgLlEmYxZYcQtM6xDgMKYwMtj4C+P33IeN3dvhi7JEseSHZJy3Gi5
 EqGA==
X-Gm-Message-State: AOAM531SizVNbSK97zhJmdAQ1UWkKqisR/AcW/I2bzvgdOkescpxkZib
 TBHEwf61N3IR64jj5sRDr38tBg==
X-Google-Smtp-Source: ABdhPJx1hWs171zbA2BxhA5Eo+6Im9xk3fLa6XdV9YZjgx4JCki+kWJ6GvKpPvU0Q/GKWcWHyr6tEw==
X-Received: by 2002:a4a:bc8d:: with SMTP id m13mr50874379oop.63.1609806090853; 
 Mon, 04 Jan 2021 16:21:30 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id s24sm10643115oij.20.2021.01.04.16.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:21:30 -0800 (PST)
Date: Mon, 4 Jan 2021 18:21:28 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <X/OxCIGani7lEwlO@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-2-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 01/16] rpmsg: introduce RPMsg control
 driver for channel creation
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

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> The RPMsg_ctrl driver is a duplication of the ioctrl part of the
> rpmsg_char driver to make generic the ioctl to manage channels by
> the userspace applications.
> 
> As a first step, this driver just creates the /dev/rpmsg_ctl<x>
> ( <x> is the instance value). The ioctl is not implemented.
> 
> Notice that this driver is associated to a RPMsg device with no endpoint.
> Instantiating this device as an RPMsg device allows to retrieve the
> associated RPMsg backend.
> 

I think it would make more sense to make the rpmsg_char driver do what
you want and then cleanly extract the "control" code out of it to a
separate file - than to create a duplicate implementation and then
retire the other one.

In particular I think that would show the difference between the two
better.

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/Kconfig      |   8 ++
>  drivers/rpmsg/Makefile     |   1 +
>  drivers/rpmsg/rpmsg_ctrl.c | 208 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 217 insertions(+)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 0b4407abdf13..c9e602016c3b 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -23,6 +23,14 @@ config RPMSG_NS
>  	  channel that probes the associated RPMsg device on remote endpoint
>  	  service announcement.
>  
> +config RPMSG_CTRL
> +	tristate "RPMSG control interface"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the /dev/rpmsg_ctl API. this API
> +	  allows user-space programs to create channels with specific name,
> +	  source and destination addresses.
> +
>  config RPMSG_MTK_SCP
>  	tristate "MediaTek SCP"
>  	depends on MTK_SCP
> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> index 8d452656f0ee..3c1bce9d0228 100644
> --- a/drivers/rpmsg/Makefile
> +++ b/drivers/rpmsg/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
>  obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
> +obj-$(CONFIG_RPMSG_CTRL)	+= rpmsg_ctrl.o
>  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
>  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
>  obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> new file mode 100644
> index 000000000000..425c3e32ada4
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) STMicroelectronics 2020

This is pretty much a verbatim copy of rpmsg_char and as such
STMicroelectronics is not the appropriate/sole copyright holder of the
content.

Regards,
Bjorn

> + */
> +
> +#include <linux/cdev.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include "rpmsg_internal.h"
> +#include <uapi/linux/rpmsg.h>
> +
> +#define RPMSG_DEV_MAX	(MINORMASK + 1)
> +
> +#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrl_dev, dev)
> +#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrl_dev, cdev)
> +
> +/**
> + * struct rpmsg_ctrl_dev - control device for instantiating endpoint devices
> + * @rpdev:	underlaying rpmsg device
> + * @cdev:	cdev for the ctrl device
> + * @dev:	device for the ctrl device
> + */
> +struct rpmsg_ctrl_dev {
> +	struct rpmsg_device *rpdev;
> +	struct cdev cdev;
> +	struct device dev;
> +};
> +
> +static DEFINE_IDA(rpmsg_ctrl_ida);
> +static DEFINE_IDA(rpmsg_minor_ida);
> +
> +static dev_t rpmsg_major;
> +
> +static int rpmsg_ctrl_dev_open(struct inode *inode, struct file *filp)
> +{
> +	struct rpmsg_ctrl_dev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> +
> +	get_device(&ctrldev->dev);
> +	filp->private_data = ctrldev;
> +
> +	return 0;
> +}
> +
> +static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
> +				 unsigned long arg)
> +{
> +	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
> +
> +	dev_info(&ctrldev->dev, "Control not yet implemented\n");
> +
> +	return 0;
> +};
> +
> +static int rpmsg_ctrl_dev_release(struct inode *inode, struct file *filp)
> +{
> +	struct rpmsg_ctrl_dev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> +
> +	put_device(&ctrldev->dev);
> +
> +	return 0;
> +}
> +
> +static void rpmsg_ctrl_dev_release_device(struct device *dev)
> +{
> +	struct rpmsg_ctrl_dev *ctrldev = dev_to_ctrldev(dev);
> +
> +	dev_err(dev, "%s\n", __func__);
> +
> +	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> +	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> +	cdev_del(&ctrldev->cdev);
> +	kfree(ctrldev);
> +}
> +
> +static const struct file_operations rpmsg_ctrl_fops = {
> +	.owner = THIS_MODULE,
> +	.open = rpmsg_ctrl_dev_open,
> +	.release = rpmsg_ctrl_dev_release,
> +	.unlocked_ioctl = rpmsg_ctrl_dev_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
> +};
> +
> +static int rpmsg_ctrl_add_control(struct rpmsg_ctrl_dev *ctrldev)
> +{
> +	struct device *dev = &ctrldev->dev;
> +	int ret;
> +
> +	cdev_init(&ctrldev->cdev, &rpmsg_ctrl_fops);
> +	ctrldev->cdev.owner = THIS_MODULE;
> +
> +	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
> +	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +
> +	dev_set_name(dev, "rpmsg_ctrl%d", dev->id);
> +
> +	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
> +	if (ret)
> +		goto free_minor_ida;
> +
> +	dev_info(dev, "add %s control for %s driver\n",
> +		 dev_name(dev),  dev_name(dev->parent));
> +
> +	return 0;
> +
> +free_minor_ida:
> +	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> +
> +	return ret;
> +}
> +
> +static int rpmsg_ctrl_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_ctrl_dev *ctrldev;
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
> +
> +	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
> +	if (ret < 0)
> +		goto free_ctrldev;
> +
> +	dev->id = ret;
> +
> +	ret = rpmsg_ctrl_add_control(ctrldev);
> +	if (ret < 0)
> +		goto free_ctrl_ida;
> +
> +	/* We can now rely on the release function for cleanup */
> +	dev->release = rpmsg_ctrl_dev_release_device;
> +
> +	ret = device_add(dev);
> +	if (ret) {
> +		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
> +		put_device(dev);
> +		goto free_ctrl_ida;
> +	}
> +
> +	dev_set_drvdata(dev, ctrldev);
> +	dev_set_drvdata(&rpdev->dev, ctrldev);
> +
> +	return 0;
> +
> +free_ctrl_ida:
> +	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> +free_ctrldev:
> +	put_device(dev);
> +	kfree(ctrldev);
> +
> +	return ret;
> +}
> +
> +static void rpmsg_ctrl_remove(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_ctrl_dev *ctrldev = dev_get_drvdata(&rpdev->dev);
> +
> +	device_del(&ctrldev->dev);
> +	put_device(&ctrldev->dev);
> +}
> +
> +static struct rpmsg_driver rpmsg_ctrl_driver = {
> +	.drv.name = KBUILD_MODNAME,
> +	.probe = rpmsg_ctrl_probe,
> +	.remove = rpmsg_ctrl_remove,
> +};
> +
> +static int rpmsg_ctrl_init(void)
> +{
> +	int ret;
> +
> +	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
> +	if (ret < 0) {
> +		pr_err("rpmsg_ctrl: failed to allocate char dev region\n");
> +		return ret;
> +	}
> +
> +	ret = register_rpmsg_driver(&rpmsg_ctrl_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg_ctrl: failed to register rpmsg driver\n");
> +		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +	}
> +
> +	return ret;
> +}
> +postcore_initcall(rpmsg_ctrl_init);
> +
> +static void rpmsg_ctrl_exit(void)
> +{
> +	unregister_rpmsg_driver(&rpmsg_ctrl_driver);
> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +}
> +module_exit(rpmsg_ctrl_exit);
> +
> +MODULE_DESCRIPTION("ioctl rpmsg driver");
> +MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> +MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
