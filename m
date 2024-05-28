Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F078D26B0
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 23:04:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84042C6B47E;
	Tue, 28 May 2024 21:04:07 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2329C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 21:03:59 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1f4a6a54416so1907525ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716930238; x=1717535038;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RmEhT88aTz3DGDqj6R9iZYqHzSu06mmxBxyiGQRj0OU=;
 b=PPH5HyKTgYjlOmQLII5Won7NzOKozSjevcEjKTmb+jwR5wExLbj3Ajx4qT+tybTJsv
 alKONe1UDziUtVM64Hka5Ouzs5CVflyuNooOkE/2vsm1lTcmTgIJM4hEMNNls+MS/4d3
 YflY4qgrPopz4Z6ELympI/Tetf+BRpsDpw5VyAUFAWGr4epmM42XcejU+XsrCwv/a1X7
 QVuAcok7/8hgXg5KbCtPdsSYX3zGoH5McWkLnFgp7hDSEETOkF948IJ7PXpiYAy3n/ib
 B2Wo+8Wf5OgK1UeyEUgV/4Gi7zuqhiO3KeTgyV7OUUXXpfLgHGluCVLVjkM+22Y4nMoH
 mqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716930238; x=1717535038;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmEhT88aTz3DGDqj6R9iZYqHzSu06mmxBxyiGQRj0OU=;
 b=K55cq6LWgc6xZcHGxy+l6jjdJguV6dHb//S9sVsF8swjV1J2TWGUbExNlxO7Th4/lC
 /qbaKcPPpF6lWP+7RpDJaG7bQZWA1OKYDUC5Jj+BLZuuer4YQlHN6NBYIXl5mAFRi6b8
 ehiUFlO3NNqh21m4TrCfM07ve3G+uB14T7uJyFLr9Z1/U5nL5E7Wcz6FWML4MIu7h2y4
 N5lt64/EupDPOQsnYU6EvHR1DSRkhoFpFnY35v4tuLaoh2r9IgiTilV/rFosZlXISFLE
 WIBT4h4JR4yzW2FWZJOU3FhY1t8L+IzKyEqdGjaEQWDmcXgtYP96E1KXbJ4Ir2LKD3sw
 IA0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBihxIjmAxY31W6oQyvVO0n0VeXec7nbKTI3QKeVS+fyBjnGEOjm0hZgsNH4ETv3++7mi1a2R90X9mOK78P5hxuKJXE0cid3uyP0MbFgo1aEDj6wvYfdR2
X-Gm-Message-State: AOJu0YwbiLDfNpPRVhMTL3GZzP1nDDxO6qzLf9Hy/KOF/k0t8i2F8bhE
 NaIVOCSkAGByyChtsd1A8ea/g3BGYyQrM5fvr9DKdihN85qqykPXxE3ntRLo2kqPjcA52wWhOgR
 /
X-Google-Smtp-Source: AGHT+IFSLsuBgNepaa9uXWFhRm7TTE7smDcKQUDGy+q3E60dnDvPx31raQ/EGznET3bpmPoPeK+Vjg==
X-Received: by 2002:a17:902:d485:b0:1f3:1092:ab45 with SMTP id
 d9443c01a7336-1f4eaaebf79mr2195525ad.26.1716930238350; 
 Tue, 28 May 2024 14:03:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4c7:2691:aa4a:e6b7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c96fd68sm84916855ad.171.2024.05.28.14.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 14:03:57 -0700 (PDT)
Date: Tue, 28 May 2024 15:03:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZlZGu16h1xsM3es5@p14s>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240521081001.2989417-5-arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 4/7] remoteproc: core introduce
 rproc_set_rsc_table_on_start function
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

On Tue, May 21, 2024 at 10:09:58AM +0200, Arnaud Pouliquen wrote:
> Split rproc_start()to prepare the update of the management of

I don't see any "splitting" for rproc_start() in this patch.  Please consider
rewording or removing.

> the cache table on start, for the support of the firmware loading
> by the TEE interface.
> - create rproc_set_rsc_table_on_start() to address the management of
>   the cache table in a specific function, as done in
>   rproc_reset_rsc_table_on_stop().
> - rename rproc_set_rsc_table in rproc_set_rsc_table_on_attach()
> - move rproc_reset_rsc_table_on_stop() to be close to the
>   rproc_set_rsc_table_on_start() function

This patch is really hard to read due to all 3 operations happening at the same
time.  Please split in 3 smaller patches.

> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 116 ++++++++++++++-------------
>  1 file changed, 62 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f276956f2c5c..42bca01f3bde 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1264,18 +1264,9 @@ void rproc_resource_cleanup(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL(rproc_resource_cleanup);
>  
> -static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> +static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct resource_table *loaded_table;
> -	struct device *dev = &rproc->dev;
> -	int ret;
> -
> -	/* load the ELF segments to memory */
> -	ret = rproc_load_segments(rproc, fw);
> -	if (ret) {
> -		dev_err(dev, "Failed to load program segments: %d\n", ret);
> -		return ret;
> -	}
>  
>  	/*
>  	 * The starting device has been given the rproc->cached_table as the
> @@ -1291,6 +1282,64 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  		rproc->table_ptr = loaded_table;
>  	}
>  
> +	return 0;
> +}
> +
> +static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> +{
> +	/* A resource table was never retrieved, nothing to do here */
> +	if (!rproc->table_ptr)
> +		return 0;
> +
> +	/*
> +	 * If a cache table exists the remote processor was started by
> +	 * the remoteproc core.  That cache table should be used for
> +	 * the rest of the shutdown process.
> +	 */
> +	if (rproc->cached_table)
> +		goto out;
> +
> +	/*
> +	 * If we made it here the remote processor was started by another
> +	 * entity and a cache table doesn't exist.  As such make a copy of
> +	 * the resource table currently used by the remote processor and
> +	 * use that for the rest of the shutdown process.  The memory
> +	 * allocated here is free'd in rproc_shutdown().
> +	 */
> +	rproc->cached_table = kmemdup(rproc->table_ptr,
> +				      rproc->table_sz, GFP_KERNEL);
> +	if (!rproc->cached_table)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Since the remote processor is being switched off the clean table
> +	 * won't be needed.  Allocated in rproc_set_rsc_table_on_start().
> +	 */
> +	kfree(rproc->clean_table);
> +
> +out:
> +	/*
> +	 * Use a copy of the resource table for the remainder of the
> +	 * shutdown process.
> +	 */
> +	rproc->table_ptr = rproc->cached_table;
> +	return 0;
> +}
> +
> +static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct device *dev = &rproc->dev;
> +	int ret;
> +
> +	/* load the ELF segments to memory */
> +	ret = rproc_load_segments(rproc, fw);
> +	if (ret) {
> +		dev_err(dev, "Failed to load program segments: %d\n", ret);
> +		return ret;
> +	}
> +
> +	rproc_set_rsc_table_on_start(rproc, fw);
> +
>  	ret = rproc_prepare_subdevices(rproc);
>  	if (ret) {
>  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
> @@ -1450,7 +1499,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> -static int rproc_set_rsc_table(struct rproc *rproc)
> +static int rproc_set_rsc_table_on_attach(struct rproc *rproc)
>  {
>  	struct resource_table *table_ptr;
>  	struct device *dev = &rproc->dev;
> @@ -1540,54 +1589,13 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
>  
>  	/*
>  	 * The clean resource table is no longer needed.  Allocated in
> -	 * rproc_set_rsc_table().
> +	 * rproc_set_rsc_table_on_attach().
>  	 */
>  	kfree(rproc->clean_table);
>  
>  	return 0;
>  }
>  
> -static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> -{
> -	/* A resource table was never retrieved, nothing to do here */
> -	if (!rproc->table_ptr)
> -		return 0;
> -
> -	/*
> -	 * If a cache table exists the remote processor was started by
> -	 * the remoteproc core.  That cache table should be used for
> -	 * the rest of the shutdown process.
> -	 */
> -	if (rproc->cached_table)
> -		goto out;
> -
> -	/*
> -	 * If we made it here the remote processor was started by another
> -	 * entity and a cache table doesn't exist.  As such make a copy of
> -	 * the resource table currently used by the remote processor and
> -	 * use that for the rest of the shutdown process.  The memory
> -	 * allocated here is free'd in rproc_shutdown().
> -	 */
> -	rproc->cached_table = kmemdup(rproc->table_ptr,
> -				      rproc->table_sz, GFP_KERNEL);
> -	if (!rproc->cached_table)
> -		return -ENOMEM;
> -
> -	/*
> -	 * Since the remote processor is being switched off the clean table
> -	 * won't be needed.  Allocated in rproc_set_rsc_table().
> -	 */
> -	kfree(rproc->clean_table);
> -
> -out:
> -	/*
> -	 * Use a copy of the resource table for the remainder of the
> -	 * shutdown process.
> -	 */
> -	rproc->table_ptr = rproc->cached_table;
> -	return 0;
> -}
> -
>  /*
>   * Attach to remote processor - similar to rproc_fw_boot() but without
>   * the steps that deal with the firmware image.
> @@ -1614,7 +1622,7 @@ static int rproc_attach(struct rproc *rproc)
>  		goto disable_iommu;
>  	}
>  
> -	ret = rproc_set_rsc_table(rproc);
> +	ret = rproc_set_rsc_table_on_attach(rproc);
>  	if (ret) {
>  		dev_err(dev, "can't load resource table: %d\n", ret);
>  		goto unprepare_device;
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
