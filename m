Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB12FF8EB
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jan 2021 00:31:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D230C424BE;
	Thu, 21 Jan 2021 23:31:08 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1840C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 23:31:06 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id y12so2645206pji.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 15:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v3GYhUFCubjfs+r9cjEqyb1QXcfSibvYYmDx522Iqyk=;
 b=RiuQ4NYnZLKbiGAp+5ngyptmcvYmD3jUmq8TAnBTs5siBcITh7/q2SBL8uuSxjtNbT
 WwBzo5UE4AMznf6aB8mTYPMMtT79OAU/0du2Ks+ih+uMbmYMjDgwK58HYFnuS1VDabb0
 PCTRTAdKcZaVdOWCZrkPPHWkBKfp/MjoWArjb+7kn87yldD35mgTyl9Rd4eo3/ZOF0G2
 oEMfhdTREZWUilqv+HnT4BQbhZskcZ6yE9IjyAWTNZftmmcoKlGF+IXiA5+bDM4SgkUs
 oKeNJy0wykafym6ndxVQ3ODNb8qzqus6L1r9a6++QoDwRZSob9tO1iGKGu2sNAABW6k2
 0Z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v3GYhUFCubjfs+r9cjEqyb1QXcfSibvYYmDx522Iqyk=;
 b=sSXZiN6BM9TVw3lRiMFIjEeps9htfVlaFfaEEJilNk7M75YIwT5Iq3ZrQgGSnTGop/
 +GPSH/2CjqpVpgLvfyV1Z5+rs2DK84BcGhZ+kauH3/b8fIZ16l8IxAYdXJUWCs2+wz65
 yAsSeDIdq8ft2bx+E31jqUQmT6/Nt5lVt5rbT2lTifOCEKY+3P6EmktZ0s8urgSlZbRm
 YuUjnzykcItCU6IKWjIDuo1PQ7nCB+qJU0uYW147wR/FE0VP9VNuBx9nZ3xrgAeQok2I
 C4J0/GWD0AOvpOzhFySjZ3nbdBqiYa0zY1OOiXPROwDeeXkYF9pQfvbVgnv1YF2qBNyw
 m6HQ==
X-Gm-Message-State: AOAM533Imu4OV+YJ0E9pSmMVRWusQ3mjWXH1PWG5meeVmW2VTfNkD4Uu
 bPgcrEY6UrzYqbHeFkJsUzwCbQ==
X-Google-Smtp-Source: ABdhPJzx741zyVTdofnFEivSzW1NDis38rymge8GkmAUN5dRe1w2oZH3h6ZhoF9QiHcvsmezkQ6MFw==
X-Received: by 2002:a17:90a:9503:: with SMTP id
 t3mr1943161pjo.189.1611271865173; 
 Thu, 21 Jan 2021 15:31:05 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id b2sm6576371pff.79.2021.01.21.15.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 15:31:04 -0800 (PST)
Date: Thu, 21 Jan 2021 16:31:02 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210121233102.GE611676@xps15>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-2-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
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

Hi Arnaud,

On Tue, Dec 22, 2020 at 11:57:11AM +0100, Arnaud Pouliquen wrote:
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

As Bjorn pointed out it would be better modify rpmsg_char.c to what you want it
to be rather than spinning off a parallel implementation.  One immediate
advantage would be to avoid the creation of new structures that are identical to
existing ones.  There's also the problem of bisecting...  If I remember
correctly there are a few instances where applying this set would break a bisect
session.

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

Debug left over.

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

Here "rpmsg_ctrl" is used but the changelog and refers to "rpmsg_ctl".  Using
the latter would, as Bjorn pointed out, break existing implementation.

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
