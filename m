Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B573AF8BA
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 00:42:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03B3CC57B53;
	Mon, 21 Jun 2021 22:42:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC0D3C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jun 2021 22:42:39 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id h1so9384203plt.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jun 2021 15:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JCTSVkIytk/Hp0iEchwMobckKs7yA/n0NMw1lar0mLg=;
 b=heKd2ClbKCDXRwF6fkwDkcbMHXcQwPByNrGsZHf/mglW82+G95Qrwyq4r4Cka9FXsV
 mnvwlivYWR8kVKPhO+ZEAmnjtUGzXUkU+h9ZeqGyFviJCYhufhjWDHmELeFYxihn3eNk
 5I4bZvf3TkcyzPJh6ULTc39PaYMgtSOtSPneodBxPNI1CzdaC5WxWGsSG+5xfZAGNsOF
 z4OWXGBBdcV4xgIs/tnNP1UYKljQwTPqn9DFg3181EqFU3W+I4HuMcREzxOy8HThTRbl
 c81JnLUqTlujjre6zKxFS5b//u4mvRzwMGax3pc0C0fWSnjJTttrIIUu3L1HvWw8Dhdd
 8tTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JCTSVkIytk/Hp0iEchwMobckKs7yA/n0NMw1lar0mLg=;
 b=EUvJlXif6FSbFhUcGVvWI1j5XxblT7L2UmYsgxbz74OeBqYQjV34k5fDl7SrrYHOoU
 h2G+eIRBW7INQ6xp6ivTIousfr/ryuOO6j4cSOS2TQRSHDDft7PUe+LtN1fTJARTVfSO
 m/QhRJqgx1UL2+MBQ9FPvgCCtKPJfndDobUmD4wH56pqz4lPHfCnBiC9l/ORKAF0jWOI
 X4mu1JnLPpPo2TC2pAIdinNAnmtPLl4BE5wa5F+IfF87iyq7OF3pdXYMtN6Vc9dHvpX4
 twsRILIhDJrlNvLVi60vo3Ea9epPQtsIyxjSrycGpPBDMye9CFSRc+2uTe85b5+Uu3Ix
 CDHg==
X-Gm-Message-State: AOAM533/Aa9toi1GqywjeUDTVl+BeeErA85dAt5mDE3HPG0xzWBkdbXt
 DRmggms08YtuQbnOQDbjNGTrIQ==
X-Google-Smtp-Source: ABdhPJw380SDPCqztfQNuWLssT48FIFqA/Fzbx9ACZhnNr8oIqJQVAOfOEWjzQ5EYcebKaB890LLAw==
X-Received: by 2002:a17:90a:1b25:: with SMTP id
 q34mr499846pjq.163.1624315358306; 
 Mon, 21 Jun 2021 15:42:38 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id c5sm4584329pfv.47.2021.06.21.15.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 15:42:37 -0700 (PDT)
Date: Mon, 21 Jun 2021 16:42:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210621224235.GB980846@p14s>
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
 <20210607173032.30133-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607173032.30133-2-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, julien.massot@iot.bzh,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/4] rpmsg: Introduce
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

On Mon, Jun 07, 2021 at 07:30:29PM +0200, Arnaud Pouliquen wrote:
> The rpmsg devices can be probed without default endpoint. This function
> provides the capability for rpmsg drivers to create a default endpoint
> on runtime.
> 
> For example, a driver might want the rpmsg core dispatcher to drop its
> messages until it is ready to process them. In this case, the driver will
> create the default endpoint when the conditions are met to process the
> messages.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_core.c | 51 ++++++++++++++++++++++++++++++++++++++
>  include/linux/rpmsg.h      | 14 +++++++++++
>  2 files changed, 65 insertions(+)
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
> index d97dcd049f18..ab034061722c 100644
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
> @@ -234,6 +237,17 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
>  	return ERR_PTR(-ENXIO);
>  }
>  
> +static inline struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
> +							      rpmsg_rx_cb_t cb,
> +							      void *priv,

Please move this to the previous line to match the definition in the other arm
of the #if.

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
