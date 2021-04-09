Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4EE35A4BD
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Apr 2021 19:36:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8ED6C5718B;
	Fri,  9 Apr 2021 17:36:52 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B377C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 17:36:50 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id t22so2774965ply.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 10:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mJaagzwmcPBEqhRDdpSKhyBO2gPryJhAKnh/lrCyZxs=;
 b=oTY2mTtLdLMpPirGdjcfRUbrfGUFUrbhcql99bh3xgY/vOztynS6H0LvmdPvVNZ1Si
 69cMQKvFoiWRxGroCpClnx/aRaUdUJGwusmQiwubVHx9sp6h4iBh1G9/+Nmf47BxiZbu
 08i5xIpZKsjQMwpGt9Uhoc3nD2PtAtdc1Fu9QwAw52zLm5qJ1Sw5c5UxNeAt+yiJlvsw
 ZUW2cJB6/rcWIwwd5Ci+DG5OUmKtHEwwU5sMpS1O1LeeSOnOiwllYehXkB1lmPaQRVxK
 QzNU/7xFX81uz2RwIjqURHodMWs8IuhuSqQdn3I1OHM51vRQqVzqglhlysPqIoBGg+Z1
 /kNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mJaagzwmcPBEqhRDdpSKhyBO2gPryJhAKnh/lrCyZxs=;
 b=AFlkG/HqVgEDx3JXMGVOUbL0cdp0VG9AelyIOVlzI4Z5qzOsQ+XgafftodWfBe0h/h
 BAkir5srePBsG21lHcZ6FCxC2eQv+tnfcKVOt2cXOWt4AAqiyYI8/E4rFap6EHjRzwGM
 Z8OPvs5XwupzNBX4qCHewZqj8Lrq5EVB25tAvhOzFmWhgLSyxsOoCY/Dp0lWwE/zyyRE
 iqWYmQY5KibEaL450jzHYhtf+5xgsqZpSsuWPF/7MdD33ThQczr/8Xef1OT/V5LTOAcl
 jQ7BvEmikW7Hjn8QjQSRi8dQXyKgwHX1z7jUxjngpoQ5HMvypfyfaUKjZK4EDeadecF4
 AKsA==
X-Gm-Message-State: AOAM531lL3BA6jjJLBC5dvWBCckpntNSn75QC9oCNqOmVTDYAW8WcMai
 +CErFUS95UOr80xgZqGupK2ThUhwJk3aBg==
X-Google-Smtp-Source: ABdhPJwBPaZ8iD2lW0roe1xGd9Srni2ldWafkaOXXwSKYry/1Wue2o1pffghu7WP3sLSvaWPPqTZ5A==
X-Received: by 2002:a17:902:720b:b029:e9:abcc:e60a with SMTP id
 ba11-20020a170902720bb02900e9abcce60amr4625255plb.20.1617989808648; 
 Fri, 09 Apr 2021 10:36:48 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id y2sm3091156pgp.2.2021.04.09.10.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 10:36:48 -0700 (PDT)
Date: Fri, 9 Apr 2021 11:36:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210409173646.GA489094@xps15>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
 <20210323122737.23035-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323122737.23035-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/7] rpmsg: Move the rpmsg control device
 from rpmsg_char to rpmsg_ctrl
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

On Tue, Mar 23, 2021 at 01:27:32PM +0100, Arnaud Pouliquen wrote:
> Create the rpmsg_ctrl.c module and move the code related to the
> rpmsg_ctrldev device in this new module.
> 
> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> kconfig file.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> update from [1]:
> - keep rpmsg_ctrldev prefix (no more functions and structures renaming),
>

That is much better
 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210219111501.14261-7-arnaud.pouliquen@foss.st.com/
