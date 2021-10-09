Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F154274A0
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Oct 2021 02:23:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60627C5C824;
	Sat,  9 Oct 2021 00:23:51 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 104BAC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Oct 2021 00:23:49 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso13550795otu.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 17:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JkIOVgb0rFlzTTWYy9nxBqEDUeJR0ZAQd/WMS4wwxAg=;
 b=tgAss8XZylSYp96jFg8QWvj9pCW5nn8W6lfIhXtFcDdGjnT4o75iOG3+ZFeQ0itOVZ
 A7HUnFO77nQkpIyQ6FDNdgQcfwvmoELb9OzY0ejzLQN+/pI6PFJP1L+yaNnL9plpzhkB
 cUGWlTJ4ZG4v118IUpr03AcbDINktfy4IHtmixC4qCsFDCSQXI3XGXWyG78s7+Bb8Im5
 hK4TJ3EijoTqVCwniZ8B6+RsZFZOvP1OU72d9BjQtpGNoz+wpvCeftBis4JEFN/Juz94
 IwaAH959OJr9R5aMjk5LApH2oSebuNeiupx/GZE/bR+fVID4eCgPJaRZQudMjA56yl3Y
 AE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JkIOVgb0rFlzTTWYy9nxBqEDUeJR0ZAQd/WMS4wwxAg=;
 b=2Z/axYef8PwXOJDOY3nWvksWutecXQuf7brCGKKzkvdWjv1sSHAD8ipc3jAueRMqa9
 1nOQWOP2SX8IlvS7nbm7Lv/Y4ielXJQQgCP9Ihps68TFAXL1W/0aIY/dA4xinbKDG2dR
 I7vnyl8RbP4Sjg2/8Kj9lYIGODjJmHeQEcp9FloS2AfsI+cQQdAweHnuQRUdaALRpmec
 XvcfuAmMOy6uqlvyaGd3Hf7WZJY7KpQtsn3fp29NHweJNccBku8bCeEBMufAM8qscd2k
 zkFT2y6Sp32vB9RN9NECWt2QoEDeyqGj3jCojCc7JrcjiLryueGBcfCHIrVXyQar1Gg2
 ToCw==
X-Gm-Message-State: AOAM530c7C80yH/y56Nu/cTO+BWdgK56khl4ETdOE3dKxLMDKJgqLH4l
 KDmW32FuiiKREH2LDVA4ubVHXg==
X-Google-Smtp-Source: ABdhPJzScZ5VD0XmUxg3zl8evGFYSN5Cwytom2vRIcVLCXghggc5kzuN6ajWU8F0d5f8RB5Vf11hFg==
X-Received: by 2002:a05:6830:2486:: with SMTP id
 u6mr10866085ots.353.1633739028379; 
 Fri, 08 Oct 2021 17:23:48 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id bd24sm255815oib.52.2021.10.08.17.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 17:23:48 -0700 (PDT)
Date: Fri, 8 Oct 2021 17:25:26 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YWDhdq4iOihzC5FI@ripper>
References: <20210712132303.25058-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712132303.25058-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3] rpmsg: ctrl: Introduce new
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

On Mon 12 Jul 06:23 PDT 2021, Arnaud Pouliquen wrote:

> Allow the user space application to create and release an rpmsg device
> by adding RPMSG_CREATE_DEV_IOCTL and RPMSG_RELEASE_DEV_IOCTL ioctrls to
> the /dev/rpmsg_ctrl interface
> 

With
https://lore.kernel.org/linux-remoteproc/CAHk-=wgea9bo-j4+LAvZF7OKPAXKqrGgiBAhXTJ3Jv5JAZgA+A@mail.gmail.com/
and
https://lore.kernel.org/linux-arm-msm/1609958656-15064-1-git-send-email-hemantk@codeaurora.org/
in mind, I would like some concrete examples of when and how this is
going to be used.


Also, as I said previously, this would have been better to put together
with the split out of rpmsg_ctrl, because afaict this is the only reason
for doing that. Or am I simply missing something?

> The RPMSG_CREATE_DEV_IOCTL Ioctl can be used to instantiate a local rpmsg
> device.
> Depending on the back-end implementation, the associated rpmsg driver is
> probed and a NS announcement can be sent to the remote processor.
> 

So, does this imply that in order to spawn a new rpmsg_char from the
host side, I would use RPMSG_CREATE_DEV_IOCTL and to open a channel
announced by the remote I would use RPMSG_CREATE_EPT_IOCTL?

> The RPMSG_RELEASE_DEV_IOCTL allows the user application to release a
> rpmsg device created either by the remote processor or with the
> RPMSG_CREATE_DEV_IOCTL call.

Is this a side effect, bug or a feature?

Regards,
Bjorn

> Depending on the back-end implementation, the associated rpmsg driver is
> removed and a NS destroy rpmsg can be sent to the remote processor.
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> update from V2
> - add Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> - rebased on kernel V.14-rc1 + 
>   series V5 Restructure the rpmsg char to decorrelate the control part [1]
> 
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=514017
> 
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
