Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAF13B89DF
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 22:48:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BBA4C56630;
	Wed, 30 Jun 2021 20:48:30 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAA39C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 20:48:27 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id g21so3660544pfc.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 13:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3V3OFykueXALQcb8bHaOuERxTOWs4Agns0W740chGTg=;
 b=dXFdaB5eK79hyNZjeXXsAOEOK1YUd22gnr/ukEbvG5B/Cj0fkM+Vihe1cNwY+Aed/S
 YiqwQ8eUD2Un/L66bOnABrG0xmvMZOydY9l9QRQ8aRB2SQqPAKQjVkWUGgcwtrGS0KZZ
 2MjkWulYiPLphm4SQOJ/iKEm1kBZxL9LrjtiQMcLjIiW6CyLDOR0ECn9Tp0cWjwMKvij
 BG6LAP6BNgSaq3oeK3QyaEjZQdfmi/LZ8l0DwXUFBwWm7ba2nyRY1fHs3t1oNLdHwj3d
 FqTmnDNlRgEcK0beAB76IkESPtnILtCF+6816JOPQ6X6ijIUdgkWO73EgQolp8jyH2GJ
 +MpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3V3OFykueXALQcb8bHaOuERxTOWs4Agns0W740chGTg=;
 b=J4MSFJBkJyxS6M2uqbTXSJObh+M4nGvLmm/UynxfEl7E28NL2ngH8Q3fIDab+pn655
 6ilhgd5NlfOo2ggb7KJp6kmkg902pYzAhyU1eOywh0cqk/qsXfMqJEB2p9Y0Fip8xGiH
 aXb9+tJ6KFsHXuvGch+BNGkfkE+MZ4J7QRs/ICmbn4gMmj4Ajv2ZdLPKr689uDsQ3evo
 0cUAlCWPOR0b+pSi7MArm2go91eqn0OpuBLcy/ETTukP+8W9wTMoaxIFStSTBYPreLHZ
 ZUOt1HlgYU40oPSQzT5cKRi0RPwmEKMOUc4BPZfRTzM1Pm8ZnuZgZlZThUdJhCoNKPQY
 /w6A==
X-Gm-Message-State: AOAM530exBI3rOsqPsr/xtVgd972zptZ/ZDO3VQlZA0BpOCWT/ndR5jl
 ZJHPw7ElQtKSHXFTgT8KVBb+iQ==
X-Google-Smtp-Source: ABdhPJyFJr3vbX3/L7gBnKcYr0blRFKn0IkndBGDGYJMRGGsjExVmR1Ip/lyLEQuCxkfAa/UE5iIWA==
X-Received: by 2002:a63:5057:: with SMTP id q23mr35744377pgl.271.1625086106139; 
 Wed, 30 Jun 2021 13:48:26 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id m21sm7339455pjz.57.2021.06.30.13.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 13:48:25 -0700 (PDT)
Date: Wed, 30 Jun 2021 14:48:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210630204823.GC1290178@p14s>
References: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
 <20210623150504.14450-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623150504.14450-4-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 3/4] rpmsg: char: Add possibility to
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

On Wed, Jun 23, 2021 at 05:05:03PM +0200, Arnaud Pouliquen wrote:
> Current implementation create/destroy a new endpoint on each
> rpmsg_eptdev_open/rpmsg_eptdev_release calls.
> 
> For a rpmsg device created by the NS announcement mechanism we need to
> use a unique static endpoint that is the default rpmsg device endpoint
> associated to the channel.
> 
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
> ---
> update vs V1:
> - remove the management of the default endpoint creation from rpmsg_eptdev_open.
> 
> ---
>  drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 50b7d4b00175..a75dce1e29d8 100644
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
> +	if (!eptdev->rpdev || eptdev->ept == eptdev->rpdev->ept)

Did you find a scenario where eptdev->rpdev would not be valid when this is
called?  To me if this code is called __rpmsg_chrdev_eptdev_create() has setup
the rpdev pointer and therefore it will be valid.

If there is a scenario where it is possible that eptdev->rpdev is invalid then
please add a comment with the details.  Otherwise simply remove the first part
of the condition.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

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
