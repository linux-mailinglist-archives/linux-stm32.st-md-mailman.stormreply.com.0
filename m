Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A72911D60
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 09:53:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8CA4C712A2;
	Fri, 21 Jun 2024 07:53:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E740AC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 21:29:03 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1f9b523a15cso10765155ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 14:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718918942; x=1719523742;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1B8n/9x5UV/1SNK0e2sD4WDigveg5fhKDxICWDMhEd8=;
 b=vxghf35qJ/ujS8qY704tTRAYdUbaWQDGz/sinX7m0dQq/Kigg3iTN3ijjKVlCzveqY
 GbS/WPzNlZIubGG/ypjDK8tos9plSqlY8l32kq9irTfpnNGcZhI3HAx91RE39uJsQmUs
 9t4qMfAViUyE4G78QCueF4JcQ1ZSubVC9Pv054YjmYceLgLl2MxvPhmrTKueN0AzXEEg
 b/BSBsiqrQFbSGRd/aEbXllDqH/V/cSlEJOl4lJJA3og8mWhzho8EspJLZnWZiLWRUPW
 zuGiJSK1WArTUxJzjS/dCLVt/dY74lgvTo/IBKtXfvNbVS0iitgtxslLiuFJfIRu+omT
 6QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718918942; x=1719523742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1B8n/9x5UV/1SNK0e2sD4WDigveg5fhKDxICWDMhEd8=;
 b=uVJN2BjGraippPRxJ3xIf7evrmveDSepPk1BmKn5Aze7vPqMCtRcw43xwhswy56EAn
 s4EsSKaKIhzkPIRcmpiO2JD0xO8PATdhX1bitUL0mnGqneEaYeEC1cTiEE1TFnv8Ypnn
 n54n2mdNCANn92ce2VBdcUvehmn8Iod5gQvbNm9U3AjLdQvlfAzJWvsWWXcmHX+P1XMU
 JIFoaUQlTCEr10S3joX3Exn5n5WQJkh0JXCLjNs4skSPLLaoIEEqUdZWrBQROQttkReO
 kYmfsMIxa/mlRXz/nryT1Jpi+2FCIfGLzv2Jbbty59H6F/Oi3oBCtoT9n8GGkDxP/iw7
 jbQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUxKEhktXKhL4yAUKgpthFEDK8+PRzP4EVr3vB20M9a27ttYuccXHcYUZ83fVbdwuKcKMJvM92nW1iY2QpPvI+dmQUEmu2dUr9r6lZ7tPX3sj/nx1JcRRq
X-Gm-Message-State: AOJu0YyDVlAyKLE4cVycxGg5+2V9RoIxv//D2QTQwhc8iF2GUKsRR3gx
 cnMrFtdId0vLp6mPbpfA6ncCfNEHtAy1QoERO6Wt7LpSCLHNW0WpYJQCz4QfZZQ=
X-Google-Smtp-Source: AGHT+IGRZRV15RUYJQ36Wvbuz7tQOaEP3gRrX62dbm+NaihBOC+cfum9DmWH761VwwydaedMpum6CQ==
X-Received: by 2002:a17:902:daca:b0:1f8:66fb:1679 with SMTP id
 d9443c01a7336-1f9a9274fb1mr93302075ad.30.1718918942421; 
 Thu, 20 Jun 2024 14:29:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800::9eba])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbbc1cbsm698255ad.282.2024.06.20.14.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 14:29:01 -0700 (PDT)
Date: Thu, 20 Jun 2024 15:28:58 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZnSfGkcjxr/4qJn/@p14s>
References: <20240611073904.475019-1-arnaud.pouliquen@foss.st.com>
 <20240611073904.475019-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240611073904.475019-2-arnaud.pouliquen@foss.st.com>
X-Mailman-Approved-At: Fri, 21 Jun 2024 07:53:37 +0000
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 1/5] remoteproc: core: Introduce
	rproc_pa_to_va helper
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

On Tue, Jun 11, 2024 at 09:39:00AM +0200, Arnaud Pouliquen wrote:
> When a resource table is loaded by an external entity such as U-boot or
> OP-TEE, we do not necessary get the device address(da) but the physical

s/necessary/necessarily

