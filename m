Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 602897A35EC
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Sep 2023 16:43:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2101FC6B474;
	Sun, 17 Sep 2023 14:43:39 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19C82C6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Sep 2023 14:43:38 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so61546601fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Sep 2023 07:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694961817; x=1695566617;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fdaEbu6km8BqHRGwr2c7GCk1sImwIY5D3Zm1fNqAyQY=;
 b=g0pCh2ROTFHw1+5/Fh0v+RGMfYd+ZlZxtgi+IiEmRM01WtI8FcUSnpf628G4gI5zBS
 G5Je2nkc1EdweG748dSbods5SmlGKbCkNbjpMSG+S7/9pb0JxgUd7vkE8qKeCUAgEEpG
 ILax4gllLgpPxct5GS0gsyhgCYxyo5K9SugIuw98n/JjD08hDSGBZ2QyA2EbpgiTJ9vQ
 dCkEsBMFFeynzelMZUh9gr/sC0iXFs6UaOV+jHrBHjh38c87WzhJgLZ1NlNTLngp5Fcr
 8G7uDBWTaGcSAV3Nb/ZlbuMvA/NFMYvFDTbwy+NNfiOdlTWQTEzXJEvQ5CiIjSt5Kf+O
 uaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694961817; x=1695566617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fdaEbu6km8BqHRGwr2c7GCk1sImwIY5D3Zm1fNqAyQY=;
 b=oP+4o4y4gJ36VqeYTv6TwGzOa0faCODr942SOUWd1v+WCNiFbfcRkzs73I4GsR8ZNz
 sTo7GgFs/EBfaU53yQVDsiwyEoaoeNRMUQbL+RX1fVYc78vB0M37y7UEn1WO95jXN6q7
 p3GDwPObm2lj848okK+9ESrNiuZ0G323mgjjlOUEh4IgGMqzBY1td6Zw858do8Ekvc5u
 lkA2T10T31xhQj/WBvQ/shcgjuZcDJvuE7p8ZfzJozRFd5P1oFnO7FTgCHNrnFJn3so1
 rMfxaFCd6HKGF7YLxMnRHGgupJ0/Oi+IGVJiW8tZqa3U7PcGBkgnWnxYjBIcgZ4PMVE3
 CneA==
X-Gm-Message-State: AOJu0YxaHwrcXao9b7FD7keV6qK77aqiuYJ2rV6LdIeuffYWq+idxmJZ
 ryRk1gsn8+GRGbiR5FJWxH0=
X-Google-Smtp-Source: AGHT+IEJIeAd3ewMw2+cvZVpanMlw/F0SbFIvtkFqTZ0ddrwDnzgxXx7HQKIxO9egvEEZV79PvH9eA==
X-Received: by 2002:a2e:9409:0:b0:2bd:1bca:ebee with SMTP id
 i9-20020a2e9409000000b002bd1bcaebeemr5200667ljh.19.1694961816913; 
 Sun, 17 Sep 2023 07:43:36 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-246-155-gprs.simobil.net.
 [46.123.246.155]) by smtp.gmail.com with ESMTPSA id
 x8-20020a1709065ac800b0099bccb03eadsm4998862ejs.205.2023.09.17.07.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 07:43:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jisheng Zhang <jszhang@kernel.org>
Date: Sun, 17 Sep 2023 16:43:33 +0200
Message-ID: <5714209.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230916075829.1560-20-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-20-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH net-next v2 19/23] net: stmmac:
 dwmac-sunxi: use devm_stmmac_probe_config_dt()
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

Dne sobota, 16. september 2023 ob 09:58:25 CEST je Jisheng Zhang napisal(a):
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The remove_new() callback now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 25 +++++++------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c index
> beceeae579bf..b857235f5b1f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> @@ -108,36 +108,31 @@ static int sun7i_gmac_probe(struct platform_device
> *pdev) if (ret)
>  		return ret;
> 
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
> 
>  	gmac = devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
> -	if (!gmac) {
> -		ret = -ENOMEM;
> -		goto err_remove_config_dt;
> -	}
> +	if (!gmac)
> +		return -ENOMEM;
> 
>  	ret = of_get_phy_mode(dev->of_node, &gmac->interface);
>  	if (ret && ret != -ENODEV) {
>  		dev_err(dev, "Can't get phy-mode\n");
> -		goto err_remove_config_dt;
> +		return ret;
>  	}
> 
>  	gmac->tx_clk = devm_clk_get(dev, "allwinner_gmac_tx");
>  	if (IS_ERR(gmac->tx_clk)) {
>  		dev_err(dev, "could not get tx clock\n");
> -		ret = PTR_ERR(gmac->tx_clk);
> -		goto err_remove_config_dt;
> +		return PTR_ERR(gmac->tx_clk);
>  	}
> 
>  	/* Optional regulator for PHY */
>  	gmac->regulator = devm_regulator_get_optional(dev, "phy");
>  	if (IS_ERR(gmac->regulator)) {
> -		if (PTR_ERR(gmac->regulator) == -EPROBE_DEFER) {
> -			ret = -EPROBE_DEFER;
> -			goto err_remove_config_dt;
> -		}
> +		if (PTR_ERR(gmac->regulator) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
>  		dev_info(dev, "no regulator found\n");
>  		gmac->regulator = NULL;
>  	}
> @@ -155,7 +150,7 @@ static int sun7i_gmac_probe(struct platform_device
> *pdev)
> 
>  	ret = sun7i_gmac_init(pdev, plat_dat->bsp_priv);
>  	if (ret)
> -		goto err_remove_config_dt;
> +		return ret;
> 
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret)
> @@ -165,8 +160,6 @@ static int sun7i_gmac_probe(struct platform_device
> *pdev)
> 
>  err_gmac_exit:
>  	sun7i_gmac_exit(pdev, plat_dat->bsp_priv);
> -err_remove_config_dt:
> -	stmmac_remove_config_dt(pdev, plat_dat);
> 
>  	return ret;
>  }
> @@ -179,7 +172,7 @@ MODULE_DEVICE_TABLE(of, sun7i_dwmac_match);
> 
>  static struct platform_driver sun7i_dwmac_driver = {
>  	.probe  = sun7i_gmac_probe,
> -	.remove_new = stmmac_pltfr_remove,
> +	.remove_new = stmmac_pltfr_remove_no_dt,
>  	.driver = {
>  		.name           = "sun7i-dwmac",
>  		.pm		= &stmmac_pltfr_pm_ops,




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
