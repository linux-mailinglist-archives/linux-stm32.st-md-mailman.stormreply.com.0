Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD6ECBC12D
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Dec 2025 23:30:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F0AEC58D77;
	Sun, 14 Dec 2025 22:30:59 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D0B0C57B68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Dec 2025 22:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=z6fXs+IIbDChxuFtTKIP2sLb6jR6q7HS1FdEpkJpi6g=; b=2rEh/LIVp8lLB0Cmg0619HT3ME
 YLLfXMm8HuA25MtApqKFp1X85UfJ7fAykF9Eyig4AJuNW1FgFBmoV9/q7aiok7X3EQ1bVhljtMylJ
 ujYx/7ZUEo/Hz6Dzeq42dceYvih8RtSxHWeGZrY4yWA4IhDxUHx3yvbRglCvtmXq0r24=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vUubz-00GwZz-Sv; Sun, 14 Dec 2025 23:30:43 +0100
Date: Sun, 14 Dec 2025 23:30:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Message-ID: <b9c8580f-e615-4eaa-8878-2fb8d888c0aa@lunn.ch>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
 <20251214-dwmac_multi_irq-v1-1-36562ab0e9f7@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251214-dwmac_multi_irq-v1-1-36562ab0e9f7@oss.nxp.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC 1/4] net: stmmac: platform: read
	channels irq
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

On Sun, Dec 14, 2025 at 11:15:37PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Read IRQ resources for all channels, to allow multi IRQ mode
> for platform glue drivers.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 38 +++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 8979a50b5507..29e40253bdfe 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -700,6 +700,9 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>  				  struct stmmac_resources *stmmac_res)
>  {
> +	int i;
> +	char name[8];

Reverse Christmas tree please.

>  	memset(stmmac_res, 0, sizeof(*stmmac_res));
>  
>  	/* Get IRQ information early to have an ability to ask for deferred
> @@ -743,7 +746,40 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  
>  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
>  
> -	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> +	if (IS_ERR(stmmac_res->addr))
> +		return PTR_ERR(stmmac_res->addr);
> +
> +	/* RX channels irq */
> +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> +		scnprintf(name, 8, "rx-queue-%d", i);

It would be better to use sizeof(name), not 8.

Also, 'rx-queue-' is 9 characters. So i don't see how this can
actually work?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
