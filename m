Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B75832D986
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 19:40:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB0CCC57B75;
	Thu,  4 Mar 2021 18:40:43 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C23FC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 18:40:41 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id a4so19439711pgc.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Mar 2021 10:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iOyXuDvcxIJx0fWVVx3P/498/pkanhShN/F9x63Eql0=;
 b=Wuo6av27VDcEVAtYW39edz6pHWrLzKoZG4gc3DHdSiXT0pBgzFxK4Qhxja0uIrZrDf
 EKcShlOVP8HvDiKbOJCahNHqBlO4rpO17GmgaO/KB3/HJhx+MrWbBf5n/ieH8TRFxDyg
 2GC+ACuHebskaqyXCnvBUAjHpQ+hgvViHN5AJSsqeOdQK9jYWmJs/iNb2EtSXqLYRgUw
 gJGBKR7CFO06PZj9TQlD/nTCGKodGlFjJ9y4VL/S53qR+m2nI+eomG3A4NfY/+68g9HO
 2n1WEyFwGkY4srHwUxtFpVVp3Hqm36rm+rYkn5Q3EjoFyE6MWb4NSql7XTcXCicxQfVC
 ptFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iOyXuDvcxIJx0fWVVx3P/498/pkanhShN/F9x63Eql0=;
 b=p/Xpq4Cr9a6qpLCZUkUr2YKZl3R4iFaegaBOUmph1ZTwLK4JaPxcbDFkwCI1CtIJ6q
 TM0uXU4RwuHr8vtIOJo4d1vz3gIVe1xrHpumh/UNd8yEkE7PK7oYrCUWhjkQ3Kjfqwj8
 u1km0fV51dbAJQj2VCASAZchX65Fa4tt90GP9kF9EDZ6V0IA2MpFpgPNvUBqxD9/YOAO
 E1NbIM/bqbDCt9spUV820OQl7it3vjznNbivh/7J59l7NjHRQJIe4XjSi14rls7M9HFn
 ruwSfhfRK0hrWGllofy+vyH1a+AF6c2IqjMSClUrzquADfs+23X04rF16OZgtlHrnOVF
 V/6A==
X-Gm-Message-State: AOAM532sc8VtvsHZwzk4dq3F2hrT/GCxS33+Pe4JPgN4F1fMbyIjrUSq
 zthRrdBfQ7Snj63sH3D/Iiq+qg==
X-Google-Smtp-Source: ABdhPJzwkhYn2cMBistrs8Pz3+urfuo6UpVT529eTD4hB8ctm0CobSvjPpPE3fffwBuYBUSQaLsr4Q==
X-Received: by 2002:a63:140b:: with SMTP id u11mr4792170pgl.436.1614883240211; 
 Thu, 04 Mar 2021 10:40:40 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 25sm107673pfh.199.2021.03.04.10.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 10:40:36 -0800 (PST)
Date: Thu, 4 Mar 2021 11:40:34 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210304184034.GA3854911@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-16-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-16-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 15/16] rpmsg: char: no dynamic endpoint
 management for the default one
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

There has to be a capital letter at the start of the title:

rpmsg: char: No dynamic endpoint management for the default one

Please fix for all the patches.

On Fri, Feb 19, 2021 at 12:15:00PM +0100, Arnaud Pouliquen wrote:
> Do not dynamically manage the default endpoint. The ept address must
> not change.
> This update is needed to manage the RPMSG_CREATE_DEV_IOCTL. In this
> case a default endpoint is used and it's address must not change or
> been reused by another service.

The above is very difficult to understand.  I am not sure about introducing
RPMSG_CREATE_DEV_IOCTL in this patchset.  More on that in an upcoming comment.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index c98b0e69679b..8d3f9d6c20ad 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -114,14 +114,23 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	struct rpmsg_endpoint *ept;
>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>  	struct device *dev = &eptdev->dev;
> +	u32 addr = eptdev->chinfo.src;
>  
>  	get_device(dev);
>  
> -	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> -	if (!ept) {
> -		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> -		put_device(dev);
> -		return -EINVAL;
> +	/*
> +	 * The RPMsg device can has been created by a ns announcement. In this
> +	 * case a default endpoint has been created. Reuse it to avoid to manage
> +	 * a new address on each open close.
> +	 */

Here too it is very difficult to understand because the comment
doesn't not describe what the code does.  The code creates an enpoint if it
has not been created, which means /dev/rpmsgX was created from the ioctl. 

> +	ept = rpdev->ept;
> +	if (!ept || addr != ept->addr) {
> +		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> +		if (!ept) {
> +			dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> +			put_device(dev);
> +			return -EINVAL;
> +		}
>  	}
>  
>  	eptdev->ept = ept;
> @@ -133,12 +142,17 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
>  {
>  	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> +	struct rpmsg_device *rpdev = eptdev->rpdev;
>  	struct device *dev = &eptdev->dev;
>  
> -	/* Close the endpoint, if it's not already destroyed by the parent */
> +	/*
> +	 * Close the endpoint, if it's not already destroyed by the parent and it is not the
> +	 * default one.
> +	 */
>  	mutex_lock(&eptdev->ept_lock);
>  	if (eptdev->ept) {
> -		rpmsg_destroy_ept(eptdev->ept);
> +		if (eptdev->ept != rpdev->ept)
> +			rpmsg_destroy_ept(eptdev->ept);
>  		eptdev->ept = NULL;
>  	}
>  	mutex_unlock(&eptdev->ept_lock);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
