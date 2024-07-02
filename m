Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3179243D4
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2024 18:44:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7086AC6DD9E;
	Tue,  2 Jul 2024 16:44:53 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 125CEC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2024 16:44:52 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-706b14044cbso3295171b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Jul 2024 09:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719938691; x=1720543491;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Phw++KCNea16DU8eOTMmV36Mdb5a7m8SacK5PGBp32U=;
 b=x6EEP41pa2XYhMN6K67PTa+xcRcTRGs5V1sGNrrCn0C/NadOQ6F8VtgHDctFWfnwun
 wZE/OyhjvA6e2reYR775gMCrt33exNWhomdo3tczWu6l36zWZLYaHoQPcSZiAafLpMxT
 hbAsnt1OI2ewje7Qk8SeBGBIsF9K0TRmnkERuEJpXBhaDpMFs4zNfcT1LQ5bVbb2nNya
 Puy+6hUch//ahgLTeCdx3+eUqc8EeDuh06ztbBMHO1Pn9CRGcirBLIugvbLhFjzmY9f7
 cdzCuGrCsJJTT8ufDF0Tm//jPSFTld29EXWWnCG/TB7I5Z8GEGednWvRZ+DyCQDyClfP
 xCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719938691; x=1720543491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Phw++KCNea16DU8eOTMmV36Mdb5a7m8SacK5PGBp32U=;
 b=YjjDEu9Swy+tcc3RN5TZl6S03422zWhhPtHcDAT6AyXZPBil+6UIND6+T1f/Udlel1
 1lSBn7Yiyq5U8S69uGarLtbMo40oNPZjFFy+m0Rn3LC3LPj1kUFYfBHifjbIeuofh9SE
 UXyMO+bM6LTqPZGmgh1eZBe2cn0bwsDMSUB5lttt859usQTH65/0zC1pb6i/Vw9A77kY
 hHR2NiG3HdAUyuLlGWvuLJ0xLrMoWhaq+TNlyFZbPe+mwbHhlttyr/qGRHc/JAMtiCgW
 NR4IhIhzRIoosOzoeTjDiN3wyJ0H8q0f2KanKdasaO2XpTGyA9xPFiivWrlyJfOprBM8
 fnNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYNfLen2/g9vDl/0Jy+bChSGqB+weY1dDRLAhD7/8KJ+pxc69zEeHXTqJvc8dIQSL2QJTqG+m9omM/Mvq8nJVjdJU7VNzqcCg8+EjBwwKSllYMSUNz5Kac
X-Gm-Message-State: AOJu0YyyiX7k6RwKQUXB3Lzza0rGl3cyQBFQpdIsBdYdAUbg9jPbFqQz
 77ay0vmWNxtHg8nmk1jILqEFMzNd3C+zl2nkVOQRkXCeQHPrNOnBvhTwI35Ur4M=
X-Google-Smtp-Source: AGHT+IEwftAV+W5epvlPenld+i4k1K8ts6v6lErfwD0yVJfMBJDDLudodQFJyGkNq/gL/ZnZMvMS1A==
X-Received: by 2002:a05:6a20:c992:b0:1bd:91b0:10a5 with SMTP id
 adf61e73a8af0-1bef6248467mr7426144637.47.1719938690225; 
 Tue, 02 Jul 2024 09:44:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a83c:9cd1:70fd:d18a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-708029582d5sm8709470b3a.89.2024.07.02.09.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 09:44:49 -0700 (PDT)
Date: Tue, 2 Jul 2024 10:44:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZoQufshvHg1AR90C@p14s>
References: <20240621143759.547793-1-arnaud.pouliquen@foss.st.com>
 <20240621143759.547793-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621143759.547793-6-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 5/5] remoteproc: stm32: Add support of
 an OP-TEE TA to load the firmware
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

On Fri, Jun 21, 2024 at 04:37:59PM +0200, Arnaud Pouliquen wrote:
> The new TEE remoteproc device is used to manage remote firmware in a

Device or driver?

> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> introduced to delegate the loading of the firmware to the trusted
> execution context. In such cases, the firmware should be signed and
> adhere to the image format defined by the TEE.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 63 ++++++++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 8cd838df4e92..fd905b3cf206 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/pm_wakeirq.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/remoteproc_tee.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> @@ -257,6 +258,19 @@ static int stm32_rproc_release(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int stm32_rproc_tee_stop(struct rproc *rproc)
> +{
> +	int err;
> +
> +	stm32_rproc_request_shutdown(rproc);
> +
> +	err = tee_rproc_stop(rproc);
> +	if (err)
> +		return err;
> +
> +	return stm32_rproc_release(rproc);
> +}
> +
>  static int stm32_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -693,8 +707,20 @@ static const struct rproc_ops st_rproc_ops = {
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> +static const struct rproc_ops st_rproc_tee_ops = {
> +	.prepare	= stm32_rproc_prepare,
> +	.start		= tee_rproc_start,
> +	.stop		= stm32_rproc_tee_stop,
> +	.kick		= stm32_rproc_kick,
> +	.load		= tee_rproc_load_fw,
> +	.parse_fw	= tee_rproc_parse_fw,
> +	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
> +
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] = {
>  	{ .compatible = "st,stm32mp1-m4" },
> +	{ .compatible = "st,stm32mp1-m4-tee" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> @@ -853,17 +879,42 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
> +	struct tee_rproc *trproc = NULL;
>  	struct rproc *rproc;
>  	unsigned int state;
> +	u32 proc_id;
>  	int ret;
>  
>  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
>  
> -	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> -	if (!rproc)
> -		return -ENOMEM;
> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
> +		/*
> +		 * Delegate the firmware management to the secure context.
> +		 * The firmware loaded has to be signed.
> +		 */
> +		ret = of_property_read_u32(np, "st,proc-id", &proc_id);
> +		if (ret) {
> +			dev_err(dev, "failed to read st,rproc-id property\n");
> +			return ret;
> +		}
> +
> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
> +		if (!rproc)
> +			return -ENOMEM;
> +
> +		trproc = tee_rproc_register(dev, rproc, proc_id);
> +		if (IS_ERR(trproc)) {
> +			dev_err_probe(dev, PTR_ERR(trproc),
> +				      "signed firmware not supported by TEE\n");
> +			return PTR_ERR(trproc);
> +		}
> +	} else {
> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> +		if (!rproc)
> +			return -ENOMEM;
> +	}
>  
>  	ddata = rproc->priv;
>  
> @@ -915,6 +966,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (trproc)
> +		tee_rproc_unregister(trproc);
> +
>  	return ret;
>  }
>  
> @@ -935,6 +989,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (rproc->tee_interface)
> +		tee_rproc_unregister(rproc->tee_interface);
> +
>  }
>  
>  static int stm32_rproc_suspend(struct device *dev)
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
