Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EFD567287
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jul 2022 17:26:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ACA9C640F7;
	Tue,  5 Jul 2022 15:26:16 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8941AC640F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jul 2022 15:26:14 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id e132so11672092pgc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Jul 2022 08:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RQfmpcsha3ArE/QFeVZl2sZJZkzc1FloBr65IG86g+E=;
 b=atnthrEw5hwVwghdYpuhl9GEciSOFtsb2uiMqoaI2NcdG+7stm7xHzu+tEwbUZDrOn
 u9ihOo9wByMur3+CaBV/HU9gf3MWn+HRfHzImOZji7GAsmxHpbp6z3XsTvsbQNs04uUd
 qi7Mapd7u6CpKJBuYpzZA5epaXb+9tJEg3TtflxGhA1LXrkBA59r+tSLY+CyEMbDQu8D
 zhn4M449/JZk3SB+1REN54IMIYo4LXwVG2JWzk4sMPfGyYkLGPdBBNe0HdsTg4686SXA
 XAE33w31i+8NnWnNvJqFQKZMTYVTEQAzD7DLr9f/tqGf79HKZdkUpfQZVrkbKrXjBAFR
 OKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RQfmpcsha3ArE/QFeVZl2sZJZkzc1FloBr65IG86g+E=;
 b=SaLYs8hTbLyuf2r+8ZlD1zcwfmijaUsXH71AYOKATl4T752pwEH2FZ5QuZl3E2WD0z
 96IF7pQnw8ERVr36jAnR6M79k3yFosS2s0bNzLhQiFgD8FuV270ZiogXtgZWKhQmfyz4
 GKu1TtGUf5ImxK+bf+TYrH5ENQ9Osv8ZduqCiDOZpHqUt+K2zNUUeDiOMGIYzJ9uIqnb
 ikLaVKWs7OajD4CK8KH6Tz9HI0UthowCAa8oYSDXNMcx6WI/h1dVJoF81n//RO5yUK3v
 N5YksSmgv8WuZCbc26/s0zaEobCEzUGqgBw5AzH2ckYX6sOSu9pMC7ivEPO2ptl391aW
 pmQg==
X-Gm-Message-State: AJIora8NTRtRC36yvgeh6nsCkftlsIoD93aIh4JAXPmYBlnoMVHD7jAZ
 0CjrTSj1y7c1QcC1R3a1TduZ1A==
X-Google-Smtp-Source: AGRyM1sLgNJQQUYM9sVYRJO0xAMHac3MF3u/i7OfFyuN1PluSk9g6snzjjMN0mcMZ06FwdM3qg0SaQ==
X-Received: by 2002:a63:3142:0:b0:40d:3fd3:53b5 with SMTP id
 x63-20020a633142000000b0040d3fd353b5mr30531275pgx.416.1657034773089; 
 Tue, 05 Jul 2022 08:26:13 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170903228800b0016b8746132esm10065693plh.105.2022.07.05.08.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 08:26:11 -0700 (PDT)
Date: Tue, 5 Jul 2022 09:26:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220705152609.GA2440144@p14s>
References: <20220603163158.612513-1-arnaud.pouliquen@foss.st.com>
 <20220603163158.612513-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603163158.612513-3-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 2/4] remoteproc: core: Introduce
 rproc_add_rvdev function
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

On Fri, Jun 03, 2022 at 06:31:56PM +0200, Arnaud Pouliquen wrote:
> The rproc structure contains a list of registered rproc_vdev structure.
> To be able to move the management of the rproc_vdev structure in
> remoteproc_virtio.c (i.e rproc_rvdev_add_device and
> rproc_rvdev_remove_device functions), introduce the rproc_add_rvdev

Function rproc_rvdev_remove_device() no longer exists and shouldn't be part of
this changelog.

> and rproc_remove_rvdev functions.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> Updates vs previous revision (based on Mathieu Poirier's comments):
> - Fix function name in commit message and add Mathieu's Reviewed-by.
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c438c32f7f0d..86147efc0aad 100644
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
> @@ -577,7 +589,7 @@ void rproc_vdev_release(struct kref *ref)
>  	}
>  
>  	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	list_del(&rvdev->node);
> +	rproc_remove_rvdev(rvdev);
>  	device_unregister(&rvdev->dev);
>  }
>  
> -- 
> 2.24.3
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
