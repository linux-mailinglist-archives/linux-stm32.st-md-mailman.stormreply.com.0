Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D59B98BC
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 20:35:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95969C78013;
	Fri,  1 Nov 2024 19:35:38 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECC33C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 19:35:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6DB94A44C27;
 Fri,  1 Nov 2024 19:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F887C4CECE;
 Fri,  1 Nov 2024 19:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730489730;
 bh=LBcJYTB6WIbJ8DlAwG7hImL3BwFHDAgo02896nLj1Z4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLbv6Uxxo8SQJm21791wg19EUL58H9utdxxI+OA95m+CsTNwB6++xU/9/m0/hprGj
 FtqxO722j/ulpty5c1g+TzF8YdjdDro98e1zAlPeEFWLLAoCn6+7UtlhGuTleLfpso
 eNscequJtH3HGY/7k19sz42uhTZQvG1XdBRIiJQkwDctN219TGQ688tmK/8/jJDeB6
 xnNdv9hOxEvaQG6/wx9hM3wkaPEmADMC08UUYZweW3oo+foHodWykfrMiOYhGHEePi
 AtOY5QHqt93iRsKHseckQw7hxrXvT4v+rFXiusKwK4RQ3t7F4tl9ow6gg6MF6Cun/f
 Ly6v514duNndA==
Date: Fri, 1 Nov 2024 14:35:28 -0500
From: Rob Herring <robh@kernel.org>
To: Lothar Rubusch <l.rubusch@gmail.com>
Message-ID: <20241101193528.GA4067749-robh@kernel.org>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
 <20241029202349.69442-12-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241029202349.69442-12-l.rubusch@gmail.com>
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 11/23] net: stmmac: add support for
	dwmac 3.72a
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

On Tue, Oct 29, 2024 at 08:23:37PM +0000, Lothar Rubusch wrote:
> The dwmac 3.72a is an ip version that can be found on Intel/Altera Arria10
> SoCs. Going by the hardware features "snps,multicast-filter-bins" and
> "snps,perfect-filter-entries" shall be supported. Thus add a
> compatibility flag, and extend coverage of the driver for the 3.72a.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c   | 1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> index 598eff926..b9218c07e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> @@ -56,6 +56,7 @@ static const struct of_device_id dwmac_generic_match[] = {
>  	{ .compatible = "snps,dwmac-3.610"},
>  	{ .compatible = "snps,dwmac-3.70a"},
>  	{ .compatible = "snps,dwmac-3.710"},
> +	{ .compatible = "snps,dwmac-3.72a"},
>  	{ .compatible = "snps,dwmac-4.00"},
>  	{ .compatible = "snps,dwmac-4.10a"},
>  	{ .compatible = "snps,dwmac"},
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 54797edc9..e7e2d6c20 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -522,6 +522,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	if (of_device_is_compatible(np, "st,spear600-gmac") ||
>  		of_device_is_compatible(np, "snps,dwmac-3.50a") ||
>  		of_device_is_compatible(np, "snps,dwmac-3.70a") ||
> +		of_device_is_compatible(np, "snps,dwmac-3.72a") ||

All these of_device_is_compatible() checks should really go away and all 
the settings just come from match table data. Then everything is const 
and we're not matching multiple times at run-time. That would be a bit 
of refactoring though...

>  		of_device_is_compatible(np, "snps,dwmac")) {
>  		/* Note that the max-frame-size parameter as defined in the
>  		 * ePAPR v1.1 spec is defined as max-frame-size, it's
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
