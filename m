Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 704BB36723D
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 20:06:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39BBCC58D5D;
	Wed, 21 Apr 2021 18:06:39 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B18BC58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 18:06:36 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id p16so18149656plf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rTCdIGeW4Af6klHefq45nF+2qbz5fBGqc92alfd8T8Y=;
 b=E2FuKRBnSVVwyyWxul22Sg0uJ1sl4/2F2CVbq/RZreNFqbrgmdrZG+IdbD48BaGgf+
 RsjvCBWV3RAACDrwOl9XrP6biUgwm1GJTNBvJyPq0G/PynAXny6xdGUC2hY1sB9a9Sqq
 BwBhOrMzTvL3MOZWTzXZpcVodktfdx6Q6gpp3Fy9FNAK4Dv9YrZ6xBNmgMxWaCvgEt22
 iqAne+1MX2ZfcTFarBk+reZzFqDZkIvdPVUlOpvla1GV/oQQhlTgUAIBgeZXEKCsJ7u8
 zmrzacfa/rtlYiZRNVELL7GO2uAdsc6bFAKI3xtgjXG6WmGXTDHZeQE9WY19GhQSELFR
 VPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rTCdIGeW4Af6klHefq45nF+2qbz5fBGqc92alfd8T8Y=;
 b=ljAbEbbCwne7s+m/1R0D5b0KsNPZRTu5PJwR3DMMb+8jowrW/lgeVjU0CFNyqYlY3Q
 8wx5FZAQWtpqG+7CO3/vS5S0XwZsYiIytHiRSZ0m0OnH8AoJp7+q9PNsQ1jj+6PDw8On
 IfrbUQI93x21ESYPS5q45pFgOsXKKOVGflQlgUyfapaNDvWDyd1SZTg8Of39SRhJB6Bx
 BRVRVGXnG0qTQhnkk45CGpZgQtyTrxciQMmzUHrlHXY1U6P+yMl9fn+ItwdxqpebCSoC
 skFQW6KxezZ62KGxszvZ2j7epewHAWUX5Ewq3b16TqVx+YFkzUQ37dSKFwNgrt7WC78P
 7M1Q==
X-Gm-Message-State: AOAM531LiHyLGUO7lHLgNW9OxLAy6rYbNAyR1SOxLAJDAkfpWV/A3K2U
 ZcJuK6jBMaCKI10EJeWEeIwTM/bWCTP8AA==
X-Google-Smtp-Source: ABdhPJw2Vu7bLzAqvhoR2bzc1i74eI9A1rh7ZjYCQyN8htnEleZhXTqc+1ei2B6+5gem/pGpGBMRsw==
X-Received: by 2002:a17:902:778f:b029:ec:d04d:4556 with SMTP id
 o15-20020a170902778fb02900ecd04d4556mr4259318pll.43.1619028395305; 
 Wed, 21 Apr 2021 11:06:35 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id gc15sm2683421pjb.2.2021.04.21.11.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 11:06:34 -0700 (PDT)
Date: Wed, 21 Apr 2021 12:06:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210421180632.GF1223348@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413134458.17912-4-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/7] rpmsg: Update
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

On Tue, Apr 13, 2021 at 03:44:54PM +0200, Arnaud Pouliquen wrote:
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
> 
> ---
> update from v1
> - move the rename of the rpmsg_ctrl driver from previous patch to
>   this one.
> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  drivers/rpmsg/qcom_smd.c          | 2 +-
>  drivers/rpmsg/rpmsg_ctrl.c        | 2 +-
>  drivers/rpmsg/rpmsg_internal.h    | 8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 05533c71b10e..7d7e809800ec 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1642,7 +1642,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
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
> index a5bb9ed97f32..059c228d0045 100644
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
> index a76c344253bf..8c500a8f29aa 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -82,16 +82,16 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo);
>  /**
> - * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
> + * rpmsg_ctrl_register_device() - register a char device for control based on rpdev
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
> index 8e49a3bacfc7..e42234a3e2ab 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -840,7 +840,7 @@ static struct rpmsg_device *rpmsg_virtio_add_ctrl_dev(struct virtio_device *vdev
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
