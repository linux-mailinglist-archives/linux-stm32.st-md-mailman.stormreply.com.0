Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIdeBDLyeGmGuAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 18:13:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B63984D2
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 18:13:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42AACC555BE;
	Tue, 27 Jan 2026 17:13:21 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2010AC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 17:13:20 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a7bceb6cd0so46486145ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 09:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769533998; x=1770138798;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=agfJUc5KsSJBcH21DdIZrBPenVYNGLTuQIkxtglloIs=;
 b=wGhHlqnyZ11POQ1O/pNv100JYBR26VQTOPmQ2nkNhnBwOVqKcs2n2IAnJAut4t86a4
 YjofRKooxshB5mOa6JGbYXmbnROi+3L0PVHLmk+sGdk+cJnrCHAeUDIaYY0eeuZ0qab8
 GOIi97r6X5P0IqM7uJ/dVcz4rFvzClp1oDRiklWmcE2UmnxPTrB2+LKq8sEStaP5gNDF
 B6w5mgifU43uJxumDTlPt97JIgVyB4EgDAsFrc9wWnoeNeM32y6aIrD23Imxb7DVC48X
 +Q+uwZZBRJIgB/UHO9bLLG2HEdm5VxKCAiBSTbNc61fzBMIu/L2MDBME+sdbS0ONMt/k
 rpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769533998; x=1770138798;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agfJUc5KsSJBcH21DdIZrBPenVYNGLTuQIkxtglloIs=;
 b=C8gbCVSwbD59faUGnySOG12LJI8nN2U3ERpIprmpsng2bPuUa2UA6UkM9iMsPS7rb4
 JVE8OJGbAjKMQJ//OtDNyEi1DSr5g1bExgOiFQjFTp9IE8rzX3G7rxLpUrf0MOfhlh0n
 NBMQm/Bz15/jPorvSeQnzcuYeD6rO2annGkowM8c9gqMldLJkyZHt34V0GpEctSI2y79
 4FemZ5MjBzvpUZyN31+C1kNrJxc3Pf2YIhKrTeCJcF3UQDaUaTrdv8mvRAhImUAYg6HH
 k4N64sq4+4oilMMH6+yj/1W8O4zpBQfrQAAXnU6HxQwYQqsqhhhB8xod/02fb20pGK5i
 5wOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9xOdZRWl8NrzuqBT5xgvnzjC6VljWcDPb3ZKNL42svZ6Xkl4DkiljYlT3A3tLArBkl/qZn67aMn0qSQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzdk5KSwOF4pp0ajPC2CKX7InRVXt9VTmyV+bNy5zMKgAAfdFL/
 uQq5ASzMJ0i/PriZnYYnoxecRz1t3YGIONdJNblHmWELCsoPS650L/pQ/nd9i3vMJaQ=
X-Gm-Gg: AZuq6aIBbn77ZH/aU+lTJKktC9/qVNN2UPW1oEXHTnLPHl8euJ1GS8Nnkv/3jHbUCo1
 7IlBJv4prwqRkgHsh6eJMbkVB3OyogOZ6cRzDm4+wiGm+2N1ElmVSNy0kIzGOYi2ee1ClJfyf9J
 YMEjBJDAnmdvc6k1Pwl+Mq74o8r2qLuMKd+1VgDIpO+8Mm4By4R6XuknQycOxLu8QaCphifZiqr
 s2J8NivUlHhS7stTR3rD27Xn8LXap3sgBfXHLjfHNaKZq75hap8qp1vjXhb/pRnYCbWf356UwXz
 u8eiCGaPDQcgJYvGua/wZCOsMHUGrcF5T8qlqkoTJfmmGCeo43zhrD4zWzKqdf0qTTx7LGAaM1j
 2jugGAOooTfgWUXjfYIt7LXUZv0ikK4SNFgiMt/ttrYRs3nL/Fh+HkpOkLS9U5Z/Ek5ulwkyS4D
 +gwiPtAWuchUJTlw==
X-Received: by 2002:a17:903:4b07:b0:2a0:c1fc:3de5 with SMTP id
 d9443c01a7336-2a870de57c6mr17694475ad.51.1769533998175; 
 Tue, 27 Jan 2026 09:13:18 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:89d2:9516:bf0b:fe8e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a802daa66asm121765205ad.9.2026.01.27.09.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 09:13:17 -0800 (PST)
Date: Tue, 27 Jan 2026 10:13:15 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <aXjyKzINfpwkv2Fi@p14s>
References: <20260127130555.3211411-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127130555.3211411-1-arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH] remoteproc: core: support fixed
 device index from DT aliases
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnaud.pouliquen@foss.st.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[linaro.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email]
X-Rspamd-Queue-Id: A8B63984D2
X-Rspamd-Action: no action

