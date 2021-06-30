Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 556AD3B89CF
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 22:38:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C135C56630;
	Wed, 30 Jun 2021 20:38:27 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D59F7C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 20:38:25 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id m17so2178789plx.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 13:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=29U3jHG7Pp1+7u6Mh/ME/IzDFz5tOMaeoDOJAA5iyCc=;
 b=LATc6+sHrVVjNkZ/A2Q4iru8qz4SPu0DPaZ030h0AfrsZqQR7E2wruOhIi2/igoRmB
 VXUVgpAx9PqQLsTyGd0l2CJFMX8Wg7DQPOSv2eu9hN+0koZUW0EtnLYMUiVPH8yJwQvf
 kDUUB0NbFWHYyyozUlpGS4pkc2qUCxbUr5t1kjAsjyMPDHXy9iOnqCjQO/1xu0fWvnve
 CEmh7WZgu+FV8Lu/L7MN3DZrmrGKWe+80/2XYRHoDEPyZgb/faX3Z3qX3blBQ0XpTkUl
 EgOxN7sQ0E5DODJ/ZR5lmyASuI+Hk889QyJ5J2RJg8Jc9FRvx9qKOlcnHlGMghFfqS3G
 IcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=29U3jHG7Pp1+7u6Mh/ME/IzDFz5tOMaeoDOJAA5iyCc=;
 b=g4UdpF5e78/zxE9LKeIHeBO9LEkWL/5YKcB8IraNZGx722r5BiF4re/pKMhmOtlxHM
 Jerwe898KijLYXj5XybqliWHMe9EUSeKlPY+of96Gthc2qVaGKjDZ5CIyEWcob4OOlaZ
 0ZibEDJ0MU2fbq+85eUPaC85tK1VtYYB/WknC4eQCjdbcilDugTH6NMcPPv009ScIP2e
 r8N3Hlga6lLEfS9pM1KHp5WNnVVZXIF55ZrEBQBLIp+T2cP1KNFCN0VCeNlZJ5jxMAON
 lZ8mnc9kiOiUjtJeKCXSLEwTVYed+cznT70CjD8/fFWy0mwsx/d7blr8+7mH7dIjnwjt
 gSMA==
X-Gm-Message-State: AOAM530LAGGqHzZiYtJnSw53eQdWYmByrHT81h8ttdGn5+7AzTA3Oy1s
 rkHTr73CG7fNyn7HSwkpykjwjw==
X-Google-Smtp-Source: ABdhPJySADZzfAvXzFglO2HxoY3PDjww1phzUZfKG8HhCFxivUc3Eir5TyRK7xqh6yHUpZBE6wuM/Q==
X-Received: by 2002:a17:902:a981:b029:116:a139:6054 with SMTP id
 bh1-20020a170902a981b0290116a1396054mr33649783plb.60.1625085504194; 
 Wed, 30 Jun 2021 13:38:24 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id p10sm22283464pfn.147.2021.06.30.13.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 13:38:23 -0700 (PDT)
Date: Wed, 30 Jun 2021 14:38:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210630203821.GA1290178@p14s>
References: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
 <20210623150504.14450-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623150504.14450-2-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 1/4] rpmsg: Introduce
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

On Wed, Jun 23, 2021 at 05:05:01PM +0200, Arnaud Pouliquen wrote:
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
> ---
> 
> update from V1:
> - Minor: alignement of the function parameter to have homogenous function declaration.
> ---
> 
>  drivers/rpmsg/rpmsg_core.c | 51 ++++++++++++++++++++++++++++++++++++++
>  include/linux/rpmsg.h      | 13 ++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e5daee4f9373..07b680bda61f 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -115,6 +115,57 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
>  }
>  EXPORT_SYMBOL(rpmsg_create_ept);
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
> + * a endpoint and assign it as the default endpoint of the rpmsg device.

s/"a endpoint"/"an endpoint"

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
> +	/* It does not make sense to create a default  endpoint without a callback. */

s/"default  endppoint"/"default endpoint"

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +	if (!cb)
> +		return NULL;
> +
> +	if (rpdev->ept)
> +		return rpdev->ept;
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
>   * rpmsg_destroy_ept() - destroy an existing rpmsg endpoint
>   * @ept: endpoing to destroy
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index d97dcd049f18..11f473834e86 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -172,6 +172,9 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *);
>  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
>  					rpmsg_rx_cb_t cb, void *priv,
>  					struct rpmsg_channel_info chinfo);
> +struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
> +						rpmsg_rx_cb_t cb, void *priv,
> +						struct rpmsg_channel_info chinfo);
>  
>  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
>  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> @@ -234,6 +237,16 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
>  	return ERR_PTR(-ENXIO);
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
