Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 773CE427450
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Oct 2021 01:41:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E789C5C824;
	Fri,  8 Oct 2021 23:41:21 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FAFDC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 23:41:18 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so13495166otq.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 16:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E2HRXF4ISVU2+cymW013Lc9bdY2GyNOKabizpiOqGQY=;
 b=nZGBkZgqbaOZWKC81X/38uDT/zKLALPhkwxZIS/ruJkI+DpGMOkOJYJbU4QEJue47Q
 WKXE+3iF+oyuMn7De5rw+x4XGSjsIV4eEm5WDXTd+lwnUCyyNKHD77lhBjxDHcEgfA70
 s/GEj7NCSJw/bcZPaVcqjfgeaM07NOIGUUdbsQ1eSB+OGwgqX031BwWFdX7AYovBfhUf
 VxohewkMyZjaVQ0NZf8QIQjTESt8c2SeeUfcRp/Q1yxxqMHzSY6YbLC53b7rZRc05Onb
 FMiYxCKyC7PLT8onmNnClHi6MUnamkUNAfETl4rqFJLPhAaCGonmSVh4wVdygxtM3GH9
 zBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E2HRXF4ISVU2+cymW013Lc9bdY2GyNOKabizpiOqGQY=;
 b=IhbRo1ToVsdm7fClfHrmTwTCfKXsM+K3jsl3qaa1eI00kjkiDBMdXdSaSbLnISNuS2
 JchpCoxd45t/U0wbJiJ3e0tccXpbwrY5Vw0B3WOs5Gri1lbLnvYqRQlPlRqby1LIyHgS
 8lzXBTYMKhXaAfb/7yiB+lsCmAhr/iznh1Mj3eTwmKuLzB1ucuYhThbldjN1oGzytRlh
 Vomr4miaPv06JeY1HNlbfEuzeF/w+EW+8RBR4FwiVmH3r3F2qpTCrX9oGFMa8iK5lj0a
 MjYlGRTpm5x77QG+4LkkAhYESYSc2NXd2kU0r7J3/j5LGzHsVeOhT5w8qoCtNkqVNyE/
 JrTQ==
X-Gm-Message-State: AOAM533bqm6PMcfOBjEp0nx3bzpVcLtZVcEOMomzQHxtRuSiJUyQVBHr
 CDXoN8RUbWPmpXWPxjjZBQFVOg==
X-Google-Smtp-Source: ABdhPJw1fJpx6ds2gCEuhqVhet8I9m53n9mue5tu41mUvYXtKQBkxf84KQuRooQD3XAXRAZX9Q0puA==
X-Received: by 2002:a9d:64c:: with SMTP id 70mr10690738otn.59.1633736475832;
 Fri, 08 Oct 2021 16:41:15 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id l25sm145046oot.36.2021.10.08.16.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:41:15 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:42:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YWDXfeR79u5QQvk3@ripper>
References: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
 <20210712131900.24752-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712131900.24752-4-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 3/4] rpmsg: char: Add possibility to
 use default endpoint of the rpmsg device.
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

On Mon 12 Jul 06:18 PDT 2021, Arnaud Pouliquen wrote:

> Current implementation create/destroy a new endpoint on each
> rpmsg_eptdev_open/rpmsg_eptdev_release calls.
> 
> For a rpmsg device created by the NS announcement mechanism we need to
> use a unique static endpoint that is the default rpmsg device endpoint
> associated to the channel.
> 

Why do you need this endpoint associated with the channel? Afaict the
read/write operations still operate on eptdev->ept, so who does use the
default endpoint for the device?

> This patch prepares the introduction of a rpmsg channel device for the
> char device. The rpmsg channel device will require a default endpoint to
> communicate to the remote processor.
> 
> Add the static_ept field in rpmsg_eptdev structure. This boolean
> determines the behavior on rpmsg_eptdev_open and rpmsg_eptdev_release call.
> 
> - If static_ept == false:
>   Use the legacy behavior by creating a new endpoint each time
>   rpmsg_eptdev_open is called and release it when rpmsg_eptdev_release
>   is called on /dev/rpmsgX device open/close.
> 
> - If static_ept == true:
>   use the rpmsg device default endpoint for the communication.
> - Address the update of _rpmsg_chrdev_eptdev_create in e separate patch for readability.
> 
> Add protection in rpmsg_eptdev_ioctl to prevent to destroy a default endpoint.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Julien Massot <julien.massot@iot.bzh>
> ---
>  drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 50b7d4b00175..bd728d90ba4c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -45,6 +45,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
>   * @queue_lock:	synchronization of @queue operations
>   * @queue:	incoming message queue
>   * @readq:	wait object for incoming queue
> + * @static_ept: specify if the endpoint has to be created at each device opening or
> + *              if the default endpoint should be used.
>   */
>  struct rpmsg_eptdev {
>  	struct device dev;
> @@ -59,6 +61,8 @@ struct rpmsg_eptdev {
>  	spinlock_t queue_lock;
>  	struct sk_buff_head queue;
>  	wait_queue_head_t readq;
> +
> +	bool static_ept;

I think you can skip rpmsg_create_default_ept() if you just make this
struct rpmsg_endpoint *.

>  };
>  
>  int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> @@ -116,7 +120,15 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  
>  	get_device(dev);
>  
> -	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> +	/*
> +	 * If the static_ept is set to true, the rpmsg device default endpoint is used.
> +	 * Else a new endpoint is created on open that will be destroyed on release.
> +	 */
> +	if (eptdev->static_ept)
> +		ept = rpdev->ept;

This would be:
	if (eptdev->static_ept)
		ept = eptdev->static_ept;

> +	else
> +		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> +
>  	if (!ept) {
>  		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
>  		put_device(dev);
> @@ -137,7 +149,8 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
>  	/* Close the endpoint, if it's not already destroyed by the parent */
>  	mutex_lock(&eptdev->ept_lock);
>  	if (eptdev->ept) {
> -		rpmsg_destroy_ept(eptdev->ept);
> +		if (!eptdev->static_ept)
> +			rpmsg_destroy_ept(eptdev->ept);
>  		eptdev->ept = NULL;
>  	}
>  	mutex_unlock(&eptdev->ept_lock);
> @@ -264,6 +277,10 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>  		return -EINVAL;
>  
> +	/* Don't allow to destroy a default endpoint. */
> +	if (eptdev->ept == eptdev->rpdev->ept)

And this would be if:
	if (eptdev->static_ept)
		return -EPERM;

Wouldn't -EINVAL or something be better than -EPERM when you try to
destroy one of these endpoints?

It's not that we don't have permission, it's that it's not a valid
operation on this object.

Regards,
Bjorn

> +		return -EPERM;
> +
>  	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
>  }
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
