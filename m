Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 871D984477E
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 19:52:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E556C6DD6B;
	Wed, 31 Jan 2024 18:52:28 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22A33C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 18:52:26 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6ddcfbc5a5fso32587b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 10:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706727144; x=1707331944;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=25r5gOm14IJEMHyveKwAf4p2gsLmehhu/N00VeJ591Y=;
 b=EfqDEOgDOFKwrlqSQyC/En1912FKsrG799o0/KxLmnjnC6sD26HTC9o29rJ0ykqvAo
 k//AslIDGIRkdNLya7ihSpeAohaTynCEpH95rnDAv9BmX7YjR63cMemPcDE32NQqqtpW
 /WOtRLAxyZQWCqU9qBC2AUoYR9/r8frv+4XugB3IXOcGyj/NTLSS5O5kKC7ZCvsETpdB
 u4H4id871oY0sFjkpYEnGzXpN5vXPfL0biLYB2FjpyP2si2O2Due9/gN4V/SDKJkYPR7
 uPVCvzhHI7OjkEVMWJ7OpwUoVRs2ap6axxjVr59CKkmH8f/XikQZjkJR4NlV2fwOZ3Ql
 3xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706727144; x=1707331944;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25r5gOm14IJEMHyveKwAf4p2gsLmehhu/N00VeJ591Y=;
 b=WSFrKOHLegsfRvEDtcrWcZixjhQl+Dm6H1KgW7GuLCiRLRX5q0RRG2MA/aQsTd0kbD
 o9g4JaSH2Y+5q7tkMgVmdO6F7Il34fdrKJ95mEDm8N3ZXl2XetZf/EEPxR73zZEMYVFF
 S2hwTfRGJq2xryNMYUrjlTNIgDmk0n+VXnTNtZgPD3qFPND6OeR7yB6ZIUwntsP5Bdv0
 6P3NoyxluHVddsqsINYg2jkf5qpw5Yc8/GtBNjjyZWWuP5o5+PFyrqaESY3HCAT6PUVs
 0A6j6mbQNdN8k0SbHjg1ENTOHF6yucjf55j7Ja1ZSeZWFRsdaIlm2n/QfDnEh67Q1quF
 SKPg==
X-Gm-Message-State: AOJu0YxlKC+w8axSn3r8SKUfYwI+tBlBZHM3ICaTlbafuLbrOhjCeX5o
 9tGln8NBgp1NrbZHSOM8MrjKcxqvmF2uurTmtS8CRM24TJAjFIRDg8zVzeQB+g0=
X-Google-Smtp-Source: AGHT+IFt7HhwIpxyhcBUyO5WrVAx3ZZVqZxLhljiEsHbdkGMIfzL6iqPgPDoivsMk5MeYNfBz4nY2A==
X-Received: by 2002:a05:6a00:1acf:b0:6df:dfd5:1b1e with SMTP id
 f15-20020a056a001acf00b006dfdfd51b1emr1625498pfv.7.1706727144422; 
 Wed, 31 Jan 2024 10:52:24 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:130d:9bb4:89ef:ab9e])
 by smtp.gmail.com with ESMTPSA id
 b185-20020a6334c2000000b0059d6f5196fasm10722471pga.78.2024.01.31.10.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 10:52:24 -0800 (PST)
Date: Wed, 31 Jan 2024 11:52:21 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ZbqW5YfDmEWG4G1X@p14s>
References: <20240118100433.3984196-1-arnaud.pouliquen@foss.st.com>
 <20240118100433.3984196-5-arnaud.pouliquen@foss.st.com>
 <ZbPnsJm67G10+HQ3@p14s>
 <7ec6c9e8-9267-4e7c-81a4-abcdb2ab4239@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ec6c9e8-9267-4e7c-81a4-abcdb2ab4239@foss.st.com>
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

