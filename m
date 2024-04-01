Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86014893D0A
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 17:46:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A139C69067;
	Mon,  1 Apr 2024 15:46:40 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70B32CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 15:46:38 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so2642438a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Apr 2024 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711986397; x=1712591197;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tWWRyK5tdfdVBLwP7xJLWPNoP24uv5LR7F3wgBZy5NM=;
 b=mtIoK6yAXFPcA7RRdOba8oH4XyStp0WMwXSj38ZkzDTXN54R4w8O/VAa6amEQ+6uC6
 Tsiqf8vriXGdYZuHQz+R+e32HBtLmWZju9hBdQ3OAevJ76vFOfDoWL7/xtEOAlnINe4m
 togIzag/nH++xG9AM066EqXjCnLa4ZUeQV2Z8XalRnPsvDUTuxCfEeB+y7u7tBVAelpl
 aTiwd5kGFO3iUuC+seGRY6ifxm2an1atwtj1WVfYyFNS/RQrcbM2LjxfHxFoKCW+JMVu
 /0WUbEqStXcQqP61W3tndaFVJgXMtyMF/10oBf69SFiQCLNAvpwzGZL0GRNR95xS6Rjn
 vGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711986397; x=1712591197;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWWRyK5tdfdVBLwP7xJLWPNoP24uv5LR7F3wgBZy5NM=;
 b=RkvY5Z357AoRCj0opJ+ODC30PJj9YcmAEHIK8TA8eQEABFS4OuDNX6RdxJ48ltzgyP
 TlPyvx70v0341hg5c+pgq38ri80bxzOz0XPPuyci4vo3XnDNzEaWnuIOnKt90yjyrBwi
 UeX6nd8gxBp14hCYEvOX/qYhRM231Dq6wrKOgETI6gYFgVfVUXB5PHbG1RV0sF9944qH
 trInwNxMEqbeRPWL1OhTn/eAXJ8ko8sL/SMXdhqNhc0J1doA5Gj4j7tvcNsqeP7ojF2l
 2yv2/yXwrKgisdRLkOtDoacRtCaxYHHFYuB6CgDFstzP9DMyEYnN4twf91wGv/zM2ux3
 Lqfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTUDmd6lqR58HQiSpwgqEXc1H48cG3l3tavQYbUvM73ZEw9JYWxIsltuyvJ0QtkNuRNGyKSgsrJaYOl5wxAI5Lam7f1GGnunSKjsRfdaVs0ZIPw4ejOg4C
X-Gm-Message-State: AOJu0YwZAengLvgdHKHeOysres6VkRE8crv4yIckaqg/zXk0Qote1S/B
 vlmsZujyOpZ9TAQMkmt68gNiLhYvk8UGVlotIq8NtWbABNAYsQY32HD1CYASXYA=
X-Google-Smtp-Source: AGHT+IGWzqfdQG8QU+iZ2Gll0nvewCIExy0+sTscNhq0mJMvkBLBHBxl3TB+FIZyie/YQqZOZslCNA==
X-Received: by 2002:a17:903:2284:b0:1dd:c953:cfa0 with SMTP id
 b4-20020a170903228400b001ddc953cfa0mr11118225plh.48.1711986396521; 
 Mon, 01 Apr 2024 08:46:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8aef:41d9:be1:3de4])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170902e30b00b001e25e0cb271sm1073263plc.224.2024.04.01.08.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 08:46:36 -0700 (PDT)
Date: Mon, 1 Apr 2024 09:46:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ZgrW2avODv29vWNP@p14s>
References: <20240308144708.62362-1-arnaud.pouliquen@foss.st.com>
 <20240308144708.62362-5-arnaud.pouliquen@foss.st.com>
 <ZgGrnkcebcIQQic6@p14s>
 <a08add21-b8ff-434a-9689-6af8b05b1965@foss.st.com>
 <ZgRT7PtzIogAWc50@p14s>
 <2cd23e93-1a3a-4128-b947-35fe2b04ccab@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2cd23e93-1a3a-4128-b947-35fe2b04ccab@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 4/4] remoteproc: stm32: Add support of
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

