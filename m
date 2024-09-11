Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6DF9756D8
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2024 17:20:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DA2DC6C841;
	Wed, 11 Sep 2024 15:20:38 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5DE7C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 15:20:30 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-71923d87be4so154577b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 08:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726068029; x=1726672829;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6QsnF80Nnvoo/JnHghxBCTtAMnmOaIQ36MmFNNxPphg=;
 b=aZNRUyfqNaEiLG4/nghi4uCQP1KtV8wJtH/ShRONn5Yofe3IhT5wR+HVIyzbuJ4Dny
 ssXj+HMFROm/mqsEF6hBAJKIbQAqyra8ZevcSjDhPjziX+Y7G2OPewNpA1M2b7jngYfQ
 tHOsySvouNR+908JeXhKUWd1Pa19kQ4arR35atvV16HLGpfHnuZPv9OvbfEFzNaIdJJw
 R5Zk69Op4ePN/vwVyv4Jp5HNmOYX9EyFyx4okFDxQJ00PPwl3DyDhQfU3MSBdgTC6ayx
 YkHwaz5Je5Xnc8bFLrS4G3U94JWaFBfqLEWUhMdHhj9qsYkg220FKhHQtqUoajCEjI+L
 rQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726068029; x=1726672829;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6QsnF80Nnvoo/JnHghxBCTtAMnmOaIQ36MmFNNxPphg=;
 b=lUAZa6AXZNzzeKOWFgz8c46qAQe1a+mpaMDssHJi3rerZHqQFvlbg4QsETZJ2W2fjg
 G6PCrcNwCMot9f4V7x0n02ruh17WHlN5ksVMhjzjGDmhQ1fAb5QYaaxn5Z3gSEiw3cA+
 xBLLlvaB0aRYrW8WbmRlmNKRUfduwubw35NFa1I4oX/PZ4xlyfLuirecY9ARk7mwQcxV
 579rJPFl3FtKdpDtNw1jvnvxElwUELrW0cft87nyVmF9lzZhHmgvyhfN0fdHgjTfjJEa
 o+88GtY+Pg5N5yDrD7JH1H3guYiSQA3xvAUAa7Nre8Mdo9KlI88spQiUwTO0tZwJ0Zgv
 AoXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvU0T7D+Oot6sDu92ROBeGhTo/nBuzl2Qu7akvX5BmlMdTctnSZQV0oXaXCnypGMA9Pyv0CntsqjQTrA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw4hCMn277UiBCU7W4gFrFPItYPrXQBPNZ/jda23MJ+wRWfuVfs
 KGo1Fo3iOxrIIuqXIIDu7+o3bU9w0wo0aSvJRFTiPpPt8arl6eYhzpqdihxCwnM=
X-Google-Smtp-Source: AGHT+IF62OJJay2y+CU+PR4n787g3j2oQeP+yBY3R968kbDmjxolxaxWKCPxr0TAOuJnc1ZT8F6S1Q==
X-Received: by 2002:a05:6a00:92a6:b0:706:b10c:548a with SMTP id
 d2e1a72fcca58-718d5f06a3emr22601898b3a.22.1726068029283; 
 Wed, 11 Sep 2024 08:20:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:cc9a:9892:2799:3634])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-719090ada75sm3099467b3a.162.2024.09.11.08.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 08:20:28 -0700 (PDT)
Date: Wed, 11 Sep 2024 09:20:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZuG1OiYO7YA+c81G@p14s>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240830095147.3538047-4-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 3/7] remoteproc: core: Refactor
 resource table cleanup into rproc_release_fw
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

On Fri, Aug 30, 2024 at 11:51:43AM +0200, Arnaud Pouliquen wrote:
> This patch centralizing the cleanup of the resource table into a new
> helper function rproc_release_fw().
> 

Sure, but you did not explain _why_ the change is needed.

> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index ace11ea17097..7694817f25d4 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1256,6 +1256,13 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static void rproc_release_fw(struct rproc *rproc)
> +{
> +	/* Free the copy of the resource table */
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = NULL;
> +	rproc->table_ptr = NULL;
> +}
>  
>  /**
>   * rproc_resource_cleanup() - clean up and free all acquired resources
> @@ -1485,9 +1492,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  
>  clean_up_resources:
>  	rproc_resource_cleanup(rproc);
> -	kfree(rproc->cached_table);
> -	rproc->cached_table = NULL;
> -	rproc->table_ptr = NULL;
> +	rproc_release_fw(rproc);
>  unprepare_rproc:
>  	/* release HW resources if needed */
>  	rproc_unprepare_device(rproc);
> @@ -2067,10 +2072,7 @@ int rproc_shutdown(struct rproc *rproc)
>  
>  	rproc_disable_iommu(rproc);
>  
> -	/* Free the copy of the resource table */
> -	kfree(rproc->cached_table);
> -	rproc->cached_table = NULL;
> -	rproc->table_ptr = NULL;
> +	rproc_release_fw(rproc);
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> @@ -2133,10 +2135,7 @@ int rproc_detach(struct rproc *rproc)
>  
>  	rproc_disable_iommu(rproc);
>  
> -	/* Free the copy of the resource table */
> -	kfree(rproc->cached_table);
> -	rproc->cached_table = NULL;
> -	rproc->table_ptr = NULL;
> +	rproc_release_fw(rproc);
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
