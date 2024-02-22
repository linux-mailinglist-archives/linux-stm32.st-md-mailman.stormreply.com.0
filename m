Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895E86020D
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 20:02:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 186ADC69063;
	Thu, 22 Feb 2024 19:02:47 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF360C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 19:02:44 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5dbd519bde6so22641a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 11:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708628563; x=1709233363;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vTYNxcj2neo6HPPvD99c1Q/mh/wbkm0pvCmLFsw0RNE=;
 b=YPsG7AzUPlnjtjE9ZDylHoGCbhdhb6kBaspAQtyoD60U8VdoQlDzKg4JWeV8qHMGd4
 J4Vljxahz4dWhkyz9SbMf9gu2YfWKN2MO0ISAVavRjhrXrKPyOLsIZV7in+djmjxeQsw
 0T/XwgUCIAM9xqW0MkhQwY2A3Z6OKlEs748AJKIFRgOuBX8B+X7WzzrPejEVt/IDemEA
 T04KQPlE1WsOXC5WBP8GAcabho5rTYGTR9QEACExfWCsQTcw7CD+KCSzU5KVqjK3+dwd
 O7xwJujIECnG3VjrsUSEGU6t3bbMpXLr3bf1pjWdvIdCnM9r9aiX+vIP5Ub/DzUHL4LE
 alqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708628563; x=1709233363;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vTYNxcj2neo6HPPvD99c1Q/mh/wbkm0pvCmLFsw0RNE=;
 b=USCw1OctNI6QmihMNVqGzADFyme3mnFeXT4JmzxZi1QyDwvtu8GmSSGCh8ttGDw/nF
 IH55fPBS29GlxmSS0WpiJR4IiUspfaeYpaHuBHFPzl6F1y/vr5RiWZomQp5tiRRW675E
 ESHWMteIlBgMRVjy/vurVpcnOYyFBbQ3Bc7rJ/s2CCCmRqj+DCZKtGuOvDoO9fih14qk
 1rv1Gk7cM81ZkHH3vy9pA9YdZ1tk6dLixwtLxVGVw3RTsj1r5Zo1luzOmRqk37JCzPnc
 BYL42yxhtEiPf/Zg6ID9yOdwETu7Kpf+YxpFP5ojDrrS9n9mwMcvAZwfvXtfBEJiZ4Pp
 ozPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlhDakfmcaNSo2Y5Fy3uJzeh4axoHnB7/amPxJDMXH92GuSs3bNQ/7BG94kM7+qOm1bz835Qd3Jn2wf9UVca/aK7U5vWIOchBQpIe7JBlH1QW+zbD4jXUt
X-Gm-Message-State: AOJu0YxNT8JPzVpZ2lcrcN/+ymFTpdzgibviKaEARJhg7GuCcNmGXIDc
 GHySHVv00xksn+xn9PG6pBeuh5ztZqPAO7CDMzhNVqT1/4TsPOWVonGJ/uxNSoQ=
X-Google-Smtp-Source: AGHT+IGHpe6qaxfqw4bUvBWsv+UIbIpFUkh4ZbooGLlTNoQO8V6VqfMPRcSemGOLTfiSJOpq7TrZDw==
X-Received: by 2002:a05:6a21:9101:b0:19e:ccb2:fd80 with SMTP id
 tn1-20020a056a21910100b0019eccb2fd80mr20697588pzb.8.1708628563292; 
 Thu, 22 Feb 2024 11:02:43 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:1fd:7619:a246:fc72])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a056a00124a00b006e4de94c111sm10598pfi.65.2024.02.22.11.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 11:02:42 -0800 (PST)
Date: Thu, 22 Feb 2024 12:02:40 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZdeaUGpWlqGOG31u@p14s>
References: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
 <20240214172127.1022199-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214172127.1022199-8-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 7/7] remoteproc: stm32: Add support of
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

Hi,

