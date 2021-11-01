Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E3441F6A
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Nov 2021 18:37:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FAACC5A4FF;
	Mon,  1 Nov 2021 17:37:26 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED404C5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Nov 2021 17:37:24 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 v40-20020a056830092800b0055591caa9c6so18092465ott.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Nov 2021 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G6TcqpHFdZZYSxe2t4YewV0bxg9nDBi/X+VnzoNiljk=;
 b=iEr27HKRHJrarwIO9n1LC6MIkFyDYM3qab0PilgmMleud4k76Jdg5s/365sHRMPZ/D
 e19c2oqdGLNAGEqGcy7D6LcbUAVUsUH1lYOVd3DJ6PYvICXht4D1ApZCcgQU7Y3ma7n2
 oMDEct1WQXGNrZCmE86+3JMZLZ4oMAOFk/PbvGWCw4UURvj0JToDDZsplnHM2jAwxxUr
 QTDliYlDK4VbY1npus73FgW4MxijgbG8fRwMaEgtq1vYrzH+ECVIs/5LgqdgcOxbna3N
 JJkQrSLgsTWSGeAaLZUJrHvYQe4e0iWL9UailvKihOCn2bTR04f6uh9CcBMOGHlfXJ5V
 RRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G6TcqpHFdZZYSxe2t4YewV0bxg9nDBi/X+VnzoNiljk=;
 b=a4UASJfCqQSTXD1x6VSSResD5zLFAjhQYF0/R7g415JeDdMD9RAreG+5E1RPDFA9rE
 aYWTuAfY33Tx5q17GclM1JZtMrpbs/sSf/TZuLvvlRVwcg/ch1pQGiGeh57Sigu/d03S
 VgTF00EHqacoQ6MgPCu+CrvzhoMTLD/NfbhuegkAs5vkQ46t4cS5Ve+2IKjijmzMudF0
 CXwpGUk2j3x6wkj+aPq6+2n0KB3o6bG4T+PhRc43dki8h3n9ETQSavuw3W/NCZ6TaBmE
 Xi7wCXoYo3avWJnmPALTyel3VJdjXd/g5tjb6YzDW5wQrnbt9/JcXydZed7Gu0oWlqLT
 j3KA==
X-Gm-Message-State: AOAM531qvo3CKP/tS3hYsawQ198HCTcfXgzJNbso8u5P8ubuwrQABs7c
 wfvnWOeD5BQdzoQWXqzV75LdyQ==
X-Google-Smtp-Source: ABdhPJw9L2dzbBwVxfG/mj16FU1rikZcWY/vLQoxgaaNK7FBf6Xg0Nh0F4ZldiiKvS6zn+0IIw4r9w==
X-Received: by 2002:a05:6830:144d:: with SMTP id
 w13mr11475596otp.163.1635788243767; 
 Mon, 01 Nov 2021 10:37:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id bb33sm1139550oob.2.2021.11.01.10.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:37:23 -0700 (PDT)
Date: Mon, 1 Nov 2021 12:37:18 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YYAlzvXns4Ejxa6S@builder.lan>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-7-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022125426.2579-7-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 06/10] rpmsg: Introduce
 rpmsg_create_default_ept function
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

On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:

> By providing a callback in the rpmsg_driver structure, the rpmsg devices
> can be probed with a default endpoint created.
> 
> In this case, it is not possible to associated to this endpoint private data
> that could allow the driver to retrieve the context.
> 
> This helper function allows rpmsg drivers to create a default endpoint
> on runtime with an associated private context.
> 
> For example, a driver might create a context structure on the probe and
> want to provide that context as private data for the default rpmsg
> callback.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Julien Massot <julien.massot@iot.bzh>
> ---
>  drivers/rpmsg/rpmsg_core.c | 51 ++++++++++++++++++++++++++++++++++++++
>  include/linux/rpmsg.h      | 13 ++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 53162038254d..92557c49d460 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -132,6 +132,57 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
>  }
>  EXPORT_SYMBOL(rpmsg_destroy_ept);
>  
> +/**
> + * rpmsg_create_default_ept() - create a default rpmsg_endpoint for a rpmsg device
> + * @rpdev: rpmsg channel device
> + * @cb: rx callback handler
> + * @priv: private data for the driver's use
> + * @chinfo: channel_info with the local rpmsg address to bind with @cb
> + *
> + * On register_rpmsg_driver if no callback is provided in the rpmsg_driver structure,
> + * no endpoint is created when the device is probed by the rpmsg bus.
> + *
> + * This function returns a pointer to the default endpoint if already created or creates
> + * an endpoint and assign it as the default endpoint of the rpmsg device.

But if the driver didn't specify a callback, when would this ever
happen?

> + *
> + * Drivers should provide their @rpdev channel (so the new endpoint would belong
> + * to the same remote processor their channel belongs to), an rx callback
> + * function, an optional private data (which is provided back when the
> + * rx callback is invoked), and an address they want to bind with the
> + * callback. If @addr is RPMSG_ADDR_ANY, then rpmsg_create_ept will
> + * dynamically assign them an available rpmsg address (drivers should have
> + * a very good reason why not to always use RPMSG_ADDR_ANY here).
> + *
> + * Returns a pointer to the endpoint on success, or NULL on error.

Correct kerneldoc is "Return: ..."

> + */
> +struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
> +						rpmsg_rx_cb_t cb, void *priv,
> +						struct rpmsg_channel_info chinfo)
> +{
> +	struct rpmsg_endpoint *ept;
> +
> +	if (WARN_ON(!rpdev))
> +		return NULL;
> +
> +	/* It does not make sense to create a default endpoint without a callback. */
> +	if (!cb)
> +		return NULL;
> +
> +	if (rpdev->ept)
> +		return rpdev->ept;

How does the caller know if they should call rpmsg_destroy_ept() on the
returned ept or not?

> +
> +	ept = rpdev->ops->create_ept(rpdev, cb, priv, chinfo);
> +	if (!ept)
> +		return NULL;
> +
> +	/* Assign the new endpoint as default endpoint */
> +	rpdev->ept = ept;
> +	rpdev->src = ept->addr;
> +
> +	return ept;
> +}
> +EXPORT_SYMBOL(rpmsg_create_default_ept);
> +
>  /**
>   * rpmsg_send() - send a message across to the remote processor
>   * @ept: the rpmsg endpoint
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 6fe51549d931..b071ac17ff78 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -172,6 +172,9 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *);
>  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
>  					rpmsg_rx_cb_t cb, void *priv,
>  					struct rpmsg_channel_info chinfo);
> +struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,

Is there ever a case where someone outside drivers/rpmsg/ should call
this function?

Regards,
Bjorn

> +						rpmsg_rx_cb_t cb, void *priv,
> +						struct rpmsg_channel_info chinfo);
>  
>  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
>  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> @@ -236,6 +239,16 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
>  	return NULL;
>  }
>  
> +static inline struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
> +							      rpmsg_rx_cb_t cb, void *priv,
> +							      struct rpmsg_channel_info chinfo)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return NULL;
> +}
> +
>  static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
>  {
>  	/* This shouldn't be possible */
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
