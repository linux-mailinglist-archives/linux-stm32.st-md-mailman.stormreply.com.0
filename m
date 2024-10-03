Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC498EDE3
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2024 13:18:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D0ECC78024;
	Thu,  3 Oct 2024 11:18:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 337A1C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2024 11:18:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E65EF5C5A4C;
 Thu,  3 Oct 2024 11:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE624C4CEC5;
 Thu,  3 Oct 2024 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727954296;
 bh=AtYWg0i+YgGT7RsQ96Mj+yOKNWur0aXD7xdQt3uW+a8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kDMpTqJPT5y+13vnCs3T53BfGSzwmvg+daUGX7k2VcNREQDIiH8jz+HBSVKyJ83Bn
 LB/uF0AOZ17LW6PcBPRykWRiCo5IaGT7byz8dWHYTyD9ocg1+yoap7ZQAp3A6duoyH
 BgHgA4tTgHA6jpeD+eHOnHygM6TEuSD88Neg1aeLsmmlr/6rigwhx2lM4Ql8hLnt3v
 JS6VpG/rWfx8o+k1TrZ7T1IKK2wdtIEdpcQCMuBRJ+J7GRijD/gY6cKviCMLjYNJ9M
 +DPvzb6/P9olrhoSWbpcj6REwyS8iJVB0E3Orh9tKERa1lARJFzJ5zMxu+r9h92Guv
 e/MbrDUWofJfQ==
Date: Thu, 3 Oct 2024 12:18:11 +0100
From: Simon Horman <horms@kernel.org>
To: Vitalii Mordan <mordan@ispras.ru>
Message-ID: <20241003111811.GJ1310185@kernel.org>
References: <20240930183715.2112075-1-mordan@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930183715.2112075-1-mordan@ispras.ru>
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 netdev@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Vadim Mutilin <mutilin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] stmmac: dwmac-intel-plat: fix call
 balance of tx_clk handling routines
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

On Mon, Sep 30, 2024 at 09:37:15PM +0300, Vitalii Mordan wrote:
> If the clock dwmac->tx_clk was not enabled in intel_eth_plat_probe,
> it should not be disabled in any path.
> 
> Conversely, if it was enabled in intel_eth_plat_probe, it must be disabled
> in all error paths to ensure proper cleanup.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: 9efc9b2b04c7 ("net: stmmac: Add dwmac-intel-plat for GBE driver")
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-intel-plat.c   | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> index d68f0c4e7835..2a2893f2f2a8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> @@ -108,7 +108,12 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  			if (IS_ERR(dwmac->tx_clk))
>  				return PTR_ERR(dwmac->tx_clk);
>  
> -			clk_prepare_enable(dwmac->tx_clk);
> +			ret = clk_prepare_enable(dwmac->tx_clk);
> +			if (ret) {
> +				dev_err(&pdev->dev,
> +					"Failed to enable tx_clk\n");
> +				return ret;
> +			}
>  
>  			/* Check and configure TX clock rate */
>  			rate = clk_get_rate(dwmac->tx_clk);
> @@ -117,6 +122,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  				rate = dwmac->data->tx_clk_rate;
>  				ret = clk_set_rate(dwmac->tx_clk, rate);
>  				if (ret) {
> +					clk_disable_unprepare(dwmac->tx_clk);
>  					dev_err(&pdev->dev,
>  						"Failed to set tx_clk\n");
>  					return ret;

Hi Vitalii,

I think that unwinding using a goto label would be more idiomatic here
and in the following changes to intel_eth_plat_probe().

> @@ -131,6 +137,8 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  			rate = dwmac->data->ptp_ref_clk_rate;
>  			ret = clk_set_rate(plat_dat->clk_ptp_ref, rate);
>  			if (ret) {
> +				if (dwmac->data->tx_clk_en)
> +					clk_disable_unprepare(dwmac->tx_clk);
>  				dev_err(&pdev->dev,
>  					"Failed to set clk_ptp_ref\n");
>  				return ret;
> @@ -150,7 +158,8 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret) {
> -		clk_disable_unprepare(dwmac->tx_clk);
> +		if (dwmac->data->tx_clk_en)
> +			clk_disable_unprepare(dwmac->tx_clk);

Smatch warns that dwmac->data may be NULL here.

>  		return ret;
>  	}
>  
> @@ -162,7 +171,8 @@ static void intel_eth_plat_remove(struct platform_device *pdev)
>  	struct intel_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
>  
>  	stmmac_pltfr_remove(pdev);
> -	clk_disable_unprepare(dwmac->tx_clk);
> +	if (dwmac->data->tx_clk_en)

And I wonder if it can be NULL here too.

> +		clk_disable_unprepare(dwmac->tx_clk);
>  }
>  
>  static struct platform_driver intel_eth_plat_driver = {
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
