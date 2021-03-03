Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C62FF32B95B
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 18:01:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FE72C57B64;
	Wed,  3 Mar 2021 17:01:37 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9661C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 17:01:35 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id o38so16805360pgm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 09:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NS5lTDaGXttSrOQ5MHO4aoL/JPMPWoX9kViqNvHNTVw=;
 b=VsTPW062qCBbmWlJ6C89JwMPfX2rDXIXP6PJpEDWU5cAcLYJV//2F9SQV7xbWGyQ6t
 N/Rrr+z55FyTSfysrWPPFGBI9GzuwfbuCLjvmLihq1RUVnJaIoexXJkZqixLZeCccfIt
 qgu8mRlb9Glv1h6/OEu5+c6Xh/SwIKfMpq2/E0JcnV1pqjbdfki1j1vR/5H3xQ2moPQI
 v0WAlKnK9Y3T6+iwkwiLboG/ZK2GiXhnegwLcW4zGDaCuqubIh953KIf0nquF0PWc+0T
 br0mTrp+RzZOS3Gp9zTRIYGKyfqgWoc9vCbsN2yl3IhVr3pdWDrUGArTIAcV8rFiyJD8
 yGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NS5lTDaGXttSrOQ5MHO4aoL/JPMPWoX9kViqNvHNTVw=;
 b=DaLHjnpMJdkKgP0QOEt+rjIUriZvgAhQGJCvBZAb5o8/LEZyFX5V1BhgPEbwCrNb64
 64I71lm1Y8SvgHt0TD88AK3iCkSjQYsnwNLjJBg1Ie6EvOUZ1CSz36zJZvavU0ubHt4Q
 +47TkGxHZzKVc/tTTdLG8Wh0sxRtN3oRZUbWEOHoxtPiW2rqyw80zj4em1wekALyJ3B1
 6XSuxk6Gq+zZccJPJoslMaHjWPPUZTI4/9hnaEIIlbc55EZWpyRDwvDxUe8JXjF3ndCZ
 Z37PNMXQvBgdsT6+CdVBAPBb0yIOWIS2B66FCb5BOyBlIIES0f2Imhhj6ObWO79SKbRM
 zYMA==
X-Gm-Message-State: AOAM532Pxyy5KDdsId1/CVFfgI4WrVydrbgN5hf/pqH7SzaBmppGW0Ql
 rEkhfUF9FQIN5XV1wL/5UcufMw==
X-Google-Smtp-Source: ABdhPJwnSJtlw+7CYzN3TJ1B9S6jcmKYC9LYLbDS05Ed7kcO8bdthFTmHZaaIeoVlr9rJGVEnmxWAQ==
X-Received: by 2002:a63:4a44:: with SMTP id j4mr23741977pgl.199.1614790893689; 
 Wed, 03 Mar 2021 09:01:33 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 132sm3438070pfu.158.2021.03.03.09.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:01:31 -0800 (PST)
Date: Wed, 3 Mar 2021 10:01:30 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210303170130.GC3817330@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-8-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 07/16] rpmsg: update
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

On Fri, Feb 19, 2021 at 12:14:52PM +0100, Arnaud Pouliquen wrote:
> As driver is now the rpmsg_ioctl, rename the function.
> In addition, initialize the rpdev addresses to RPMSG_ADDR_ANY as not
> defined.

This patch works but the changelog needs a rework.  The title reflects the
essence of changes but the text of the changelog doesn't.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c |  2 +-
>  drivers/rpmsg/qcom_smd.c          |  2 +-
>  drivers/rpmsg/rpmsg_ctrl.c        |  2 +-
>  drivers/rpmsg/rpmsg_internal.h    | 10 ++++++----
>  4 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 27a05167c18c..d4e4dd482614 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1625,7 +1625,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
>  	rpdev->dev.parent = glink->dev;
>  	rpdev->dev.release = qcom_glink_device_release;
>  
> -	return rpmsg_chrdev_register_device(rpdev);
> +	return rpmsg_ctrl_register_device(rpdev);
>  }
>  
>  struct qcom_glink *qcom_glink_native_probe(struct device *dev,
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 19903de6268d..40a1c415c775 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1097,7 +1097,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
>  	qsdev->rpdev.dev.parent = &edge->dev;
>  	qsdev->rpdev.dev.release = qcom_smd_release_device;
>  
> -	return rpmsg_chrdev_register_device(&qsdev->rpdev);
> +	return rpmsg_ctrl_register_device(&qsdev->rpdev);
>  }
>  
>  /*
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index fa05b67d24da..2e43b4096aa8 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -180,7 +180,7 @@ static struct rpmsg_driver rpmsg_ctrl_driver = {
>  	.probe = rpmsg_ctrl_probe,
>  	.remove = rpmsg_ctrl_remove,
>  	.drv = {
> -		.name = "rpmsg_chrdev",
> +		.name = KBUILD_MODNAME,
>  	},
>  };
>  
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..7428f4465d17 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -82,16 +82,18 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
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
> +static inline int rpmsg_ctrl_register_device(struct rpmsg_device *rpdev)
>  {
> -	strcpy(rpdev->id.name, "rpmsg_chrdev");
> -	rpdev->driver_override = "rpmsg_chrdev";
> +	strcpy(rpdev->id.name, "rpmsg_ctrl");
> +	rpdev->driver_override = "rpmsg_ctrl";
> +	rpdev->src = RPMSG_ADDR_ANY;
> +	rpdev->dst = RPMSG_ADDR_ANY;
>  
>  	return rpmsg_register_device(rpdev);
>  }
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