> address(pa).
> This helper performs similar translation than the rproc_da_to_va()
> but based on a physical address.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 74 +++++++++++++++++++++++++++-
>  include/linux/remoteproc.h           |  3 ++
>  2 files changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f276956f2c5c..3fdec0336fd6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -230,6 +230,77 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  }
>  EXPORT_SYMBOL(rproc_da_to_va);
>  
> +/**
> + * rproc_pa_to_va() - lookup the kernel virtual address for a physical address of a remoteproc
> + * memory
> + *
> + * @rproc: handle of a remote processor
> + * @pa: remoteproc physical address
> + * @len: length of the memory region @pa is pointing to
> + * @is_iomem: optional pointer filled in to indicate if @da is iomapped memory
> + *
> + * Some remote processors will ask us to allocate them physically contiguous
> + * memory regions (which we call "carveouts"), and map them to specific
> + * device addresses (which are hardcoded in the firmware). They may also have
> + * dedicated memory regions internal to the processors, and use them either
> + * exclusively or alongside carveouts.
> + *
> + * They may then ask us to copy objects into specific addresses (e.g.
> + * code/data sections) or expose us certain symbols in other device address
> + * (e.g. their trace buffer).
> + *
> + * This function is a helper function with which we can go over the allocated
> + * carveouts and translate specific physical addresses to kernel virtual addresses
> + * so we can access the referenced memory. This function also allows to perform
> + * translations on the internal remoteproc memory regions through a platform
> + * implementation specific pa_to_va ops, if present.
> + *
> + * Note: phys_to_virt(iommu_iova_to_phys(rproc->domain, da)) will work too,
> + * but only on kernel direct mapped RAM memory. Instead, we're just using
> + * here the output of the DMA API for the carveouts, which should be more
> + * correct.

No point in copying all this.  Just say that it does the same thing as
rproc_da_to_va(), but with the PA address.

> + *
> + * Return: a valid kernel address on success or NULL on failure
> + */
> +void *rproc_pa_to_va(struct rproc *rproc, phys_addr_t pa, size_t len, bool *is_iomem)
> +{
> +	struct rproc_mem_entry *carveout;
> +	void *ptr = NULL;
> +
> +	if (rproc->ops->da_to_va) {

This is really wrong.

> +		ptr = rproc->ops->pa_to_va(rproc, pa, len);
> +		if (ptr)
> +			goto out;
> +	}

There is no current customer for ops::pa_to_va() so please remove.

Thanks,
Mathieu

> +
> +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> +		int offset = pa - carveout->dma;
> +
> +		/*  Verify that carveout is allocated */
> +		if (!carveout->va)
> +			continue;
> +
> +		/* try next carveout if da is too small */
> +		if (offset < 0)
> +			continue;
> +
> +		/* try next carveout if da is too large */
> +		if (offset + len > carveout->len)
> +			continue;
> +
> +		ptr = carveout->va + offset;
> +
> +		if (is_iomem)
> +			*is_iomem = carveout->is_iomem;
> +
> +		break;
> +	}
> +
> +out:
> +	return ptr;
> +}
> +EXPORT_SYMBOL(rproc_pa_to_va);
> +
>  /**
>   * rproc_find_carveout_by_name() - lookup the carveout region by a name
>   * @rproc: handle of a remote processor
> @@ -724,8 +795,7 @@ static int rproc_alloc_carveout(struct rproc *rproc,
>  	 * firmware was compiled with.
>  	 *
>  	 * In this case, we must use the IOMMU API directly and map
> -	 * the memory to the device address as expected by the remote
> -	 * processor.
> +	 * the memory to the device address as etable
>  	 *
>  	 * Obviously such remote processor devices should not be configured
>  	 * to use the iommu-based DMA API: we expect 'dma' to contain the
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2..28aa62a3b505 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -367,6 +367,7 @@ enum rsc_handling_status {
>   * @detach:	detach from a device, leaving it powered up
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>   * @da_to_va:	optional platform hook to perform address translations
> + * @pa_to_va:	optional platform hook to perform address translations
>   * @parse_fw:	parse firmware to extract information (e.g. resource table)
>   * @handle_rsc:	optional platform hook to handle vendor resources. Should return
>   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> @@ -391,6 +392,7 @@ struct rproc_ops {
>  	int (*detach)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> +	void * (*pa_to_va)(struct rproc *rproc, phys_addr_t da, size_t len);
>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>  	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
>  			  int offset, int avail);
> @@ -690,6 +692,7 @@ int rproc_detach(struct rproc *rproc);
>  int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>  void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> +void *rproc_pa_to_va(struct rproc *rproc, phys_addr_t pa, size_t len, bool *is_iomem);
>  
>  /* from remoteproc_coredump.c */
>  void rproc_coredump_cleanup(struct rproc *rproc);
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
