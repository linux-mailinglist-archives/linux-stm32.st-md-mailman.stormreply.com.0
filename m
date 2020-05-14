Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F47C1D2667
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 07:05:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED57FC3F930;
	Thu, 14 May 2020 05:05:08 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA65C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 05:05:06 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id l73so2435783pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 22:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tj3wTZtbDhnHZV3JGD+uPMkyVs4DjgIgPsF9FB8nJ8k=;
 b=Es7gB+V2iRrBdGZENlfFP7ZPj71j6sUTsS8b5RJjQMyycpeN/dRq6+h1KC46rIh+dG
 e+y1nzHg3jqoLQh7i8c5I4c9EYPm60CBZJrrgjhCe2uf7IU1sulmF1wC1vnocmblc9Tl
 llsaiwqDsP0oYe1Rus7kOj4t2oH3xU3fVf2P3bU5JdHVmu0y0qBPea8bJhn/p14vdYNK
 yBxV1rVd/BEV1c2WW0RVMFcX92t/U5FnflbXkSTm0Q35KHD/6iqB7pVnOGvM8n9UJpGc
 +G1BKArwMEdLVLpJHsocK6RDgotJXXtlrWu/t2mFUIrTt90g9axtbXaRVvbFAZz9l5ye
 X7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tj3wTZtbDhnHZV3JGD+uPMkyVs4DjgIgPsF9FB8nJ8k=;
 b=rmALqOYig4Gp0I2PGgZQ4yUoqgQTwWNOw9jc5fbxjOXoMHWO/T92dwGhfet9UUf4D7
 VsvxygtDLURejHBdWXoCQsnHPDEE/acCvCVZYpRfRdoNt1wdq7/yfJHcfTuKNIAFuS5C
 QKi8DbHQA6YHsLZaiM+GgusdbpwDMwgVcbBRD+MydCtm5gY+7IvHp9TW0d4CTrcpoZ37
 mowhfLBcxRaFFiX62uIfKgsu3wy7vGSZxpQJ3o3vsJcgGkVscIVdEi5z6zvyuAfkOH81
 N2tonMKC77KUMd6GRh7+b6qDRYt/ggCKzaHbGSCfPIjzXRUTToFsg45O6eKI01CrBg2D
 blMQ==
X-Gm-Message-State: AOAM532VGOsXysh2bAl7AVvFQfr96P2I7AVxJF/4HrgXcKnvuYp8SSHf
 qXiteW3MTHAhyJhcXzUlTiY7pw==
X-Google-Smtp-Source: ABdhPJxE+Ga0oiFVkwJhCJzgkI8UBbxRw3MDQH0DbdFOywzsoL1X/me7zuMcKuBheK34DoyGKQsEYg==
X-Received: by 2002:a17:90a:c201:: with SMTP id
 e1mr5391158pjt.162.1589432704717; 
 Wed, 13 May 2020 22:05:04 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id 1sm1059453pgy.77.2020.05.13.22.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 22:05:04 -0700 (PDT)
Date: Wed, 13 May 2020 22:03:33 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <20200514050333.GK16107@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-6-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-6-mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 05/12] remoteproc: stm32: Parse syscon
 that will manage M4 synchronisation
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

> Get from the DT the syncon to probe the state of the remote processor
> and the location of the resource table.
> 
> Mainly based on the work published by Arnaud Pouliquen [1].
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 658439d4b00a..a285f338bed8 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -70,6 +70,8 @@ struct stm32_rproc {
>  	struct reset_control *rst;
>  	struct stm32_syscon hold_boot;
>  	struct stm32_syscon pdds;
> +	struct stm32_syscon m4_state;
> +	struct stm32_syscon rsctbl;
>  	int wdg_irq;
>  	u32 nb_rmems;
>  	struct stm32_rproc_mem *rmems;
> @@ -606,6 +608,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	*auto_boot = of_property_read_bool(np, "st,auto-boot");
>  
> +	/*
> +	 * See if we can check the M4 status, i.e if it was started
> +	 * from the boot loader or not.
> +	 */
> +	err = stm32_rproc_get_syscon(np, "st,syscfg-m4-state",
> +				     &ddata->m4_state);
> +	if (err) {
> +		/* remember this */
> +		ddata->m4_state.map = NULL;
> +		/* no coprocessor state syscon (optional) */
> +		dev_warn(dev, "m4 state not supported\n");
> +
> +		/* no need to go further */
> +		return 0;
> +	}
> +
> +	/* See if we can get the resource table */
> +	err = stm32_rproc_get_syscon(np, "st,syscfg-rsc-tbl",
> +				     &ddata->rsctbl);
> +	if (err) {
> +		/* no rsc table syscon (optional) */
> +		dev_warn(dev, "rsc tbl syscon not supported\n");
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.20.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
