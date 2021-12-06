Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C3469BAE
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 16:14:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4E33C5F1E5;
	Mon,  6 Dec 2021 15:14:50 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE7AFC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 15:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 265421F4488A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638803687; bh=0wYI5HLADYAd4xSANRFLZ/t5SGL4HjQoUDDbtVZMntw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=F3i+qP58ek+QIKjw1gTAd6rIjXU196UrMqKi+DJqxtwKT9teAAAKYDKlz5oFjx46y
 FPqYUOo3CrAC3nuDPAyR2f16fDPcNAwAenlgSg0xB58532r5z07c3PBmgezyJ6ti6L
 KebBY0RT6kj0OndKhn9btJ7CLlBQznplhoMfPx+oIn44P4Yp4uw0SnnewMaBvZ7IeD
 KxkWDS4nJRLje/JEm0LgJyq17nuMAIFq11UWBpXnIAKA8FrW2f2CGgYXRyyVob+1Mx
 FVg68HlMTJE1lQAItxtheu4WVmAArwN9qGVH7ibsCT2t5b0jghIuqZzlmT9nYhBXVH
 FiDZ12bt+YGDw==
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20211203063418.14892-1-biao.huang@mediatek.com>
 <20211203063418.14892-2-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9dc0cbc3-8de0-f1ed-cfc9-852b7e69ab3c@collabora.com>
Date: Mon, 6 Dec 2021 16:14:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211203063418.14892-2-biao.huang@mediatek.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, dkirjanov@suse.de,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/7] net-next: stmmac: dwmac-mediatek:
 add platform level clocks management
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Il 03/12/21 07:34, Biao Huang ha scritto:
> This patch implements clks_config callback for dwmac-mediatek platform,
> which could support platform level clocks management.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 24 ++++++++++++++-----
>   1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 58c0feaa8131..157ff655c85e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -359,9 +359,6 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
>   		return ret;
>   	}
>   
> -	pm_runtime_enable(&pdev->dev);
> -	pm_runtime_get_sync(&pdev->dev);
> -
>   	return 0;
>   }
>   
> @@ -370,11 +367,25 @@ static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
>   	struct mediatek_dwmac_plat_data *plat = priv;
>   
>   	clk_bulk_disable_unprepare(plat->num_clks_to_config, plat->clks);
> -
> -	pm_runtime_put_sync(&pdev->dev);
> -	pm_runtime_disable(&pdev->dev);
>   }
>   
> +static int mediatek_dwmac_clks_config(void *priv, bool enabled)
> +{
> +	struct mediatek_dwmac_plat_data *plat = priv;
> +	int ret = 0;
> +
> +	if (enabled) {
> +		ret = clk_bulk_prepare_enable(plat->num_clks_to_config, plat->clks);
> +		if (ret) {
> +			dev_err(plat->dev, "failed to enable clks, err = %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +		clk_bulk_disable_unprepare(plat->num_clks_to_config, plat->clks);
> +	}
> +
> +	return ret;
> +}
>   static int mediatek_dwmac_probe(struct platform_device *pdev)
>   {
>   	struct mediatek_dwmac_plat_data *priv_plat;
> @@ -420,6 +431,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>   	plat_dat->bsp_priv = priv_plat;
>   	plat_dat->init = mediatek_dwmac_init;
>   	plat_dat->exit = mediatek_dwmac_exit;
> +	plat_dat->clks_config = mediatek_dwmac_clks_config;
>   	mediatek_dwmac_init(pdev, priv_plat);
>   
>   	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> 

Hello Biao,

you're removing all calls to pm_runtime_* functions, so there is no more reason
to include linux/pm_runtime.h in this file: please also remove the inclusion.

Thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
