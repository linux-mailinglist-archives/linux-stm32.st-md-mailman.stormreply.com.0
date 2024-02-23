Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6CC861BD8
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 19:37:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F9B4C6B47E;
	Fri, 23 Feb 2024 18:37:34 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E48FDC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 18:37:33 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1dc75972f25so4718595ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 10:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708713452; x=1709318252;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KZoiqAY2Uur/aGWMy2naDtSDhhq1uQ0pWzfI5wkuDOg=;
 b=Bswga0dAtizFupUt6C5PXWnb6H10xCaIMcprfSJIqnbTqoAHnxEFHrxAY/NF3KozF2
 6VwmgwX1cermeRrilkZpxZMPuYTNt4XGdcB2vBzFuWtuGNtowoHrTMxUBZ0viwxee2EA
 Jnm7wDgrGAjbOOCawskl7PYUv+gga5bt3fI0eUGUzYWS1H59HC1/Wb5vOeXzEVYDg8td
 RLNkYYxQaNs6lyiTKPi5HT9RNQxMtHAn+SyOGudSqsZi+GoORdG9Uo7fY/dzAqJ6Xfbr
 O5SKbm9BBsVD06DPAk81M2oMGw5Y6S/wTGw3LGbHssWuswe4H+tPiBB7C+IyB9YcpzqU
 gGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708713452; x=1709318252;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZoiqAY2Uur/aGWMy2naDtSDhhq1uQ0pWzfI5wkuDOg=;
 b=NFiY2Y4LaXDZtN2MrCibJSTCBFgI4AeWNJoTiwY+iFuWoRr+X72yt+/leipn9CVaGd
 0pklP2neQyWFOrf+L9JIqs9P4zr7e82BQfhkBl0A7TVsBoegBdsTLrXFOVMar2Pbe5Dr
 56NAmAmnacuSwMcqItDHzG2qdv7eXSdzP2/1ff7TG9KQc/Xfhn6PS3YFFfVEBpTn0GWq
 kZVluI4Xo7SfswLtmz33VTyru6EjNbf74BR8k9YpMRb0CWR/Ssqfz+8RLng5f3WKMHum
 g2BK+lzjtIcyMZCth7fZ44d8RjlVMozdDfTs3auT6rbxbsjOY4QUL23wLvydkdySRJuT
 9/Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFhHJhAGQ/qEZAR/kpwmK+5zvLlA4QKGp+8pdPGoJEiiYat8XjuIIGlw68oLj8RSUPTIRC62Qvn93UqfFrhF/yGCB2Gqv8wzxT5EkbYF1LmQfJ86CuHa6L
X-Gm-Message-State: AOJu0YztU25mPlTBUjanFuC0eiXFlgRoEDWL9WF5BKlCeikJoAa0ktFP
 jRsOK+O6M4rOi2uXVyO2EH+zI25gnIsffRdERDY2+4i1vnV7KaZYyyhE8v9tdkk=
X-Google-Smtp-Source: AGHT+IEFnq/adSWGsq0T7PG+TvSPinae6jkrUQ6p7/FCofH5i6KR3wHNsGv2ykbTotKDS+HU96hvow==
X-Received: by 2002:a17:902:c146:b0:1dc:5ae8:174c with SMTP id
 6-20020a170902c14600b001dc5ae8174cmr624284plj.17.1708713452286; 
 Fri, 23 Feb 2024 10:37:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a9ba:9d9e:b797:23f1])
 by smtp.gmail.com with ESMTPSA id
 kb6-20020a170903338600b001db5bdd5e3bsm12042829plb.13.2024.02.23.10.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 10:37:31 -0800 (PST)
Date: Fri, 23 Feb 2024 11:37:29 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <Zdjl6Z2ktTwi+oWp@p14s>
References: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
 <20240214172127.1022199-8-arnaud.pouliquen@foss.st.com>
 <ZdeaUGpWlqGOG31u@p14s>
 <609373ba-c81d-4aee-81cb-8628e2c6897b@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <609373ba-c81d-4aee-81cb-8628e2c6897b@foss.st.com>
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

