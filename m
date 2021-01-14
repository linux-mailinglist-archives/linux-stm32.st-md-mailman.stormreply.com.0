Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E172F6A7B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 20:05:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05EADC424C0;
	Thu, 14 Jan 2021 19:05:49 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75A67C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 19:05:47 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id q20so3914015pfu.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 11:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9eQpCXhKjCHwg9nJ0ZvUFOOkfeOuaFDT4T5heWosDRk=;
 b=sqRjubUVFoI42sWF35FLYlG5wrhrTfG4ofY/KnCDSFr1CiweQKiYdOu+Y2g9Vkw1rB
 j7tJuC9H85ZI5gZGIIU0Mm0pdWrGni6WCcHB+VdhE2tw5zihK4JpZc3CFOZm2UWTUwvo
 DmYW8eIXE2s2a1Yhi6JaR5ZYDO5ykeGGQ+0I48muB+KYO1rEim4vfFR2jkcg7RhjsKYI
 LDIM4WFj0a5rXDo0jXymb8cAGEzd9ffnhKW/U0FletCAqcqQyh4QfZEHGvJHPBGpsjB+
 pH+8We+T8OTCPqxvCCpb/DQ+Tzf5JXWQm7T8FBKtW0opDpEhrvqXH3Keaf09io5M3uVK
 YLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9eQpCXhKjCHwg9nJ0ZvUFOOkfeOuaFDT4T5heWosDRk=;
 b=eELVql9HM42jYpR62hTT/IWuJOPomBGqx8fLw+BBPzS3eQBGv1G7So06wW9jHhB4tS
 TTdqbeBbyAgDeTJbBHAcO8oKH4F4KDrK/GykW3ng3BBWlcv5+UqXukBipU3uZRD5VF1M
 suqAMDjCeXAjLyCDa4sWQlk5r4DxNLXI8uRIEwHAm4gE0K6dhyXyBtSCUhLtQkCIbjUW
 DTAJVFOLLqyeUKWnPGyJjwo3tuql1JRcP/3byA5bYvSVryBrxrmShPQ1KZosyh5zfnMo
 FeVVnmQQ2uzKH+lTq6gyu4FSDypW73m+ybQIvem8sC/uuld/bg8CZjYSW1mQVsGBU6zk
 aeBQ==
X-Gm-Message-State: AOAM532ysgSTC59v/E5YkTGmBiKNALQ9jNUPFc8dvqjCiVECbc0I0L8L
 te4kw5n9bYkmQb6lRmuhh5TmhA==
X-Google-Smtp-Source: ABdhPJyn8ffJyXOF9cK+jocYwrLCcfz6CojMYiM4QGvdeTEZoBPlKtMfSWkixhuPd+fqpuT7Av6Hpw==
X-Received: by 2002:a63:7904:: with SMTP id u4mr8851614pgc.41.1610651145903;
 Thu, 14 Jan 2021 11:05:45 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id g30sm5504881pfr.152.2021.01.14.11.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 11:05:45 -0800 (PST)
Date: Thu, 14 Jan 2021 12:05:43 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210114190543.GB255481@xps15>
References: <20210106133714.9984-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210106133714.9984-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: return an error if device
	already open
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

On Wed, Jan 06, 2021 at 02:37:14PM +0100, Arnaud Pouliquen wrote:
> The rpmsg_create_ept function is invoked when the device is opened.
> As only one endpoint must be created per device. It is not
> possible to open the same device twice.
> The fix consists in returning -EBUSY when device is already
> opened.
> 
> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 4bbbacdbf3bb..360a1ab0a9c4 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -127,6 +127,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>  	struct device *dev = &eptdev->dev;
>  
> +	if (eptdev->ept)
> +		return -EBUSY;
> +

I rarely had to work so hard to review a 2 line patch...

As far as I can tell the actual code is doing the right thing.  If user space is
trying to open the same eptdev more than once function rpmsg_create_ept() should
complain and the operation denied, wich is what the current code is doing.  

There is currently two customers for this API - SMD and GLINK.  The SMD code is
quite clear that if the channel is already open, the operation will be
denied [1].  The GLINK code isn't as clear but the fact that it returns NULL on
error conditions [2] is a good indication that things are working the same way.

What kind of use case are you looking to address?  Is there any way you can use
rpdev->ops->create_ept() as it is currently done?

Thanks,
Mathieu

[1]. https://elixir.bootlin.com/linux/v5.11-rc3/source/drivers/rpmsg/qcom_smd.c#L920
[2]. https://elixir.bootlin.com/linux/v5.11-rc3/source/drivers/rpmsg/qcom_glink_native.c#L1149

>  	get_device(dev);
>  
>  	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
