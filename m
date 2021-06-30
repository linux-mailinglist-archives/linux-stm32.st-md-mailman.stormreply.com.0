Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF03B89D4
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 22:39:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88CF0C56630;
	Wed, 30 Jun 2021 20:39:04 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF0F3C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 20:39:02 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 g24-20020a17090ace98b029017225d0c013so3912935pju.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 13:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1QWbs7h30bnNV963rbbzjJDg0UDFTbJY6yBzK3R8mzg=;
 b=hPNODuyPg5Rw1fJUcM4FQLorWQylbBhvhPXzL9BR56UUv8auy73pUzuVprp2niJH9y
 648UPRT0FCkbQN54PhQvGm7BMqfcz4HzaY/fIukSwechh/s3tItlXuWLl5EDi9YRB040
 aP4xB4Mpdu0JRAVcVdKqezE1sUU+dAC5TtN9lLE58R7MIgEWnh3zTPAcV+/evTbgA21y
 1AF5nFlx6POoLmfAxBVgaUcUpdGPULTt/mmbPcGsnakygUjb5b0jDxZBMfOJ5WC0ahiX
 jP/q4YEAD5N5IR0fnE8Ndwl3UcEaNhrQ6C6eFeStiUXAZBDJTYZT9xtXGCLDbqykTPqY
 pgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1QWbs7h30bnNV963rbbzjJDg0UDFTbJY6yBzK3R8mzg=;
 b=M7gDaJmt3mDHos9Dpx4X/s3Q5r1G/yQ1iNaEhlxHmutQDfe4YQHlBtwIlJYt6Bf00p
 gab2E2L0VagzTDaxSqIxvGLda7fOYHATrwMCbFFULwfJr+MPRQIww0i4Cb5irD+gxkfs
 IowDP3SglXMc9k6E2D42jOYEpXDefeZHyzQ2gjB7oxkftOb+hVxhe6SnFVe+lbBQJJUT
 kUmhkXgLk6yPFfkjCwxViG/buhSt1Ct9lhO8YBVBmhxtOFq/8niNcrR+g7Z2k9suEnAH
 j2HtxYFKHN4cPvetQ3pSU+alOuH+lDY1/RhBZlS6xpu41yxhtRxyDFjx3jpZ919K6xtc
 O5zg==
X-Gm-Message-State: AOAM530oqn2336iMmQHHr9AcsZlicet18ANtLQ9GEs3y8flFnMhnhN6R
 iw/9mCKbDyfN8VYNKXYcqXMcdw==
X-Google-Smtp-Source: ABdhPJxDuIvq0mqYDwGwJgxm0JEJP5gLA/GtqUYItFp3JZTSwPwTb7ZgJHTBlXQk1hmBRYmeYd0BLw==
X-Received: by 2002:a17:902:a3cf:b029:128:cade:7dd5 with SMTP id
 q15-20020a170902a3cfb0290128cade7dd5mr19411664plb.4.1625085541384; 
 Wed, 30 Jun 2021 13:39:01 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id ay3sm14191539pjb.38.2021.06.30.13.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 13:39:00 -0700 (PDT)
Date: Wed, 30 Jun 2021 14:38:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210630203859.GB1290178@p14s>
References: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
 <20210623150504.14450-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623150504.14450-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/4] rpmsg: char: Introduce
 __rpmsg_chrdev_create_eptdev function
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

On Wed, Jun 23, 2021 at 05:05:02PM +0200, Arnaud Pouliquen wrote:
> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
> the rpmsg_eptdev context structure.
> 
> This patch prepares the introduction of a rpmsg channel device for the
> char device. The rpmsg device will need a reference to the context.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index fbe10d527c5c..50b7d4b00175 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -323,8 +323,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	kfree(eptdev);
>  }
>  
> -int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> -			       struct rpmsg_channel_info chinfo)
> +static struct rpmsg_eptdev *__rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev,
> +							 struct device *parent,
> +							 struct rpmsg_channel_info chinfo)
>  {
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev;
> @@ -332,7 +333,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>  	if (!eptdev)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	dev = &eptdev->dev;
>  	eptdev->rpdev = rpdev;
> @@ -374,9 +375,10 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  	if (ret) {
>  		dev_err(dev, "device_add failed: %d\n", ret);
>  		put_device(dev);
> +		return ERR_PTR(ret);
>  	}
>  
> -	return ret;
> +	return eptdev;
>  
>  free_ept_ida:
>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
> @@ -386,7 +388,19 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  	put_device(dev);
>  	kfree(eptdev);
>  
> -	return ret;
> +	return ERR_PTR(ret);
> +}
> +
> +int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo)
> +{
> +	struct rpmsg_eptdev *eptdev;
> +
> +	eptdev = __rpmsg_chrdev_eptdev_create(rpdev, parent, chinfo);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
