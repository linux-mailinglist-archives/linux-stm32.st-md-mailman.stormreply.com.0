Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D142B97855C
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Sep 2024 18:03:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90177C78020;
	Fri, 13 Sep 2024 16:03:40 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21657C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2024 16:03:33 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20573eb852aso22919865ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2024 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726243412; x=1726848212;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M4rJxA46YKftOjieYVN+HBOxnPrXbeWw//Bs8OxUrsg=;
 b=WSYUBGK7HkdjCvLz5Efd9XLbObGIGPAMUNnWv12YpiZ4YZ0ZuAVg8FCzHoTTdXj30W
 qCpKKKz/K9lTYP331GEmztTH2cZ+iD2ynCujqRF6rs4TBTP/794zJaI0OVziDKTnXbOO
 cwDKAL+Tc3Onhr739/4HFgovIBVinSIuiOzGAyqshbO4VMKffyAMXawTF02Fi5QRpTyn
 nYFp5iJ7xQN0x+Jow+CgyEc25XNmUCh2iV6NzkuIRArEbtx2PXjQ70lypvGQIQfFdii0
 okcoXZuOI7FbXnUh+j3wMoUhPvc4deZKWzhs3enTjK+naZns4wCFyjhCTYmv2FHIgEY7
 vx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726243412; x=1726848212;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M4rJxA46YKftOjieYVN+HBOxnPrXbeWw//Bs8OxUrsg=;
 b=wXMoFCTEiO7JIC1tUPDm9VlOso5GcMeCvXYp0PpwTXus42KpC03M/wxENeBkZroB77
 g0H2quWkTJLmql17BqhILzeZCu8v8t/DG0LzQE+fGdHePfINgKfAP1UDnZksdNhYxzuC
 k5gmKjVTUnCoGi17ScyBwyQn/SnLQCjp4joofuHedfKCIaqFxVU14m0S4uKrfkdKvTbf
 P9ErwUaHxs/rUPKk5Bo8GUU6MlieCGroUoF5uSI0U9q3fq88h1YqXfwvThw5Jq5+U0SS
 op7kN/xGDWQG2lbbPmhOvZn6f6TSObtbqWJhykn7DVrMkqY3njrE9juUI2WKXvhfvGX7
 5rAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURF0PfyN4NEIlbIS25TGp7em8aGZNZpo5dSkj8ceKqoQHUNpmqIFAY9G9uEtqx8lp0sBN4gY1yCE0R5g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywp7cJQovW2b+yq24ZeFWn2KYYdcTrKRTdOVHrrRvm8QLqNYFVv
 jmaKN1Gur2dZzZfcoqyF45fZl5dZ+G0cW+HoCwtBhVTcq88PHuggWdZIucNWVU4=
X-Google-Smtp-Source: AGHT+IHHG7/l+/CqolXps5oc2mC7BwomTqGBul0o12SUT9T68nYYTvdvziy3yYLjWM7QytKM7qWGwA==
X-Received: by 2002:a17:902:ecc4:b0:207:2093:99bc with SMTP id
 d9443c01a7336-2076e591765mr96910475ad.14.1726243411549; 
 Fri, 13 Sep 2024 09:03:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a6cd:be2b:8e1e:719e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076af49293sm29809225ad.96.2024.09.13.09.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 09:03:31 -0700 (PDT)
Date: Fri, 13 Sep 2024 10:03:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZuRiTxDN7+UO42H+@p14s>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240830095147.3538047-8-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 7/7] remoteproc: stm32: Add support of
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

On Fri, Aug 30, 2024 at 11:51:47AM +0200, Arnaud Pouliquen wrote:
> The new TEE remoteproc driver is used to manage remote firmware in a
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
> index 79c638936163..400a7a93b1c9 100644
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

        if (rproc->tee_interface)

I am done reviewing this set.

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
