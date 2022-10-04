Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3145F45BC
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Oct 2022 16:39:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9009C6334A;
	Tue,  4 Oct 2022 14:39:56 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8125C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Oct 2022 14:39:55 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id n83so14594598oif.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Oct 2022 07:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=C9mbynAWhlZLPcnxIkEkUheYSWevkrIWO3ImSHgFO3g=;
 b=lYOfleTtTYL5KjEHr2GlmWCtH3xON4AXsTQorBrLpRDRn9Z1Y3ICZwnPnMQ3GEG3kP
 ZvKLFcLkgJnacDXXbpkn6APqEA9g4CeJyo1i35YCIweA77x04/GKBygrScqX82EMEzUu
 WTJngHZMWa0+u4i60G68aNQoqb/qWwv/ByVBWGvX8aRIMxfTdaoF/jhMF/w9k0UMNGjn
 9lJkSiWVeGj9fLyZdCJ9wVRnrGeaFFQIUNTHAwGXe1gdjpvoxGIb18F+iFrtW6r8WnM4
 OoRmrZVaIITy9Uni6VdwoIm2NGCkWq4gpW/JUREv25ew6Xd1yFZXU8h0tOGcFAVZXMvj
 sKmw==
X-Gm-Message-State: ACrzQf1yp4EJg3yOc4NPvPZqBFnDe2X7+y2Z4qA7INtGcbrRnH/ydMVi
 8MoM0+1ABWzaoXwD22AaJQ==
X-Google-Smtp-Source: AMsMyM4dYcbq8JBg1woswaO8pn7/MT/46qINQGQkx4GKIMhjqDJZvKjz8PjYZXzhbcBzLHD36o8Bgw==
X-Received: by 2002:a05:6808:23c5:b0:34f:bba7:2949 with SMTP id
 bq5-20020a05680823c500b0034fbba72949mr34434oib.101.1664894394472; 
 Tue, 04 Oct 2022 07:39:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s37-20020a0568302aa500b00636a8dafdc9sm3059486otu.2.2022.10.04.07.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:39:54 -0700 (PDT)
Received: (nullmailer pid 1480570 invoked by uid 1000);
 Tue, 04 Oct 2022 14:39:54 -0000
Date: Tue, 4 Oct 2022 09:39:54 -0500
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20221004143954.GA1479221-robh@kernel.org>
References: <20220921135044.917140-1-arnaud.pouliquen@foss.st.com>
 <20220921135044.917140-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220921135044.917140-5-arnaud.pouliquen@foss.st.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-stm32] [PATCH v9 4/4] remoteproc: virtio: Create
 platform device for the remoteproc_virtio
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

On Wed, Sep 21, 2022 at 03:50:44PM +0200, Arnaud Pouliquen wrote:
> Define a platform driver to manage the remoteproc virtio device as
> a platform devices.
> 
> The platform device allows to pass rproc_vdev_data platform data to
> specify properties that are stored in the rproc_vdev structure.
> 
> Such approach will allow to preserve legacy remoteproc virtio device
> creation but also to probe the device using device tree mechanism.
> 
> remoteproc_virtio.c update:
>   - Add rproc_virtio_driver platform driver. The probe ops replaces
>     the rproc_rvdev_add_device function.
>   - All reference to the rvdev->dev has been updated to rvdev-pdev->dev.
>   - rproc_rvdev_release is removed as associated to the rvdev device.
>   - The use of rvdev->kref counter is replaced by get/put_device on the
>     remoteproc virtio platform device.
>   - The vdev device no longer increments rproc device counter.
>     increment/decrement is done in rproc_virtio_probe/rproc_virtio_remove
>     function in charge of the vrings allocation/free.
> 
> remoteproc_core.c update:
>   Migrate from the rvdev device to the rvdev platform device.
>   From this patch, when a vdev resource is found in the resource table
>   the remoteproc core register a platform device.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c     |  12 +-
>  drivers/remoteproc/remoteproc_internal.h |   2 -
>  drivers/remoteproc/remoteproc_virtio.c   | 143 ++++++++++++-----------
>  include/linux/remoteproc.h               |   6 +-
>  4 files changed, 82 insertions(+), 81 deletions(-)

[...]

> +/* Platform driver */
> +static const struct of_device_id rproc_virtio_match[] = {
> +	{ .compatible = "virtio,rproc" },

This is not documented. Add a binding schema if you need DT support.

> +	{},
> +};
> +
> +static struct platform_driver rproc_virtio_driver = {
> +	.probe		= rproc_virtio_probe,
> +	.remove		= rproc_virtio_remove,
> +	.driver		= {
> +		.name	= "rproc-virtio",
> +		.of_match_table	= rproc_virtio_match,
> +	},
> +};
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
