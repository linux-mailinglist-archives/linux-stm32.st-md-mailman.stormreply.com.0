Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4470F32D9B6
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 19:55:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8659C57B75;
	Thu,  4 Mar 2021 18:55:29 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E18DDC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 18:55:27 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id 18so4760355pfo.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Mar 2021 10:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X7AZqrsRrcth+0vhIoZwJc17+iOSIdFnS/9ezQsHyQQ=;
 b=xSTFsW+hrccBHxvVPtlkcY8CGpQI2Nq2GgtdkOJdhbhCXFFqCWd8vx/b6SteK+K3sx
 O7CpZtlT2qht9yecYV3E1H+KjKow7dwfq5RgjuBtTWPpfSX7vsQH5QW3qJdEzbt7B1+P
 KwJx7UgNgcKunhOVZ/7ZbrxXjSlXrfiVKuZUCJ3m3l3F/Yqhi/Qt/FgRxDzAz5Gv96C7
 O8SRmEUPbIA4WXIvdZSqk9GPZywHWI9acmID8dKrMIIA9363DOP0/BRQXWSwTLM/p+KL
 +3s08yEl/5vuEBH97+Owc2XBgbVs2r1yggCYLaaF0MuoTddjrfNNTXW8GaAWQYtg4lNS
 3VYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X7AZqrsRrcth+0vhIoZwJc17+iOSIdFnS/9ezQsHyQQ=;
 b=YMp+BKhtjtpF3oJXiCFvx/iQZcSYyM+V9QPJNNZlGjCl0jQ3j//g3af5wj22zDU0Zc
 fN3TMh5bKfSafZgZlAzZM8qMh6Ghrx32LtG9UOM1bJp12ZUwyC8IrWJtDvOzmivwDRw1
 jcr4VDM1EV1y3lgKFubf4Xqd+C8S2qFvx9WbMpKMkORhEIShl90xOGu/CVnlVjEnKqr7
 gUSH0N1p3/N86SwwS3qA65P4t1Y6DfqG9mfHlzIhxwrrysqPQD/h2c9+WVUgUqDN6rjk
 zJ/lhVwGHbX3+Vmz6UTtal3mImOyqFWPeYwhMtMM6TfYj42PVDaAdI92olFQN729KrFw
 4JFA==
X-Gm-Message-State: AOAM531yzdbyVJsuzoECJF+FNqohjchUAQq6vf5teWtDbA2oqXH43jsI
 fPByJgQeDRgC8OmZLf480+bvZw==
X-Google-Smtp-Source: ABdhPJzszkC/1+6RyebxySsHQ7RkcPuJ6V9QsqjSOJNVdr6UKz2Z+8c3UoA2uw2WhPBEvSd3uoTFnQ==
X-Received: by 2002:a05:6a00:138f:b029:1b8:b9d5:3a2c with SMTP id
 t15-20020a056a00138fb02901b8b9d53a2cmr5230356pfg.10.1614884126417; 
 Thu, 04 Mar 2021 10:55:26 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id o1sm165048pgq.1.2021.03.04.10.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 10:55:22 -0800 (PST)
Date: Thu, 4 Mar 2021 11:55:20 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210304185520.GC3854911@xps15>
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
> This patch prepares the introduction of a RPMsg device for the
> char device. the RPMsg device will need a reference to the context.
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

Shouldn't the second argument to __rpmsg_chrdev_create_eptdev() be @parent?

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
