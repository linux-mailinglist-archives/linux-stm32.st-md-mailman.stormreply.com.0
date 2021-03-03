Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2AA32B9FA
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 19:43:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A8B1C57B62;
	Wed,  3 Mar 2021 18:43:52 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 644D7C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 18:43:49 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id s23so4925106pji.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 10:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gVzR7oLstl6ac4ZTkA4CIGL1WR32C+kvWFg+bT72InI=;
 b=Kdp0z6TouC9vsp6Gaa4T0X4l/lsXsHfBSgHsbjgBgBPnZs72XvLOn3wMnlX2wWvV+U
 zAMijtl3Db+skGKokSbjFctHPeDghD+JPckIzTRM+Fx2LFOFfIymQelQrxwLgZlOYD4j
 YO2yBXWtCdBIUxFcBE1BbMM/MVUOP60rUwUdqaOe9MTiaIxQZBVKN3o3iJyV5pEm3h1U
 pz+M9M2KJbAiQoZiDGGSSqkcchEre8O5f/3u2SuaFDxXZBbBV4J74E4O05bgZTa54tad
 9oD8BVbYvPaWNc7HCsQkWiYbEST7gerlhWe9ONUT1GMXJcWy7IjXVQfVNn3IHTPjp0rS
 lpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gVzR7oLstl6ac4ZTkA4CIGL1WR32C+kvWFg+bT72InI=;
 b=eqmdiwLVRGwZ8jU477EfsJzDAAZcBghA2cVdAgUAmkHIGbIO2s50PIVTsOe/y1pf46
 urhzzjFGqeK43qTXyPbPdM+5mE3XJxVsvxcadyI4VFS0Mlbu7WPkUtdeMVSzo3Gl5lDT
 xTcyEsxzudKAfmdURR5MmhhogvYW9pWtV8HQrHe1Ni77fvRtxuKGuCezq9Al5ZJQ2ml4
 48DVBBdyAgSYKTroxL3xR91YfVEIPFa0iZFcCxHo+LBdh6NmCxvptkEQp7wEx82MzZdw
 k8Lfq0UMa5Tg+tTXhkWWNpQX+b3ZoZYvdkIO4r7fVLmEoCQ9yStUn3YECS2vnqNINtIH
 GKdA==
X-Gm-Message-State: AOAM530y5S4ODKh2d80DuIQkZzhBEb98fEC5Gw17zHT//2UX7qPNGQwX
 qbW3cg8lSxH2vja2+3hvDs2dvw==
X-Google-Smtp-Source: ABdhPJyaZX7NAFW2wCjv1k35xfC/hJogQ35MtOZEOH1TxdzZzw44BBaFYPLSKZlYUZq4CWNEHQPUwQ==
X-Received: by 2002:a17:90a:4882:: with SMTP id b2mr474911pjh.69.1614797028306; 
 Wed, 03 Mar 2021 10:43:48 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id v126sm23944372pfv.163.2021.03.03.10.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:43:47 -0800 (PST)
Date: Wed, 3 Mar 2021 11:43:45 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210303184345.GD3817330@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-12-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-12-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 11/16] rpmsg: virtio: register the
	rpmsg_ctrl device
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

On Fri, Feb 19, 2021 at 12:14:56PM +0100, Arnaud Pouliquen wrote:
> Instantiate the rpmsg_ioctl device on virtio RPMsg bus creation.

s/rpmsg_ioctl/rpmsg_ctrl

Now I understand what you meant in patch 05.

> This provides the possibility to expose the RPMSG_CREATE_EPT_IOCTL
> to create RPMsg chdev endpoints.

You mean RPMSG device endpoints, i.e rpmsg_eptdev?  If so I think it should be
added to the changelog.  Otherwiser someone could be tempted to look for "chdev"
and find anything but a rpmsg_eptdev.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> V5:
> Fix compilation issue
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 57 +++++++++++++++++++++++++++++---
>  1 file changed, 52 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index e87d4cf926eb..2e6b34084012 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -813,14 +813,52 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
>  	wake_up_interruptible(&vrp->sendq);
>  }
>  
> +static struct rpmsg_device *rpmsg_virtio_add_ctrl_dev(struct virtio_device *vdev)
> +{
> +	struct virtproc_info *vrp = vdev->priv;
> +	struct virtio_rpmsg_channel *vch;
> +	struct rpmsg_device *rpdev_ctrl;
> +	int err = 0;
> +
> +	vch = kzalloc(sizeof(*vch), GFP_KERNEL);
> +	if (!vch)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/* Link the channel to the vrp */
> +	vch->vrp = vrp;
> +
> +	/* Assign public information to the rpmsg_device */
> +	rpdev_ctrl = &vch->rpdev;
> +	rpdev_ctrl->ops = &virtio_rpmsg_ops;
> +
> +	rpdev_ctrl->dev.parent = &vrp->vdev->dev;
> +	rpdev_ctrl->dev.release = virtio_rpmsg_release_device;
> +	rpdev_ctrl->little_endian = virtio_is_little_endian(vrp->vdev);
> +
> +	err = rpmsg_ctrl_register_device(rpdev_ctrl);
> +	if (err) {
> +		kfree(vch);
> +		return ERR_PTR(err);
> +	}
> +
> +	return rpdev_ctrl;
> +}
> +
> +static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
> +{
> +	if (!rpdev_ctrl)
> +		return;
> +	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
> +}
> +
>  static int rpmsg_probe(struct virtio_device *vdev)
>  {
>  	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
>  	static const char * const names[] = { "input", "output" };
>  	struct virtqueue *vqs[2];
>  	struct virtproc_info *vrp;
> -	struct virtio_rpmsg_channel *vch;
> -	struct rpmsg_device *rpdev_ns;
> +	struct virtio_rpmsg_channel *vch = NULL;
> +	struct rpmsg_device *rpdev_ns = NULL, *rpdev_ctrl;

As far as I can tell @rpdev_ns doesn't have to be initialized.

>  	void *bufs_va;
>  	int err = 0, i;
>  	size_t total_buf_space;
> @@ -894,12 +932,18 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  	vdev->priv = vrp;
>  
> +	rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
> +	if (IS_ERR(rpdev_ctrl)) {
> +		err = PTR_ERR(rpdev_ctrl);
> +		goto free_coherent;
> +	}
> +
>  	/* if supported by the remote processor, enable the name service */
>  	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
>  		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
>  		if (!vch) {
>  			err = -ENOMEM;
> -			goto free_coherent;
> +			goto free_ctrldev;
>  		}
>  
>  		/* Link the channel to our vrp */
> @@ -915,7 +959,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  		err = rpmsg_ns_register_device(rpdev_ns);
>  		if (err)
> -			goto free_coherent;
> +			goto free_vch;
>  	}
>  
>  	/*
> @@ -939,8 +983,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  	return 0;
>  
> -free_coherent:
> +free_vch:
>  	kfree(vch);
> +free_ctrldev:
> +	rpmsg_virtio_del_ctrl_dev(rpdev_ctrl);
> +free_coherent:
>  	dma_free_coherent(vdev->dev.parent, total_buf_space,
>  			  bufs_va, vrp->bufs_dma);
>  vqs_del:
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
