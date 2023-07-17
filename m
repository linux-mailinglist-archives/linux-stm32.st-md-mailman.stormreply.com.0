Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB79756FCD
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 00:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88AFDC6B452;
	Mon, 17 Jul 2023 22:30:29 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB510C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 22:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=22T4AJNsPZJV+E1q24Ne8LGvDnuZIqG3AB+8sQzRH74=; b=dAN1+K0qIXYM5HsDssNUMlrTaI
 lTPDmbzC1brsIBqdZPHnL6gT1qu8B8B2LBejDqIULI9Jhs/rWiwkme6wd/Qb7BgEJpTqtzZbb9YL6
 UoddfQmk7T5ZH1GmmbLUHO7j6GPaIWppJtRC5DQIMSfiprNUd6hwLc80P5vQo33flGiE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qLWjT-001aHO-HH; Tue, 18 Jul 2023 00:30:19 +0200
Date: Tue, 18 Jul 2023 00:30:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <accc8d89-7565-460e-a874-a491b755bbb8@lunn.ch>
References: <20230717164307.2868264-1-m.felsch@pengutronix.de>
 <20230717164307.2868264-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717164307.2868264-2-m.felsch@pengutronix.de>
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: platform: add
 support for phy-supply
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

On Mon, Jul 17, 2023 at 06:43:07PM +0200, Marco Felsch wrote:
> Add generic phy-supply handling support to control the phy regulator.
> Use the common stmmac_platform code path so all drivers using
> stmmac_probe_config_dt() and stmmac_pltfr_pm_ops can use it.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 51 +++++++++++++++++++
>  include/linux/stmmac.h                        |  1 +
>  2 files changed, 52 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index eb0b2898daa3d..6193d42b53fb7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -10,6 +10,7 @@
>  
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/module.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> @@ -423,6 +424,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	if (plat->interface < 0)
>  		plat->interface = plat->phy_interface;
>  
> +	/* Optional regulator for PHY */
> +	plat->phy_regulator = devm_regulator_get_optional(&pdev->dev, "phy");
> +	if (IS_ERR(plat->phy_regulator)) {
> +		if (PTR_ERR(plat->phy_regulator) == -EPROBE_DEFER)
> +			return ERR_CAST(plat->phy_regulator);
> +		dev_info(&pdev->dev, "No regulator found\n");
> +		plat->phy_regulator = NULL;
> +	}
> +

So this gets the regulator. When do you actually turn it on?

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
