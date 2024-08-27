Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B68F960EBF
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 16:52:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 494AFC6DD6E;
	Tue, 27 Aug 2024 14:52:01 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF167C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 14:51:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ABA9ACE134C;
 Tue, 27 Aug 2024 14:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFF4C4DE06;
 Tue, 27 Aug 2024 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724770309;
 bh=NWB5s3i1kq4dW2CrUfpkajBrMSzQ94Hq46U32Q7Ft/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p8iuOBjmg0viE6cadtY00LPh0+MNMt7PW9OUsvoUrh0nm2rdR/TUM6qaDTQjz18fg
 Zjy9nIq8LioA2jN83GxP/BBPmGlrYrQtoIAV2Ct2gHJRC0ISJ8MESFgGxEOnPFcw1G
 yfphDH4zRsiRR4i2BDIDga1R9Rs0rhMkQ57Sbr9jZ3Yk2CjcyWkmdQ+cYBJ5812lgy
 EqFhhzll9QJzUNZFtazSm3uVCZF4TieaeONPS04BWAR5ESkjYtoJnGY8stgBYfq0dW
 Iqu301WDbqghCwHu2hXY0JoURJPr9EPh7jnt0yYSOKfVzHu1m/e7zZTed2f5zpjAMB
 1idVVIQyLuYPQ==
Date: Tue, 27 Aug 2024 15:51:42 +0100
From: Simon Horman <horms@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240827145142.GI1368797@kernel.org>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-2-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-2-frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, linus.walleij@linaro.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, sd@queasysnail.net, linux@armlinux.org.uk,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
 kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com,
 ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, mcoquelin.stm32@gmail.com,
 justinstitt@google.com, olteanv@gmail.com, davem@davemloft.net,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v3 1/9] net: stmmac: dwmac-intel-plat:
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

On Tue, Aug 27, 2024 at 03:57:04AM -0600, Yangtao Li wrote:
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

As it looks like there will be a v4 anyway, a minor nit from my side:
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

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
