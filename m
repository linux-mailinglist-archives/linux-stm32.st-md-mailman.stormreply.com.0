Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BB1203EC7
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2020 20:08:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72B07C36B0C;
	Mon, 22 Jun 2020 18:08:34 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EEBAC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 18:08:32 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id a21so16450369oic.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 11:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jm6bjK+DZcG0T8JiyiA68BtynZx883K3XjW2OLQiO2A=;
 b=bftkEq2a51p+DW68Q2XCLk5dmflAD5WMjTxB6mlUfr5UbyRvEI+GIOHsciMkO2Vp9l
 cb9W4q2OsKVrxVpjj0yoEjGi8S9dPNQ8x9RvbvEZVswLS/lpuRiz9ERT/vZDta/heeQR
 /5u9toSK/cSkeiwGAdW+NDWN/X9HasreMvD75VZNZCiUL/XVffLbdvf44KiopBTZjBh1
 EHSAoJjsoTfyyypZkvahGppgkuQJc4DNB1kgmW8S9BhFNquV+95N4KTkVO2p4nCsOyJJ
 kVTI41Denqsbm5hzgxC2TMehhvNedd/a8NQVYIkI29R/sBHyI1ldstkoJ3reSRwdB/jU
 74qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jm6bjK+DZcG0T8JiyiA68BtynZx883K3XjW2OLQiO2A=;
 b=sdrNXEAt/dD1t5mMePR6OXuWf1Xv6HcSrIRoypeCrpECCFZCqT/QYeQXsVSYed+Sa5
 3z68P0ANASXbX5+CjKYCPxrAszmeeyS1pZ+SFyX2HVPXJ0j7P/NWYyAPg+FZL5cqpsKN
 aC3GEkK1vdQjUP2rVTI6exXvBmNvWyShmB+6d3Fwf1MC76deifQoOIloZcC/XbQRQjHM
 wRq88/SrO/3h4iEdvg0BJ7W4Oll27dEaIU+Vx+IC9svOBnHafOigDPCYKfAhpAN8jmHf
 nN3DuwcwoQazQ3JbK7Z5eZd6WJ2332cdFyUhDooO/8qEJvhTltFss9GHBh3P/EdbSo9z
 ZhxA==
X-Gm-Message-State: AOAM532gdWDD7izW8YVUZiA8y06IHV861YKIKcvl/utniP02KJxYCcCs
 O9+w+mSJWnByXQzB5ZsLqZ96+A==
X-Google-Smtp-Source: ABdhPJyK93YJhfPtxJTdAiMfzN0O99PZVEz67jcgBt6vGBzhF0DwyY6f+HuyEeSZcDAH+We/1ZoeWA==
X-Received: by 2002:aca:c34b:: with SMTP id t72mr13773010oif.34.1592849310661; 
 Mon, 22 Jun 2020 11:08:30 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id t1sm3556113oot.36.2020.06.22.11.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 11:08:29 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:05:45 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <20200622180545.GL149351@builder.lan>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
 <20200601175552.22286-7-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601175552.22286-7-mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 06/11] remoteproc: stm32: Properly set
 co-processor state when attaching
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

On Mon 01 Jun 10:55 PDT 2020, Mathieu Poirier wrote:

> Introduce the required mechanic to set the state of the M4 in order
> to properly deal with scenarios where the co-processor has been
> stated by another entity.
> 
> Mainly based on the work published by Arnaud Pouliquen [1].
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 80fd8fd831da..2154c8b90a2a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -38,6 +38,13 @@
>  #define STM32_MBX_VQ1_ID	1
>  #define STM32_MBX_SHUTDOWN	"shutdown"
>  
> +#define M4_STATE_OFF		0
> +#define M4_STATE_INI		1
> +#define M4_STATE_CRUN		2
> +#define M4_STATE_CSTOP		3
> +#define M4_STATE_STANDBY	4
> +#define M4_STATE_CRASH		5
> +
>  struct stm32_syscon {
>  	struct regmap *map;
>  	u32 reg;
> @@ -635,12 +642,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
> +				     unsigned int *state)
> +{
> +	/* See stm32_rproc_parse_dt() */
> +	if (!ddata->m4_state.map) {
> +		/*
> +		 * We couldn't get the coprocessor's state, assume
> +		 * it is not running.
> +		 */
> +		state = M4_STATE_OFF;
> +		return 0;
> +	}
> +
> +	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
> +}
> +
> +
>  static int stm32_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
>  	struct rproc *rproc;
> +	unsigned int state;
>  	int ret;
>  
>  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> @@ -663,6 +688,13 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> +	ret = stm32_rproc_get_m4_status(ddata, &state);
> +	if (ret)
> +		goto free_rproc;
> +
> +	if (state == M4_STATE_CRUN)

I presume this won't ever be e.g. M4_STATE_CRASH or M4_STATE_STANDBY?

Regards,
Bjorn

> +		rproc->state = RPROC_DETACHED;
> +
>  	rproc->has_iommu = false;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
>  	if (!ddata->workqueue) {
> -- 
> 2.20.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
