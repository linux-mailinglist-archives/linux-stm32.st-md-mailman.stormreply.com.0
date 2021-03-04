Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D832D9FB
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 20:06:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 198A1C57B75;
	Thu,  4 Mar 2021 19:06:04 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C44A9C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 19:06:00 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id l2so19544203pgb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Mar 2021 11:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rbbyP4f7puqulTra1fDP6OcDsptLygIaw3JP1xb77tM=;
 b=fadB5UiTzffTtxrnqdd8PhIkKLTzeY5XXE5bdX4vJi9wo5p/1BA58D1ACxEGMuIXJo
 uRdV+JdUT+4TivRh1Y40BT7tBt05iF3Tz+jLltT8q+VcbuFdOFg+2BbGlOhl2nPI5mQN
 4lwwe1QpLvzBeIwu2bP1lHAPbZMo0UurQ8Q2ArljOCzw8/qTlcmYslAtXIPic2EMbECj
 cdZCaoCA3q4OIWue/ZYMje4G8wQSt2UGacFpsykcWPznbxJR2tF86woEKSo30D3ge1IK
 TvQkapUM9mbMHGPF+Jmp2IgSipfBrZoPAOUpOpk9yVHDrrFEj5JMOGn1W1Dtcak7NGNR
 2P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rbbyP4f7puqulTra1fDP6OcDsptLygIaw3JP1xb77tM=;
 b=WINt53TqKo9000HkSh3w62wnS1o1pqras+bT8pgCp7tC7RAGl7+U8A/JGlSYLSpZCp
 4kp2er6QfCz9SFfKNob666phOQJn8hUwE4Ssg+DoBeXGOZ1Cqb584ILTO5pc6RJF0+qD
 bZ1lNwxNqleqk/kc4AHh9V93b/mVpNWhJPzV5Z1hHpAR7p8utha4xErTRBwhA6VO/cEq
 VVO76ZWakucVXAcCrJCvqY3033PqpChvXDqh+7Pu2KxFXNgfnYUJ0Kp3rwbKYMiFemvR
 vgPcznNj/v8ErPBr+D2KFlByE0Bnr/vRH3yc+m4ZektXcMINoUx1ltmjSVhoOPjCFzu6
 vXTA==
X-Gm-Message-State: AOAM531GjRHLhwGjRiMxHfyvQJtmZ/tyraG1oRdmj8ulxDXgZ5Do4Ewg
 5/aFhiYZkRtSiI7ck5JZVoUorQ==
X-Google-Smtp-Source: ABdhPJzM5524ccpy7qBq9OHI+RD9DcNp/2ZQOTkWThKPhkwH8zqKQJ3k0rww2CocJYdIxOK9EbiFlA==
X-Received: by 2002:a63:4241:: with SMTP id p62mr4758259pga.453.1614884759096; 
 Thu, 04 Mar 2021 11:05:59 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 188sm146234pfz.119.2021.03.04.11.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 11:05:55 -0800 (PST)
Date: Thu, 4 Mar 2021 12:05:53 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210304190553.GD3854911@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-14-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-14-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 13/16] rpmsg: char: introduce
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

On Fri, Feb 19, 2021 at 12:14:58PM +0100, Arnaud Pouliquen wrote:
> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
> the rpmsg_eptdev context structure.

Add newlines between paragraphs.

> This patch prepares the introduction of a RPMsg device for the
> char device. the RPMsg device will need a reference to the context.

s/the/The

s/RPMsg/RPMSG - throughout the patchset.

As a general note please be mindful of patch changelogs.  I often find myself
having to decipher the ideas being conveyed.

I am done reviewing this set.  There are things I will want to come back to but
the general goals behind the patchset are being achieved.

Thanks,
Mathieu

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 09ae1304837c..66dcb8845d6c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -328,8 +328,9 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
>  
> -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> -			       struct rpmsg_channel_info chinfo)
> +static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
> +							 struct device *parent,
> +							 struct rpmsg_channel_info chinfo)
>  {
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev;
> @@ -337,7 +338,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>  	if (!eptdev)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	dev = &eptdev->dev;
>  	eptdev->rpdev = rpdev;
> @@ -381,7 +382,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  		put_device(dev);
>  	}
>  
> -	return ret;
> +	return eptdev;
>  
>  free_ept_ida:
>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
> @@ -391,7 +392,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  	put_device(dev);
>  	kfree(eptdev);
>  
> -	return ret;
> +	return ERR_PTR(ret);
> +}
> +
> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo)
> +{
> +	struct rpmsg_eptdev *eptdev;
> +
> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
