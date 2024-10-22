Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F19B9AB2AC
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 17:52:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22491C6DD9F;
	Tue, 22 Oct 2024 15:52:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CCEAC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 15:52:14 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-20c77459558so49727075ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 08:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729612333; x=1730217133;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8AkVLCCPZxZ1fApkqmTMKj62SttuuqmnYfplcOKZMck=;
 b=UZ/RRKQZVohvTWz4+UlTCKJhnNjc9i/SEf8A4k0dXyITkhA0QEI4Xsd1dRszKlutkG
 xWRv9q0rGCAZ4OL91kK0kdN+Q4rHtxS/rUHLdXzxVqfGHYvO4PCpQ/6mkcpq3atePGYe
 Ni1OixgeCFCWLgZl3SRTzoTQi29Bg4KiDWQj2MwUAGF/IKHye3EAN8P0CllvoURRvlK9
 gylCeaA0/zL0pfzAPEbXvum1A33IdCH6tNMEWIZh0B1CfECRwasJRQvXxjre9qdraePo
 P7E3mp2QlLf1codAkAyhQ4FocVkdwel1cNUJu1G6bkrE6AnyUbE8mVI9TiE0GmJhB/30
 Mobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729612333; x=1730217133;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8AkVLCCPZxZ1fApkqmTMKj62SttuuqmnYfplcOKZMck=;
 b=XQJWFha4kXE6bSTJVMhC00P9FQD+EImOOrD6NzaC23syD/Tt+SLpkuGB7J3t0kFLJ2
 dUGaadW2qOCrXIHZKKSPg5eP/WKr+qg8APey/MDYXgPwyaMOsweYWBWIQKW9/sb+uUS4
 PTBDmcCda4ZJbPDItzyk3YODtneLZ0pWB2vqJily7TRDKR8mWilVt6SIHJgERXXrHIq9
 sW/atm2ml+OG7MTWaIKX/qTozcAL2vkSY1U6ZZIgXphnTjtlDEFYiriel6nL6ETPa1V/
 VJcXmBUyjTLMpMO1YwetK9QV8AomCokSHjMTPLhk1jI0iEzid+XOkmzV5QiCVO+R2HJf
 ViHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuVx+hWARU1KVFY63z4kbybKyqqVbtPJI8R+030Ug8ZVIYzFN+vMwm354vyws1OiTs8LcKPs51kHgcug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwCDb1rI3pXEvls3N1r0KTkTFiemDENMOfO6dZ8mgfqQPxJUWfs
 RwsyCeaEkHL/EtOwFP5lCkejg9F8R7SeiZr+5x9Nw7F4jWwCpY+2f1jHlURysB0=
X-Google-Smtp-Source: AGHT+IEsN3+xGI76q2s1diRf4iXLrreaf3Jeckwsh5L0/TmOy3pREL6E0A6kjoW8nKAID3UtRLL8+w==
X-Received: by 2002:a17:903:1cc:b0:20c:c880:c3b0 with SMTP id
 d9443c01a7336-20e948aefd1mr44835425ad.21.1729612332913; 
 Tue, 22 Oct 2024 08:52:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:567b:4c87:a9aa:a404])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7ef0c5e4sm44510525ad.97.2024.10.22.08.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 08:52:12 -0700 (PDT)
Date: Tue, 22 Oct 2024 09:52:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZxfKKe5C/O16x+J4@p14s>
References: <20241009080108.4170320-1-arnaud.pouliquen@foss.st.com>
 <20241009080108.4170320-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241009080108.4170320-8-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v11 7/7] remoteproc: stm32: Add support of
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

On Wed, Oct 09, 2024 at 10:01:08AM +0200, Arnaud Pouliquen wrote:
> The new TEE remoteproc driver is used to manage remote firmware in a
> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> introduced to delegate the loading of the firmware to the trusted
> execution context. In such cases, the firmware should be signed and
> adhere to the image format defined by the TEE.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> updates vs v9 revision:
> - rename tee_interface to tee_rproc_itf
> - in stm32_rproc_probe(), test and use rproc->tee_rproc_itf instead of
>   trproc in the tee_rproc_unregister() call
> - initialize release_fw ops
> ---
>  drivers/remoteproc/stm32_rproc.c | 63 ++++++++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 288bd70c7861..cb7093de41df 100644
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
> @@ -255,6 +256,19 @@ static int stm32_rproc_release(struct rproc *rproc)
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
> @@ -691,8 +705,20 @@ static const struct rproc_ops st_rproc_ops = {
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
> +	.release_fw	= tee_rproc_release_fw,
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] = {
>  	{ .compatible = "st,stm32mp1-m4" },
> +	{ .compatible = "st,stm32mp1-m4-tee" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> @@ -851,17 +877,42 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
> +	struct tee_rproc *trproc = NULL;

The cleaner this patchset get, the more obvious it is (at least to me) that
struct tee_rproc needs to be changed to struct rproc_tee.  Otherwise I keep
wondering if this is coming from the TEE subsystem or the remoteproc subsystem.

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

This should return an integer rather than a struct tee_rproc * since the latter
is available through rproc->tee_rproc_itf.

In line with my comment above, this should be changed to rproc_tee_register()
since it belongs to the remoteproc subsystem.  Before when I asked for
tee_remoteproc.c to be changed to remoteproc_tee.c, I thought we could get by
without changing the inside but now I think it is clear that we can't - this
needs to be addressed.  

> +		if (IS_ERR(trproc)) {
> +			dev_err_probe(dev, PTR_ERR(trproc),
> +				      "signed firmware not supported by TEE\n");
> +			return PTR_ERR(trproc);

                        return dev_err_probe(...);
> +		}
> +	} else {
> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> +		if (!rproc)
> +			return -ENOMEM;
> +	}
>  
>  	ddata = rproc->priv;
>  
> @@ -913,6 +964,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (rproc->tee_rproc_itf)
> +		tee_rproc_unregister(rproc->tee_rproc_itf);
> +

If I read Bjorn's comment properly, this should probably be:

                rproc_tee_unregister(rproc);

with the if() inside the function.

>  	return ret;
>  }
>  
> @@ -933,6 +987,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (rproc->tee_rproc_itf)
> +		tee_rproc_unregister(rproc->tee_rproc_itf);
> +

Same here.

I am done reviewing this set.

Thanks,
Mathieu

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
