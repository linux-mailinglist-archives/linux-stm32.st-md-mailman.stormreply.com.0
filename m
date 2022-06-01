Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC7B53AC1B
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Jun 2022 19:42:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23B5DC03FC4;
	Wed,  1 Jun 2022 17:42:06 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B2B1C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jun 2022 17:42:04 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id a10so2691434pju.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Jun 2022 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tv+lrJqQ4Et9gRDXAG4uoZgL+FzMyJaBz4gkWA0oo5U=;
 b=CEBnpwn7U8OOk2f91B9RzYtl5plgtoA6dQd0KO6OZZqujXGWSQ0c8e3hqmG5vJKa4S
 23N7rY52Mu0KLNHSCkGA69MgZ/XrSpktd+3Hk9AeLccvgQdZiXb/JocKbvzGwaVv8c/O
 wUAAlO/432IEqXF2/0b4ZIZKaARt35imKrx4Cc9WBrE7MGVCINVDJQAq0atRb2V2ks8N
 viSSVCeuHE4vAtviTM49W9Sf/qaRiWp3o59fFCYgZyJdDN3riC0MaLRBwHh92FOzqKxC
 MkfoQ6s7N2UtBM7Fp5tDOmS/Di8e/0k2BB4Sc2XlXIdigGNchLDR22gV/bqcmZNJEd7T
 n6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tv+lrJqQ4Et9gRDXAG4uoZgL+FzMyJaBz4gkWA0oo5U=;
 b=zeujqFJn6r0RfbMx7Kz83H6/zFpzDtuBrwkxM177bgw8sHj4bnwk8KYtR4iTtGkn1g
 1PR6eMNjayWLgbFRV7QVcQSZt67OHY0wlVeTi48d1bW7YXi9knDyihUEKTQWP25rKvQb
 XjGnLRrxWa8iN2EuVARO+5LQ1YP7oYF4TT/qdwXZs3QHYVI3OqKOa9nZwxH/hOclZ5o4
 GGsQW6uuVnyjFzE68BAh4uq+KK1m5u/FybePmNtj8DD3w0aNkj6IEo1Wknf7nTj002gj
 HoLrPob7fEkvkbxq3aGU82HfEKbNTooTgQ2iygYuik77i8JHXcxbrz6cqtO1FZVuJvzX
 ytkA==
X-Gm-Message-State: AOAM533WCEsp21vlBagf1MuBaetoVWLc5CYvvgyYhOD+yScgRbQyXPmK
 sbj4RHFIPOVx1ckfOX1u9ts5sg==
X-Google-Smtp-Source: ABdhPJw2yoeUzjbSj9ybeuQTKhogIf8O8EKVnSQU7o4hWlgDt6lfiDzhSUwWuNKXeuDUnfNfGDALIg==
X-Received: by 2002:a17:90a:8b18:b0:1e0:b1cd:aa9a with SMTP id
 y24-20020a17090a8b1800b001e0b1cdaa9amr35619537pjn.103.1654105323224; 
 Wed, 01 Jun 2022 10:42:03 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 193-20020a6215ca000000b0050dc76281a4sm1782788pfv.126.2022.06.01.10.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 10:42:01 -0700 (PDT)
Date: Wed, 1 Jun 2022 11:41:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220601174159.GD531268@p14s>
References: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
 <20220406095446.1187968-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406095446.1187968-3-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH v5 2/4] remoteproc: core: Introduce
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

On Wed, Apr 06, 2022 at 11:54:44AM +0200, Arnaud Pouliquen wrote:
> The rproc structure contains a list of registered rproc_vdev structure.

This should be rproc_rvdev.

> To be able to move the management of the rproc_vdev structure in
> remoteproc_virtio.c (i.e rproc_rvdev_add_device and
> rproc_rvdev_remove_device functions), introduce the rproc_register_rvdev
> and rproc_unregister_rvdev functions.

The name of those functions doesn't match the content of the patch.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3a469220ac73..081bea39daf4 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -484,6 +484,18 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  	return 0;
>  }
>  
> +static void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> +{
> +	if (rvdev && rproc)
> +		list_add_tail(&rvdev->node, &rproc->rvdevs);
> +}
> +
> +static void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev)
> +		list_del(&rvdev->node);
> +}
> +
>  static struct rproc_vdev *
>  rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  {
> @@ -547,7 +559,7 @@ rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  			goto unwind_vring_allocations;
>  	}
>  
> -	list_add_tail(&rvdev->node, &rproc->rvdevs);
> +	rproc_add_rvdev(rproc, rvdev);
>  
>  	rvdev->subdev.start = rproc_vdev_do_start;
>  	rvdev->subdev.stop = rproc_vdev_do_stop;
> @@ -576,7 +588,7 @@ static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
>  	}
>  
>  	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	list_del(&rvdev->node);
> +	rproc_remove_rvdev(rvdev);

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

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