On Fri, Feb 23, 2024 at 02:54:13PM +0100, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 2/22/24 20:02, Mathieu Poirier wrote:
> > Hi,
> > 
> > On Wed, Feb 14, 2024 at 06:21:27PM +0100, Arnaud Pouliquen wrote:
> >> The new TEE remoteproc device is used to manage remote firmware in a
> >> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> >> introduced to delegate the loading of the firmware to the trusted
> >> execution context. In such cases, the firmware should be signed and
> >> adhere to the image format defined by the TEE.
> >>
> >> A new "to_attach" field is introduced to differentiate the use cases
> >> "firmware loaded by the boot stage" and "firmware loaded by the TEE".
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >> V2 to V3 update:
> >> - remove stm32_rproc_tee_elf_sanity_check(), stm32_rproc_tee_elf_load()
> >>   stm32_rproc_tee_elf_find_loaded_rsc_table() and  stm32_rproc_tee_start() that are bnow unused
> >> - use new rproc::alt_boot field to sepcify that the alternate fboot method is used
> >> - use stm32_rproc::to_attach field to differenciate attch mode from remoteproc tee boot mode.
> >> - remove the used of stm32_rproc::fw_loaded
> >> ---
> >>  drivers/remoteproc/stm32_rproc.c | 85 +++++++++++++++++++++++++++++---
> >>  1 file changed, 79 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> >> index fcc0001e2657..9cfcf66462e0 100644
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
> >> +	bool to_attach;
> >> +	struct tee_rproc *trproc;
> >>  	void __iomem *rsc_va;
> >>  };
> >>  
> >> @@ -253,10 +259,30 @@ static int stm32_rproc_release(struct rproc *rproc)
> >>  			return err;
> >>  		}
> >>  	}
> >> +	ddata->to_attach = false;
> >>  
> >>  	return err;
> >>  }
> >>  
> >> +static int stm32_rproc_tee_attach(struct rproc *rproc)
> >> +{
> >> +	/* Nothing to do, remote proc already started by the secured context. */
> >> +	return 0;
> >> +}
> >> +
> >> +static int stm32_rproc_tee_stop(struct rproc *rproc)
> >> +{
> >> +	int err;
> >> +
> >> +	stm32_rproc_request_shutdown(rproc);
> >> +
> >> +	err = tee_rproc_stop(rproc);
> >> +	if (err)
> >> +		return err;
> >> +
> >> +	return stm32_rproc_release(rproc);
> >> +}
> >> +
> >>  static int stm32_rproc_prepare(struct rproc *rproc)
> >>  {
> >>  	struct device *dev = rproc->dev.parent;
> >> @@ -637,10 +663,14 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
> >>  {
> >>  	struct stm32_rproc *ddata = rproc->priv;
> >>  	struct device *dev = rproc->dev.parent;
> >> +	struct tee_rproc *trproc = ddata->trproc;
> >>  	phys_addr_t rsc_pa;
> >>  	u32 rsc_da;
> >>  	int err;
> >>  
> >> +	if (trproc && !ddata->to_attach)
> >> +		return tee_rproc_get_loaded_rsc_table(rproc, table_sz);
> >> +
> > 
> > Why do we need a flag at all?  Why can't st_rproc_tee_ops::get_loaded_rsc_table
> > be set to tee_rproc_get_loaded_rsc_table()?
> 
> 
> This function is used to retrieve the address of the resource table in 3 cases
> - attach to a firmware started by the boot loader (U-boot).
> - load of the firmware by OP-TEE.
> - crash recovery on a signed firmware started by the boot loader.
> 
> The flag is used to differentiate the attch from the other uses cases
> For instance we support this use case.
> 1) attach to the firmware on boot
> 2) crash during runtime
>   2a) stop the firmware by OP-TEE( ddata->to_attach set to 0)
>   2b) load the firmware by OP-TEE
>   2c) get the loaded resource table from OP-TEE (we can not guaranty
>       that the firmware loaded on recovery is the same)
>   2d) restart the firmware by OP-TEE

This is not maintainable and needs to be broken down into smaller
building blocks.  The introduction of tee_rproc_parse_fw() should help dealing
with some of the complexity.

