Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5CB79EE35
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Sep 2023 18:24:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 615ACC6B46F;
	Wed, 13 Sep 2023 16:24:35 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FB83C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Sep 2023 16:24:34 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-269304c135aso6164a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Sep 2023 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694622273; x=1695227073;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T8zYJ0RCDSzCvH0QmeVklyy3iTRroJs+iiHGO8/+f8I=;
 b=ATE81iu177Uq/2fPRR9LnnqQFscbXNyIV04SJy1gw4ahSZ2vcXt7IbIOp3Yjp3bs6q
 f6AyTDvtSPIqPlsfdXNxB8ijkuqWnGRjD+Cftw5nn+2zodD/amMsu2GghkR5o9mdhEqm
 J3yf4L1qYNMbEAOqg/tZKI/vEk9td8KS5cykC1F4ZZIpzqMKB9TMA/0Tisxh4VS0d0mJ
 7eJJV1dpFU9SbVkUf/pwIZ8lAH7GB1jFLkdpeATZGqMnhxGf/fnqZAVNJk+GxBM6/Lod
 7GuorTAiXB6aIogL+hiFGTMkfkqWUTORxlYG8sPJKOf6fNfVqzopvQgY4gF4kSix2Qsm
 9gjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694622273; x=1695227073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8zYJ0RCDSzCvH0QmeVklyy3iTRroJs+iiHGO8/+f8I=;
 b=S1G2aFmNKvzzCzLK5zDUJIhUIjyNGLIU98IWFdTyKD2x9Z5GOKTaSXZpFx1u6me+/k
 0Ne+f1Vstw7ZGUvH2F7Ul6Or6mhMk3jq9FPttBJq6+5T8teRQ1r1Ma/6Xf7xs75EdGtu
 PNvKBvwduA8c/ohVgcp+AMLj0CL7bm5BSR1zX8wtiw047Jta2Ep+EFkYxisZLv5pfom6
 ncgiu9Oa5T3EbJVmMtIZq2sPPXgpaHwX3U0DS17QFYEvdbRFOkoInyhXsQBU3n9z0VIW
 MgF/xm7B5RHs7GgZtzbi9kW4TdKlFFfDPGKTO1pb8ZDGmRyoe2lHSzCHFZZqvv5aN2tk
 p97w==
X-Gm-Message-State: AOJu0Yy+V53dLQ0q8GKoOOxV6HL/TwO29h5wlXUr4J57B/Ys9XYVCQjt
 NWqne8h3DqodQtXU8DZZWtEqRg==
X-Google-Smtp-Source: AGHT+IHWgvdtB+C/HoVawZpYur0vnXtpwb+tKQOBHfzGcJms7pMWVUlPNPLiwp+O2MlPn4j6G7TlYg==
X-Received: by 2002:a17:90b:4c4f:b0:268:1068:4464 with SMTP id
 np15-20020a17090b4c4f00b0026810684464mr2548211pjb.30.1694622272676; 
 Wed, 13 Sep 2023 09:24:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d880:f5d9:a2c5:d083])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b002680ef05c40sm1668280pjb.55.2023.09.13.09.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 09:24:32 -0700 (PDT)
Date: Wed, 13 Sep 2023 10:24:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Chen Jiahao <chenjiahao16@huawei.com>
Message-ID: <ZQHiPUYYLNwJ/rz1@p14s>
References: <20230817083336.404635-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817083336.404635-1-chenjiahao16@huawei.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next v2] remoteproc: stm32: Clean up
 redundant dev_err_probe()
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

On Thu, Aug 17, 2023 at 04:33:36PM +0800, Chen Jiahao wrote:
> Referring to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant. Removing outside dev_err_probe() to
> clean it up.
> 
> Besides, switch to use platform_get_irq_optional() since the irq
> is optional here.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 98234b44f038..1f53c672c66b 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -712,9 +712,9 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  	unsigned int tzen;
>  	int err, irq;
>  
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq == -EPROBE_DEFER)
> -		return dev_err_probe(dev, irq, "failed to get interrupt\n");
> +		return irq;
>  
>  	if (irq > 0) {
>  		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
