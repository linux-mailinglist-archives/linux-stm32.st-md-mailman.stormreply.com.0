Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F7E466F6B
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 02:58:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E039AC5F1DC;
	Fri,  3 Dec 2021 01:58:22 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3ED4C5F1D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 01:58:21 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so2094562oto.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 17:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=smb1r2XfUg8MLMMqcLmw+mdb8mXA88P8HeDQMpSaQXQ=;
 b=mW8Rv4d2wGlgGwsDI0ch3/RY0Wx//Sz5OSXjuV8KTLtxaXMX3yJhSuWICAf0tiPXXP
 mhRyWyrnEOMmQAY5PmQIqRnmCi34S3AaT9pOatU6pFWx5R7Wa0S/9NhcaTvz7duM+vDs
 nA3AZGMHH96/GUTHGFwj/UwgokoPy3sm9eajYvMSDLi76bO3DuIP3JEkHXGsNVf8TLZq
 XlYLUSN2AJtWdRlwJXlaFcxgmioaNoOPZ1mXKifsIwkHmnHKW9fvwOqRcihaSsqlskqa
 tXlOxgjfiasJv+t0NcHn7ZdD8obF5EDzesBHZzo1dJOInzClaQ2eOrr1OX6u2vpynfDd
 d6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=smb1r2XfUg8MLMMqcLmw+mdb8mXA88P8HeDQMpSaQXQ=;
 b=CHg6hqKwHNK+ZirFA0m+RG938fGpr4uUs14uU154vtP8/EhjcnrXnkLkN6u6QBhv+o
 it61LcVD8VQHJ0J8thJlVUHT/useGJraAL7Vv80OwmH1BSmkKDeNMC2aaCClW0j16JGE
 IsslF3gFV5sFNsdK/+yHD0g9SkrlM9c5HX5bRDP1ov5ezAizvNMZMAP5vYMQBgubjm7H
 q+FFfiagXe6VVAiVbNmsIIzi9BVj792ecozpMUr4R0F7TmNGJs/b8E9zwPoSVLgipBX+
 s4+FKSG8jeVJka2b1zcfHP5xCTwS9J71BxlHgzGOyrQaMYejV+qLv2hV5FgZSxHutTG6
 oOVw==
X-Gm-Message-State: AOAM532BgP5vhHpqq4GiuH9mXKEy+htLRZHvAw34TJUk6vgy8Qbe92QG
 3dkLQfuM/NC4Qc7RjQWFs6RbPw==
X-Google-Smtp-Source: ABdhPJx5tNIkP0zfsreHzBezhGIR/QP82WXkGRhO9QXAzHMcFilI+uffVEm1od0Li4r41vInbereeg==
X-Received: by 2002:a05:6830:22cf:: with SMTP id
 q15mr14047768otc.255.1638496700813; 
 Thu, 02 Dec 2021 17:58:20 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t18sm376710ott.2.2021.12.02.17.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 17:58:19 -0800 (PST)
Date: Thu, 2 Dec 2021 19:58:14 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <Yal5tplvcqDjEeTs@builder.lan>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
 <20211108141937.13016-13-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211108141937.13016-13-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v7 12/12] rpmsg: core: send a ns
 announcement when a default endpoint is created
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

On Mon 08 Nov 08:19 CST 2021, Arnaud Pouliquen wrote:

> When a channel is created by user space application with the
> RPMSG_CREATE_DEV_IOCTL controls, a ns announcement has to be sent
> (depending on backend) to inform the remote side that a new service
> is available.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index bdcde57c22f6..63227279397d 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -145,6 +145,9 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
>   *
>   * This function returns a pointer to an endpoint created and assigned as the default
>   * endpoint of the rpmsg device.
> + * If we need to, we also announce about this channel to the remote
> + * processor. This announcement is needed in case the driver is exposing an rpmsg service that has
> + * been created locally.
>   *
>   * Drivers should provide their @rpdev channel (so the new endpoint would belong
>   * to the same remote processor their channel belongs to), an rx callback
> @@ -161,6 +164,7 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
>  						struct rpmsg_channel_info chinfo)
>  {
>  	struct rpmsg_endpoint *ept;
> +	int err = 0;
>  
>  	if (WARN_ON(!rpdev))
>  		return NULL;
> @@ -183,6 +187,16 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
>  	rpdev->ept = ept;
>  	rpdev->src = ept->addr;
>  
> +	if (rpdev->ops->announce_create)
> +		err = rpdev->ops->announce_create(rpdev);
> +	if (err) {
> +		rpmsg_destroy_ept(ept);
> +		rpdev->ept = NULL;
> +		rpdev->src = RPMSG_ADDR_ANY;
> +
> +		return NULL;
> +	}
> +

Unless I'm missing something I think this would be cleaner as:

	if (rpdev->ops->announce_create) {
		err = rpdev->ops->announce_create(rpdev);
		if (err) {
			...;
		}
	}

which also implies that you don't need to zero-initialize err.

Other than that, this looks good and follows what would happen in
rpmsg_dev_probe()...


PS. In rpmsg_dev_probe(), if rpdrv->probe() succeeds but announce_create
returns a failure we will exit the function with an error, which will
just fail really_probe() and we won't ever clean up the device (i.e.
call rpdev->remove()).

Regards,
Bjorn

>  	return ept;
>  }
>  EXPORT_SYMBOL(rpmsg_create_default_ept);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
