Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB119A6EDA
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 17:55:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0ECFC78034;
	Mon, 21 Oct 2024 15:55:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E74BC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 15:54:55 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20c9978a221so53615615ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729526094; x=1730130894;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W2P/OAPuPPfGZgym/n673Rfg3DHU/GqTqUEFYAFx22E=;
 b=qGxS/uq6b3jxf2+lH3MVWRNked3cmiGkmLuSRVU/zenQRGnlhOJ7LB9HWKc05NHZ5w
 UXY2P+Umj89DPbWsDG1Eg03vMKRyxoazrmpPaHwG4B/gyWwzIk4zKHELO6iOW0pKgGgH
 ldWtJOlGqIY4/1pSL9knTpYpg5co5ALnvAa6HRL9mklXcOD0mvkqQ6IRjRQ2kgjUSDTV
 OtTcz1CjYn1/X6zqXsTVk1RxIgw+ekyaMX+JbOJ2Yyj9jNZNWdY81TvWugaO9UffRpEa
 AsEgK2KcxjiJ4A6arqCulGh+oLQ+ZJKGAOL+PAy7npeDe/cC1SPgFIBEUgniI8HQ+vgX
 Sh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729526094; x=1730130894;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2P/OAPuPPfGZgym/n673Rfg3DHU/GqTqUEFYAFx22E=;
 b=LaTpWS1CI8keGj0/xoJagnZ3Ae30FF1zcU8y8UDNDx8yDPtDc49BBCdWuCepZMmxj/
 nGYavNDKbwoOD0vqqyVsU49svHNmu48PBx/d3n/U8j397NhdI0VgK4Ny3NTB0Z2gtczO
 jysDDtYNWMJuifCGC3RjnhsijbhRqsINhgpGDdXEWh48nKH/yuOhqfKGkoHWVdjalvEH
 rgvsoKL6kR2X7n3SQPe7sAeDBYUGsn8xmoMbORKYSCA1+KYvj8rmwiG3KEeM5q+Z213p
 AQ8JPg0bS5Aiq98GdOapS1zfgRDGbrTFPmoiwxAgWRfPc/7LR/4/1k3JMxo0zkUyyD5Y
 BCEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnHLVa1N1FGooAUr478MbRP+kP7VwSIoU0G+9qJcFL8OWqUxjKWKsmQce0danV7hGSew9btSTcgRRqCA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx3BajDXBbs+Nb73dfHnQXKihmirPN9CsLdseseLx6u8/edT7yB
 UupwwMtk02TPPbxI6QZ/kPSaDaDmZkJ9o7Ht6zNkSXkKef/YDQRQxmb5Sg5PFiI=
X-Google-Smtp-Source: AGHT+IHXumHx1fJK7C0JJjF2aFxoJi4eyEeDsc9H2M9LdVyaQELXWb/6QAXRzMTU/kCm/w8lInBwkg==
X-Received: by 2002:a05:6a21:70cb:b0:1cf:6ef0:c6b9 with SMTP id
 adf61e73a8af0-1d92c56b9bdmr15675587637.32.1729526093768; 
 Mon, 21 Oct 2024 08:54:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fb5e:248e:29ec:7946])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ec1356780sm3137641b3a.90.2024.10.21.08.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:54:53 -0700 (PDT)
Date: Mon, 21 Oct 2024 09:54:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZxZ5SdGmcBlra4zi@p14s>
References: <20241009080108.4170320-1-arnaud.pouliquen@foss.st.com>
 <20241009080108.4170320-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241009080108.4170320-5-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v11 4/7] remoteproc: Introduce release_fw
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

On Wed, Oct 09, 2024 at 10:01:05AM +0200, Arnaud Pouliquen wrote:
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
> Update vs v9 revision:
> - New commit that preplace previous one to introduce ops->release_fw
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
>  
>  	return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 73f640dd0fc0..bdf4d94a9e63 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
>   * @coredump:	  collect firmware dump after the subsystem is shutdown
> + * @release_fw:	optional function to release the firmware image from ROM memories.
> + *              This function is called after stopping the process or in case of an error

... after stopping the process?

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