On Fri, Mar 29, 2024 at 11:57:43AM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 3/27/24 18:14, Mathieu Poirier wrote:
> > On Tue, Mar 26, 2024 at 08:31:33PM +0100, Arnaud POULIQUEN wrote:
> >>
> >>
> >> On 3/25/24 17:51, Mathieu Poirier wrote:
> >>> On Fri, Mar 08, 2024 at 03:47:08PM +0100, Arnaud Pouliquen wrote:
> >>>> The new TEE remoteproc device is used to manage remote firmware in a
> >>>> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> >>>> introduced to delegate the loading of the firmware to the trusted
> >>>> execution context. In such cases, the firmware should be signed and
> >>>> adhere to the image format defined by the TEE.
> >>>>
> >>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>> ---
> >>>> Updates from V3:
> >>>> - remove support of the attach use case. Will be addressed in a separate
> >>>>   thread,
> >>>> - add st_rproc_tee_ops::parse_fw ops,
> >>>> - inverse call of devm_rproc_alloc()and tee_rproc_register() to manage cross
> >>>>   reference between the rproc struct and the tee_rproc struct in tee_rproc.c.
> >>>> ---
> >>>>  drivers/remoteproc/stm32_rproc.c | 60 +++++++++++++++++++++++++++++---
> >>>>  1 file changed, 56 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> >>>> index 8cd838df4e92..13df33c78aa2 100644
> >>>> --- a/drivers/remoteproc/stm32_rproc.c
> >>>> +++ b/drivers/remoteproc/stm32_rproc.c
> >>>> @@ -20,6 +20,7 @@
> >>>>  #include <linux/remoteproc.h>
> >>>>  #include <linux/reset.h>
> >>>>  #include <linux/slab.h>
> >>>> +#include <linux/tee_remoteproc.h>
> >>>>  #include <linux/workqueue.h>
> >>>>  
> >>>>  #include "remoteproc_internal.h"
> >>>> @@ -49,6 +50,9 @@
> >>>>  #define M4_STATE_STANDBY	4
> >>>>  #define M4_STATE_CRASH		5
> >>>>  
> >>>> +/* Remote processor unique identifier aligned with the Trusted Execution Environment definitions */
> >>>
> >>> Why is this the case?  At least from the kernel side it is possible to call
> >>> tee_rproc_register() with any kind of value, why is there a need to be any
> >>> kind of alignment with the TEE?
> >>
> >>
> >> The use of the proc_id is to identify a processor in case of multi co-processors.
> >>
> > 
> > That is well understood.
> > 
> >> For instance we can have a system with A DSP and a modem. We would use the same
> >> TEE service, but
> > 
> > That too.
> > 
> >> the TEE driver will probably be different, same for the signature key.
> > 
> > What TEE driver are we talking about here?
> 
> In OP-TEE remoteproc frameork is divided in 2 or  3 layers:
> 
> - the remoteproc Trusted Application (TA) [1] which is platform agnostic
> - The remoteproc Pseudo Trusted Application (PTA) [2] which is platform
> dependent and can rely on the proc ID to retrieve the context.
> - the remoteproc driver (optional for some platforms) [3], which is in charge
>  of DT parsing and platform configuration.
> 

That part makes sense.

> Here TEE driver can be interpreted by remote PTA and/or platform driver.
>

I have to guess PTA means "Platform Trusted Application" but I have no
guarantee, adding to the level of (already high) confusion brought on by this
patchset.

> [1]
> https://elixir.bootlin.com/op-tee/latest/source/ta/remoteproc/src/remoteproc_core.c
> [2]
> https://elixir.bootlin.com/op-tee/latest/source/core/pta/stm32mp/remoteproc_pta.c
> [3]
> https://elixir.bootlin.com/op-tee/latest/source/core/drivers/remoteproc/stm32_remoteproc.c
> 
> > 
> >> In such case the proc ID allows to identify the the processor you want to address.
> >>
> > 
> > That too is well understood, but there is no alignment needed with the TEE, i.e
> > the TEE application is not expecting a value of '0'.  We could set
> > STM32_MP1_M4_PROC_ID to 0xDEADBEEF and things would work.  This driver won't go
> > anywhere for as long as it is not the case.
> 
> 
> Here I suppose that you do not challenge the rproc_ID use in general, but for
> the stm32mp1 platform as we have only one remote processor. I'm right?

That is correct - I understand the need for an rproc_ID.  The problem is with
the comment that states that '0' is aligned with the TEE definitions, which in
my head means hard coded value and a big red flag.  What it should say is
"aligned with the TEE device tree definition". 

> 
> In OP-TEE the check is done here:
> https://elixir.bootlin.com/op-tee/latest/source/core/drivers/remoteproc/stm32_remoteproc.c#L64
> 
> If driver does not register the proc ID an error is returned indicating that the
> feature is not supported.
> 
> In case of stm32mp1 yes we could consider it as useless as we have only one
> remote proc.
> 
> Nevertheless I can not guaranty that a customer will not add an external
> companion processor that uses OP-TEE to authenticate the associated firmware. As
> the trusted Application is the unique entry point. he will need the proc_id to
> identify the target at PTA level.
> 
> So from my point of view having a proc ID on stm32MP1 (and on stm32mp2 that will
> reuse same driver) aligned between Linux and OP-TEE is useful.

I agree, for as long as it is not hard coded.  The way remote processors are
discovered in the DT is perfectly acceptable, i.e the first remote processor is
for application X, the second for application Y...

> 
> That said using a TEE_REMOTEPROC_DEFAULT_ID is something that could be
> more generic (for linux and OP-TEE). This ID could be reuse in the stm32mp
> driver and platform drivers with an unique internal remote processor.
> 

