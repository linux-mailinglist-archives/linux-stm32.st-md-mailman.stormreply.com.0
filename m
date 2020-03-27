Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5C195AE9
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2020 17:17:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3D58C36B0B;
	Fri, 27 Mar 2020 16:17:46 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB833C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2020 16:17:42 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t24so4794092pgj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2020 09:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jhwYADhdGcLZbWIzbwxBzjxRAObWsK9tu6OvJnZhgK8=;
 b=mjFVfqnvAEAdGQxoWYIHbYy0+wwJhPKkgVBXpuF+JLGBQHrARncYWjhkj60r3u/Ohy
 gMlDZxixdo2YrheHdj9PypFdZMB4paHUWQ0Dysvo3Dh5fJaL5hUpsnIv/KsaI/XPQ6VC
 mXRHbbwQqeOtFbCLT6H5JqwjEOKjI4zV1UzKrgYsI+otvfieN3FwQ4AwuDFr19uD/GnN
 N/soZ2oeh19LWDzC3NqMTPMWCHm0v4z9h5ktH+BeEw37BkMO5xVf+2faWKp6mI/nLwa0
 AbLTb8CrC0uhcaCKalPUaZC0OYxrZqF3/lI5W6+/LkIN0haEj7jwE5xbAQreuF2zG7qP
 VHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jhwYADhdGcLZbWIzbwxBzjxRAObWsK9tu6OvJnZhgK8=;
 b=JQqlvfCII3/ae1qdWYeeMeGXDfqHg1ucdPR7emf+eJUVzWDM/ylBICBjH2sAgeZ9QI
 +d0t2FOC7YuAPzgasDE0Nf2TdSqvqcN9v/0lPBOBTFR8ZifSBpHuA3lXfz8rD919Zc5Q
 fXz1S910Fk5dcjuxjJdOyNLNIhsGMEhXYDbBshL+cCK8CdyTjBS5vvnPbjuxxkft9ZHf
 5KiRL1lwLdFqAXvSdbEWhdNBtwDATHpsEne0GP7CRgqogPI+gBjBjPTWQen0Je/w3xgu
 wXwvAgi1/1LpTPddCy2/pf/pWH9+pQ3QAI+6ZGmxnSfBjLHjdlwfDEckyjKiygsAOpfO
 NclQ==
X-Gm-Message-State: ANhLgQ2bHeUyAbF3RR8deOg5vngNO4sw11pk499wcfk334sUYqCXJO6g
 sYe6hPCgvO6TKrftjE8Wg6DG1g==
X-Google-Smtp-Source: ADFU+vuHJjTwlUlAnTmVZwL7ukhLfqdQyllSGr+zoP1DUk27+DscTsfzu3LkM6z3KfW5PHAuL3zRCQ==
X-Received: by 2002:a62:2cc3:: with SMTP id
 s186mr15383429pfs.236.1585325856083; 
 Fri, 27 Mar 2020 09:17:36 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id d3sm4136628pjz.2.2020.03.27.09.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 09:17:35 -0700 (PDT)
Date: Fri, 27 Mar 2020 10:17:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Clement Leger <cleger@kalray.eu>
Message-ID: <20200327161733.GA18041@xps15>
References: <20200327084939.8321-1-cleger@kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200327084939.8321-1-cleger@kalray.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] remoteproc: remove
	rproc_elf32_sanity_check
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

On Fri, Mar 27, 2020 at 09:49:39AM +0100, Clement Leger wrote:
> Since checks are present in the remoteproc elf loader before calling
> da_to_va, loading a elf64 will work on 32bits flavors of kernel.
> Indeed, if a segment size is larger than what size_t can hold, the
> loader will return an error so the functionality is equivalent to
> what exists today.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> ---
>  drivers/remoteproc/remoteproc_core.c       |  2 +-
>  drivers/remoteproc/remoteproc_elf_loader.c | 21 ---------------------
>  drivers/remoteproc/remoteproc_internal.h   |  1 -
>  drivers/remoteproc/st_remoteproc.c         |  2 +-
>  drivers/remoteproc/st_slim_rproc.c         |  2 +-
>  drivers/remoteproc/stm32_rproc.c           |  2 +-
>  6 files changed, 4 insertions(+), 26 deletions(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a9ac1d01e09b..02ff076b0122 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2069,7 +2069,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
>  		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
>  		if (!rproc->ops->sanity_check)
> -			rproc->ops->sanity_check = rproc_elf32_sanity_check;
> +			rproc->ops->sanity_check = rproc_elf_sanity_check;
>  		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
>  	}
>  
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 16e2c496fd45..29034f99898d 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -112,27 +112,6 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  }
>  EXPORT_SYMBOL(rproc_elf_sanity_check);
>  
> -/**
> - * rproc_elf_sanity_check() - Sanity Check ELF32 firmware image
> - * @rproc: the remote processor handle
> - * @fw: the ELF32 firmware image
> - *
> - * Make sure this fw image is sane.
> - */
> -int rproc_elf32_sanity_check(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret = rproc_elf_sanity_check(rproc, fw);
> -
> -	if (ret)
> -		return ret;
> -
> -	if (fw_elf_get_class(fw) == ELFCLASS32)
> -		return 0;
> -
> -	return -EINVAL;
> -}
> -EXPORT_SYMBOL(rproc_elf32_sanity_check);
> -
>  /**
>   * rproc_elf_get_boot_addr() - Get rproc's boot address.
>   * @rproc: the remote processor handle
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index b389dc79da81..31994715fd43 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -54,7 +54,6 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len);
>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>  int rproc_trigger_recovery(struct rproc *rproc);
>  
> -int rproc_elf32_sanity_check(struct rproc *rproc, const struct firmware *fw);
>  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
>  u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index a6cbfa452764..a3268d95a50e 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops = {
>  	.parse_fw		= st_rproc_parse_fw,
>  	.load			= rproc_elf_load_segments,
>  	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
> -	.sanity_check		= rproc_elf32_sanity_check,
> +	.sanity_check		= rproc_elf_sanity_check,
>  	.get_boot_addr		= rproc_elf_get_boot_addr,
>  };
>  
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index 3cca8b65a8db..09bcb4d8b9e0 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -203,7 +203,7 @@ static const struct rproc_ops slim_rproc_ops = {
>  	.da_to_va       = slim_rproc_da_to_va,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  	.load		= rproc_elf_load_segments,
> -	.sanity_check	= rproc_elf32_sanity_check,
> +	.sanity_check	= rproc_elf_sanity_check,
>  };
>  
>  /**
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 6a66dbf2df40..2e07a95439c8 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -505,7 +505,7 @@ static struct rproc_ops st_rproc_ops = {
>  	.load		= rproc_elf_load_segments,
>  	.parse_fw	= stm32_rproc_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> -	.sanity_check	= rproc_elf32_sanity_check,
> +	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
