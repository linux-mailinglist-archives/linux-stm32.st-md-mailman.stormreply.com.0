Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4289960EEB
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 16:53:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6557CC6DD6E;
	Tue, 27 Aug 2024 14:53:45 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A983C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 14:53:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9E32DCE134B;
 Tue, 27 Aug 2024 14:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182FEC6106E;
 Tue, 27 Aug 2024 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724770415;
 bh=ND1nM316SmnI2uLNfJnvcy1K3FityWNNBNH9l6o7LNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SrUT5WTGP2Dta6NNl3ZtipbShjUHbfPl9vEnh7+c/a0gfCvd3fDFkkwWcTD7MKw2n
 Eet4agTZqcI35gqrKzDGaoHu7q2uJ07SqSYazenBUo1kNwM1ApiUZUt9XjG0ZOJo/u
 X2McGktRiITcCGVp4FfRewwYdHqVo5CF2dFW7fZ/dfGcOI17Zrpch5UJsp86oDLRPC
 FexFNLbzgbQF6vXpR5wmlcHgzEvPkdAuRbiiERo86APSBoFFlVrLOtiK71YDzGug01
 MttaepYTrDfbTp9xphvsseJtrcuRVGD8yklUoQKFc/v5tti0bzAJOvTVYoyKJYYemO
 LxjX2rSk1bieQ==
Date: Tue, 27 Aug 2024 15:53:28 +0100
From: Simon Horman <horms@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240827145328.GJ1368797@kernel.org>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-3-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-3-frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, linus.walleij@linaro.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, sd@queasysnail.net, linux@armlinux.org.uk,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
 kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com,
 ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-renesas-soc@vger.kernel.org,
 mcoquelin.stm32@gmail.com, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v3 2/9] net: stmmac: platform: Convert
 to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
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

On Tue, Aug 27, 2024 at 03:57:05AM -0600, Yangtao Li wrote:
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> ---
> v2:
> -remove unused 'ret'
> -fix incompatible-pointer-types
> 
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 35 +++++--------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index ad868e8d195d..4365afabf3c4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -415,8 +415,6 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
>  static void stmmac_remove_config_dt(struct platform_device *pdev,
>  				    struct plat_stmmacenet_data *plat)
>  {
> -	clk_disable_unprepare(plat->stmmac_clk);
> -	clk_disable_unprepare(plat->pclk);
>  	of_node_put(plat->phy_node);
>  	of_node_put(plat->mdio_node);
>  }
> @@ -436,7 +434,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	struct plat_stmmacenet_data *plat;
>  	struct stmmac_dma_cfg *dma_cfg;
>  	int phy_mode;
> -	void *ret;
>  	int rc;
>  
>  	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
> @@ -615,21 +612,16 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  
>  	/* clock setup */
>  	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
> -		plat->stmmac_clk = devm_clk_get(&pdev->dev,
> -						STMMAC_RESOURCE_NAME);
> +		plat->stmmac_clk = devm_clk_get_enabled(&pdev->dev, STMMAC_RESOURCE_NAME);

As it looks like there will be a v3 anyway, a minor nit from my side:
Please preserve the line wrapping so that the lines remain <= 80 columns wide,
which is still preferred by Networking code.

		plat->stmmac_clk = devm_clk_get_enabled(&pdev->dev,
							STMMAC_RESOURCE_NAME);

>  		if (IS_ERR(plat->stmmac_clk)) {
>  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
>  			plat->stmmac_clk = NULL;
>  		}
> -		clk_prepare_enable(plat->stmmac_clk);
>  	}
>  

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