> ---
>  drivers/rpmsg/Kconfig      |   9 ++
>  drivers/rpmsg/Makefile     |   1 +
>  drivers/rpmsg/rpmsg_char.c | 177 +---------------------------
>  drivers/rpmsg/rpmsg_ctrl.c | 233 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 244 insertions(+), 176 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 0b4407abdf13..d822ec9ec692 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -10,11 +10,20 @@ config RPMSG_CHAR
>  	tristate "RPMSG device interface"
>  	depends on RPMSG
>  	depends on NET
> +	select RPMSG_CTRL
>  	help
>  	  Say Y here to export rpmsg endpoints as device files, usually found
>  	  in /dev. They make it possible for user-space programs to send and
>  	  receive rpmsg packets.
>  
> +config RPMSG_CTRL
> +	tristate "RPMSG control interface"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the /dev/rpmsg_ctrlX API. This API
> +	  allows user-space programs to create endpoints with specific service name,
> +	  source and destination addresses.
> +
>  config RPMSG_NS
>  	tristate "RPMSG name service announcement"
>  	depends on RPMSG
> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> index 8d452656f0ee..58e3b382e316 100644
> --- a/drivers/rpmsg/Makefile
> +++ b/drivers/rpmsg/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
> +obj-$(CONFIG_RPMSG_CTRL)	+= rpmsg_ctrl.o
>  obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
>  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
>  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index b9df8dc4365f..5d4a768002ce 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -29,30 +29,13 @@
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>

That define is also present in rpmsg_ctrl.c.  As such I would move it to
rpmsg_char.h.
  
>  static dev_t rpmsg_major;
> -static struct class *rpmsg_class;
>  
> -static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_ept_ida);
>  static DEFINE_IDA(rpmsg_minor_ida);
>  
>  #define dev_to_eptdev(dev) container_of(dev, struct rpmsg_eptdev, dev)
>  #define cdev_to_eptdev(i_cdev) container_of(i_cdev, struct rpmsg_eptdev, cdev)
>  
> -#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
> -#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
> -
> -/**
> - * struct rpmsg_ctrldev - control device for instantiating endpoint devices
> - * @rpdev:	underlaying rpmsg device
> - * @cdev:	cdev for the ctrl device
> - * @dev:	device for the ctrl device
> - */
> -struct rpmsg_ctrldev {
> -	struct rpmsg_device *rpdev;
> -	struct cdev cdev;
> -	struct device dev;
> -};
> -
>  /**
>   * struct rpmsg_eptdev - endpoint device context
>   * @dev:	endpoint device
> @@ -409,169 +392,13 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
> -static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> -{
> -	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> -
> -	get_device(&ctrldev->dev);
> -	filp->private_data = ctrldev;
> -
> -	return 0;
> -}
> -
> -static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
> -{
> -	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> -
> -	put_device(&ctrldev->dev);
> -
> -	return 0;
> -}
> -
> -static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> -				unsigned long arg)
> -{
> -	struct rpmsg_ctrldev *ctrldev = fp->private_data;
> -	void __user *argp = (void __user *)arg;
> -	struct rpmsg_endpoint_info eptinfo;
> -	struct rpmsg_channel_info chinfo;
> -
> -	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> -		return -EINVAL;
> -
> -	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> -		return -EFAULT;
> -
> -	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> -	chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
> -	chinfo.src = eptinfo.src;
> -	chinfo.dst = eptinfo.dst;
> -
> -	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo, rpmsg_class);
> -};
> -
> -static const struct file_operations rpmsg_ctrldev_fops = {
> -	.owner = THIS_MODULE,
> -	.open = rpmsg_ctrldev_open,
> -	.release = rpmsg_ctrldev_release,
> -	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
> -	.compat_ioctl = compat_ptr_ioctl,
> -};
> -
> -static void rpmsg_ctrldev_release_device(struct device *dev)
> -{
> -	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
> -
> -	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> -	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> -	cdev_del(&ctrldev->cdev);
> -	kfree(ctrldev);
> -}
> -
> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> -{
> -	struct rpmsg_ctrldev *ctrldev;
> -	struct device *dev;
> -	int ret;
> -
> -	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
> -	if (!ctrldev)
> -		return -ENOMEM;
> -
> -	ctrldev->rpdev = rpdev;
> -
> -	dev = &ctrldev->dev;
> -	device_initialize(dev);
> -	dev->parent = &rpdev->dev;
> -	dev->class = rpmsg_class;
> -
> -	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> -	ctrldev->cdev.owner = THIS_MODULE;
> -
> -	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_ctrldev;
> -	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> -
> -	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_minor_ida;
> -	dev->id = ret;
> -	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
> -
> -	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
> -	if (ret)
> -		goto free_ctrl_ida;
> -
> -	/* We can now rely on the release function for cleanup */
> -	dev->release = rpmsg_ctrldev_release_device;
> -
> -	ret = device_add(dev);
> -	if (ret) {
> -		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
> -		put_device(dev);
> -	}
> -
> -	dev_set_drvdata(&rpdev->dev, ctrldev);
> -
> -	return ret;
> -
> -free_ctrl_ida:
> -	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> -free_minor_ida:
> -	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> -free_ctrldev:
> -	put_device(dev);
> -	kfree(ctrldev);
> -
> -	return ret;
> -}
> -
> -static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> -{
> -	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
> -	int ret;
> -
> -	/* Destroy all endpoints */
> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
> -	if (ret)
> -		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
> -
> -	device_del(&ctrldev->dev);
> -	put_device(&ctrldev->dev);
> -}
> -
> -static struct rpmsg_driver rpmsg_chrdev_driver = {
> -	.probe = rpmsg_chrdev_probe,
> -	.remove = rpmsg_chrdev_remove,
> -	.drv = {
> -		.name = "rpmsg_chrdev",
> -	},
> -};
> -
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
>  
>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");

