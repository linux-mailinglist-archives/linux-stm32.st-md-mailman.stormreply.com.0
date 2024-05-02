Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B89608B92F3
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2024 02:54:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60F08C71291;
	Thu,  2 May 2024 00:54:23 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B78CFC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2024 00:54:15 +0000 (UTC)
Received: from [192.168.148.88] (unknown [120.20.105.107])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 088B420009;
 Thu,  2 May 2024 08:53:58 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1714611252;
 bh=2UKQhOigrDLEgeDWGD84hTlrB50inUdwvmzSWDEPPvc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=mEGxVQndQ7eIpM8jn5g71jdxtIHcuCBHuXLX3t5HOduXT6G3KWhFZnai5E2QWPjpt
 xUbxUMw8Z0D7c5pD24vc3ZzhGQXYfLHWVGmOrlPgPRJmKshV4rf1+Spnba3BnjBf4l
 8kLrN/vlnSlI42W2LzZcE2L6SrWlkinmiVnj3Rl3LhPxwTZqfRHyGa9k6V52F+FI5F
 O5UUH9X8QHzbu1WEy+dCXTrm0/I1k7hs6S6p0FEuot7yADPKouHcSE4oy6JC/UkbhR
 coiTMdEGtIg1BQPHt0NyDzVrbhFKr3BlOwadA5+C73I61sUw6Ujqb07PJS0zHw2Vf1
 h9752xRr1Wnyg==
Message-ID: <eda5b1da03d4adfa5761c49527a9232ec7facae3.camel@codeconstruct.com.au>
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 Wells Lu <wellslutw@gmail.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim
 <shiraz.linux.kernel@gmail.com>, soc@kernel.org,  Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner
 <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>,  Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,  Jacky Bai <ping.bai@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc
 <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sascha Hauer
 <s.hauer@pengutronix.de>,  Joel Stanley <joel@jms.id.au>, Dan Carpenter
 <dan.carpenter@linaro.org>
Date: Thu, 02 May 2024 10:23:58 +0930
In-Reply-To: <20240501-pinctrl-cleanup-v1-20-797ceca46e5c@nxp.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-20-797ceca46e5c@nxp.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 20/21] pinctrl: aspeed: g5: Use scope
 based of_node_put() cleanups
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

On Wed, 2024-05-01 at 20:56 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use scope based of_node_put() cleanup to simplify code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 5bb8fd0d1e41..61fbfddb5938 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -2629,14 +2629,13 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
>  		return ctx->maps[ip];
>  
>  	if (ip == ASPEED_IP_GFX) {
> -		struct device_node *node;
> +		struct device_node *node __free(device_node) = NULL;
>  		struct regmap *map;
>  
>  		node = of_parse_phandle(ctx->dev->of_node,
>  					"aspeed,external-nodes", 0);
>  		if (node) {
>  			map = syscon_node_to_regmap(node);
> -			of_node_put(node);
>  			if (IS_ERR(map))
>  				return map;
>  		} else
> @@ -2648,7 +2647,7 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
>  	}
>  
>  	if (ip == ASPEED_IP_LPC) {
> -		struct device_node *np;
> +		struct device_node *np __free(device_node) = NULL;
>  		struct regmap *map;
>  
>  		np = of_parse_phandle(ctx->dev->of_node,
> @@ -2660,7 +2659,6 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
>  				return ERR_PTR(-ENODEV);
>  
>  			map = syscon_node_to_regmap(np->parent);
> -			of_node_put(np);
>  			if (IS_ERR(map))
>  				return map;

I think I agree with Krzysztof's feedback on the Samsung patch[1], and
that I prefer the existing approach for the Aspeed driver. My reasoning
suggests the existing implementation does the right thing. That said,
the code could be adjusted to use early returns and consistent variable
names, which might make it easier to reason about. I'll consider a
follow-up patch to address that.

Regardless, thanks for taking the time to explore the cleanup.

Andrew

[1]: https://lore.kernel.org/lkml/34193501-5b7b-4ffd-8549-a04c6930d02d@kernel.org/

>  		} else
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
