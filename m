Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1F57361A
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jul 2022 14:11:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7859BC640FE;
	Wed, 13 Jul 2022 12:11:48 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF732C640FC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 12:11:46 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id a21so10434888qtw.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 05:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mQ/hcGr/I/V5gOxH9+3HtKc0WRnaD95esCjmTcO4bQ0=;
 b=FojwuT6sStHpE+uVYaLsaIIQad4I8HewXV7sDZTXbpuvLEXufIWG1ufnuRB4cMYyrz
 kPOha1HctNi444O/CECbg2EoAhrjZmGgxNVFHD7lVLdK/PjolGofJE+qgGrOlW1woIlQ
 JYGpYoVSxSjDrFE5ImvMQW+sEj+hNdRAYU6+/EU7ibVtPwJOake8jcjZ5xTfPSsdChIZ
 rfKZQzXtJzQlYU821MXv/QWkkZhUhL5xT/bTMvVhfQeeO9MCgoXK8WnblnnfdxOagYex
 G8U5s7/vMXpdFqGlPBx6CZMa0+adjTZHfVn/kHN+8qI4SM8geqkQmo8uZnFT0urSGFo/
 XVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mQ/hcGr/I/V5gOxH9+3HtKc0WRnaD95esCjmTcO4bQ0=;
 b=h5OhvucAwBnhGpeDoV+gg95BDYuEFuy4WZearlTRHnak5zLgjdPu7KYri9op0AZcNc
 MlVDC5yaCPVFsumCvSV8kVr2MugkzojTLTEn0Gnh6vX8uXX99Vdyr7QE5lzHRFlSc+XB
 VMcRXki0Njo6C9rQbaiOk8G9tA0OAD/Q0tJSfHyVmkRdjb5bGlsf97NUfqrdhZPUym6C
 43U/mDFO+os/JigV0ofJ11PO7590VWRk3fAhI124fuWZ7V2R4ElMMmFgv6ISSGMLpIbj
 aiI+WTJNYOEFbXexc1qbUIzgR5/2JlYRIt8oL2+SdX85Q9IRlc/SUtsBOuAWEXGQYhty
 Zhjg==
X-Gm-Message-State: AJIora9VWPq2l0YvRpRS7GRaHiTyQmeD5JMqZS5Pe/HOTpUgEfNjFJI5
 R2kExcwNu5D4NmVznBZt/3I=
X-Google-Smtp-Source: AGRyM1tQvQdoyjFYZfS1liJSgb+wrsI4bYFX7V+tmV4z8j3UvfsmISCnmKU2aLt9KbpEZgAIYIuBuQ==
X-Received: by 2002:ac8:5cd3:0:b0:316:f772:f0b8 with SMTP id
 s19-20020ac85cd3000000b00316f772f0b8mr2587700qta.162.1657714305566; 
 Wed, 13 Jul 2022 05:11:45 -0700 (PDT)
Received: from [192.168.43.228] ([193.86.92.180])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05620a400d00b006b5bbd8cb92sm630846qko.55.2022.07.13.05.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 05:11:44 -0700 (PDT)
Message-ID: <c8fdfa7b-f4eb-8308-4064-b868ce945e3a@gmail.com>
Date: Wed, 13 Jul 2022 14:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, David Miller <davem@davemloft.net>
References: <20220713101002.10970-1-biao.huang@mediatek.com>
 <20220713101002.10970-2-biao.huang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220713101002.10970-2-biao.huang@mediatek.com>
Cc: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net v4 1/3] stmmac: dwmac-mediatek: fix
	clock issue
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



On 13/07/2022 12:10, Biao Huang wrote:
> The pm_runtime takes care of the clock handling in current
> stmmac drivers, and dwmac-mediatek implement the
> mediatek_dwmac_clks_config() as the callback for pm_runtime.
> 
> Then, stripping duplicated clocks handling in old init()/exit()
> to fix clock issue in suspend/resume test.
> 
> As to clocks in probe/remove, vendor need symmetric handling to
> ensure clocks balance.
> 
> Test pass, including suspend/resume and ko insertion/remove.
> 
> Fixes: 3186bdad97d5 ("stmmac: dwmac-mediatek: add platform level clocks management")
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 49 ++++++++-----------
>   1 file changed, 21 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 6ff88df58767..ca8ab290013c 100644
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
> @@ -712,13 +686,32 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
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
> +}
> +
> +static int mediatek_dwmac_remove(struct platform_device *pdev)
> +{
> +	struct mediatek_dwmac_plat_data *priv_plat = get_stmmac_bsp_priv(&pdev->dev);
> +	int ret;
> +
> +	ret = stmmac_pltfr_remove(pdev);
> +	mediatek_dwmac_clks_config(priv_plat, false);
> +

We enalbe the clocks after calling stmmac_probe_config_dt(), so we should 
disable them before calling stmmac_pltfr_remove(), correct?

Other then that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> +	return ret;
>   }
>   
>   static const struct of_device_id mediatek_dwmac_match[] = {
> @@ -733,7 +726,7 @@ MODULE_DEVICE_TABLE(of, mediatek_dwmac_match);
>   
>   static struct platform_driver mediatek_dwmac_driver = {
>   	.probe  = mediatek_dwmac_probe,
> -	.remove = stmmac_pltfr_remove,
> +	.remove = mediatek_dwmac_remove,
>   	.driver = {
>   		.name           = "dwmac-mediatek",
>   		.pm		= &stmmac_pltfr_pm_ops,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
