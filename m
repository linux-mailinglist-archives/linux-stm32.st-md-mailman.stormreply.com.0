Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E4483DF88
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 18:11:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39F0EC6DD70;
	Fri, 26 Jan 2024 17:11:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAE89C6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 17:11:16 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1d76671e5a4so5345745ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 09:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706289075; x=1706893875;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Bcmrpd25Eu3WOVR04Y5OIk5yOCebYwVXK+pO0q0F6mw=;
 b=NaqSvmd7CGX/5+2+2s+YzHGs8HiyEtmuItuLzcxvOQCQhIXing79zr77YVUKr6M2zP
 urVR3+JVeHwzhlVQB7420eTQ1l1HHrrO5UhCE7lJnZ+XED3g9bVMqmlWyfXg6u0IgMUM
 PcRpgd0Vp6jKNpkCqwA7UXXVzL2VdCiEN8o0NIfQzXivl129eHfiilGYkCzBMLqWyCLZ
 4x3KXLGBVuneRBGC3ScbdMcjycbpzmhW7jZ1urro1C8xMZLvtn/t1DfqARviygHYo/hq
 T+fW6R88SwXdgUAmjVaPKMvSgyvEQ/9zQvOVtqL1vvgSg/TpRnlakCEDMKnijuz1+i9X
 nRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706289075; x=1706893875;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bcmrpd25Eu3WOVR04Y5OIk5yOCebYwVXK+pO0q0F6mw=;
 b=vQ3JbM2xE/DTnVPlZPL1iANvbHZTv0LvVnSm4RC+GoBGklTQHKyKl+UH0V+qc9wu34
 74sPhA6tcULnvCJEXHTD6zbGrbCYBoCENi3Nbc30kKA7k2txe+eAzf6gDyKHrSuvl73d
 TSOgHm/tSbkB1GaViGJOym2wyDJwHf6FKnctEOJxw9IWmYLaj/Hut/SHlbJHAbve539D
 TVnGUx3167zDQSLZJGoWj3qiOWJgQCX6mb0ZHgDPgTeK3WWn6R96Kn26b3lY9KNVqtKw
 3tavQZ/lYOZh6l/XRCEK2bEiCZKuOE7zo47QbfuYGC2y0g/fwwaw4oWB7j3NXttVOVQY
 ggAw==
X-Gm-Message-State: AOJu0YxNphA3EPWcoCbzkvDI49Ia2CPrz2CnZ++yuagSd2KetATZHvMr
 CNMlFC343pFyZgCFGSLTDFtWnIXF81Z8jaaXGjtpDzYt3qiAU/SHZ5RHWksgh+E=
X-Google-Smtp-Source: AGHT+IH5z9sKSNksJAUu83TwSp/rNEwRd7Og2IHYScnBP9tAbNauGL8Vlp/pDWgaLQsQX0ukE3j7ww==
X-Received: by 2002:a17:902:e995:b0:1d7:35e0:2b5b with SMTP id
 f21-20020a170902e99500b001d735e02b5bmr52432plb.125.1706289075281; 
 Fri, 26 Jan 2024 09:11:15 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:4ad7:9f92:4f45:da3f])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a170902d08a00b001d72f145ebdsm1175527plv.35.2024.01.26.09.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 09:11:14 -0800 (PST)
Date: Fri, 26 Jan 2024 10:11:12 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZbPnsJm67G10+HQ3@p14s>
References: <20240118100433.3984196-1-arnaud.pouliquen@foss.st.com>
 <20240118100433.3984196-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118100433.3984196-5-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/4] remoteproc: stm32: Add support of
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

On Thu, Jan 18, 2024 at 11:04:33AM +0100, Arnaud Pouliquen wrote:
> The new TEE remoteproc device is used to manage remote firmware in a
> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> introduced to delegate the loading of the firmware to the trusted
> execution context. In such cases, the firmware should be signed and
> adhere to the image format defined by the TEE.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> V1 to V2 update:
> - remove the select "TEE_REMOTEPROC" in STM32_RPROC config as detected by
>   the kernel test robot:
>      WARNING: unmet direct dependencies detected for TEE_REMOTEPROC
>      Depends on [n]: REMOTEPROC [=y] && OPTEE [=n]
>      Selected by [y]:
>      - STM32_RPROC [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && REMOTEPROC [=y]
> - Fix initialized trproc variable in  stm32_rproc_probe
> ---
>  drivers/remoteproc/stm32_rproc.c | 149 +++++++++++++++++++++++++++++--
>  1 file changed, 144 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index fcc0001e2657..cf6a21bac945 100644
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
> +	bool fw_loaded;
> +	struct tee_rproc *trproc;
>  	void __iomem *rsc_va;
>  };
>  
> @@ -257,6 +263,91 @@ static int stm32_rproc_release(struct rproc *rproc)
>  	return err;
>  }
>  
> +static int stm32_rproc_tee_elf_sanity_check(struct rproc *rproc,
> +					    const struct firmware *fw)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	unsigned int ret = 0;
> +
> +	if (rproc->state == RPROC_DETACHED)
> +		return 0;
> +
> +	ret = tee_rproc_load_fw(ddata->trproc, fw);
> +	if (!ret)
> +		ddata->fw_loaded = true;
> +
> +	return ret;
> +}
> +
> +static int stm32_rproc_tee_elf_load(struct rproc *rproc,
> +				    const struct firmware *fw)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	unsigned int ret;
> +
> +	/*
> +	 * This function can be called by remote proc for recovery
> +	 * without the sanity check. In this case we need to load the firmware
> +	 * else nothing done here as the firmware has been preloaded for the
> +	 * sanity check to be able to parse it for the resource table.
> +	 */