On Wed, Feb 14, 2024 at 06:21:27PM +0100, Arnaud Pouliquen wrote:
> The new TEE remoteproc device is used to manage remote firmware in a
> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> introduced to delegate the loading of the firmware to the trusted
> execution context. In such cases, the firmware should be signed and
> adhere to the image format defined by the TEE.
> 
> A new "to_attach" field is introduced to differentiate the use cases
> "firmware loaded by the boot stage" and "firmware loaded by the TEE".
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> V2 to V3 update:
> - remove stm32_rproc_tee_elf_sanity_check(), stm32_rproc_tee_elf_load()
>   stm32_rproc_tee_elf_find_loaded_rsc_table() and  stm32_rproc_tee_start() that are bnow unused
> - use new rproc::alt_boot field to sepcify that the alternate fboot method is used
> - use stm32_rproc::to_attach field to differenciate attch mode from remoteproc tee boot mode.
> - remove the used of stm32_rproc::fw_loaded
> ---
>  drivers/remoteproc/stm32_rproc.c | 85 +++++++++++++++++++++++++++++---
>  1 file changed, 79 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index fcc0001e2657..9cfcf66462e0 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -20,6 +20,7 @@
>  #include <linux/remoteproc.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> +#include <linux/tee_remoteproc.h>
>  #include <linux/workqueue.h>
>  
>  #include "remoteproc_internal.h"
> @@ -49,6 +50,9 @@
>  #define M4_STATE_STANDBY	4
>  #define M4_STATE_CRASH		5
>  
> +/* Remote processor unique identifier aligned with the Trusted Execution Environment definitions */
> +#define STM32_MP1_M4_PROC_ID    0
> +
>  struct stm32_syscon {
>  	struct regmap *map;
>  	u32 reg;
> @@ -90,6 +94,8 @@ struct stm32_rproc {
>  	struct stm32_mbox mb[MBOX_NB_MBX];
>  	struct workqueue_struct *workqueue;
>  	bool hold_boot_smc;
> +	bool to_attach;
> +	struct tee_rproc *trproc;
>  	void __iomem *rsc_va;
>  };
>  
> @@ -253,10 +259,30 @@ static int stm32_rproc_release(struct rproc *rproc)
>  			return err;
>  		}
>  	}
> +	ddata->to_attach = false;
>  
>  	return err;
>  }
>  
> +static int stm32_rproc_tee_attach(struct rproc *rproc)
> +{
> +	/* Nothing to do, remote proc already started by the secured context. */
> +	return 0;
> +}
> +
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
> @@ -637,10 +663,14 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
>  	struct device *dev = rproc->dev.parent;
> +	struct tee_rproc *trproc = ddata->trproc;
>  	phys_addr_t rsc_pa;
>  	u32 rsc_da;
>  	int err;
>  
> +	if (trproc && !ddata->to_attach)
> +		return tee_rproc_get_loaded_rsc_table(rproc, table_sz);
> +

Why do we need a flag at all?  Why can't st_rproc_tee_ops::get_loaded_rsc_table
be set to tee_rproc_get_loaded_rsc_table()?

>  	/* The resource table has already been mapped, nothing to do */
>  	if (ddata->rsc_va)
>  		goto done;
> @@ -693,8 +723,20 @@ static const struct rproc_ops st_rproc_ops = {
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> +static const struct rproc_ops st_rproc_tee_ops = {
> +	.prepare	= stm32_rproc_prepare,
> +	.start		= tee_rproc_start,
> +	.stop		= stm32_rproc_tee_stop,
> +	.attach		= stm32_rproc_tee_attach,
> +	.kick		= stm32_rproc_kick,
> +	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
> +	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
> +	.load		= tee_rproc_load_fw,
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] = {
> -	{ .compatible = "st,stm32mp1-m4" },
> +	{.compatible = "st,stm32mp1-m4",},
> +	{.compatible = "st,stm32mp1-m4-tee",},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> @@ -853,6 +895,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
> +	struct tee_rproc *trproc = NULL;
>  	struct rproc *rproc;
>  	unsigned int state;
>  	int ret;
> @@ -861,12 +904,33 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> -	if (!rproc)
> -		return -ENOMEM;

This patch doesn't apply to rproc-next - please rebase.


> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
> +		/*
> +		 * Delegate the firmware management to the secure context.
> +		 * The firmware loaded has to be signed.
> +		 */
> +		trproc = tee_rproc_register(dev, STM32_MP1_M4_PROC_ID);
> +		if (IS_ERR(trproc)) {
> +			dev_err_probe(dev, PTR_ERR(trproc),
> +				      "signed firmware not supported by TEE\n");
> +			return PTR_ERR(trproc);
> +		}
> +	}
>  
> -	ddata = rproc->priv;
> +	rproc = rproc_alloc(dev, np->name,
> +			    trproc ? &st_rproc_tee_ops : &st_rproc_ops,
> +			    NULL, sizeof(*ddata));
> +	if (!rproc) {
> +		ret = -ENOMEM;
> +		goto free_tee;
> +	}
>  
> +	ddata = rproc->priv;
> +	ddata->trproc = trproc;

My opinion hasn't changed from the previous patchet, i.e tee_rproc should be
folded in struct rproc as rproc::tee_interface.

More comments to come shortly...

> +	if (trproc) {
> +		rproc->alt_boot = true;
> +		trproc->rproc = rproc;
> +	}
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
>  	ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
> @@ -881,8 +945,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	if (state == M4_STATE_CRUN)
> +	if (state == M4_STATE_CRUN) {
>  		rproc->state = RPROC_DETACHED;
> +		ddata->to_attach = true;
> +	}
>  
>  	rproc->has_iommu = false;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
> @@ -916,6 +982,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  		device_init_wakeup(dev, false);
>  	}
>  	rproc_free(rproc);
> +free_tee:
> +	if (trproc)
> +		tee_rproc_unregister(trproc);
> +
>  	return ret;
>  }
>  
> @@ -923,6 +993,7 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  {
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct stm32_rproc *ddata = rproc->priv;
> +	struct tee_rproc *trproc = ddata->trproc;
>  	struct device *dev = &pdev->dev;
>  
>  	if (atomic_read(&rproc->power) > 0)
> @@ -937,6 +1008,8 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  		device_init_wakeup(dev, false);
>  	}
>  	rproc_free(rproc);
> +	if (trproc)
> +		tee_rproc_unregister(trproc);
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
