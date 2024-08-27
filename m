Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59563960E6E
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 16:48:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A711C6DD6E;
	Tue, 27 Aug 2024 14:48:37 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1606C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 14:48:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CA6D7A41B7F;
 Tue, 27 Aug 2024 14:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6C4C6107B;
 Tue, 27 Aug 2024 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724770108;
 bh=xSqwNdhpJetQ1Ga5qLAHMjPCMQYO+GkW/IDB1xWE8zM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o8UGOyDomGVhy1QCxq1ZaKUwSAbW5YdZ7bzFjTDNtZhP+MiLXGy8H4LUCK1XIXGoG
 HeWZEabT9DBgIhHuyGQRd8OuDHltgV29H/iEkNPnL2uEFIsLyQ5bdlLMnUycu0t6vY
 tGghGFURbF7nKTm/brFE+lFinwKiC49lbmKC6hy/YPZVMm+AToGe9J1D4J2KfvQx50
 qmp4sjJdVPdKfsuWqOZYcoTpZvYTJ5pt1dYutSxjniTzSYIDXZnBCu/4QtT5HvdqCm
 NRJdBsdkBcmvav0MPsQFo3jBKhq1FGtCKvrvyp3dG8US7OSo8YZnV+gRQDqHRJLmCb
 /8mLri0zG2TQA==
Date: Tue, 27 Aug 2024 15:48:21 +0100
From: Simon Horman <horms@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240827144821.GH1368797@kernel.org>
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-2-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240823072122.2053401-2-frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, kees@kernel.org,
 linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 sd@queasysnail.net, linux@armlinux.org.uk, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, kuba@kernel.org, pabeni@redhat.com,
 clement.leger@bootlin.com, ulli.kroll@googlemail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 mcoquelin.stm32@gmail.com, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v2 1/9] net: stmmac: dwmac-intel-plat:
 Convert to devm_clk_get_enabled()
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

On Fri, Aug 23, 2024 at 01:21:13AM -0600, Yangtao Li wrote:
> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c    | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> index d68f0c4e7835..dcbae653ab8c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> @@ -104,12 +104,10 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  
>  		/* Enable TX clock */
>  		if (dwmac->data->tx_clk_en) {
> -			dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
> +			dwmac->tx_clk = devm_clk_get_enabled(&pdev->dev, "tx_clk");

As it looks like there will be a v3 anyway, a minor nit from my side:
IMHO, the line above could be trivially wrapped to keep it <= 80 columns wide,
which is still preferred by Networking code.

>  			if (IS_ERR(dwmac->tx_clk))
>  				return PTR_ERR(dwmac->tx_clk);
>  
> -			clk_prepare_enable(dwmac->tx_clk);
> -
>  			/* Check and configure TX clock rate */
>  			rate = clk_get_rate(dwmac->tx_clk);
>  			if (dwmac->data->tx_clk_rate &&
> @@ -149,20 +147,15 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> -	if (ret) {
> -		clk_disable_unprepare(dwmac->tx_clk);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	return 0;
>  }
>  
>  static void intel_eth_plat_remove(struct platform_device *pdev)
>  {
> -	struct intel_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
> -
>  	stmmac_pltfr_remove(pdev);
> -	clk_disable_unprepare(dwmac->tx_clk);
>  }
>  
>  static struct platform_driver intel_eth_plat_driver = {
> -- 
> 2.39.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
