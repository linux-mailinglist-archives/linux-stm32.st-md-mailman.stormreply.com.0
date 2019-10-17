Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C964CDA728
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2019 10:23:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8552DC36B0B;
	Thu, 17 Oct 2019 08:23:54 +0000 (UTC)
Received: from inca-roads.misterjones.org (inca-roads.misterjones.org
 [213.251.177.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACB13C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2019 08:23:51 +0000 (UTC)
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1iL14J-0002NX-Lg; Thu, 17 Oct 2019 10:23:35 +0200
To: Daode Huang <huangdaode@hisilicon.com>
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Date: Thu, 17 Oct 2019 09:23:34 +0100
From: Marc Zyngier <maz@kernel.org>
In-Reply-To: <1571296423-208359-1-git-send-email-huangdaode@hisilicon.com>
References: <1571296423-208359-1-git-send-email-huangdaode@hisilicon.com>
Message-ID: <9bbcce19c777583815c92ce3c2ff2586@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: huangdaode@hisilicon.com, jason@lakedaemon.net,
 andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
 tglx@linutronix.de, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 nm@ti.com, t-kristo@ti.com, ssantosh@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
Cc: nm@ti.com, andrew@lunn.ch, jason@lakedaemon.net,
 gregory.clement@bootlin.com, linux-kernel@vger.kernel.org, t-kristo@ti.com,
 mcoquelin.stm32@gmail.com, ssantosh@kernel.org, tglx@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 sebastian.hesselbarth@gmail.com
Subject: Re: [Linux-stm32]
	=?utf-8?q?=5BPATCH=5D_use_devm=5Fplatform=5Fioremap?=
	=?utf-8?q?=5Fresource=28=29_for_irqchip_drivers?=
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 2019-10-17 08:13, Daode Huang wrote:
> From: Daode Huang <huangdaode@hislicon.com>
>
> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together
>
> Signed-off-by: Daode Huang <huangdaode@hislicon.com>
> ---
>  drivers/irqchip/irq-mvebu-icu.c   | 3 +--
>  drivers/irqchip/irq-mvebu-pic.c   | 3 +--
>  drivers/irqchip/irq-stm32-exti.c  | 3 +--
>  drivers/irqchip/irq-ti-sci-inta.c | 3 +--
>  drivers/irqchip/irq-ts4800.c      | 3 +--
>  5 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/irqchip/irq-mvebu-icu.c
> b/drivers/irqchip/irq-mvebu-icu.c
> index 547045d..ddf9b0d 100644
> --- a/drivers/irqchip/irq-mvebu-icu.c
> +++ b/drivers/irqchip/irq-mvebu-icu.c
> @@ -357,8 +357,7 @@ static int mvebu_icu_probe(struct platform_device 
> *pdev)
>
>  	icu->dev = &pdev->dev;
>
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	icu->base = devm_ioremap_resource(&pdev->dev, res);
> +	icu->base = devm_platform_ioremap_resource(pdev, res);

void __iomem *devm_platform_ioremap_resource(struct platform_device 
*pdev,
                                              unsigned int index)

What could possibly go wrong? I'd suggest you start compiling (and 
possibly
testing) the code you change before sending patches...

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
