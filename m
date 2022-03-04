Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C72364CDCC3
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 19:39:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BFA8C5F1EE;
	Fri,  4 Mar 2022 18:39:12 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5914C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 18:39:10 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 27so8200472pgk.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Mar 2022 10:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BknUbfqpfPqnNnTE+wwFbcKTHVg6JII8p6R6OPkErWY=;
 b=ZCkewWppykr0MiRvRFbknZoyCTjtESq7kkoPzMl6Is5pYS9yZsBRbCLVerWeLLwgb8
 i0vuPZ1TS56CC1gHV7BkRfXmnkzGAGl3TDV4WaCiryLP2O+al2vGyBnpYmWxrzXY1Vo1
 NO1ecgjZ3SbgQidh6hWMWb8U1M3/gXyKTQ5aiyJzv4Vq49LqQO4kElvdd4polzp76+Oj
 3N6S2EFV0C7a9pwyyH0ugdpapME2bQajDVRL/pTKS5ufx9d7gEGyHMvcnxsJr/SfH3tm
 mX6JGyDPp0F/i1x1/knZh0E2h1p2EdN/XG+9PLjJUQKszIDxi/NldgeorOzCC3rZNtYO
 6VXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BknUbfqpfPqnNnTE+wwFbcKTHVg6JII8p6R6OPkErWY=;
 b=WHOZ1mcgNEdCMd6U6zSY+X0+kPZb1NG7Cl1g0mf+MaK/BbGr8KhXPC/5/N9LJgU7jV
 mt+QFQ+Y4f1ArUVgW5zMhsF0SYZHxkEJZoisLTf67BuUSmOg+7ENZVCuma9/48jhX614
 IX1zIZHtXluUhd9YTDzESJBMMtORjeHgg5OPuoJSc4Kc3wbs2FMxSrkvKyvx8RmZ7WAP
 SJuC5MSkCkYXhHHNIaM1CxXmpRJpA1q7j6rcBHi00gAymQyZdyOVBwskikBUzvMXeZ7N
 Bz1hcQoBYUY6b8DlIvKmr8o6VVqNWnVjpwRHM0SPTom8UFYvp+d+rMRq0s1Xma8lC6A+
 57iw==
X-Gm-Message-State: AOAM532pVHZdM6kAN8Tkmxu4lmgSwHfUTdBukKHPZrgti74dQBL3PS9U
 AKVNgF6j/m4REHG6SoKcnkIDTQ==
X-Google-Smtp-Source: ABdhPJwA3j+lTHK7E6P90nb3FKhZ6vQBDbdWWZuTY3m0lJH1/Lfqf6QPxfOgSxCeb6S1qI9lk5rcaw==
X-Received: by 2002:a63:3487:0:b0:373:4c14:59b1 with SMTP id
 b129-20020a633487000000b003734c1459b1mr35543410pga.68.1646419149402; 
 Fri, 04 Mar 2022 10:39:09 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a056a0014d000b004e12fd48047sm6887711pfu.35.2022.03.04.10.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 10:39:07 -0800 (PST)
Date: Fri, 4 Mar 2022 11:39:05 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220304183905.GB1660165@p14s>
References: <20220126162405.1131323-1-arnaud.pouliquen@foss.st.com>
 <20220126162405.1131323-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126162405.1131323-3-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH v3 2/4] remoteproc: core: Introduce
 rproc_register_rvdev function
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

On Wed, Jan 26, 2022 at 05:24:03PM +0100, Arnaud Pouliquen wrote:
> The rproc structure contains a list of registered rproc_vdev structure.
> To be able to move the management of the rproc_vdev structure in
> remoteproc_virtio.c (i.e rproc_rvdev_add_device and
> rproc_rvdev_remove_device functions), introduce the rproc_register_rvdev
> and rproc_unregister_rvdev functions.
> These functions will be exported by the remoteproc_core.c.

This last sentence is very confusing... I kept an eye out for the EXPORT_SYMBOL()
tag but never found it.  Please remove.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 83ff44a6a4db..7a091f860c82 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -491,6 +491,18 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  	return 0;
>  }
>  
> +static void rproc_register_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> +{
> +	if (rvdev && rproc)
> +		list_add_tail(&rvdev->node, &rproc->rvdevs);
> +}

I would call those rproc_add_rvdev() and rproc_remove_rvdev() to follow in the
footsteps of rproc_add_subdev() and rproc_remove_subdev().

> +
> +static void rproc_unregister_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev)
> +		list_del(&rvdev->node);
> +}
> +
>  static struct rproc_vdev *
>  rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  {
> @@ -554,7 +566,7 @@ rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  			goto unwind_vring_allocations;
>  	}
>  
> -	list_add_tail(&rvdev->node, &rproc->rvdevs);
> +	rproc_register_rvdev(rproc, rvdev);
>  
>  	rvdev->subdev.start = rproc_vdev_do_start;
>  	rvdev->subdev.stop = rproc_vdev_do_stop;
> @@ -583,7 +595,7 @@ static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
>  	}
>  
>  	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	list_del(&rvdev->node);
> +	rproc_unregister_rvdev(rvdev);
>  	device_unregister(&rvdev->dev);
>  }
>  
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