On Tue, Jan 30, 2024 at 10:13:48AM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 1/26/24 18:11, Mathieu Poirier wrote:
> > On Thu, Jan 18, 2024 at 11:04:33AM +0100, Arnaud Pouliquen wrote:
> >> The new TEE remoteproc device is used to manage remote firmware in a
> >> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> >> introduced to delegate the loading of the firmware to the trusted
> >> execution context. In such cases, the firmware should be signed and
> >> adhere to the image format defined by the TEE.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >> V1 to V2 update:
> >> - remove the select "TEE_REMOTEPROC" in STM32_RPROC config as detected by
> >>   the kernel test robot:
> >>      WARNING: unmet direct dependencies detected for TEE_REMOTEPROC
> >>      Depends on [n]: REMOTEPROC [=y] && OPTEE [=n]
> >>      Selected by [y]:
> >>      - STM32_RPROC [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && REMOTEPROC [=y]
> >> - Fix initialized trproc variable in  stm32_rproc_probe
> >> ---
> >>  drivers/remoteproc/stm32_rproc.c | 149 +++++++++++++++++++++++++++++--
> >>  1 file changed, 144 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> >> index fcc0001e2657..cf6a21bac945 100644
> >> --- a/drivers/remoteproc/stm32_rproc.c
> >> +++ b/drivers/remoteproc/stm32_rproc.c
> >> @@ -20,6 +20,7 @@
> >>  #include <linux/remoteproc.h>
> >>  #include <linux/reset.h>
> >>  #include <linux/slab.h>
> >> +#include <linux/tee_remoteproc.h>
> >>  #include <linux/workqueue.h>
> >>  
> >>  #include "remoteproc_internal.h"
> >> @@ -49,6 +50,9 @@
> >>  #define M4_STATE_STANDBY	4
> >>  #define M4_STATE_CRASH		5
> >>  
> >> +/* Remote processor unique identifier aligned with the Trusted Execution Environment definitions */
> >> +#define STM32_MP1_M4_PROC_ID    0
> >> +
> >>  struct stm32_syscon {
> >>  	struct regmap *map;
> >>  	u32 reg;
> >> @@ -90,6 +94,8 @@ struct stm32_rproc {
> >>  	struct stm32_mbox mb[MBOX_NB_MBX];
> >>  	struct workqueue_struct *workqueue;
> >>  	bool hold_boot_smc;
> >> +	bool fw_loaded;
> >> +	struct tee_rproc *trproc;
> >>  	void __iomem *rsc_va;
> >>  };
> >>  
> >> @@ -257,6 +263,91 @@ static int stm32_rproc_release(struct rproc *rproc)
> >>  	return err;
> >>  }
> >>  
> >> +static int stm32_rproc_tee_elf_sanity_check(struct rproc *rproc,
> >> +					    const struct firmware *fw)
> >> +{
> >> +	struct stm32_rproc *ddata = rproc->priv;
> >> +	unsigned int ret = 0;
> >> +
> >> +	if (rproc->state == RPROC_DETACHED)
> >> +		return 0;
> >> +
> >> +	ret = tee_rproc_load_fw(ddata->trproc, fw);
> >> +	if (!ret)
> >> +		ddata->fw_loaded = true;
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static int stm32_rproc_tee_elf_load(struct rproc *rproc,
> >> +				    const struct firmware *fw)
> >> +{
> >> +	struct stm32_rproc *ddata = rproc->priv;
> >> +	unsigned int ret;
> >> +
> >> +	/*
> >> +	 * This function can be called by remote proc for recovery
> >> +	 * without the sanity check. In this case we need to load the firmware
> >> +	 * else nothing done here as the firmware has been preloaded for the
> >> +	 * sanity check to be able to parse it for the resource table.
> >> +	 */
> > 
> > This comment is very confusing - please consider refactoring.  
> > 
> >> +	if (ddata->fw_loaded)
> >> +		return 0;
> >> +
> > 
> > I'm not sure about keeping a flag to indicate the status of the loaded firmware.
> > It is not done for the non-secure method, I don't see why it would be needed for
> > the secure one.
> > 
> 
> The difference is on the sanity check.
> - in rproc_elf_sanity_check we  parse the elf file to verify that it is
> valid.
> - in stm32_rproc_tee_elf_sanity_check we have to do the same, that means to
> authenticate it. the authentication is done during the load.
> 
> So this flag is used to avoid to reload it twice time.
> refactoring the comment should help to understand this flag
> 
> 
> An alternative would be to bypass the sanity check. But this lead to same
> limitation.
> Before loading the firmware in remoteproc_core, we call rproc_parse_fw() that is
> used to get the resource table address. To get it from tee we need to
> authenticate the firmware so load it...
>

I spent a long time thinking about this patchset.  Looking at the code as it
is now, request_firmware() in rproc_boot() is called even when the TEE is
responsible for loading the firmware.  There should be some conditional code
that calls either request_firmware() or tee_rproc_load_fw().  The latter should
also be renamed to tee_rproc_request_firmware() to avoid confusion.

I touched on that before but please rename rproc_tee_get_rsc_table() to
rproc_tee_elf_load_rsc_table().  I also suggest to introduce a new function,
rproc_tee_get_loaded_rsc_table() that would be called from
rproc_tee_elf_load_rsc_table().  That way we don't need trproc->rsc_va.  

I also think tee_rproc should be renamed to "rproc_tee_interface" and folded
under struct rproc.  

With the above most of the problems with the current implementation should
naturally go away.

Thanks,
Mathieu

> 
> >> +	ret = tee_rproc_load_fw(ddata->trproc, fw);
> >> +	if (ret)
> >> +		return ret;
> >> +	ddata->fw_loaded = true;
> >> +
> >> +	/* Update the resource table parameters. */
> >> +	if (rproc_tee_get_rsc_table(ddata->trproc)) {
> >> +		/* No resource table: reset the related fields. */
> >> +		rproc->cached_table = NULL;
> >> +		rproc->table_ptr = NULL;
> >> +		rproc->table_sz = 0;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static struct resource_table *
> >> +stm32_rproc_tee_elf_find_loaded_rsc_table(struct rproc *rproc,
> >> +					  const struct firmware *fw)
> >> +{
> >> +	struct stm32_rproc *ddata = rproc->priv;
> >> +
> >> +	return tee_rproc_get_loaded_rsc_table(ddata->trproc);
> >> +}
> >> +
> >> +static int stm32_rproc_tee_start(struct rproc *rproc)
> >> +{
> >> +	struct stm32_rproc *ddata = rproc->priv;
> >> +
> >> +	return tee_rproc_start(ddata->trproc);
> >> +}
> >> +
> >> +static int stm32_rproc_tee_attach(struct rproc *rproc)
> >> +{
> >> +	/* Nothing to do, remote proc already started by the secured context. */
> >> +	return 0;
> >> +}
> >> +
> >> +static int stm32_rproc_tee_stop(struct rproc *rproc)
> >> +{
> >> +	struct stm32_rproc *ddata = rproc->priv;
> >> +	int err;
> >> +
> >> +	stm32_rproc_request_shutdown(rproc);
> >> +
> >> +	err = tee_rproc_stop(ddata->trproc);
> >> +	if (err)
> >> +		return err;
> >> +
> >> +	ddata->fw_loaded = false;
> >> +
> >> +	return stm32_rproc_release(rproc);
> >> +}
> >> +
> >>  static int stm32_rproc_prepare(struct rproc *rproc)
> >>  {
> >>  	struct device *dev = rproc->dev.parent;
> >> @@ -319,7 +410,14 @@ static int stm32_rproc_prepare(struct rproc *rproc)
> >>  
> >>  static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >>  {
> >> -	if (rproc_elf_load_rsc_table(rproc, fw))
> >> +	struct stm32_rproc *ddata = rproc->priv;
> >> +	int ret;
> >> +
> >> +	if (ddata->trproc)
> >> +		ret = rproc_tee_get_rsc_table(ddata->trproc);
> >> +	else
> >> +		ret = rproc_elf_load_rsc_table(rproc, fw);
> >> +	if (ret)
> >>  		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> >>  
> >>  	return 0;
> >> @@ -693,8 +791,22 @@ static const struct rproc_ops st_rproc_ops = {
> >>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >>  };
> >>  
> >> +static const struct rproc_ops st_rproc_tee_ops = {
> >> +	.prepare	= stm32_rproc_prepare,
> >> +	.start		= stm32_rproc_tee_start,
> >> +	.stop		= stm32_rproc_tee_stop,
> >> +	.attach		= stm32_rproc_tee_attach,
> >> +	.kick		= stm32_rproc_kick,
> >> +	.parse_fw	= stm32_rproc_parse_fw,
> >> +	.find_loaded_rsc_table = stm32_rproc_tee_elf_find_loaded_rsc_table,
> >> +	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
> >> +	.sanity_check	= stm32_rproc_tee_elf_sanity_check,
> >> +	.load		= stm32_rproc_tee_elf_load,
> >> +};
> >> +
> >>  static const struct of_device_id stm32_rproc_match[] = {
> >> -	{ .compatible = "st,stm32mp1-m4" },
> >> +	{.compatible = "st,stm32mp1-m4",},
> >> +	{.compatible = "st,stm32mp1-m4-tee",},
> >>  	{},
> >>  };
> >>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> >> @@ -853,6 +965,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>  	struct device *dev = &pdev->dev;
> >>  	struct stm32_rproc *ddata;
> >>  	struct device_node *np = dev->of_node;
> >> +	struct tee_rproc *trproc = NULL;
> >>  	struct rproc *rproc;
> >>  	unsigned int state;
> >>  	int ret;
> >> @@ -861,11 +974,31 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> >> -	if (!rproc)
> >> -		return -ENOMEM;
> >> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
> >> +		trproc = tee_rproc_register(dev, STM32_MP1_M4_PROC_ID);
> >> +		if (IS_ERR(trproc)) {
> >> +			dev_err_probe(dev, PTR_ERR(trproc),
> >> +				      "signed firmware not supported by TEE\n");
> >> +			return PTR_ERR(trproc);
> >> +		}
> >> +		/*
> >> +		 * Delegate the firmware management to the secure context.
> >> +		 * The firmware loaded has to be signed.
> >> +		 */
> >> +		dev_info(dev, "Support of signed firmware only\n");
> > 
> > Not sure what this adds.  Please remove.
> 
> This is used to inform the user that only a signed firmware can be loaded, not
> an ELF file.
> I have a patch in my pipe to provide the supported format in the debugfs. In a
> first step, I can suppress this message and we can revisit the issue when I push
> the debugfs proposal.
> 
> Thanks,
> Arnaud
> 
> > 
> >> +	}
> >> +	rproc = rproc_alloc(dev, np->name,
> >> +			    trproc ? &st_rproc_tee_ops : &st_rproc_ops,
> >> +			    NULL, sizeof(*ddata));
> >> +	if (!rproc) {
> >> +		ret = -ENOMEM;
> >> +		goto free_tee;
> >> +	}
> >>  
> >>  	ddata = rproc->priv;
> >> +	ddata->trproc = trproc;
> >> +	if (trproc)
> >> +		trproc->rproc = rproc;
> >>  
> >>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> >>  
> >> @@ -916,6 +1049,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>  		device_init_wakeup(dev, false);
> >>  	}
> >>  	rproc_free(rproc);
> >> +free_tee:
> >> +	if (trproc)
> >> +		tee_rproc_unregister(trproc);
> >> +
> >>  	return ret;
> >>  }
> >>  
> >> @@ -937,6 +1074,8 @@ static void stm32_rproc_remove(struct platform_device *pdev)
> >>  		device_init_wakeup(dev, false);
> >>  	}
> >>  	rproc_free(rproc);
> >> +	if (ddata->trproc)
> >> +		tee_rproc_unregister(ddata->trproc);
> >>  }
> >>  
> >>  static int stm32_rproc_suspend(struct device *dev)
> >> -- 
> >> 2.25.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