Good morning,

On Tue, Jan 27, 2026 at 02:05:55PM +0100, Arnaud Pouliquen wrote:
> On systems with multiple remote processors, the remoteproc device
> enumeration is not stable as it depends on the probe ordering.
> As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
> always refer to the same remote processor instance, which complicates
> userspace applications.
> 
> Inspired by the SPI implementation, this commit allows board-specific
> numbering to be defined in device tree while still supporting dynamically
> registered remote processors.
> 
> For instance, on STM32MP25 Soc this can be used by defining:
> 
>     aliases {
>         remoteproc0 = &m33_rproc;
>         remoteproc1 = &m0_rproc;
>     };
> 
> When a "remoteproc<x>" DT alias is present, use it to assign a fixed
> "/sys/class/remoteproc/remoteproc<x>" entry.
> If no remoteproc alias is defined, keep the legacy index allocation.
> If only some remoteproc instances have an alias, allocate dynamic
> index starting after the highest alias index declared.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Notes:
> 
> - This patch is submitted as an RFC in this first version.
>   The main reason is that support for the Cortex-M33 and Cortex-M0 on
>   the STM32MP25 SoC is not yet upstream. The primary objective is to
>   trigger discussion on the concept; if there is agreement, I can drop
>   the RFC tag in a next version.

I think this is a good idea.

> 
> - The keystone_remoteproc driver also uses DT aliases. As it uses the
>   "rproc" alias only to construct the firmware name, it should remain
>   compatible with this change.

But we won't have "rproc" and "remoteproc" as aliases - it will have to be the
former since TI is already using it.  I also suggest doing a #define in
include/linux/remoteproc.h.  There is a possibility for backward compatibility
issues but we'll have to let the feature in next long enough to find out.

> ---
>  drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index aada2780b343..8da6c410870a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2461,6 +2461,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  			  const char *firmware, int len)
>  {
>  	struct rproc *rproc;
> +	int index = -ENODEV;
> +	int first_dynamic;
>  
>  	if (!dev || !name || !ops)
>  		return NULL;
> @@ -2481,8 +2483,27 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->dev.driver_data = rproc;
>  	idr_init(&rproc->notifyids);
>  
> -	/* Assign a unique device index and name */
> -	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);

        rproc->index = rproc_get_index(dev);

> +	/*
> +	 * Assign a unique device index and name
> +	 * Look for a static index coming from the "remoteproc" DT alias
> +	 * (e.g. "remoteproc0"). If none is found, start allocating
> +	 * dynamic IDs after the highest alias in use.
> +	 */
> +	if (dev->of_node)
> +		index = of_alias_get_id(dev->of_node, "remoteproc");
> +	if (index < 0) {
> +		first_dynamic = of_alias_get_highest_id("remoteproc");
> +		if (first_dynamic < 0)
> +			first_dynamic = 0;
> +		else
> +			first_dynamic++;
> +		rproc->index = ida_alloc_range(&rproc_dev_index, first_dynamic,
> +					       ~0, GFP_KERNEL);
> +	} else {
> +		rproc->index = ida_alloc_range(&rproc_dev_index, index,
> +					       index, GFP_KERNEL);
> +	}
> +

I find the above hard to read and even harder to maintain.  I suggest spinning
off a new function as depicted here:


>>>>>>>>>>>>>>>
/*
 * Assign a unique device index and name
 * Look for a static index coming from the "rproc" DT alias
 * (e.g. "rproc0"). If none is found, start allocating
 * dynamic IDs after the highest alias in use.
 */
static int rproc_get_index(struct device *dev)
{
        int index;

        /* No DT to deal with */
        if (!dev->of_node)
                goto legacy;

        /* See if an alias has been assigned to this remoteproc */
        index = of_alias_get_id(dev->of_node, RPROC_ALIAS);
        if (index >= 0)
                return index; 

        /*
         * No alias has been assigned to this remoteproc.  See if any
         * "rproc" aliases have been assigned and start allocating after
         * the highest one if it is the case.
         */ 
        index = of_alias_get_highest_id(RPROC_ALIAS);
        if (index >= 0)
                return = ida_alloc_range(&rproc_dev_index, index + 1,
                                         ~0, GFP_KERNEL);

legacy:
        return ida_alloc(&rproc_dev_index, GFP_KERNEL);
}
<<<<<<<<<<<<<<<



>  	if (rproc->index < 0) {
>  		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
>  		goto put_device;
> 
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
