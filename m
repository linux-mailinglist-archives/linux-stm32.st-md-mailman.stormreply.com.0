Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8D5F5766
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Oct 2022 17:26:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76B0DC63327;
	Wed,  5 Oct 2022 15:26:09 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2604C63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Oct 2022 15:26:08 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 x32-20020a17090a38a300b00209dced49cfso2100212pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Oct 2022 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=b2eDhIzvuJjsHv2/DwfAjBACGmEeoKasF0f+LJfWpy4=;
 b=yDIJ8ZRMEYVCQFO1ONUXGEjRWvVcL4ThiGTz4epVKemVgaY5GzauwMHGAPuPetOFZd
 1atCE/2CnumELCMAVeQRLc0q96EHO9X+08JgZNM1u4ryBBhLYR+W9J23gpfQ2PKMnxef
 0J6f1eCd0/a4j2CDQgTJn5zjH9mLBnQNb8aSYf7qPclJdqSABVWrvM1f5nA2LMtUtXFU
 svsrSdo0k7K6EK/uICxNBzkN26XLVDBzevv9Lo8h0ZkQkCnleoj3dypTWfA/aHApymbh
 ybz6EN8VmbxmVT4akpxKjIl2EQEmTr16EbO78zJW2+RXq3Z1qbqeDQjzfr+SvX7KK+rW
 jogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=b2eDhIzvuJjsHv2/DwfAjBACGmEeoKasF0f+LJfWpy4=;
 b=kk5BK3YPo9JNU57sj5iLlgxRqzy3OkP9ea6GQeeQT4m+6O/swDaW0dtcUoSXOWsOeL
 CYMchB2/7/yUlyaZ3ufxYobTS9viDghwku02etRBcbCB+IrYk27L0s/Gbb8ipl26NI9F
 Xonkb/YdzL8ni/aj/sgeM3dP2DNhL7kjtzGB+0Bx8uyAPuu6SpJAb6julT52TlPEYvh0
 8tIa3ajddrsvxnTLY2prbaygy+sWYfJaHALuexTBUfIwSktkL2VtgP9BXYVZ9JsyHdIn
 iTMUho8AdeH+rP1saUK+5hpb5dr0Hh4SpVEbNBmJ797Fp+OmtumQEdKl9P5Bd/h7DOTw
 BSug==
X-Gm-Message-State: ACrzQf1AlgLSJ6NxKwJT8Z0jLI0ewBB6xPc0XRLack+2GJH+xQurfdhC
 0OZ7vmDR1nkcryAcjFDUhwjB+w==
X-Google-Smtp-Source: AMsMyM6U1Tjop20XQFBtNuI8reRTz70L8Jz87X/3OM8EuLG/sMQ/s6TIjTbd9f/dOjM1BuBlaJx7AQ==
X-Received: by 2002:a17:902:b693:b0:178:5fa6:4b3 with SMTP id
 c19-20020a170902b69300b001785fa604b3mr32658463pls.63.1664983567257; 
 Wed, 05 Oct 2022 08:26:07 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 23-20020a17090a0f1700b001efa9e83927sm1249541pjy.51.2022.10.05.08.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 08:26:06 -0700 (PDT)
Date: Wed, 5 Oct 2022 09:26:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20221005152604.GA2666639@p14s>
References: <20221005081317.3411684-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005081317.3411684-1-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] remoteproc: virtio: Fix warning on
 bindings by removing the of_match_table
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

On Wed, Oct 05, 2022 at 10:13:17AM +0200, Arnaud Pouliquen wrote:
> The checkpatch tool complains that "virtio,rproc" is not documented.
> But it is not possible to probe the device "rproc-virtio" by declaring
> it in the device tree. So documenting it in the bindings does not make
> sense.
> This commit solves the checkpatch warning by suppressing the useless
> of_match_table.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> Updates vs previous revision:
> - replace the "of_platform.h" include by "platform_device.h",
> - replace "Fix-suggested-by" by "Suggested-by",
> - add Rob's Reviewed-by.
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index a29e3b8ff69c..0e95525c1158 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -13,8 +13,8 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/export.h>
> -#include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
> @@ -593,17 +593,11 @@ static int rproc_virtio_remove(struct platform_device *pdev)
>  }
>  
>  /* Platform driver */
> -static const struct of_device_id rproc_virtio_match[] = {
> -	{ .compatible = "virtio,rproc" },
> -	{},
> -};
> -
>  static struct platform_driver rproc_virtio_driver = {
>  	.probe		= rproc_virtio_probe,
>  	.remove		= rproc_virtio_remove,
>  	.driver		= {
>  		.name	= "rproc-virtio",
> -		.of_match_table	= rproc_virtio_match,

Applied.

Thanks,
Mathieu

>  	},
>  };
>  builtin_platform_driver(rproc_virtio_driver);
> -- 
> 2.24.3
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