I can't find the definition of TEE_REMOTEPROC_DEFAULT_ID anywhere, something
that doesn't help the confusion I referred to above.

> It that solution would be ok for you?
> 
> Regards,
> Arnaud
> 
> 
> > 
> >>
> >>>
> >>>> +#define STM32_MP1_M4_PROC_ID    0
> >>>> +
> >>>>  struct stm32_syscon {
> >>>>  	struct regmap *map;
> >>>>  	u32 reg;
> >>>> @@ -257,6 +261,19 @@ static int stm32_rproc_release(struct rproc *rproc)
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> +static int stm32_rproc_tee_stop(struct rproc *rproc)
> >>>> +{
> >>>> +	int err;
> >>>> +
> >>>> +	stm32_rproc_request_shutdown(rproc);
> >>>> +
> >>>> +	err = tee_rproc_stop(rproc);
> >>>> +	if (err)
> >>>> +		return err;
> >>>> +
> >>>> +	return stm32_rproc_release(rproc);
> >>>> +}
> >>>> +
> >>>>  static int stm32_rproc_prepare(struct rproc *rproc)
> >>>>  {
> >>>>  	struct device *dev = rproc->dev.parent;
> >>>> @@ -693,8 +710,19 @@ static const struct rproc_ops st_rproc_ops = {
> >>>>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >>>>  };
> >>>>  
> >>>> +static const struct rproc_ops st_rproc_tee_ops = {
> >>>> +	.prepare	= stm32_rproc_prepare,
> >>>> +	.start		= tee_rproc_start,
> >>>> +	.stop		= stm32_rproc_tee_stop,
> >>>> +	.kick		= stm32_rproc_kick,
> >>>> +	.load		= tee_rproc_load_fw,
> >>>> +	.parse_fw	= tee_rproc_parse_fw,
> >>>> +	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
> >>>> +};
> >>>> +
> >>>>  static const struct of_device_id stm32_rproc_match[] = {
> >>>> -	{ .compatible = "st,stm32mp1-m4" },
> >>>> +	{.compatible = "st,stm32mp1-m4",},
> >>>> +	{.compatible = "st,stm32mp1-m4-tee",},
> >>>>  	{},
> >>>>  };
> >>>>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> >>>> @@ -853,6 +881,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>>>  	struct device *dev = &pdev->dev;
> >>>>  	struct stm32_rproc *ddata;
> >>>>  	struct device_node *np = dev->of_node;
> >>>> +	struct tee_rproc *trproc = NULL;
> >>>>  	struct rproc *rproc;
> >>>>  	unsigned int state;
> >>>>  	int ret;
> >>>> @@ -861,9 +890,26 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>>>  	if (ret)
> >>>>  		return ret;
> >>>>  
> >>>> -	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> >>>> -	if (!rproc)
> >>>> -		return -ENOMEM;
> >>>> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
> >>>> +		/*
> >>>> +		 * Delegate the firmware management to the secure context.
> >>>> +		 * The firmware loaded has to be signed.
> >>>> +		 */
> >>>> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
> >>>> +		if (!rproc)
> >>>> +			return -ENOMEM;
> >>>> +
> >>>> +		trproc = tee_rproc_register(dev, rproc, STM32_MP1_M4_PROC_ID);
> >>>> +		if (IS_ERR(trproc)) {
> >>>> +			dev_err_probe(dev, PTR_ERR(trproc),
> >>>> +				      "signed firmware not supported by TEE\n");
> >>>> +			return PTR_ERR(trproc);
> >>>> +		}
> >>>> +	} else {
> >>>> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> >>>> +		if (!rproc)
> >>>> +			return -ENOMEM;
> >>>> +	}
> >>>>  
> >>>>  	ddata = rproc->priv;
> >>>>  
> >>>> @@ -915,6 +961,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>>>  		dev_pm_clear_wake_irq(dev);
> >>>>  		device_init_wakeup(dev, false);
> >>>>  	}
> >>>> +	if (trproc)
> >>>
> >>>         if (rproc->tee_interface)
> >>>
> >>>
> >>> I am done reviewing this set.
> >>
> >> Thank for your review!
> >> Arnaud
> >>
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>> +		tee_rproc_unregister(trproc);
> >>>> +
> >>>>  	return ret;
> >>>>  }
> >>>>  
> >>>> @@ -935,6 +984,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
> >>>>  		dev_pm_clear_wake_irq(dev);
> >>>>  		device_init_wakeup(dev, false);
> >>>>  	}
> >>>> +	if (rproc->tee_interface)
> >>>> +		tee_rproc_unregister(rproc->tee_interface);
> >>>> +
> >>>>  }
> >>>>  
> >>>>  static int stm32_rproc_suspend(struct device *dev)
> >>>> -- 
> >>>> 2.25.1
> >>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
