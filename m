Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BB9D176C
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Nov 2024 18:52:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9380C78F81;
	Mon, 18 Nov 2024 17:52:56 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCABFC78F7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2024 17:52:49 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7f450f7f11dso1662237a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2024 09:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731952368; x=1732557168;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fCr0sYPsogCz+quxodgEQ3ar7fg9yYSS/OcvrMaer1g=;
 b=G0GGlqqw6W5X4APVvwSxhT5vQs3hWGiA1PADSuelSDDWtoY/8OcVxun2gWVrnRBSsr
 8LLUMV2nq42TiXf0n8kLc+Jy4Rm7v/CiO75iCWu6XQ55QaJHNhHVq+Qr+XVsxrgye2Cc
 roeYp1AaPIuQVXHzV1jKA1cOUTZZRJcz/6vNtvKyUfsJWxwG59CK5LoLqM4W2uHjYuAr
 OsHrBbTHwpt5jIboJ0IQr/Yb9T5HPS/gH6/a1NyfKmmjVBOQrcH5X3JC1ahOlzM1y8nA
 lXCilrPIfSrKhpvqGJfk+I9k1fKc7DrjLVdtQFEiVZ5YDbzJgJsLYjWYaWP/bXTHDLns
 D72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731952368; x=1732557168;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCr0sYPsogCz+quxodgEQ3ar7fg9yYSS/OcvrMaer1g=;
 b=Y8HI3i4Xh+278JuvBBEVodMfmXQDn8/3X7fS18ZxnEqHMCnuYH9nMfmPsdG9PAkQ2Q
 tTdL7EodCWsO2W8Vvjlf5ui7dmQJAjGLsj2T+y44gki3yUETA2X7ELHy67LF1Wki/ieY
 erf5O2wjY+0vtgzTankpTamtj2HXVN4Deq3dYRyQ41vuzrx9r8pvsBoaXT6t/GbmAf9u
 bsQpy3v2T4GDnn/vxVPi1wHtjQMWWuLLSkEwdxnEI+0OcJaOgDHryJ1MV0HmWqLT9aRy
 S7LOMDfPyrVuj0QBhZYBlN/lRGbPJOPpcEm1LITu/GxHGkgzCI/TMV6T8nojxs80UWTH
 OULg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Ivt7iI5zs5d6cnEIYPVCvv72OxmQIYaji/sVPUTGw/o4SdLDu9otezB7tZd3YDPPBYm+XycvnIyUvQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJzNeTMZW9lJL8kBNP3bJCr+6cV/OaJpWJ6Jkj/p/k8L1MGlBt
 VeQY/AObFHj3EZRs3IYszNxIXymF2NMxIw1buOEfqxHIpdAwvArETcHhLKqZg0A=
X-Google-Smtp-Source: AGHT+IEJRNX9bZE0xzeLu7+8kcJ+xIr7Kwr2Ag4WKPpTArbvdH5l5IPyQ32YkKJbAIpbhDtnUqCUSw==
X-Received: by 2002:a05:6a20:43ab:b0:1db:e508:cf68 with SMTP id
 adf61e73a8af0-1dc90b4bbebmr18325105637.24.1731952368452; 
 Mon, 18 Nov 2024 09:52:48 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ced4:eca8:f5e9:9a5c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724770f9d0asm6707357b3a.26.2024.11.18.09.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 09:52:47 -0800 (PST)
Date: Mon, 18 Nov 2024 10:52:44 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <Zzt+7NBdNjyzWZIb@p14s>
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v13 4/7] remoteproc: Introduce release_fw
 optional operation
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

On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
> This patch updates the rproc_ops struct to include an optional
> release_fw function.
> 
> The release_fw ops is responsible for releasing the remote processor
> firmware image. The ops is called in the following cases:
> 
>  - An error occurs in rproc_start() between the loading of the segments and
>       the start of the remote processor.
>  - after stopping the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates from version V11:
> - fix typo in @release_fw comment
> ---
>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>  include/linux/remoteproc.h           | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7694817f25d4..46863e1ca307 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  
>  static void rproc_release_fw(struct rproc *rproc)
>  {
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);
> +
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
>  reset_table_ptr:
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);
>  	rproc->table_ptr = rproc->cached_table;

I suggest the following:

1) Create two new functions, i.e rproc_load_fw() and rproc_release_fw().  The
only thing those would do is call rproc->ops->load_fw() and
rproc->ops->release_fw(), if they are present.  When a TEE interface is
available, ->load_fw() and ->release_fw() become rproc_tee_load_fw() and
rproc_tee_release_fw().

2) Call rproc_load_fw() in rproc_boot(), just before rproc_fw_boot().  If the
call to rproc_fw_boot() fails, call rproc_release_fw().

3) The same logic applies to rproc_boot_recovery(), i.e call rproc_load_fw()
before rproc_start() and call rproc_release_fw() if rproc_start() fails.

4) Take rproc_tee_load_fw() out of rproc_tee_parse_fw().  It will now be called
in rproc_load_fw().

5) As stated above function rproc_release_fw() now calls rproc_tee_release_fw().
The former is already called in rproc_shutdown() so we are good in that front.

With the above the cached_table management within the core remains the same and
we can get rid of patch 3.7.

Thanks,
Mathieu

>  
>  	return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 2e0ddcb2d792..08e0187a84d9 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
>   * @coredump:	  collect firmware dump after the subsystem is shutdown
> + * @release_fw:	optional function to release the firmware image from ROM memories.
> + *		This function is called after stopping the remote processor or in case of an error
>   */
>  struct rproc_ops {
>  	int (*prepare)(struct rproc *rproc);
> @@ -403,6 +405,7 @@ struct rproc_ops {
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  	unsigned long (*panic)(struct rproc *rproc);
>  	void (*coredump)(struct rproc *rproc);
> +	void (*release_fw)(struct rproc *rproc);
>  };
>  
>  /**
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
