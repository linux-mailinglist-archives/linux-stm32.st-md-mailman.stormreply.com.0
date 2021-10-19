Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C13433DA5
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 19:39:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD7C1C5C857;
	Tue, 19 Oct 2021 17:39:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C84E7C5C854
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 17:39:20 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so424983pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 10:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aIh9saArreNJuwW89Ey0XiYCdKVw/+DI3nSpmQ+KnZk=;
 b=ac840SZ2tQBDysEKUu7JIgqu1DXb/RmqyWhcj5aO2bQsaec36NNyRrw7pYE264Aa5l
 ATGTgHvDix/PMVU1JKvrbhcYkr/KC0TuyK0mc0cZsv0vE8aS45RLJ7LeCGNTf2ZL5jHF
 CtNvMW1dAFALRT2gpeSywg6F+zzVhW27ths3n7cj1blOPf0uhWRHx8WQ46UcNTEYeJG5
 o93i0WIbyL1I799Q/TWI7/IdN8iBKZVJboon555BYJ70EVm9zaDXiwwzQ+4ypc7/9cBd
 MExoZJwoUrefvgA+q+ufCjpadLgSVqkmusnSlVWXff5wAxkYRN/G09drV2SwbBce4Mpf
 xvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aIh9saArreNJuwW89Ey0XiYCdKVw/+DI3nSpmQ+KnZk=;
 b=n6FpM+UQMyKjBHpnrQpe6uUPW9dZbkTmGiqII5acZSEOxc4aqnzYyYIaT60SveXnNG
 /iChFAoeuL2h+rNoLfbnb411U8P/CQgTlluwbAgXm9DHi63mPWFMeohXgrUsJBBH1p3i
 DdX3vfTAo/v4wYUHMGPErBf2zClZDsaBbKE7fTpepZjr7sv+d6nsRs2RDfmXIYjAY0ME
 3Vs0N32srMUckjvGHiOeQ2l+4Z3IxCqRey3x5TH9T8VJCoXPF2BXVOGiKy1nWvq5ugH/
 dOk44Vq6GV4+3cqwG5QiAz1gdPzKd6txSnlEfzxKJGkUuPY+/W0/kl88ITd4b+IoZr3D
 Qv4w==
X-Gm-Message-State: AOAM533e+eB6if2b4mt13cNNislPeXoyznqHXUDObmEQ45E/UdIgDoYp
 hAFea4mKBqwxvrTnkbOYHyh1qg==
X-Google-Smtp-Source: ABdhPJx6cYHvmTePVyoaUN9kahG9ENPoRxK6HbCGmsj8n9eioURUv101fiZoSUAt0tGA3cwa32k8cA==
X-Received: by 2002:a17:90a:414c:: with SMTP id
 m12mr1388141pjg.187.1634665159309; 
 Tue, 19 Oct 2021 10:39:19 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id d23sm3386554pjx.4.2021.10.19.10.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 10:39:17 -0700 (PDT)
Date: Tue, 19 Oct 2021 11:39:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211019173915.GA3340362@p14s>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-4-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh@kernel.org>,
 Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christoph Hellwig <hch@lst.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH 3/7] remoteproc: Remove vdev_to_rvdev
 and vdev_to_rproc from remoteproc API
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

Good morning,

On Fri, Oct 01, 2021 at 12:12:30PM +0200, Arnaud Pouliquen wrote:
> These both functions are only used by the remoteproc_virtio.

s/"These both functions"/"Both of these functions"

> There is no reason to expose them in the API.
> Move the functions in remoteproc_virtio.c
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 12 ++++++++++++
>  include/linux/remoteproc.h             | 12 ------------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 5e5a78b3243f..c9eecd2f9fb2 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -25,6 +25,18 @@
>  
>  #include "remoteproc_internal.h"
>  
> +static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
> +{
> +	return container_of(vdev->dev.parent, struct rproc_vdev, dev);
> +}
> +
> +static  struct rproc *vdev_to_rproc(struct virtio_device *vdev)
> +{
> +	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> +
> +	return rvdev->rproc;
> +}
> +
>  static int copy_dma_range_map(struct device *to, struct device *from)
>  {
>  	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 83c09ac36b13..e0600e1e5c17 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -684,18 +684,6 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
>  				      void *priv);
>  int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine);
>  
> -static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
> -{
> -	return container_of(vdev->dev.parent, struct rproc_vdev, dev);
> -}
> -
> -static inline struct rproc *vdev_to_rproc(struct virtio_device *vdev)
> -{
> -	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> -
> -	return rvdev->rproc;
> -}
> -
>  void rproc_add_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
>  
>  void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
