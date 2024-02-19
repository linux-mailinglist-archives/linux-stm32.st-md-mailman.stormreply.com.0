Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE3685A5C8
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 15:22:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70464C69063;
	Mon, 19 Feb 2024 14:22:36 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AE65C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 14:22:35 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1708352554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8iEgdflkmZKXImf680lz4hgFumtn+q/R0YDjSc4t/Vc=;
 b=4upGx7kJ727A884ML4hUkx8C8e9g9smfQg662DB+Eql0qhnTPCpSxSOyFEBVeuIEZl3D2x
 lifGEA6YdZDxZ3NATNyidGIV9C47gWKE1F+bi+RMUbfG6GS5JyQqSU1eF7ydP141pP96cO
 Ejs2/ZFtgYFx6xD+cXA+D6dF14bXZ1Bzog1pajHS8HEuh3FLJOXqNLOya45j2829Og2LQV
 KSVySQTHgr2Cwbsv/m17DEgTr0sZup4bsdHay2QH+ElPRfgphVBLWy8FzODQOHxWfmARqj
 +TEWoE/Dyg9x3UBjG4oHCdTBdpxv3lEZlgWMKlBfaLh5q6Id5RObd4Dpti1oRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1708352554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8iEgdflkmZKXImf680lz4hgFumtn+q/R0YDjSc4t/Vc=;
 b=4+9ecyFEBiX9R65rg3DVI+yqWFudZBvINi2tHB1FDWo7lijLMJysfGElaqbRllJylJYfxs
 KB6fhvkKSS/LqXBg==
To: Antonio Borneo <antonio.borneo@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
In-Reply-To: <20240216094758.916722-4-antonio.borneo@foss.st.com>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
 <20240216094758.916722-4-antonio.borneo@foss.st.com>
Date: Mon, 19 Feb 2024 15:22:34 +0100
Message-ID: <87a5nwa5zp.ffs@tglx>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 03/12] irqchip/stm32-exti: Map interrupts
 through interrupt nexus node
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

On Fri, Feb 16 2024 at 10:47, Antonio Borneo wrote:
> diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
> index 69982f21126a..95bb3dd10b2c 100644
> --- a/drivers/irqchip/irq-stm32-exti.c
> +++ b/drivers/irqchip/irq-stm32-exti.c
> @@ -61,6 +61,7 @@ struct stm32_exti_host_data {
>  	struct stm32_exti_chip_data *chips_data;
>  	const struct stm32_exti_drv_data *drv_data;
>  	struct hwspinlock *hwlock;
> +	struct device_node *irq_map_node;

Please keep variable declarations ordered in reverse fir tree layout:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

>  };
>  
>  static struct stm32_exti_host_data *stm32_host_data;
> @@ -713,8 +714,9 @@ static int stm32_exti_h_domain_alloc(struct irq_domain *dm,
>  	u8 desc_irq;
>  	struct irq_fwspec *fwspec = data;
>  	struct irq_fwspec p_fwspec;
> +	struct of_phandle_args out_irq;

Please move this into the condition path where it is actually used.

>  	irq_hw_number_t hwirq;
> -	int bank;
> +	int bank, ret;
>  	u32 event_trg;
>  	struct irq_chip *chip;
>  
> @@ -731,6 +733,25 @@ static int stm32_exti_h_domain_alloc(struct irq_domain *dm,
>  
>  	irq_domain_set_hwirq_and_chip(dm, virq, hwirq, chip, chip_data);
>  
> +	if (host_data->irq_map_node) {
> +		out_irq.np = host_data->irq_map_node;

Thanks,

        tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
