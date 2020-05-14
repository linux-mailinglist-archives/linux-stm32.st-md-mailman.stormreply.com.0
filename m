Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B0E1D262D
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 07:00:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96424C32EBF;
	Thu, 14 May 2020 05:00:49 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEF74C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 05:00:46 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x15so799885pfa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 22:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gRtb+ye+6N2jERJtNafzHVxmDwBVGiZa6FElJAmpzAg=;
 b=iTlKFnvLfFYMiRs/m3eZENaimKbVUuQZVgPWtxNuem+VijamM+3tXGhIT/7RFiZ1yb
 9hr9CA61VbhbBo3+o5Epa9c+28DXOGdsLDBWAuaJ7gYcFqfR9/zqGs47lEqwrE/wSRBZ
 04NAF0Z75+b+Y73uIRcl7N+gkdIXKuaLQX8PQhWal3RUGW+Ir/um6wqe3NanwiAk9jWA
 Phosz3081FLvsRMMOsZFP1Ne/gQiHo1dwSrMPAHKRdEK3ZeUdbsx7bPzSa/DoiLASZRa
 mgm/T2uJijxPTULXV0s3P0weaUSJIbptAliKmiiicCGPxvfM+eqja2dH639Xr9a1N/E6
 Wq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gRtb+ye+6N2jERJtNafzHVxmDwBVGiZa6FElJAmpzAg=;
 b=q9hP+9oDW8PKd24nQ0BdevrMsD2c+oILo9yG6+vpTzZj2MAFpYJUguvu1lKukTUQFr
 yLdyIcfKoH1mUAPLhndnoAqjd3YHINUHF8F/UVRbqo5GdWaurNQbzLHNGmjKtzpJoqbf
 YT3YK/x+sjhoZTolUckTuC8luQ+CEtuzKu8AhOR8Gzsq6YmpJ1USOru/RfzNiZq/ViZm
 6Rld5lp1lSH0Ql7JwERt4uTYkBLdowVq58834Cj4uVQAJ2loKN5rO03uRutpGpDW1OI6
 sd+lH84DhClsLv+bB8kHgFbJdhGSA670NSBeDeNgcZmzA8SU0lJtXNk4VjyIYD9BZ5Ue
 xXWQ==
X-Gm-Message-State: AOAM5315+kKIXTiDtZhckYhadIw0TpEIvwGF5CwlTIotJE0Hjfz/Adsl
 RLoKvaxB2fkPbuWYUG+QrsQVoA==
X-Google-Smtp-Source: ABdhPJyrnJxz1I6U4kp3zNWz12oevEgN0OyqU9jHUbD2BpMkoM8FG83os68vLDY7dUIJhvaavhyMxA==
X-Received: by 2002:a65:6799:: with SMTP id e25mr2609901pgr.9.1589432445068;
 Wed, 13 May 2020 22:00:45 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id a15sm16664612pju.3.2020.05.13.22.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 22:00:44 -0700 (PDT)
Date: Wed, 13 May 2020 21:59:14 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <20200514045914.GI16107@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-4-mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 03/12] remoteproc: stm32: Decouple
 rproc from DT parsing
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

On Fri 24 Apr 13:24 PDT 2020, Mathieu Poirier wrote:

> Remove the remote processor from the process of parsing the device tree
> since (1) there is no correlation between them and (2) to use the
> information that was gathered to make a decision on whether to
> synchronise with the M4 or not.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 1ac90adba9b1..57a426ea620b 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -538,12 +538,11 @@ static int stm32_rproc_get_syscon(struct device_node *np, const char *prop,
>  	return err;
>  }
>  
> -static int stm32_rproc_parse_dt(struct platform_device *pdev)
> +static int stm32_rproc_parse_dt(struct platform_device *pdev,
> +				struct stm32_rproc *ddata, bool *auto_boot)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> -	struct rproc *rproc = platform_get_drvdata(pdev);
> -	struct stm32_rproc *ddata = rproc->priv;
>  	struct stm32_syscon tz;
>  	unsigned int tzen;
>  	int err, irq;
> @@ -589,7 +588,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
>  
>  	err = regmap_read(tz.map, tz.reg, &tzen);
>  	if (err) {
> -		dev_err(&rproc->dev, "failed to read tzen\n");
> +		dev_err(dev, "failed to read tzen\n");
>  		return err;
>  	}
>  	ddata->secured_soc = tzen & tz.mask;
> @@ -605,7 +604,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
>  	if (err)
>  		dev_info(dev, "failed to get pdds\n");
>  
> -	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
> +	*auto_boot = of_property_read_bool(np, "st,auto-boot");
>  
>  	return stm32_rproc_of_memory_translations(pdev, ddata);
>  }
> @@ -616,6 +615,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
>  	struct rproc *rproc;
> +	bool auto_boot = false;
>  	int ret;
>  
>  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> @@ -626,9 +626,16 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (!rproc)
>  		return -ENOMEM;
>  
> +	ddata = rproc->priv;
> +
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
> +	ret = stm32_rproc_parse_dt(pdev, ddata, &auto_boot);
> +	if (ret)
> +		goto free_rproc;
> +
> +	rproc->auto_boot = auto_boot;
>  	rproc->has_iommu = false;
> -	ddata = rproc->priv;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
>  	if (!ddata->workqueue) {
>  		dev_err(dev, "cannot create workqueue\n");
> @@ -638,13 +645,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, rproc);
>  
> -	ret = stm32_rproc_parse_dt(pdev);
> -	if (ret)
> -		goto free_wkq;
> -
>  	ret = stm32_rproc_request_mbox(rproc);
>  	if (ret)
> -		goto free_rproc;
> +		goto free_wkq;
>  
>  	ret = rproc_add(rproc);
>  	if (ret)
> -- 
> 2.20.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
