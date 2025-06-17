Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C4BADCC6E
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jun 2025 15:05:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76CB5C36B27;
	Tue, 17 Jun 2025 13:05:13 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE144C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jun 2025 13:05:11 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55HD4OSn014423;
 Tue, 17 Jun 2025 08:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1750165464;
 bh=bMoUi4cuL4Udgs4T48YUDRqAwuLLsrWE2yiMKniBN8Q=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=iOPUzq/Wv/zVI915DrZDgofpMJTW9L4QqExXTyKz1FejMUYdWg4LQ/AHhrXt7ypdb
 ktgvBsoWBF5nZCatCoTKHFpjX0J0tzQU3MKo2tEH9srz0Ss8BC2Y2Hw36TNwC8Qor/
 nscAi77V/8rxjryCvbG/6ddP6GJoiuDrQEZc7Alk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55HD4OA53625511
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 17 Jun 2025 08:04:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 17
 Jun 2025 08:04:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 17 Jun 2025 08:04:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55HD4O6R1941963;
 Tue, 17 Jun 2025 08:04:24 -0500
Date: Tue, 17 Jun 2025 08:04:23 -0500
From: Nishanth Menon <nm@ti.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Message-ID: <20250617130423.nrqcprlpdxdmddbo@truck>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-10-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611104348.192092-10-jirislaby@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tero Kristo <kristo@kernel.org>, imx@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Santosh Shilimkar <ssantosh@kernel.org>, tglx@linutronix.de,
 Fabio Estevam <festevam@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] irqchip: Use dev_fwnode()
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

On 12:43-20250611, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> 
> ---
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/irqchip/irq-imgpdc.c              | 2 +-
>  drivers/irqchip/irq-imx-irqsteer.c        | 2 +-
>  drivers/irqchip/irq-keystone.c            | 4 ++--
>  drivers/irqchip/irq-mvebu-pic.c           | 2 +-
>  drivers/irqchip/irq-pruss-intc.c          | 2 +-
>  drivers/irqchip/irq-renesas-intc-irqpin.c | 6 ++----
>  drivers/irqchip/irq-renesas-irqc.c        | 2 +-
>  drivers/irqchip/irq-renesas-rza1.c        | 5 ++---
>  drivers/irqchip/irq-renesas-rzg2l.c       | 5 ++---
>  drivers/irqchip/irq-renesas-rzv2h.c       | 2 +-
>  drivers/irqchip/irq-stm32mp-exti.c        | 4 +---
>  drivers/irqchip/irq-ti-sci-inta.c         | 3 +--
>  drivers/irqchip/irq-ti-sci-intr.c         | 3 +--
>  drivers/irqchip/irq-ts4800.c              | 2 +-
>  14 files changed, 18 insertions(+), 26 deletions(-)
> 

[..]


> diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
> index 7de59238e6b0..01963d36cfaf 100644
> --- a/drivers/irqchip/irq-ti-sci-inta.c
> +++ b/drivers/irqchip/irq-ti-sci-inta.c
> @@ -701,8 +701,7 @@ static int ti_sci_inta_irq_domain_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	domain = irq_domain_create_linear(of_fwnode_handle(dev_of_node(dev)),
> -					  ti_sci_get_num_resources(inta->vint),
> +	domain = irq_domain_create_linear(dev_fwnode(dev), ti_sci_get_num_resources(inta->vint),
>  					  &ti_sci_inta_irq_domain_ops, inta);
>  	if (!domain) {
>  		dev_err(dev, "Failed to allocate IRQ domain\n");
> diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
> index 07fff5ae5ce0..354613e74ad0 100644
> --- a/drivers/irqchip/irq-ti-sci-intr.c
> +++ b/drivers/irqchip/irq-ti-sci-intr.c
> @@ -274,8 +274,7 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
>  		return PTR_ERR(intr->out_irqs);
>  	}
>  
> -	domain = irq_domain_create_hierarchy(parent_domain, 0, 0,
> -					     of_fwnode_handle(dev_of_node(dev)),
> +	domain = irq_domain_create_hierarchy(parent_domain, 0, 0, dev_fwnode(dev),
>  					     &ti_sci_intr_irq_domain_ops, intr);
>  	if (!domain) {
>  		dev_err(dev, "Failed to allocate IRQ domain\n");

[..]
For the ti-sci irqchip drivers:

Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
