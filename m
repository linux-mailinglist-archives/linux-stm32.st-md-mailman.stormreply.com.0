Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8DF35A4F5
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Apr 2021 19:53:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 035B7C5718B;
	Fri,  9 Apr 2021 17:53:58 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B0A3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 17:53:56 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q10so4485476pgj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t0lA/jFVR3TTCjtnv1uyJJiTbsD33ku905quI/YeL/8=;
 b=ujzqBY4P8EW3BO2TN+Pcc1TuyrOGLeEzdi6LjPKFvGdzOrzLy+E3xdB6qDl7lnihv7
 mtR4mmom/nb94xbAaHAgP4YyETgvmhM99+46KpKkZiu7Mk73tAWdkdVgVaRqYJKW0hQI
 Bqa8PL8+fsaU9pm6TbG3aH7vLnq4jvdzsY87YLCIbLDBO8va6hggYohkPwYFX2cUKf5w
 VPXOBlEuxvHCiVhsPdUgwzjmx6BRnMTva66Bvgr+a6430LOyipUkgDPeMdxZeU1kv9Iz
 bST5+/kITQOvnzSmXiePB5EZlE9qgE6+aJ1EyCp36p4diDPPk6Ikgv+1G/OM1+JHsh4u
 Qpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t0lA/jFVR3TTCjtnv1uyJJiTbsD33ku905quI/YeL/8=;
 b=sU9k0iVTSAT80q/TI7Ur1uFbSf4Vgihx07oSjaA+jqpvz1Vp0qMH/TCpio8lk9aqGG
 hoIQDDsxDnJmVOWolTdw2hP1nIeXcJ7eodX01K3Ps4GK7E2lJEzM6fBXyOaBt9jcL+es
 VrWX4P4m+8twCvTCkBktT0tF6hKJWBJpXU/MuRGLT2+BroKsFtvoFmlVM6H+wupe300L
 zl1M2QptuaGovj9ZFLSObV/L/NMGqST0jorWV+HvMsEQaz+VdGe1gZzXbKRR+Sa2ZwCD
 QbRRXmFu6SdYU0D0IHV4dlK1Yau6KfwELwLbU0Rbcboho0jMiu+gkVniqrVqQjW1riJt
 oM4Q==
X-Gm-Message-State: AOAM531sSH9ftZa0qEw8lK4oUU0q8XED6cVbuEM/kqlOxVD+vMgpOxOO
 3LzoKWFzJBoH4sqrQNUKdgtr5w==
X-Google-Smtp-Source: ABdhPJzxMzOT86u7n+dmZg6aYJAHdUkT8NqqK1u+CwJMn8VdnNGQaux3HBYp8DZNloQZe9Q//Gftyw==
X-Received: by 2002:a05:6a00:883:b029:247:562:f8f9 with SMTP id
 q3-20020a056a000883b02902470562f8f9mr3739481pfj.34.1617990834443; 
 Fri, 09 Apr 2021 10:53:54 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id n73sm3049665pfd.196.2021.04.09.10.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 10:53:53 -0700 (PDT)
Date: Fri, 9 Apr 2021 11:53:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210409175352.GB489094@xps15>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
 <20210323122737.23035-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323122737.23035-5-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 4/7] rpmsg: char: Introduce
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

On Tue, Mar 23, 2021 at 01:27:34PM +0100, Arnaud Pouliquen wrote:
> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
> the rpmsg_eptdev context structure.
> 
> This patch prepares the introduction of a rpmsg channel device for the
> char device. The rpmsg device will need a reference to the context.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> update from [1]
> - propagate parent param in rpmsg_chrdev_create_eptdev,
> - fix changelog.
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20210219111501.14261-14-arnaud.pouliquen@foss.st.com/
> ---
>  drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 5d4a768002ce..7f6d46078179 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -325,7 +325,8 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	kfree(eptdev);
>  }
>  
> -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
> +							 struct device *parent,
>  			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)

Please fix:

static struct rpmsg_eptdev *
__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
                             struct rpmsg_channel_info chinfo, struct class *rpmsg_class)

>  {
>  	struct rpmsg_eptdev *eptdev;
> @@ -334,7 +335,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>  	if (!eptdev)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	dev = &eptdev->dev;
>  	eptdev->rpdev = rpdev;
> @@ -378,7 +379,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  		put_device(dev);
>  	}
>  
> -	return ret;
> +	return eptdev;
>  
>  free_ept_ida:
>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
> @@ -388,7 +389,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  	put_device(dev);
>  	kfree(eptdev);
>  
> -	return ret;
> +	return ERR_PTR(ret);
> +}
> +
> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo,  struct class *rpmsg_class)
> +{
> +	struct rpmsg_eptdev *eptdev;
> +
> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, parent, chinfo, rpmsg_class);
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
