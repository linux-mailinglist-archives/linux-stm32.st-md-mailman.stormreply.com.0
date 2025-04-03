Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7942FA7A730
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Apr 2025 17:43:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 247B5C78F85;
	Thu,  3 Apr 2025 15:43:54 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5F14C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 15:43:53 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1743695032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zw2Q8IErZl7b2iE4osU+g+AbXrA3g7lMnn18YWn6OGA=;
 b=dFWiJT0FPb501rI4xZxAByeZrueh0d+1tmsohsU10/skaN4SqFYNYnNUBrxpwGfwv6ZgFe
 sRGiTo7ylfSy8Ansnahrr1ZZ/GGkol94OFKkcdGM6NI6cZg0b3rzO+I8Cx/6v/yUkgQza0
 lT9KtmHQ61kb1AX+T8hP4C/RMdBbpv+jJFqYMR9t47lLg+ao9k9Gh9sl5n8MaRm3bmf2Jv
 tqp7J++dTsLFYelx0UX0mA5+w06DJY45qs/FCA6WG1SKALnZZrs7LeN5kJzhbRBFQdHevE
 HpJIUFwbhOtGkX4c3pD1LyWqRZEy7x/rNBcowLk0kP0k5KGjgmtsQpWuLiF6Zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1743695032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zw2Q8IErZl7b2iE4osU+g+AbXrA3g7lMnn18YWn6OGA=;
 b=v8VAC7w3EX8v79DHy2WTqiCxnEnOI+yD68u3RIJprG8VcGaUoghq9uoYwhGbQp8UrheL3f
 SKmG2quvzSHdxNBg==
To: Christian Bruel <christian.bruel@foss.st.com>, maz@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
In-Reply-To: <20250403122805.1574086-3-christian.bruel@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
 <20250403122805.1574086-3-christian.bruel@foss.st.com>
Date: Thu, 03 Apr 2025 17:43:52 +0200
Message-ID: <87mscxuu6f.ffs@tglx>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Christian Bruel <christian.bruel@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/3] irqchip/gic: Use 0x10000 offset to
 access GICC_DIR on STM32MP2
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

On Thu, Apr 03 2025 at 14:28, Christian Bruel wrote:

> When GIC_4KNOT64K bit in the GIC configuration register is
> 0 (64KB), address block is modified in such a way than only the

s/than/that/

> first 4KB of the GIC cpu interface are accessible with default
> offsets.
> With this bit mapping GICC_DIR register is accessible at

What's 'this bit mapping' ? This sentence does not parse.

> offset 0x10000 instead of 0x1000, thus remap accordingly

...

> +/*
> + * 8kB GICC range is not accessible with the default 4kB translation
> + * granule. 0x1000 offset is accessible at 64kB translation.
> + */

I have a hard time to map this comment to the change log, which suggests
to me that this is the other way round.

> +static bool gic_8kbaccess(void *data)
> +{
> +	struct gic_chip_data *gic = data;
> +	void __iomem *alt;
> +
> +	if (!is_hyp_mode_available())
> +		return false;
> +
> +	alt = ioremap(gic->cpu_phys_base, GIC_STM32MP2_CPU_DEACTIVATE + 4);
> +	if (!alt) {
> +		pr_err("Unable to remap GICC_DIR register\n");
> +		return false;

That's a hack because in case that the remap fails, this leaves the
thing enabled, but disfunctional.

Thanks,

        tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