To avoid any confusion I would put "rpmsg_char"... And I don't think it changes
anything for users.

> -	if (ret < 0) {
> +	if (ret < 0)
>  		pr_err("rpmsg: failed to allocate char dev region\n");
> -		return ret;
> -	}
> -
> -	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> -	if (IS_ERR(rpmsg_class)) {
> -		pr_err("failed to create rpmsg class\n");
> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> -		return PTR_ERR(rpmsg_class);
> -	}
> -
> -	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> -	if (ret < 0) {
> -		pr_err("rpmsgchr: failed to register rpmsg driver\n");
> -		class_destroy(rpmsg_class);
> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> -	}
>  
>  	return ret;
>  }
> @@ -579,8 +406,6 @@ postcore_initcall(rpmsg_chrdev_init);
>  
>  static void rpmsg_chrdev_exit(void)
>  {
> -	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> -	class_destroy(rpmsg_class);
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
>  module_exit(rpmsg_chrdev_exit);
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> new file mode 100644
> index 000000000000..e203ecc18120
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021, STMicroelectronics
> + * Copyright (c) 2016, Linaro Ltd.
> + * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
> + * Copyright (c) 2012, PetaLogix
> + * Copyright (c) 2011, Texas Instruments, Inc.
> + * Copyright (c) 2011, Google, Inc.
> + *
> + * Based on rpmsg performance statistics driver by Michal Simek, which in turn
> + * was based on TI & Google OMX rpmsg driver.
> + */
> +#include <linux/cdev.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/rpmsg.h>
> +#include <linux/slab.h>
> +#include <uapi/linux/rpmsg.h>
> +
> +#include "rpmsg_char.h"
> +#include "rpmsg_internal.h"
> +
> +#define RPMSG_DEV_MAX	(MINORMASK + 1)
> +
> +static dev_t rpmsg_major;
> +struct class *rpmsg_class;
> +
> +static DEFINE_IDA(rpmsg_ctrl_ida);
> +static DEFINE_IDA(rpmsg_minor_ida);
> +
> +#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
> +#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
> +
> +/**
> + * struct rpmsg_ctrldev - control device for instantiating endpoint devices
> + * @rpdev:	underlaying rpmsg device
> + * @cdev:	cdev for the ctrl device
> + * @dev:	device for the ctrl device
> + */
> +struct rpmsg_ctrldev {
> +	struct rpmsg_device *rpdev;
> +	struct cdev cdev;
> +	struct device dev;
> +};
> +
> +static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> +{
> +	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> +
> +	get_device(&ctrldev->dev);
> +	filp->private_data = ctrldev;
> +
> +	return 0;
> +}
> +
> +static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
> +{
> +	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> +
> +	put_device(&ctrldev->dev);
> +
> +	return 0;
> +}
> +
> +static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> +				unsigned long arg)
> +{
> +	struct rpmsg_ctrldev *ctrldev = fp->private_data;
> +	void __user *argp = (void __user *)arg;
> +	struct rpmsg_endpoint_info eptinfo;
> +	struct rpmsg_channel_info chinfo;
> +
> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> +		return -EINVAL;
> +
> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> +		return -EFAULT;
> +
> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> +	chinfo.src = eptinfo.src;
> +	chinfo.dst = eptinfo.dst;
> +
> +	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo, rpmsg_class);
> +};
> +
> +static const struct file_operations rpmsg_ctrldev_fops = {
> +	.owner = THIS_MODULE,
> +	.open = rpmsg_ctrldev_open,
> +	.release = rpmsg_ctrldev_release,
> +	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
> +};
> +
> +static void rpmsg_ctrldev_release_device(struct device *dev)
> +{
> +	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
> +
> +	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> +	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> +	cdev_del(&ctrldev->cdev);
> +	kfree(ctrldev);
> +}
> +
> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_ctrldev *ctrldev;
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
> +	dev->class = rpmsg_class;
> +
> +	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> +	ctrldev->cdev.owner = THIS_MODULE;
> +
> +	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
> +	if (ret < 0)
> +		goto free_ctrldev;
> +	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +
> +	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
> +	if (ret < 0)
> +		goto free_minor_ida;
> +	dev->id = ret;
> +	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
> +
> +	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
> +	if (ret)
> +		goto free_ctrl_ida;
> +
> +	/* We can now rely on the release function for cleanup */
> +	dev->release = rpmsg_ctrldev_release_device;
> +
> +	ret = device_add(dev);
> +	if (ret) {
> +		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
> +		put_device(dev);
> +	}
> +
> +	dev_set_drvdata(&rpdev->dev, ctrldev);
> +
> +	return ret;
> +
> +free_ctrl_ida:
> +	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> +free_minor_ida:
> +	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> +free_ctrldev:
> +	put_device(dev);
> +	kfree(ctrldev);
> +
> +	return ret;
> +}
> +
> +static void rpmsg_ctrldev_remove(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
> +	int ret;
> +
> +	/* Destroy all endpoints */
> +	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
> +	if (ret)
> +		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
> +
> +	device_del(&ctrldev->dev);
> +	put_device(&ctrldev->dev);
> +}
> +
> +static struct rpmsg_driver rpmsg_ctrldev_driver = {
> +	.probe = rpmsg_ctrldev_probe,
> +	.remove = rpmsg_ctrldev_remove,
> +	.drv = {
> +		.name = "rpmsg_ctrl",

With this change rpmsg_chrdev_register_device() will fail to find a driver to
work with, something that will break the Glink/SMD code if someone tries a
bisect.  Things will work out just fine if you move this to patch 3.  

> +	},
> +};
> +
> +static int rpmsg_ctrldev_init(void)
> +{
> +	int ret;
> +
> +	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");

And here I'd go with "rpmsg_ctrl".

> +	if (ret < 0) {
> +		pr_err("rpmsg: failed to allocate char dev region\n");
> +		return ret;
> +	}
> +
> +	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> +	if (IS_ERR(rpmsg_class)) {
> +		pr_err("failed to create rpmsg class\n");
> +		ret = PTR_ERR(rpmsg_class);
> +		goto free_region;
> +	}
> +
> +	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
> +		goto free_class;
> +	}
> +
> +	return 0;
> +
> +free_class:
> +	class_destroy(rpmsg_class);
> +free_region:
> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +
> +	return ret;
> +}
> +postcore_initcall(rpmsg_ctrldev_init);
> +
> +static void rpmsg_ctrldev_exit(void)
> +{
> +	unregister_rpmsg_driver(&rpmsg_ctrldev_driver);
> +	class_destroy(rpmsg_class);
> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +}
> +module_exit(rpmsg_ctrldev_exit);
> +
> +MODULE_DESCRIPTION("rpmsg control interface");
> +MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
