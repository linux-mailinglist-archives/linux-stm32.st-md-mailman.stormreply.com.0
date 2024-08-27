Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7064960F10
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 16:55:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92692C6DD6E;
	Tue, 27 Aug 2024 14:55:40 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3C3BC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 14:55:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1BC35A41AFF;
 Tue, 27 Aug 2024 14:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903EDC4E699;
 Tue, 27 Aug 2024 14:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724770532;
 bh=D80vpx6U6QT7GcY5OtgT2Iqfz6U4g8ngRy6lrqYUReA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mzY3EkoijKjcm5DDmYoHp5H2ObZXtFKsAMa12P/QKAptq4mddaMTqo7uGVS3xob46
 5jUTvBkE/DZ33nI2za/bDA6MbTauhaXisYMORZ/5e9XdAIGzWXD3JDhE64Ii2i/eKt
 O8HiVHGByi9iQJybjjlB2SiZ9eTUVQAE39HG9gr5whw2clXYCtDtvubb7gaZpfy/pE
 sx8K4t+gUDaNJDGp/EXP5b8wW7lrQo6TNDlaJ+8SiWg5z61yjpl4plNnwjB9cBtYos
 Ql/I7sCYTMQ4C109ubkSm5qLVdm/90L4TOuXhH4QjUYve1b/uzB1+GNGVDGEX4bVCS
 sRdHpm4Q4lIjw==
Date: Tue, 27 Aug 2024 15:55:25 +0100
From: Simon Horman <horms@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20240827145525.GK1368797@kernel.org>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-9-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-9-frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, linus.walleij@linaro.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, sd@queasysnail.net, linux@armlinux.org.uk,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
 kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com,
 ulli.kroll@googlemail.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 mcoquelin.stm32@gmail.com, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v3 8/9] net: mvpp2: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
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

On Tue, Aug 27, 2024 at 03:57:11AM -0600, Yangtao Li wrote:
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>

...

> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> index 2fe8bae4eb3c..0ca2daeb0f90 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> @@ -7561,56 +7561,32 @@ static int mvpp2_probe(struct platform_device *pdev)

...

> -		priv->axi_clk = devm_clk_get_optional(&pdev->dev, "axi_clk");
> -		if (IS_ERR(priv->axi_clk)) {
> -			err = PTR_ERR(priv->axi_clk);
> -			goto err_mg_core_clk;
> +			clk = devm_clk_get_optional_enabled(&pdev->dev, "mg_core_clk");

As it looks like there will be a v3 anyway, a minor nit from my side:
IMHO, the line above could be trivially wrapped to keep it <= 80 columns wide,
which is still preferred by Networking code.

> +			if (IS_ERR(clk))
> +				return PTR_ERR(clk);
>  		}
>  
> -		err = clk_prepare_enable(priv->axi_clk);
> -		if (err < 0)
> -			goto err_mg_core_clk;
> -
> -		/* Get system's tclk rate */
> -		priv->tclk = clk_get_rate(priv->pp_clk);
> +		clk = devm_clk_get_optional_enabled(&pdev->dev, "axi_clk");
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
