Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3558B9801
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2024 11:45:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC6F6C71291;
	Thu,  2 May 2024 09:45:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74338C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2024 09:45:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 063AE61283;
 Thu,  2 May 2024 09:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6A9C113CC;
 Thu,  2 May 2024 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714643119;
 bh=KMKmbjNxDjaQW/0y4bty5ahkkoXZGQdtL8KqJYUhwyE=;
 h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
 b=oAfQwcFEFQ4YSvMqY1Xbh/lsc5LPNSzumgD/oGqD14ngGgVPaEs7MibpgzzKx9oki
 Zagn8sEO8gj46WZhp4lLi4tBXFTB+pnYiA73nYZaFmp60rxFnqFwc6JU+DjWzL67dG
 /MZ0o36PB32nJVFZyZuANe63Rb2438n1oBk0vqlifHQrplthsktdyd/SJ9MqUjTqSh
 S4MhcJVVnSWRNuZQtI579Q7AgypadRVel2Bn/9DPwLpuM9kooXWaDgrnlLnFOcgFi9
 WcmGesxwuIsoxe8I2o27QKIei0xaWcNAItuJ4mp51iYpDI3BxfZTFiHOR9LfE7YUv9
 8qqWoV1TVGUXg==
Message-ID: <dfde41a3-9d7d-4253-8297-c7684372f6f0@kernel.org>
Date: Thu, 2 May 2024 18:45:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-12-797ceca46e5c@nxp.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240501-pinctrl-cleanup-v1-12-797ceca46e5c@nxp.com>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 12/21] pinctrl: k210: Use scope based
 of_node_put() cleanups
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

On 5/1/24 21:56, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use scope based of_node_put() cleanup to simplify code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/pinctrl-k210.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index b6d1ed9ec9a3..2753e14c3e38 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -849,7 +849,6 @@ static int k210_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				       unsigned int *num_maps)
>  {
>  	unsigned int reserved_maps;
> -	struct device_node *np;
>  	int ret;
>  
>  	reserved_maps = 0;
> @@ -861,13 +860,11 @@ static int k210_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	if (ret < 0)
>  		goto err;
>  
> -	for_each_available_child_of_node(np_config, np) {
> +	for_each_available_child_of_node_scoped(np_config, np) {
>  		ret = k210_pinctrl_dt_subnode_to_map(pctldev, np, map,
>  						     &reserved_maps, num_maps);
> -		if (ret < 0) {
> -			of_node_put(np);

Personally, I am really not a fan of things that hide code like that scoped
thing... If I want a language that hides code, I would be doing C++ :)
That said, I am not opposed to this so I will let Linus (Walleij) decide.

Also, I think that "for_each_available_child_of_node" is a bad name... It really
should be something like for_each_available_child_of_node_get() to make it clear
that a of_node_put() is needed.

> +		if (ret < 0)
>  			goto err;
> -		}
>  	}
>  	return 0;
>  
> 

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