This comment is very confusing - please consider refactoring.  

> +	if (ddata->fw_loaded)
> +		return 0;
> +

I'm not sure about keeping a flag to indicate the status of the loaded firmware.
It is not done for the non-secure method, I don't see why it would be needed for
the secure one.

> +	ret = tee_rproc_load_fw(ddata->trproc, fw);
> +	if (ret)
> +		return ret;
> +	ddata->fw_loaded = true;
> +
> +	/* Update the resource table parameters. */
> +	if (rproc_tee_get_rsc_table(ddata->trproc)) {
> +		/* No resource table: reset the related fields. */
> +		rproc->cached_table = NULL;
> +		rproc->table_ptr = NULL;
> +		rproc->table_sz = 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct resource_table *
> +stm32_rproc_tee_elf_find_loaded_rsc_table(struct rproc *rproc,
> +					  const struct firmware *fw)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +
> +	return tee_rproc_get_loaded_rsc_table(ddata->trproc);
> +}
> +
> +static int stm32_rproc_tee_start(struct rproc *rproc)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +
> +	return tee_rproc_start(ddata->trproc);
> +}
> +
> +static int stm32_rproc_tee_attach(struct rproc *rproc)
> +{
> +	/* Nothing to do, remote proc already started by the secured context. */
> +	return 0;
> +}
> +
> +static int stm32_rproc_tee_stop(struct rproc *rproc)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	int err;
> +
> +	stm32_rproc_request_shutdown(rproc);
> +
> +	err = tee_rproc_stop(ddata->trproc);
> +	if (err)
> +		return err;
> +
> +	ddata->fw_loaded = false;
> +
> +	return stm32_rproc_release(rproc);
> +}
> +
>  static int stm32_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -319,7 +410,14 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  
>  static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  {
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> +	struct stm32_rproc *ddata = rproc->priv;
> +	int ret;
> +
> +	if (ddata->trproc)
> +		ret = rproc_tee_get_rsc_table(ddata->trproc);
> +	else
> +		ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret)
>  		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
>  
>  	return 0;
> @@ -693,8 +791,22 @@ static const struct rproc_ops st_rproc_ops = {
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> +static const struct rproc_ops st_rproc_tee_ops = {
> +	.prepare	= stm32_rproc_prepare,
> +	.start		= stm32_rproc_tee_start,
> +	.stop		= stm32_rproc_tee_stop,
> +	.attach		= stm32_rproc_tee_attach,
> +	.kick		= stm32_rproc_kick,
> +	.parse_fw	= stm32_rproc_parse_fw,
> +	.find_loaded_rsc_table = stm32_rproc_tee_elf_find_loaded_rsc_table,
> +	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
> +	.sanity_check	= stm32_rproc_tee_elf_sanity_check,
> +	.load		= stm32_rproc_tee_elf_load,
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] = {
> -	{ .compatible = "st,stm32mp1-m4" },
> +	{.compatible = "st,stm32mp1-m4",},
> +	{.compatible = "st,stm32mp1-m4-tee",},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> @@ -853,6 +965,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
> +	struct tee_rproc *trproc = NULL;
>  	struct rproc *rproc;
>  	unsigned int state;
>  	int ret;
> @@ -861,11 +974,31 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> -	if (!rproc)
> -		return -ENOMEM;
> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
> +		trproc = tee_rproc_register(dev, STM32_MP1_M4_PROC_ID);
> +		if (IS_ERR(trproc)) {
> +			dev_err_probe(dev, PTR_ERR(trproc),
> +				      "signed firmware not supported by TEE\n");
> +			return PTR_ERR(trproc);
> +		}
> +		/*
> +		 * Delegate the firmware management to the secure context.
> +		 * The firmware loaded has to be signed.
> +		 */
> +		dev_info(dev, "Support of signed firmware only\n");

Not sure what this adds.  Please remove.

> +	}
> +	rproc = rproc_alloc(dev, np->name,
> +			    trproc ? &st_rproc_tee_ops : &st_rproc_ops,
> +			    NULL, sizeof(*ddata));
> +	if (!rproc) {
> +		ret = -ENOMEM;
> +		goto free_tee;
> +	}
>  
>  	ddata = rproc->priv;
> +	ddata->trproc = trproc;
> +	if (trproc)
> +		trproc->rproc = rproc;
>  
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
> @@ -916,6 +1049,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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
> @@ -937,6 +1074,8 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  		device_init_wakeup(dev, false);
>  	}
>  	rproc_free(rproc);
> +	if (ddata->trproc)
> +		tee_rproc_unregister(ddata->trproc);
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