> 
> > 
> >>  	/* The resource table has already been mapped, nothing to do */
> >>  	if (ddata->rsc_va)
> >>  		goto done;
> >> @@ -693,8 +723,20 @@ static const struct rproc_ops st_rproc_ops = {
> >>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >>  };
> >>  
> >> +static const struct rproc_ops st_rproc_tee_ops = {
> >> +	.prepare	= stm32_rproc_prepare,
> >> +	.start		= tee_rproc_start,
> >> +	.stop		= stm32_rproc_tee_stop,
> >> +	.attach		= stm32_rproc_tee_attach,
> >> +	.kick		= stm32_rproc_kick,
> >> +	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
> >> +	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
> >> +	.load		= tee_rproc_load_fw,
> >> +};
> >> +
> >>  static const struct of_device_id stm32_rproc_match[] = {
> >> -	{ .compatible = "st,stm32mp1-m4" },
> >> +	{.compatible = "st,stm32mp1-m4",},
> >> +	{.compatible = "st,stm32mp1-m4-tee",},
> >>  	{},
> >>  };
> >>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> >> @@ -853,6 +895,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>  	struct device *dev = &pdev->dev;
> >>  	struct stm32_rproc *ddata;
> >>  	struct device_node *np = dev->of_node;
> >> +	struct tee_rproc *trproc = NULL;
> >>  	struct rproc *rproc;
> >>  	unsigned int state;
> >>  	int ret;
> >> @@ -861,12 +904,33 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> >> -	if (!rproc)
> >> -		return -ENOMEM;
> > 
> > This patch doesn't apply to rproc-next - please rebase.
> 
> Yes, sure. I forgot to mention in my cover letter that my series has been
> applied and tested on 841c35169323 (Linux 6.8-rc4).
> 
> > 
> > 
> >> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
> >> +		/*
> >> +		 * Delegate the firmware management to the secure context.
> >> +		 * The firmware loaded has to be signed.
> >> +		 */
> >> +		trproc = tee_rproc_register(dev, STM32_MP1_M4_PROC_ID);
> >> +		if (IS_ERR(trproc)) {
> >> +			dev_err_probe(dev, PTR_ERR(trproc),
> >> +				      "signed firmware not supported by TEE\n");
> >> +			return PTR_ERR(trproc);
> >> +		}
> >> +	}
> >>  
> >> -	ddata = rproc->priv;
> >> +	rproc = rproc_alloc(dev, np->name,
> >> +			    trproc ? &st_rproc_tee_ops : &st_rproc_ops,
> >> +			    NULL, sizeof(*ddata));
> >> +	if (!rproc) {
> >> +		ret = -ENOMEM;
> >> +		goto free_tee;
> >> +	}
> >>  
> >> +	ddata = rproc->priv;
> >> +	ddata->trproc = trproc;
> > 
> > My opinion hasn't changed from the previous patchet, i.e tee_rproc should be
> > folded in struct rproc as rproc::tee_interface.
> 
> Sure, I will do it in next version
> 
> > 
> > More comments to come shortly...
> > 
> 
> Thanks!
> Arnaud
> 
> >> +	if (trproc) {
> >> +		rproc->alt_boot = true;
> >> +		trproc->rproc = rproc;
> >> +	}
> >>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> >>  
> >>  	ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
> >> @@ -881,8 +945,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		goto free_rproc;
> >>  
> >> -	if (state == M4_STATE_CRUN)
> >> +	if (state == M4_STATE_CRUN) {
> >>  		rproc->state = RPROC_DETACHED;
> >> +		ddata->to_attach = true;
> >> +	}
> >>  
> >>  	rproc->has_iommu = false;
> >>  	ddata->workqueue = create_workqueue(dev_name(dev));
> >> @@ -916,6 +982,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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
> >> @@ -923,6 +993,7 @@ static void stm32_rproc_remove(struct platform_device *pdev)
> >>  {
> >>  	struct rproc *rproc = platform_get_drvdata(pdev);
> >>  	struct stm32_rproc *ddata = rproc->priv;
> >> +	struct tee_rproc *trproc = ddata->trproc;
> >>  	struct device *dev = &pdev->dev;
> >>  
> >>  	if (atomic_read(&rproc->power) > 0)
> >> @@ -937,6 +1008,8 @@ static void stm32_rproc_remove(struct platform_device *pdev)
> >>  		device_init_wakeup(dev, false);
> >>  	}
> >>  	rproc_free(rproc);
> >> +	if (trproc)
> >> +		tee_rproc_unregister(trproc);
> >>  }
> >>  
> >>  static int stm32_rproc_suspend(struct device *dev)
> >> -- 
> >> 2.25.1
> >>
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
