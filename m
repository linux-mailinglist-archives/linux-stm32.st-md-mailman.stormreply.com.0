Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1597A533B
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Sep 2023 21:47:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CA37C6B474;
	Mon, 18 Sep 2023 19:47:17 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 128F9C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 19:47:14 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5029ace4a28so7066260e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695066434; x=1695671234;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3GMjth0uk4svVwUdt3+lP+YAoEP9JG5oh8mw/tamzSY=;
 b=U34TT7GL+Dep50hHyB/1nFFkjlYAdM59SSx3NnozQIn0u9AgP4fZb0iOPGaPkv1ZLa
 SNe6/PpOe1AGzdjZuULnOSmIDOk44BDApbfclOv0uZbXjY45O6iaMFe2a8xOAvhc209h
 ShLHGxNLmPome5ioG6KSHVnH6rg4fElLkR7XzbUU3UOF8hu5+oNoXzVPg7dPm4vyx990
 q8+XRsv+HK9f2J6/DhEKGAzSfNZ0i8CtQMWge3SHBDcDUm4V4rsIRZfyXD72QFy5vleR
 KUudpTDxHhOI2IwJISO5Addea6zy/eIqkWOzkikupC3POD89zXkH6IQpQlBEXsO8KiHp
 R1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695066434; x=1695671234;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GMjth0uk4svVwUdt3+lP+YAoEP9JG5oh8mw/tamzSY=;
 b=YYAgOt2Noqgkwu5KQYfDl1KCXGr3jNOsIYIwwcMRbgV3Gn8eLKNapjz6AVzFPqIpjX
 IFovTi3fWffWbdRIl3p2QkdyvEz3U3awFdGS+mbbmnOtbZsHtdFRATg+Tw5qDQGUaSpT
 qnywevH6NQDRBVI4hNgb3+GMFMOrx1ZJZIRNtZs20o7FqHAa8P9Cj33uJ7/9j1+3O6cD
 un2xbhJTZMj4jBA2TbVmCMdOQpI+GA0PHYIKqigFmiK7QAyKSQOt8ydTseWQ23v57U51
 ZnJCzRjWQmdxL01+GyVuNxl8K3uxnYE02B8QfWZcHCwm50/E/hf9LCE7+9u06QGpmvx/
 otGw==
X-Gm-Message-State: AOJu0YzXCjJVo5KlRsdVy0sEb9ZgdijT0Ei4HgTuHYX3cpdsU1VPrUNL
 WI/anrEra1HsAIjbfIM/vBc=
X-Google-Smtp-Source: AGHT+IFU7njRlBwGSq66q3hzfwk/hZvM8S7fmF9CZN+KqPY2x8ju4hdMyo/0KMTFfnBSlUsJW2or3w==
X-Received: by 2002:a05:6512:2256:b0:503:636:68e1 with SMTP id
 i22-20020a056512225600b00503063668e1mr275797lfu.20.1695066433864; 
 Mon, 18 Sep 2023 12:47:13 -0700 (PDT)
Received: from mobilestation ([178.176.81.244])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a19f703000000b0050084e55bd8sm1926434lfe.138.2023.09.18.12.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 12:47:13 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:47:07 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <5x3xddynxi4mcf5zpac5q3kjabpq7iui6kdynasvgwp3ekzkc6@va2bm4fnh4fo>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-8-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-8-jszhang@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-tegra@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-amlogic@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 07/23] net: stmmac:
 dwmac-intel-plat: use devm_stmmac_probe_config_dt()
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

On Sat, Sep 16, 2023 at 03:58:13PM +0800, Jisheng Zhang wrote:
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The calling of stmmac_pltfr_remove() now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 27 +++++++------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> index d352a14f9d48..d1aec2ca2b42 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> @@ -85,17 +85,15 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat)) {
>  		dev_err(&pdev->dev, "dt configuration failed\n");
>  		return PTR_ERR(plat_dat);
>  	}
>  
>  	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> -	if (!dwmac) {
> -		ret = -ENOMEM;
> -		goto err_remove_config_dt;
> -	}
> +	if (!dwmac)
> +		return -ENOMEM;
>  
>  	dwmac->dev = &pdev->dev;
>  	dwmac->tx_clk = NULL;
> @@ -110,10 +108,8 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  		/* Enable TX clock */
>  		if (dwmac->data->tx_clk_en) {
>  			dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
> -			if (IS_ERR(dwmac->tx_clk)) {
> -				ret = PTR_ERR(dwmac->tx_clk);
> -				goto err_remove_config_dt;
> -			}
> +			if (IS_ERR(dwmac->tx_clk))
> +				return PTR_ERR(dwmac->tx_clk);
>  
>  			clk_prepare_enable(dwmac->tx_clk);
>  
> @@ -126,7 +122,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  				if (ret) {
>  					dev_err(&pdev->dev,
>  						"Failed to set tx_clk\n");
> -					goto err_remove_config_dt;
> +					return ret;
>  				}
>  			}
>  		}
> @@ -140,7 +136,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  			if (ret) {
>  				dev_err(&pdev->dev,
>  					"Failed to set clk_ptp_ref\n");
> -				goto err_remove_config_dt;
> +				return ret;
>  			}
>  		}
>  	}
> @@ -158,22 +154,17 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret) {

>  		clk_disable_unprepare(dwmac->tx_clk);
> -		goto err_remove_config_dt;
> +		return ret;

Just a general note IMO it's better for maintainability to have the
clean-up-on-error block than reverting the previous changes in the if
body. Thus should you add new functions call before the block in
subject you won't need to add duplicated cleanup functions calls, but
just add new reverting method invocation to the cleanup-on-error path.

-Serge(y)

>  	}
>  
>  	return 0;
> -
> -err_remove_config_dt:
> -	stmmac_remove_config_dt(pdev, plat_dat);
> -
> -	return ret;
>  }
>  
>  static void intel_eth_plat_remove(struct platform_device *pdev)
>  {
>  	struct intel_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
>  
> -	stmmac_pltfr_remove(pdev);
> +	stmmac_pltfr_remove_no_dt(pdev);
>  	clk_disable_unprepare(dwmac->tx_clk);
>  }
>  
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
