Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E00456B55B
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Jul 2022 11:23:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA5DFC640F5;
	Fri,  8 Jul 2022 09:23:01 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF6A3C0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Jul 2022 09:23:00 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id p128so19188376iof.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Jul 2022 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=U7/XgC9RN4le35mQLRbV3pgGUKx0V1tiTu9hGjasAGI=;
 b=SEK73+0Tdh+TtsYAOudd9GcFL0cnMQL6EwVH3NZG1Q30TqNpGfwvwxVJ2yocAZX8c+
 tgT9JhTrxCYfJbYfH0P20SPZcvRqLljpJC9Lqbn8Ai+p4Hoy88XH5B3Ha0zLOPlN4iYB
 3ZTQwMWmO1icAlPKhiYJqlojNR+8r3BJDGPkPcVh20KoN95cOiE3gUDbDhl+BsQJcDLy
 mqhmI2yhnR3shxv2ESZ1BlMBJuSty2Y+4vKsbAG+W5Bwi1tXBKgHR+vlDlxZFWQW26qz
 32gBntj83aot+8Ro4KWE1AXAxSgNtonorWstIOMmxwFD7D813RUTpEPn1XeNoGb+rtg7
 CaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U7/XgC9RN4le35mQLRbV3pgGUKx0V1tiTu9hGjasAGI=;
 b=ojw54J90fquw3eD4F13aNofAJaIT3gC+2WUQNfbwFJ3CAtT3SEqq+Hw139BdNsAq9Y
 6cIXqox/bnaR82RRmp0sopnuJQJPc2jJ3gbHVWkOdGg95QkvJLBGLtHQGFmnZ8S7HDen
 9TQtSpUdWJZQADmG+VRtMZESGb/OR2dmAYYRgUP1nDV1THzZHzvkrYaM7mext3VFR1rt
 +9NUmsPEkVtA0hwH6+EJPpz0gv+snOdIDHwecJOSjfvG25oWwnWpEwL3EYidRTjvkm9H
 RVFSmWWXnE51ugB/UAz/vSy8aOODIRzUq5I73RhpXn15Pu4NPP54IhskjVI6aWLTxEPT
 k6iw==
X-Gm-Message-State: AJIora/kwwaFG/ekd2enfYaK0wHyetV6rzk0JC1aDwEI6wLnYRmu6z7/
 02Sza8KghLNkPfn1sZsean8=
X-Google-Smtp-Source: AGRyM1t2xWCoYr09Jo0vvMoTX8WrRJ5XuGWsryJmy0bfppS9LrrILQXKs9QWucfoDSuMtqnmbOifuQ==
X-Received: by 2002:a05:6602:164a:b0:678:682f:568b with SMTP id
 y10-20020a056602164a00b00678682f568bmr1403979iow.187.1657272179559; 
 Fri, 08 Jul 2022 02:22:59 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a92d94a000000b002dc616d93acsm63916ilq.28.2022.07.08.02.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 02:22:58 -0700 (PDT)
Message-ID: <14bf5e6b-4230-fffc-4134-c3015cf4d262@gmail.com>
Date: Fri, 8 Jul 2022 11:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, David Miller <davem@davemloft.net>
References: <20220708083937.27334-1-biao.huang@mediatek.com>
 <20220708083937.27334-2-biao.huang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220708083937.27334-2-biao.huang@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net v3] stmmac: dwmac-mediatek: fix clock
	issue
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



On 08/07/2022 10:39, Biao Huang wrote:
> Since clocks are handled in mediatek_dwmac_clks_config(),
> remove the clocks configuration in init()/exit(), and
> invoke mediatek_dwmac_clks_config instead.
> 
> This issue is found in suspend/resume test.
> 

Commit message is rather confusing. Basically you are moving the clock enable 
into probe instead of init and remove it from exit. That means, clocks get 
enabled earlier and don't get disabled if the module gets unloaded. That doesn't 
sound correct, I think we would at least need to disable the clocks in remove 
function.

I suppose that suspend calls exit and that there was a problem when we disable 
the clocks there. Is this a HW issue that has no other possible fix?

Regards,
Matthias

> Fixes: 3186bdad97d5 ("stmmac: dwmac-mediatek: add platform level clocks management")
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 36 +++++--------------
>   1 file changed, 9 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 6ff88df58767..e86f3e125cb4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -576,32 +576,7 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
>   		}
>   	}
>   
> -	ret = clk_bulk_prepare_enable(variant->num_clks, plat->clks);
> -	if (ret) {
> -		dev_err(plat->dev, "failed to enable clks, err = %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = clk_prepare_enable(plat->rmii_internal_clk);
> -	if (ret) {
> -		dev_err(plat->dev, "failed to enable rmii internal clk, err = %d\n", ret);
> -		goto err_clk;
> -	}
> -
>   	return 0;
> -
> -err_clk:
> -	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
> -	return ret;
> -}
> -
> -static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
> -{
> -	struct mediatek_dwmac_plat_data *plat = priv;
> -	const struct mediatek_dwmac_variant *variant = plat->variant;
> -
> -	clk_disable_unprepare(plat->rmii_internal_clk);
> -	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
>   }
>   
>   static int mediatek_dwmac_clks_config(void *priv, bool enabled)
> @@ -643,7 +618,6 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
>   	plat->addr64 = priv_plat->variant->dma_bit_mask;
>   	plat->bsp_priv = priv_plat;
>   	plat->init = mediatek_dwmac_init;
> -	plat->exit = mediatek_dwmac_exit;
>   	plat->clks_config = mediatek_dwmac_clks_config;
>   	if (priv_plat->variant->dwmac_fix_mac_speed)
>   		plat->fix_mac_speed = priv_plat->variant->dwmac_fix_mac_speed;
> @@ -712,13 +686,21 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>   	mediatek_dwmac_common_data(pdev, plat_dat, priv_plat);
>   	mediatek_dwmac_init(pdev, priv_plat);
>   
> +	ret = mediatek_dwmac_clks_config(priv_plat, true);
> +	if (ret)
> +		return ret;
> +
>   	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>   	if (ret) {
>   		stmmac_remove_config_dt(pdev, plat_dat);
> -		return ret;
> +		goto err_drv_probe;
>   	}
>   
>   	return 0;
> +
> +err_drv_probe:
> +	mediatek_dwmac_clks_config(priv_plat, false);
> +	return ret;
>   }
>   
>   static const struct of_device_id mediatek_dwmac_match[] = {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
