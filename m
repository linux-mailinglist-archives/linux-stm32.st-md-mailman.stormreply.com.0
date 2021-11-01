Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 743FD441F0C
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Nov 2021 18:14:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D5DFC5A4FF;
	Mon,  1 Nov 2021 17:14:53 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 779F4C5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Nov 2021 17:14:50 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id x8so21594239oix.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Nov 2021 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TAQqw3KjdM4L0YpQtUnwgo97V5E+/VwuteYqlXaknWA=;
 b=Lka1HvsUaKOYF6Bvf7hwnE9Kv3V83IbfyA8r5O7+34g3lLxVwuhdEuG4VEObsH+5fD
 xUSuQ21SDBahArvc+vuvR96BUML/E8pjCzW3vnNFR/oo3MGxYoDbrVK7vTumhcATBC8X
 kgkeIN7XnYFLM5q2cj9DqrftSEgVt2UZja/VDQzCfJDSbUaR+YSW4+4s/WjIMThr8NH3
 /tyZ3AwTYg6+Zp2voiFUiaRTQgw6As+clfCeytEsXUFjPnMN9ctyliCaliRZUN3FB2us
 q2+ZsvplMEZvGEGe386FZQYNKD6MSQQ/l7Fn5qu+vbXclnBG/5+RbcgJxonx215qUFEd
 c0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TAQqw3KjdM4L0YpQtUnwgo97V5E+/VwuteYqlXaknWA=;
 b=oE5V9VkYkPhhPfhzU3/58YBa5xpGi+61Haqz/urElpopTwB+ij3Z+IacmNV4iCKqP7
 vJgQqfld8MLIUmZ9UD8yxmZtMefz1fjq13Lm+FA88b7AO+Vh2q6RwPDUwm0f8torrwTX
 p75iES36PYmtZi1bA4IiYY37NKW1KhVcwA/WQD0bN+WatJDBbmni3yMgy2q9YsjuWLcw
 nxKNy58BuUHufuKL8PTdvGl1ip/4Vm7QCFH56Pw5nxJLX9j8mGAZyODgQLwS9EclHlan
 8DOTs1N7qMPQDwac0ZNRUSKcLL/RzlVVPnc+WdWw3oztzjrdHCDm3wgjd9u2p1aazObV
 dZAg==
X-Gm-Message-State: AOAM531W2Hp0QpC+7BsAOc9hEOSB8Ddo9KIvm1+YANt+UobdhJF6kIl1
 8r2lPGikhuL8awDc1aI/ri4xHg==
X-Google-Smtp-Source: ABdhPJz6QQFMXhR9zJ4GABG0Qu6iyAK2xcv2AQMoASAhiR6mwR16lRfY6/NHWX/riQrqo+D6PpjksQ==
X-Received: by 2002:aca:3b89:: with SMTP id i131mr219401oia.102.1635786889248; 
 Mon, 01 Nov 2021 10:14:49 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id bd5sm1783921oib.2.2021.11.01.10.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:14:48 -0700 (PDT)
Date: Mon, 1 Nov 2021 12:14:44 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YYAghC2xVYoPyrpK@builder.lan>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022125426.2579-5-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 04/10] rpmsg: Update
 rpmsg_chrdev_register_device function
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

On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:

> The rpmsg_chrdev driver has been replaced by the rpmsg_ctrl driver
> for the /dev/rpmsg_ctrlX devices management. The reference for the
> driver override is now the rpmsg_ctrl.
> 
> Update the rpmsg_chrdev_register_device function to reflect the update,
> and rename the function to use the rpmsg_ctrldev prefix.
> 
> The platform drivers are updated accordingly.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  drivers/rpmsg/qcom_smd.c          | 2 +-
>  drivers/rpmsg/rpmsg_ctrl.c        | 2 +-
>  drivers/rpmsg/rpmsg_internal.h    | 8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 3f377a795b33..e6eb7fd126c9 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1715,7 +1715,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
>  	rpdev->dev.parent = glink->dev;
>  	rpdev->dev.release = qcom_glink_device_release;
>  
> -	return rpmsg_chrdev_register_device(rpdev);
> +	return rpmsg_ctrldev_register_device(rpdev);
>  }
>  
>  struct qcom_glink *qcom_glink_native_probe(struct device *dev,
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 8da1b5cb31b3..d223e438d17c 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1113,7 +1113,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
>  	qsdev->rpdev.dev.parent = &edge->dev;
>  	qsdev->rpdev.dev.release = qcom_smd_release_device;
>  
> -	return rpmsg_chrdev_register_device(&qsdev->rpdev);
> +	return rpmsg_ctrldev_register_device(&qsdev->rpdev);
>  }
>  
>  /*
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 1d3c12e5cdcf..4734ce9d927b 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -180,7 +180,7 @@ static struct rpmsg_driver rpmsg_ctrldev_driver = {
>  	.probe = rpmsg_ctrldev_probe,
>  	.remove = rpmsg_ctrldev_remove,
>  	.drv = {
> -		.name = "rpmsg_chrdev",
> +		.name = "rpmsg_ctrl",
>  	},
>  };
>  
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..d6056f09bcd8 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -82,16 +82,16 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo);
>  /**
> - * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
> + * rpmsg_ctrldev_register_device() - register a char device for control based on rpdev
>   * @rpdev:	prepared rpdev to be used for creating endpoints
>   *
>   * This function wraps rpmsg_register_device() preparing the rpdev for use as
>   * basis for the rpmsg chrdev.
>   */
> -static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
> +static inline int rpmsg_ctrldev_register_device(struct rpmsg_device *rpdev)
>  {
> -	strcpy(rpdev->id.name, "rpmsg_chrdev");
> -	rpdev->driver_override = "rpmsg_chrdev";
> +	strcpy(rpdev->id.name, "rpmsg_ctrl");
> +	rpdev->driver_override = "rpmsg_ctrl";
>  
>  	return rpmsg_register_device(rpdev);
>  }
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 5da622eb1c8f..2acec7f37474 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -839,7 +839,7 @@ static struct rpmsg_device *rpmsg_virtio_add_ctrl_dev(struct virtio_device *vdev
>  	rpdev_ctrl->dev.release = virtio_rpmsg_release_device;
>  	rpdev_ctrl->little_endian = virtio_is_little_endian(vrp->vdev);
>  
> -	err = rpmsg_chrdev_register_device(rpdev_ctrl);
> +	err = rpmsg_ctrldev_register_device(rpdev_ctrl);
>  	if (err) {
>  		kfree(vch);
>  		return ERR_PTR(err);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
