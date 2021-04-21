Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD6367199
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 19:43:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B30D7C58D5D;
	Wed, 21 Apr 2021 17:43:35 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC24EC58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 17:43:33 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id a12so29563043pfc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iop9sruWWZSxGtHmNYX36Jd0eJEk72OqG23A/bctcgg=;
 b=KERT70S61Qltkgi1Aa1Wpfd5hkz2A2hEM601DubpZKrbIW2mF3Izu2wlKbW3nSQcqC
 mx1W6dd58gQrZCCPglM5531BdBO/Trlm1EVn3bJnYEmxIxZ8+OlfF6RonRRs6ZiLvrJ/
 ay+za8z/TJI75zmDPw/UsI63VAuWYIwDU7YuOAcPuSK9M6Xxmgl+U7ENmIMhO04ct2EM
 w75kSMJJgJpxbjiuORyewwe6Cy8n6Z+zyOBzbKneWzX9fM5FqIxicILNgLXcReJdbVqL
 vsUHWmBFaGFGVBWrb5VMJFARqqI8SjLOkrqf3RQDaoeJrx/fJ6uqsZLEOQLqtjEfc9Xg
 t7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iop9sruWWZSxGtHmNYX36Jd0eJEk72OqG23A/bctcgg=;
 b=BLKn7Ig4tQX9rNI1YW9SeX/L2H4gNKBbVsGd9GkaRVnowUd7uyPv0Y+yOoBu0Jzx37
 W1Ebm9WAmoLJRybxl1QQcii1WLE9QgyG8ipNmIBjIaGpgPxgr71nmw5uLbZI6GxHNYw1
 1TPKhbuswZI1NDlwmzb9n/l99KUHN0NnkxjyKbkrRYvTozUG3M2muxCJDkawDpl2Nc2k
 BVIsozvYi0/UU/A2WYVqanStZFiV6J1No182AA/tQbl4kT4logUWOhn8dTL/hQiGeNRz
 0Spa2qVd1gre2RUh2Xvg5WdSZ7wtQ+BowVvJq4csOGS/endZjxHIAy3LIiV5lQZgK4Am
 JK3A==
X-Gm-Message-State: AOAM532cWNmjXNhlLUQwvyVGlnoUCHIgdT7ODOo6pBoe53YqShIwqHSC
 rhb+NnivavGbvNhQQ2E+3R0Img==
X-Google-Smtp-Source: ABdhPJymxLvOl4ALgewRCvw1sM7e3ewI+dY0lHkB+zghwJ+H6qoPqYG6aYn6nlN5eAJGlKIR3wNDdw==
X-Received: by 2002:a65:5089:: with SMTP id r9mr22949281pgp.38.1619027012152; 
 Wed, 21 Apr 2021 10:43:32 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id r3sm59810pgn.82.2021.04.21.10.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 10:43:31 -0700 (PDT)
Date: Wed, 21 Apr 2021 11:43:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210421174329.GB1223348@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413134458.17912-5-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 4/7] rpmsg: char: Introduce
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

On Tue, Apr 13, 2021 at 03:44:55PM +0200, Arnaud Pouliquen wrote:
> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
> the rpmsg_eptdev context structure.
> 
> This patch prepares the introduction of a rpmsg channel device for the
> char device. The rpmsg device will need a reference to the context.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> update from V1
> - fix __rpmsg_chrdev_create_eptdev function header indentation.
> 
> ---
>  drivers/rpmsg/rpmsg_char.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 21ef9d9eccd7..a64249d83172 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -323,8 +323,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	kfree(eptdev);
>  }
>  
> -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> -			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
> +static struct rpmsg_eptdev *
> +__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +			     struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
>  {
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev;
> @@ -332,7 +333,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>  	if (!eptdev)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	dev = &eptdev->dev;
>  	eptdev->rpdev = rpdev;
> @@ -376,7 +377,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  		put_device(dev);
>  	}
>  
> -	return ret;
> +	return eptdev;
>  
>  free_ept_ida:
>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
> @@ -386,7 +387,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
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
