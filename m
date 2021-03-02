Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A719E32A8AC
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Mar 2021 19:01:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 696D8C56638;
	Tue,  2 Mar 2021 18:01:19 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91430C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 18:01:15 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id q20so14319102pfu.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Mar 2021 10:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UBInWvC4UtsMqMVlbtixev5AhwLr9Odk/zIdyxeWBVE=;
 b=gkKGSNWCsOVvAVoe6dY3Z32WGzDgmFBGW2Rdy7IGyI+X06lJHhsUEJnYKADiJ+JwDz
 KZa4BRTCoHDaMLCWkJ3VXKKsiTKWIDKvMbwuY+xaQ6rzeikYjM4sBUKsNOTFnUMUOsNR
 o6Qlyjx7EVKBp4wxt/L+lmHVpdomxhCqLVSYVGlAoij6YB1NgtrudvLPLPduMz/06TQX
 /zXj3i/TR5iMmw/f0irj/FtJLyZUhjeAXxmRB/HDFZ0+hB6yS++YHwHv9NI+SjSpXrD/
 yFUjZlgvAsbweDBQcQ000ZDcSzfSazOk8QnGzA7XPoc7/gVoJ/gzN85rz06qgjWIiqcR
 NE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UBInWvC4UtsMqMVlbtixev5AhwLr9Odk/zIdyxeWBVE=;
 b=lUTUt1V2VF2QwpwxaC6ztTc4QtKHBcrT12sQ03d6c3unURU3vxNp0zgjdPzW+AwF1A
 0D4mSGDik5NhxSN49mXIAtJs5j7oCnvw20zIDMFkIg4NmPnNJqpkmIR0Hjj4KtHi8rAp
 am5sAyhoW8091jim+MwhXh+ebhxYSG2i0cLjXjO2LYNQXvCWlsHqzsw2F0asMqolaKha
 GHU29Eam6E6j6VXp0Qj3aXH5usEUaKCSfBQTLjyh3lGZ77SRfxR8NF5BWnwks+wGMF1m
 +uDLuyiefKqi+Bkvr49KZe+Adta4Zjk4HKHyC8KAYLteLQ2gPAVhxn7Tu7zzOaGJHH0Q
 p0/w==
X-Gm-Message-State: AOAM5321YkJDpIpv8ZoVzxwRHieWiwE4cwrhyXYEaB8bWTKW/uF1UFhw
 pp4+PWFw9Z8fnk69Ggs5sSVYgg==
X-Google-Smtp-Source: ABdhPJzG0wzLzTI1eJKKGZkec00/EiMDhEKSsK3bDtPIQa/dNEuZiqt855r5ju1GLQpivCBDKuVbsw==
X-Received: by 2002:a63:585d:: with SMTP id i29mr19092274pgm.10.1614708074117; 
 Tue, 02 Mar 2021 10:01:14 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id q15sm20198751pfk.181.2021.03.02.10.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 10:01:13 -0800 (PST)
Date: Tue, 2 Mar 2021 11:01:11 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210302180111.GB3791957@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-6-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 05/16] rpmsg: char: dissociate the
 control device from the rpmsg class
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

On Fri, Feb 19, 2021 at 12:14:50PM +0100, Arnaud Pouliquen wrote:
> The RPMsg control device is a RPMsg device, it is already
> referenced in the RPMsg bus. There is only an interest to
> reference the ept char devices in the rpmsg class.
> This patch prepares the code split of the control and end point
> devices in two separate files.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 78a6d19fdf82..23e369a00531 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -485,7 +485,6 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	dev = &ctrldev->dev;
>  	device_initialize(dev);
>  	dev->parent = &rpdev->dev;
> -	dev->class = rpmsg_class;

This may break user space...  It has been around for so long that even if the
information is redundant we have to keep it.

>  
>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>  	ctrldev->cdev.owner = THIS_MODULE;
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
