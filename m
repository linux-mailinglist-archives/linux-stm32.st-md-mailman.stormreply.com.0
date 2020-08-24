Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A76D250BCB
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Aug 2020 00:44:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C490EC32EA7;
	Mon, 24 Aug 2020 22:44:52 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D947CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 22:44:50 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id ep8so188573pjb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 15:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lvqRTw0O3/yHbkOlErkH4DxLVlE/caoRK9250pDnuAc=;
 b=c8qrRiGCb73Dq+2Ss/c+oYm87rB3yS5b69CdPfgdJvR9OkGboB8mQDsBffKqrmPV2Z
 7SP58uLu7Lq+cK09GbokMmYO0eyKBYizG1AIGGzXf04vQDwoutHJJ1HXHZWsJ4buBoP0
 okNbb5Fpk7pIHc7D1NOIZqHCo8v5CYKdgSFbptNMDwwMVfhYplZ8ejyXpJPchXscoxHo
 fYT3hC/28GRCdl2Icy8sMsKJ1zmV0EThW8EXjLTjgzTcI7vNntWlrsv2uk7iKvNVKUCa
 /jYaKVeGMK3eypuuDuPr8+YmzRtExnXVaZsGq6FI2sdF4cDeI93utfdqtXmWkuuNIcTl
 guiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lvqRTw0O3/yHbkOlErkH4DxLVlE/caoRK9250pDnuAc=;
 b=pOiuz8645nWEc41tIv6LfkhgS8xsewvKh1MMmgQO0fwMAQQ+ClZTLm0zQKueE/wq/d
 LdldlRbH6ASnZ+RPsxHK/zz/RSoCI1EVvOFDHquqmdprv/yJ7KplTr9I7RwrAXEejrR7
 rZHQVuctFiM5t7ponMUlwn0MObIPCfWOaJk21EpA2PDuuFQr2NFKdHlPJAv51f23ABPH
 86rV6+Ns081jIgYysjqd18i34oAGE2yU73KulEEFQnBMj4QXZd6UcGTT4A2UNPhCHZnT
 5uoSOidpn78Rq5kklqqMVtdreOdLKV2kAyavSkOo2z12SAMgHq8o8qzHXGtn9haMVnAp
 oWxw==
X-Gm-Message-State: AOAM530i9BWoIqXFEZg/k3/yM4d0E0kiGGC+bCuJQRXWhLzcutDk2Ztj
 sIxAsSpG5lXRknw5MLbGQBYEhQ==
X-Google-Smtp-Source: ABdhPJziXw/OMxO7aabSOn/p/vOo1+0RBR9sraOf+s0c/lIGdujYnIuv4mKjS3v5VqZkJ6K6Gni+WA==
X-Received: by 2002:a17:90a:d24c:: with SMTP id
 o12mr1200035pjw.60.1598309089056; 
 Mon, 24 Aug 2020 15:44:49 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id 144sm12465625pfu.114.2020.08.24.15.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 15:44:48 -0700 (PDT)
Date: Mon, 24 Aug 2020 16:44:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200824224446.GC3938186@xps15>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
 <20200731114732.12815-3-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731114732.12815-3-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 2/9] rpmsg: core: add channel creation
	internal API
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

Hi Arnaud,

On Fri, Jul 31, 2020 at 01:47:25PM +0200, Arnaud Pouliquen wrote:
> Add the channel creation API as a first step to be able to define the
> name service announcement as a rpmsg driver independent from the RPMsg
> virtio bus.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/rpmsg_core.c     | 37 ++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h | 12 +++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index a6361cad608b..ae7da4a2e528 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -20,6 +20,43 @@
>  
>  #include "rpmsg_internal.h"
>  
> +/**
> + * rpmsg_create_channel() - create a new rpmsg channel
> + * using its name and address info.
> + * @rpdev: rpmsg driver
> + * @chinfo: channel_info to bind
> + *
> + * Returns a pointer to the new rpmsg device on success, or NULL on error.
> + */
> +struct rpmsg_device *
> +	rpmsg_create_channel(struct rpmsg_device *rpdev,
> +			     struct rpmsg_channel_info *chinfo)
> +{
> +	if (WARN_ON(!rpdev) || !rpdev->ops->create_channel)
> +		return NULL;

Ok for the WARN_ON().  In another if(), I would check for ops and
ops->create_channel().  Same for the release() operation.

> +
> +	return rpdev->ops->create_channel(rpdev, chinfo);
> +}
> +EXPORT_SYMBOL(rpmsg_create_channel);
> +
> +/**
> + * rpmsg_release_channel() - release a rpmsg channel
> + * using its name and address info.
> + * @rpdev: rpmsg driver
> + * @chinfo: channel_info to bind
> + *
> + * Returns a pointer to the new rpmsg device on success, or NULL on error.
> + */
> +int rpmsg_release_channel(struct rpmsg_device *rpdev,
> +			  struct rpmsg_channel_info *chinfo)
> +{
> +	if (WARN_ON(!rpdev) || !rpdev->ops->release_channel)
> +		return 0;
> +
> +	return rpdev->ops->release_channel(rpdev, chinfo);
> +}
> +EXPORT_SYMBOL(rpmsg_release_channel);
> +
>  /**
>   * rpmsg_create_ept() - create a new rpmsg_endpoint
>   * @rpdev: rpmsg channel device
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index 3fc83cd50e98..d5ab286d0e5e 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -20,6 +20,8 @@
>  
>  /**
>   * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
> + * @create_channel:	create backend-specific channel, optional
> + * @release_channel:	release backend-specific channel, optional
>   * @create_ept:		create backend-specific endpoint, required
>   * @announce_create:	announce presence of new channel, optional
>   * @announce_destroy:	announce destruction of channel, optional
> @@ -29,6 +31,11 @@
>   * advertise new channels implicitly by creating the endpoints.
>   */
>  struct rpmsg_device_ops {
> +	struct rpmsg_device *(*create_channel)(struct rpmsg_device *rpdev,
> +					     struct rpmsg_channel_info *chinfo);
> +	int (*release_channel)(struct rpmsg_device *rpdev,
> +			       struct rpmsg_channel_info *chinfo);
> +
>  	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
>  					    rpmsg_rx_cb_t cb, void *priv,
>  					    struct rpmsg_channel_info chinfo);
> @@ -75,6 +82,11 @@ int rpmsg_unregister_device(struct device *parent,
>  struct device *rpmsg_find_device(struct device *parent,
>  				 struct rpmsg_channel_info *chinfo);
>  
> +struct rpmsg_device *
> +	rpmsg_create_channel(struct rpmsg_device *rpdev,
> +			     struct rpmsg_channel_info *chinfo);
> +int rpmsg_release_channel(struct rpmsg_device *rpdev,
> +			  struct rpmsg_channel_info *chinfo);
>  /**
>   * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
>   * @rpdev:	prepared rpdev to be used for creating endpoints
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
