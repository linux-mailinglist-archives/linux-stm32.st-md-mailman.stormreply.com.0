Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC18C80D3
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2024 08:14:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 646F9C6DD6D;
	Fri, 17 May 2024 06:14:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79247C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2024 06:14:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H0O4Ye003261;
 Fri, 17 May 2024 08:13:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=J3o804ncxF/enh0kdjgc+0YUwQx2VM+mClNeplniKwc=; b=CV
 xSZy930UTX7kDamAv2gi390UDjIU+WfLGT6+qTNZa8Hkd+yJK75cIjojTcNGENLI
 BZXukHl1cbO+xx0BClOTjP4+RS637PPEZfSGyM5gcLPtlikd9R82kz62BFQCUdjg
 hg7KKyl1iltJ7WLlSnl73hlsyoLrSH4JScIhCCz5Atn5dnoL4Qog2D57Ukm5e4ei
 7lGcFyD2wB2a/S/nX+IftdXds93oxlEx06x7ejgzCNxb1dAlqpVZ9aDQL7DgoNF3
 6W7MH/CNQYmJRAhI6UKq5f2XqI/btsPocfwEo0I/o9aUe09mZKEAIhrOAYKJFBSG
 bWg2Tl1y24/bmqSNujYQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4sxwghph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 May 2024 08:13:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 924C54002D;
 Fri, 17 May 2024 08:13:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79F8F20F54A;
 Fri, 17 May 2024 08:11:54 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 08:11:51 +0200
Message-ID: <124b75a6-d8da-4e29-8dce-79d18c355ba2@foss.st.com>
Date: Fri, 17 May 2024 08:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing
 <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, <soc@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jacky Bai <ping.bai@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc
 <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>,
 Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 03/20] pinctrl: stm32: Use scope based
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



On 5/4/24 15:20, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use scope based of_node_put() cleanup to simplify code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/stm32/pinctrl-stm32.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 978ccdbaf3d3..a8673739871d 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -670,7 +670,6 @@ static int stm32_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				 struct device_node *np_config,
>  				 struct pinctrl_map **map, unsigned *num_maps)
>  {
> -	struct device_node *np;
>  	unsigned reserved_maps;
>  	int ret;
>  
> @@ -678,12 +677,11 @@ static int stm32_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	*num_maps = 0;
>  	reserved_maps = 0;
>  
> -	for_each_child_of_node(np_config, np) {
> +	for_each_child_of_node_scoped(np_config, np) {
>  		ret = stm32_pctrl_dt_subnode_to_map(pctldev, np, map,
>  				&reserved_maps, num_maps);
>  		if (ret < 0) {
>  			pinctrl_utils_free_map(pctldev, *map, *num_maps);
> -			of_node_put(np);
>  			return ret;
>  		}
>  	}
> 

Hi

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
